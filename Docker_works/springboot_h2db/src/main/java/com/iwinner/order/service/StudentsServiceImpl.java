package com.iwinner.order.service;

import java.util.List;

import com.iwinner.order.repository.StudentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iwinner.order.model.StudentsModel;

@Service
public class StudentsServiceImpl {

	@Autowired
	private StudentsRepository studentRepo;

	public StudentsModel save(StudentsModel student) {
		return studentRepo.save(student);
	}

	public StudentsModel findByRoll(String roll) {
		return studentRepo.findByRoll(roll);
	}

	public StudentsModel findByStudentId(Integer studentId) {
		return studentRepo.findByStudentId(studentId);
	}

	public List<StudentsModel> getList() {
		return studentRepo.findAll();
	}

	public void deleteByStudentId(Integer studentId) {
		StudentsModel student = studentRepo.findByStudentId(studentId);
		studentRepo.delete(student);


	}
}
