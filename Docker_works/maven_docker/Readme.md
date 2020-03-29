	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<!--  For standalone JAR file <configuration><executable>false</executable></configuration> -->
				<configuration>
                	<mainClass>com.virtualpairprogrammers.TomcatWARApplication</mainClass>
            	</configuration>
			</plugin>	
			
			<plugin>
			<groupId>io.fabric8</groupId>
			<artifactId>docker-maven-plugin</artifactId>
			<version>0.21.0</version>

	<configuration>
        <!--  <dockerHost>http://127.0.0.1:2375</dockerHost> -->        
        <!--  this is for Mac and Amazon Linux -->
         <dockerHost>unix:///var/run/docker.sock</dockerHost> 

        <verbose>true</verbose>
        
        <!-- Needed if pushing to DockerHub: preferred to store these in local environment (see the course) -->
        <authConfig>
			  <username>anjaiahspr</username>
              <password>XYYXXXX</password>
        </authConfig>
        
		<images>
			<image>
				<name>anjaiahspr/fleetman-webapp01:latest</name>
				<build>
					<dockerFileDir>${project.basedir}/src/main/docker/</dockerFileDir>

                    <!--copies Jar to the maven directory (uses Assembly system)-->
					<assembly>
						<descriptorRef>artifact</descriptorRef>
					</assembly>
					<tags>
						<tag>latest</tag>
					</tags>
				</build>
			</image>
		</images>
	</configuration>
	<executions>
	
	  <execution>
	    <phase>package </phase>
	    <goals>
	         <goal>build</goal>
	     </goals>
	  </execution>
	</executions>
</plugin>					
		</plugins>
		
		<resources>
			<resource>
				<filtering>false</filtering>
				<directory>src/main/resources</directory>
			</resource>		
		</resources>
		
	</build>
	
