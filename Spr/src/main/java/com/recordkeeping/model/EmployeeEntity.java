package com.recordkeeping.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.recordkeeping.util.CustomJsonDateDeserializer;

@Entity
@Table(name="SPR_USER")
public class EmployeeEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int emp_id;
	
	@Column(name="EMP_CODE")
	private String emp_code;
			
	@Column(name="PWD")
	private String pwd;
	
	@Column(name="EMP_NAME")
	private String emp_name;
	
	@Column(name="PLANT")
	private String plant;
	
	@Column(name="ROLE")
	private String role;
	
	@Column(name="LOGIN_TYPE")
	private String LOGIN_TYPE;
	
	@Column(name="PLANT_1")
	private int plant_1;

	@Column(name="PLANT_2")
	private int plant_2;
	
	@Column(name="PLANT_5")
	private int plant_5;
	
	@Column(name="PLANT_6")
	private int plant_6;
	
	@Column(name="REPORTS_TO")
	private String reports_to;

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getPlant() {
		return plant;
	}

	public void setPlant(String plant) {
		this.plant = plant;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getLOGIN_TYPE() {
		return LOGIN_TYPE;
	}

	public void setLOGIN_TYPE(String lOGIN_TYPE) {
		LOGIN_TYPE = lOGIN_TYPE;
	}

	public int getPlant_1() {
		return plant_1;
	}

	public void setPlant_1(int plant_1) {
		this.plant_1 = plant_1;
	}

	public int getPlant_2() {
		return plant_2;
	}

	public void setPlant_2(int plant_2) {
		this.plant_2 = plant_2;
	}

	public int getPlant_5() {
		return plant_5;
	}

	public void setPlant_5(int plant_5) {
		this.plant_5 = plant_5;
	}

	public int getPlant_6() {
		return plant_6;
	}

	public void setPlant_6(int plant_6) {
		this.plant_6 = plant_6;
	}

	public String getReports_to() {
		return reports_to;
	}

	public void setReports_to(String reports_to) {
		this.reports_to = reports_to;
	}

	
	}