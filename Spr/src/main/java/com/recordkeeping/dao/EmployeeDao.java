package com.recordkeeping.dao;

import com.recordkeeping.model.EmployeeEntity;

public interface EmployeeDao {

	public EmployeeEntity authenticateUser(EmployeeEntity employee);
}
