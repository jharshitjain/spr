package com.recordkeeping.model;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.recordkeeping.util.CustomJsonDateDeserializer;

public class Assembly {

	private int assembly_id;
	private int sno;
	private Date assembly_date;
	private int plantno;
	private String customer;
	private int cellno;
	private String insert_mould;
	private String shift;
	private String car_model;
	private String part_name;
	private String fr_rr;
	private String rh_lh;
	private int prod_target;
	private int prod_actual;
	private int used_man_power;
	private int down_time;
	private int bd_time;
	private int prodrun_time;
	private float co_time_target;
	private float co_time_actual;
	private int no_of_co;
	private float startuptime_target;
	private float startuptime_actual;
	private int no_of_setup;
	private int internal_rej;
	private float process_scrap;
	public int getAssembly_id() {
		return assembly_id;
	}
	public void setAssembly_id(int assembly_id) {
		this.assembly_id = assembly_id;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public Date getAssembly_date() {
		return assembly_date;
	}
	
	@JsonDeserialize(using=CustomJsonDateDeserializer.class)
	public void setAssembly_date(Date assembly_date) {
		this.assembly_date = assembly_date;
	}
	public int getPlantno() {
		return plantno;
	}
	public void setPlantno(int plantno) {
		this.plantno = plantno;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public int getCellno() {
		return cellno;
	}
	public void setCellno(int cellno) {
		this.cellno = cellno;
	}
	public String getInsert_mould() {
		return insert_mould;
	}
	public void setInsert_mould(String insert_mould) {
		this.insert_mould = insert_mould;
	}
	public String getShift() {
		return shift;
	}
	public void setShift(String shift) {
		this.shift = shift;
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
	public String getRh_lh() {
		return rh_lh;
	}
	public void setRh_lh(String rh_lh) {
		this.rh_lh = rh_lh;
	}
	public int getProd_target() {
		return prod_target;
	}
	public void setProd_target(int prod_target) {
		this.prod_target = prod_target;
	}
	public int getProd_actual() {
		return prod_actual;
	}
	public void setProd_actual(int prod_actual) {
		this.prod_actual = prod_actual;
	}
	public int getUsed_man_power() {
		return used_man_power;
	}
	public void setUsed_man_power(int used_man_power) {
		this.used_man_power = used_man_power;
	}
	public int getDown_time() {
		return down_time;
	}
	public void setDown_time(int down_time) {
		this.down_time = down_time;
	}
	public int getBd_time() {
		return bd_time;
	}
	public void setBd_time(int bd_time) {
		this.bd_time = bd_time;
	}
	public int getProdrun_time() {
		return prodrun_time;
	}
	public void setProdrun_time(int prodrun_time) {
		this.prodrun_time = prodrun_time;
	}
	public float getCo_time_target() {
		return co_time_target;
	}
	public void setCo_time_target(float co_time_target) {
		this.co_time_target = co_time_target;
	}
	public float getCo_time_actual() {
		return co_time_actual;
	}
	public void setCo_time_actual(float co_time_actual) {
		this.co_time_actual = co_time_actual;
	}
	public int getNo_of_co() {
		return no_of_co;
	}
	public void setNo_of_co(int no_of_co) {
		this.no_of_co = no_of_co;
	}
	public float getStartuptime_target() {
		return startuptime_target;
	}
	public void setStartuptime_target(float startuptime_target) {
		this.startuptime_target = startuptime_target;
	}
	public float getStartuptime_actual() {
		return startuptime_actual;
	}
	public void setStartuptime_actual(float startuptime_actual) {
		this.startuptime_actual = startuptime_actual;
	}
	public int getNo_of_setup() {
		return no_of_setup;
	}
	public void setNo_of_setup(int no_of_setup) {
		this.no_of_setup = no_of_setup;
	}
	public int getInternal_rej() {
		return internal_rej;
	}
	public void setInternal_rej(int internal_rej) {
		this.internal_rej = internal_rej;
	}
	public float getProcess_scrap() {
		return process_scrap;
	}
	public void setProcess_scrap(float process_scrap) {
		this.process_scrap = process_scrap;
	}
	
	
	
	
}
