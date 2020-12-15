package com.iwinner.order.repository;
import com.iwinner.order.model.Student;
import org.springframework.data.repository.CrudRepository;

public interface StudentRepository extends CrudRepository<Student, Integer>
{
}
