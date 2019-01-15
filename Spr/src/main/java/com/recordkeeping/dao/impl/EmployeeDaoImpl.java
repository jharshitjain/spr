package com.recordkeeping.dao.impl;

import java.util.HashSet;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.recordkeeping.dao.AbstractDao;
import com.recordkeeping.dao.EmployeeDao;
import com.recordkeeping.model.EmployeeEntity;

@Repository
@Transactional
public class EmployeeDaoImpl extends AbstractDao implements EmployeeDao {

	public EmployeeEntity authenticateUser(EmployeeEntity employee) {
		EmployeeEntity authEmp=null;
		Query query=getSession().createQuery("from EmployeeEntity where emp_code='"+employee.getEmp_code()+"' and pwd='"+employee.getPwd()+"' and role='"+employee.getRole()+"'");
		authEmp=(EmployeeEntity)query.uniqueResult();
		return authEmp;
	}

}
