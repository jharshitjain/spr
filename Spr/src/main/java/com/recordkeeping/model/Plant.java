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
@Table(name="PLANT")
public class Plant {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int plant_id;
	
	@Column(name="COMPANY")
	private String company;
	
	@Column(name="ENTRY_DATE")
	private Date entry_date;
	
	@Column(name="USER_ID")
	private String user_id;
	
	@Column(name="USER_PLANT_NO")
	private String user_plant_no;
	
	@Column(name="PLANT_NO")
	private String plant_no;
	
	@Column(name="LOCATION")
	private String plant_name;

	public int getPlant_id() {
		return plant_id;
	}

	public void setPlant_id(int plant_id) {
		this.plant_id = plant_id;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Date getEntry_date() {
		return entry_date;
	}

	@JsonDeserialize(using=CustomJsonDateDeserializer.class)
	public void setEntry_date(Date entry_date) {
		this.entry_date = entry_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_plant_no() {
		return user_plant_no;
	}

	public void setUser_plant_no(String user_plant_no) {
		this.user_plant_no = user_plant_no;
	}

	public String getPlant_no() {
		return plant_no;
	}

	public void setPlant_no(String plant_no) {
		this.plant_no = plant_no;
	}

	public String getPlant_name() {
		return plant_name;
	}

	public void setPlant_name(String plant_name) {
		this.plant_name = plant_name;
	}
	
	
	
}