package com.recordkeeping.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recordkeeping.dao.EmployeeDao;
import com.recordkeeping.model.EmployeeEntity;
import com.recordkeeping.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDao employeeDao;
	
	public EmployeeEntity authenticateService(EmployeeEntity employee) {
		
		return employeeDao.authenticateUser(employee);
	}

}
