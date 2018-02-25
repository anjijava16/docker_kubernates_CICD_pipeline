package com.cfelde.amazon.aurora;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

/**
 * This is the client used for testing the Amazon Aurora database.
 * It is testing a specific use case similar to that of a NoSQL data model.
 * The model consists of a hash key, a range key, and a blob of data.
 * 
 * It will use a table defined as:
 * CREATE TABLE `test_tbl` (
 *  `hash_key` char(36) NOT NULL,
 *  `range_key` bigint(20) NOT NULL,
 *  `value` mediumblob NOT NULL,
 *  PRIMARY KEY (`hash_key`,`range_key`)
 * ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 *
 * @author Christian Felde
 */
public class Test {
    public static final String PROP_KEY_URL = "db.url";
    public static final String PROP_KEY_USER = "db.user";
    public static final String PROP_KEY_PASS = "db.pass";
    
    private static enum Operation { INSERT, SELECT };
    
    private final Properties properties;
    
    public static void main(String... args) throws Exception {
        if (args.length != 3) {
            System.out.println("Usage: " + Test.class.getName() + " [prop file] [operation: insert or select] [thread count: number or max]");
            System.exit(1);
        }
        
        final Properties properties = loadProperties(args[0]);
        final Operation operation = getOperationEnum(args[1]);
        final int threadCount = getThreadCount(args[2]);
        
        final Test test = new Test(properties);
        
        System.out.println("Will start " + operation + " operation using " + threadCount + " threads..");
        
        List<Thread> threads = new ArrayList<>();
        
        for (int i = 0; i < threadCount; i++) {
            threads.add(new Thread(() -> {
                try {
                    switch (operation) {
                        case INSERT:
                            test.runInsert();
                            break;
                        case SELECT:
                            test.runSelect();
                            break;
                    }
                } catch (Exception ex) {
                    System.err.println("Exception in thread: " + ex.getMessage());
                }
            }));
        }
        
        threads.stream().forEach((t) -> t.start());
        threads.stream().forEach(Test::joinUtil);
    }
    
    private static Properties loadProperties(String propPath) throws IOException {
        File propFile = new File(propPath);
        
        if (!propFile.isFile())
            throw new IOException("Unable to located properties at " + propFile.getAbsolutePath());
        
        Properties properties = new Properties();
        properties.load(new FileReader(propFile));
        
        return properties;
    }
    
    private static Operation getOperationEnum(String operation) {
        switch (operation.toLowerCase().trim()) {
            case "insert":
                return Operation.INSERT;
            case "select":
                return Operation.SELECT;
            default:
                throw new IllegalArgumentException("Unknown operation: " + operation);
        }
    }

    private static int getThreadCount(String threadCount) {
        if (threadCount.equalsIgnoreCase("max"))
            return Runtime.getRuntime().availableProcessors();
        
        return Integer.parseInt(threadCount);
    }
    
    private static void joinUtil(Thread t) {
        try {
            t.join();
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }
    
    public Test(Properties properties) {
        this.properties = properties;
    }
    
    private synchronized Connection getConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(properties.getProperty(PROP_KEY_URL),
                properties.getProperty(PROP_KEY_USER), properties.getProperty(PROP_KEY_PASS));

        connection.setAutoCommit(true);
        connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
        
        return connection;
    }
    
    private void runInsert() throws SQLException {
        Connection connection = getConnection();
        
        try (Statement stmt = connection.createStatement()) {
            stmt.execute("truncate `test_tbl`");
        }
        
        PreparedStatement insertStmt = connection.prepareStatement("insert into `test_tbl` (`hash_key`, `range_key`, `value`) values (?, ?, ?)");
        
        final long rangeMax = 100000;
        
        int logCount = 0;
        
        while (true) {
            final String hashKey = UUID.randomUUID().toString();
            final byte[] blobData = new byte[1024 * 64];
            ThreadLocalRandom.current().nextBytes(blobData);
            
            final long startTime = System.currentTimeMillis();
            
            for (long range = 0; range < rangeMax; range++) {
                insertStmt.setString(1, hashKey);
                insertStmt.setLong(2, range);
                insertStmt.setBlob(3, new ByteArrayInputStream(blobData));
                
                insertStmt.executeUpdate();
            }
            
            final long endTime = System.currentTimeMillis();
            final long diffTime = endTime - startTime;
            final long perSec = (rangeMax * 1000) / diffTime;
            
            System.out.println(new StringBuilder().append(logCount++).append("\tINSERT\t").append(rangeMax).append("\t").append(diffTime).append("\t").append(perSec).toString());
            
            if (logCount >= 3)
                break;
        }
    }
    
    private void runSelect() throws SQLException, IOException {
        Connection connection = getConnection();
        
        PreparedStatement selectRndHashKeys = connection.prepareStatement("select distinct `hash_key` from `test_tbl` order by RAND() limit 1000");
        PreparedStatement selectAsc = connection.prepareStatement("select `hash_key`, `range_key`, `value` from `test_tbl` where `hash_key` = ? and `range_key` between ? and ? order by `range_key` limit 1000");
        PreparedStatement selectDesc = connection.prepareStatement("select `hash_key`, `range_key`, `value` from `test_tbl` where `hash_key` = ? and `range_key` between ? and ? order by `range_key` desc limit 1000");
        
        final long rangeMax = 100000;
        
        // Start by getting our random hash keys
        List<String> hashKeys = new ArrayList<>();
        try (ResultSet rsRndHashKeys = selectRndHashKeys.executeQuery()) {
            while (rsRndHashKeys.next())
                hashKeys.add(rsRndHashKeys.getString("hash_key"));
        }
        
        System.out.println("Found " + hashKeys.size() + " random hash keys");
        
        int logCount = 0;
        
        while (true) {
            final long startTime = System.currentTimeMillis();
            
            long count = 0;
            
            for (String hashKey : hashKeys) {
                PreparedStatement select;
                switch (ThreadLocalRandom.current().nextBoolean() ? 1 : 0) {
                    case 0:
                        select = selectAsc;
                        break;
                    default:
                        select = selectDesc;
                        break;
                }
                
                final long lowRange = ThreadLocalRandom.current().nextLong(rangeMax);
                final long highRange = ThreadLocalRandom.current().nextLong(lowRange, rangeMax);
                
                select.setString(1, hashKey);
                select.setLong(2, lowRange);
                select.setLong(3, highRange);
                
                try (ResultSet rsSelect = select.executeQuery()) {
                    while (rsSelect.next()) {
                        String hashKey2 = rsSelect.getString("hash_key");
                        long range = rsSelect.getLong("range_key");
                        
                        int valueLength = 0;
                        
                        try (InputStream is = rsSelect.getBinaryStream("value")) {
                            while (is.read() != -1)
                                valueLength++;
                        }
                        
                        if (!hashKey.equals(hashKey2) || range < lowRange || range > highRange || valueLength != 1024 * 64)
                            throw new SQLException("Data integrity fail");
                        
                        count++;
                    }
                }
            }
            
            final long endTime = System.currentTimeMillis();
            final long diffTime = endTime - startTime;
            final long perSec = (count * 1000) / diffTime;
            
            System.out.println(new StringBuilder().append(logCount++).append("\tSELECT\t").append(count).append("\t").append(diffTime).append("\t").append(perSec).toString());
            
            if (logCount >= 5)
                break;
            
            Collections.shuffle(hashKeys);
        }
    }
}
