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
@Table(name="PART")
public class Part {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int part_id;
	
	@Column(name="COMPANY")
	private String company;
	
	@Column(name="ENTRY_DATE")
	private Date entry_date;
	
	@Column(name="USER_ID")
	private String user_id;
	
	@Column(name="USER_PLANT_NO")
	private String user_plant_no;
	
	@Column(name="CUSTOMER_GROUP")
	private String customer_group;
	
	@Column(name="MODEL")
	private String car_model;
	
	@Column(name="PART_NO")
	private String part_no;
	
	@Column(name="PART_NAME")
	private String part_name;
	
	@Column(name="EXTRUSION_LINE_NO")
	private String extrusion_line_no;
	
	@Column(name="EXTRUSION_LENGTH_MM")
	private String extrusion_length_mm;
	
	@Column(name="FLOCKING_LINE_NO")
	private String flocking_line_no;
	
	@Column(name="PLANT")
	private String plant;

	public int getModel_id() {
		return part_id;
	}

	public void setModel_id(int model_id) {
		this.part_id = model_id;
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

	public String getCustomer_group() {
		return customer_group;
	}

	public void setCustomer_group(String customer_group) {
		this.customer_group = customer_group;
	}

	public String getCar_model() {
		return car_model;
	}

	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}

	public String getPart_no() {
		return part_no;
	}

	public void setPart_no(String part_no) {
		this.part_no = part_no;
	}

	public String getPart_name() {
		return part_name;
	}

	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}

	public String getExtrusion_line_no() {
		return extrusion_line_no;
	}

	public void setExtrusion_line_no(String extrusion_line_no) {
		this.extrusion_line_no = extrusion_line_no;
	}

	public String getExtrusion_length_mm() {
		return extrusion_length_mm;
	}

	public void setExtrusion_length_mm(String extrusion_length_mm) {
		this.extrusion_length_mm = extrusion_length_mm;
	}

	public String getFlocking_line_no() {
		return flocking_line_no;
	}

	public void setFlocking_line_no(String flocking_line_no) {
		this.flocking_line_no = flocking_line_no;
	}

	public String getPlant() {
		return plant;
	}

	public void setPlant(String plant) {
		this.plant = plant;
	}
	
	
	
	
}