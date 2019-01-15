package com.recordkeeping.model;

import java.sql.Date;

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
@Table(name="FLOCKING")
public class FlockingEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int flocking_id;
	
	@Column(name="SNO")
	private String sno;
	
	@Column(name="DATE")
	private Date flocking_date;
	
	@Column(name="PLANTNO")
	private String plantno;
	
	@Column(name="CUSTOMER")
	private String customer;
	
	@Column(name="LINE")
	private String line;
	
	@Column(name="MODEL")
	private String car_model;
	
	@Column(name="PART_NAME")
	private String part_name;
	
	@Column(name="FR_RR")
	private String fr_rr;
	
	@Column(name="SHIFT")
	private String shift;
	
	@Column(name="PROD_TARGET")
	private String prod_target;
	
	@Column(name="PROD_ACTUAL")
	private String prod_actual;
	
	@Column(name="USED_MAN_POWER")
	private String used_man_power;
	
	@Column(name="DOWN_TIME")
	private String down_time;
	
	@Column(name="BD_TIME")
	private String bd_time;
	
	@Column(name="PRODRUN_TIME")
	private String prodrun_time;
	
	@Column(name="CO_TIME_TARGET")
	private String co_time_target;
	
	@Column(name="CO_TIME_ACTUAL")
	private String co_time_actual;
	
	@Column(name="NO_OF_CO")
	private String no_of_co;
	
	@Column(name="STARTUPTIME_TARGET")
	private String startuptime_target;
	
	@Column(name="STARTUPTIME_ACTUAL")
	private String startuptime_actual;
	
	@Column(name="NO_OF_SETUP")
	private String no_of_setup;
	
	@Column(name="INTERNAL_REJ")
	private String internal_rej;
	
	@Column(name="COMPANY")
	private String company;
	
	@Column(name="ENTRY_DATE")
	private Date entry_date;
	
	@Column(name="USER_ID")
	private String user_id;
	
	@Column(name="USER_PLANT_NO")
	private String user_plant_no;
	
	@Column(name="HOD")
	private String hod;
	
	@Column(name="IsApproved")
	private int isApproved;
	
	@Column(name="ApprovedBy")
	private int approvedBy;
	
	
	@Column(name="Approve_date")
	private Date approveDate;
	
	@Column(name="Modify_date")
	private Date modifyDate;

	public int getFlocking_id() {
		return flocking_id;
	}

	public void setFlocking_id(int flocking_id) {
		this.flocking_id = flocking_id;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Date getFlocking_date() {
		return flocking_date;
	}
	@JsonDeserialize(using=CustomJsonDateDeserializer.class)
	public void setFlocking_date(Date flocking_date) {
		this.flocking_date = flocking_date;
	}

	public String getPlantno() {
		return plantno;
	}

	public void setPlantno(String plantno) {
		this.plantno = plantno;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getCar_model() {
		return car_model;
	}

	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}

	public String getPart_name() {
		return part_name;
	}

	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}

	public String getFr_rr() {
		return fr_rr;
	}

	public void setFr_rr(String fr_rr) {
		this.fr_rr = fr_rr;
	}

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getProd_target() {
		return prod_target;
	}

	public void setProd_target(String prod_target) {
		this.prod_target = prod_target;
	}

	public String getProd_actual() {
		return prod_actual;
	}

	public void setProd_actual(String prod_actual) {
		this.prod_actual = prod_actual;
	}

	public String getUsed_man_power() {
		return used_man_power;
	}

	public void setUsed_man_power(String used_man_power) {
		this.used_man_power = used_man_power;
	}

	public String getDown_time() {
		return down_time;
	}

	public void setDown_time(String down_time) {
		this.down_time = down_time;
	}

	public String getBd_time() {
		return bd_time;
	}

	public void setBd_time(String bd_time) {
		this.bd_time = bd_time;
	}

	public String getProdrun_time() {
		return prodrun_time;
	}

	public void setProdrun_time(String prodrun_time) {
		this.prodrun_time = prodrun_time;
	}

	public String getCo_time_target() {
		return co_time_target;
	}

	public void setCo_time_target(String co_time_target) {
		this.co_time_target = co_time_target;
	}

	public String getCo_time_actual() {
		return co_time_actual;
	}

	public void setCo_time_actual(String co_time_actual) {
		this.co_time_actual = co_time_actual;
	}

	public String getNo_of_co() {
		return no_of_co;
	}

	public void setNo_of_co(String no_of_co) {
		this.no_of_co = no_of_co;
	}

	public String getStartuptime_target() {
		return startuptime_target;
	}

	public void setStartuptime_target(String startuptime_target) {
		this.startuptime_target = startuptime_target;
	}

	public String getStartuptime_actual() {
		return startuptime_actual;
	}

	public void setStartuptime_actual(String startuptime_actual) {
		this.startuptime_actual = startuptime_actual;
	}

	public String getNo_of_setup() {
		return no_of_setup;
	}

	public void setNo_of_setup(String no_of_setup) {
		this.no_of_setup = no_of_setup;
	}

	public String getInternal_rej() {
		return internal_rej;
	}

	public void setInternal_rej(String internal_rej) {
		this.internal_rej = internal_rej;
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

	public String getHod() {
		return hod;
	}

	public void setHod(String hod) {
		this.hod = hod;
	}

	public int getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(int isApproved) {
		this.isApproved = isApproved;
	}

	public int getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(int approvedBy) {
		this.approvedBy = approvedBy;
	}

	public Date getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	 
	
	
	

	
	
	
	
}