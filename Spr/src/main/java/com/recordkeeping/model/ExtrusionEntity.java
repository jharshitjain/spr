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
@Table(name="EXTRUSION")
public class ExtrusionEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int extrusion_id;
	
	@Column(name="SNO")
	private String sno;
	
	@Column(name="DATE")
	private Date extrusion_date;
	
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
	
	@Column(name="TRIAL_OR_PROD")
	private String trial_or_prod;
	
	@Column(name="SHIFT")
	private String shift;
	
	@Column(name="PROD_TARGET")
	private String prod_target;
	
	@Column(name="PROD_ACTUAL")
	private String prod_actual;
	
	@Column(name="PROD_KG")
	private String prod_kg;
	
	@Column(name="PRODPLAN_TIME")
	private String prodplan_time;
	
	@Column(name="SETUPTIME_TARGET")
	private String setuptime_taget;
	
	@Column(name="SETUPTIME_ACTUAL")
	private String setuptime_actual;
	
	@Column(name="CO_TIME_TARGET")
	private String co_time_target;
	
	@Column(name="CO_TIME_ACTUAL")
	private String co_time_actual;
	
	@Column(name="DOWN_TIME")
	private String down_time;
	
	@Column(name="BD_TIME")
	private String bd_time;
	
	@Column(name="PRODRUN_TIME")
	private String prodrun_time;
	
	@Column(name="LINE_REJ_TARGET")
	private String line_rej_target;
	
	@Column(name="LINE_REJ_ACTUAL")
	private String line_rej_actual;
	
	@Column(name="CO_SCRAP_TARGET")
	private String co_scrap_taget;
	
	@Column(name="CO_SCRAP_ACTUAL")
	private String co_scrap_actual;
	
	@Column(name="NO_OF_CO")
	private String no_of_co;
	
	@Column(name="NO_OF_SETUP")
	private String no_of_Setup;
	
	@Column(name="TRIAL_REJ")
	private String trail_rej;
	
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

	public int getExtrusion_id() {
		return extrusion_id;
	}

	public void setExtrusion_id(int extrusion_id) {
		this.extrusion_id = extrusion_id;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Date getExtrusion_date() {
		return extrusion_date;
	}
	@JsonDeserialize(using=CustomJsonDateDeserializer.class)
	public void setExtrusion_date(Date extrusion_date) {
		this.extrusion_date = extrusion_date;
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

	public String getTrial_or_prod() {
		return trial_or_prod;
	}

	public void setTrial_or_prod(String trial_or_prod) {
		this.trial_or_prod = trial_or_prod;
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

	public String getProd_kg() {
		return prod_kg;
	}

	public void setProd_kg(String prod_kg) {
		this.prod_kg = prod_kg;
	}

	public String getProdplan_time() {
		return prodplan_time;
	}

	public void setProdplan_time(String prodplan_time) {
		this.prodplan_time = prodplan_time;
	}

	public String getSetuptime_taget() {
		return setuptime_taget;
	}

	public void setSetuptime_taget(String setuptime_taget) {
		this.setuptime_taget = setuptime_taget;
	}

	public String getSetuptime_actual() {
		return setuptime_actual;
	}

	public void setSetuptime_actual(String setuptime_actual) {
		this.setuptime_actual = setuptime_actual;
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

	public String getLine_rej_target() {
		return line_rej_target;
	}

	public void setLine_rej_target(String line_rej_target) {
		this.line_rej_target = line_rej_target;
	}

	public String getLine_rej_actual() {
		return line_rej_actual;
	}

	public void setLine_rej_actual(String line_rej_actual) {
		this.line_rej_actual = line_rej_actual;
	}

	public String getCo_scrap_taget() {
		return co_scrap_taget;
	}

	public void setCo_scrap_taget(String co_scrap_taget) {
		this.co_scrap_taget = co_scrap_taget;
	}

	public String getCo_scrap_actual() {
		return co_scrap_actual;
	}

	public void setCo_scrap_actual(String co_scrap_actual) {
		this.co_scrap_actual = co_scrap_actual;
	}

	public String getNo_of_co() {
		return no_of_co;
	}

	public void setNo_of_co(String no_of_co) {
		this.no_of_co = no_of_co;
	}

	public String getNo_of_Setup() {
		return no_of_Setup;
	}

	public void setNo_of_Setup(String no_of_Setup) {
		this.no_of_Setup = no_of_Setup;
	}

	public String getTrail_rej() {
		return trail_rej;
	}

	public void setTrail_rej(String trail_rej) {
		this.trail_rej = trail_rej;
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
