package com.iwinner.order.repository;

import com.iwinner.order.model.Customer;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Long> {
    
    List<Customer> findByName(String name);
    
}
