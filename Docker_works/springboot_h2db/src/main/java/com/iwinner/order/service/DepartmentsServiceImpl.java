package com.iwinner.order.service;

import java.util.List;

import com.iwinner.order.model.DepartmentsModel;
import com.iwinner.order.repository.DepartmentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentsServiceImpl {

	@Autowired
	private DepartmentsRepository departmentRepo;
	
	
	public List<DepartmentsModel> getList(){
		return departmentRepo.findAll();
	}
}
