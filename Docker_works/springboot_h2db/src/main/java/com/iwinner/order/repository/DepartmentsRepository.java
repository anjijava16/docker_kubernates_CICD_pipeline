package com.iwinner.order.repository;

import com.iwinner.order.model.DepartmentsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentsRepository extends JpaRepository<DepartmentsModel, Integer>{

}
