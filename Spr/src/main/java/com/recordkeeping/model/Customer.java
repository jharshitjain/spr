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
@Table(name="CUSTOMER")
public class Customer {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int customer_id;
	
	@Column(name="COMPANY")
	private String company;
	
	@Column(name="ENTRY_DATE")
	private Date entry_date;
	
	@Column(name="USER_ID")
	private String user_id;
	
	@Column(name="USER_PLANT_NO")
	private String user_plant_no;
	
	@Column(name="NAME_1")
	private String name_1;
	
	@Column(name="LOCATION")
	private String location;
	
	@Column(name="SEARCH_TERM")
	private String search_term;
	
	@Column(name="ADDRESS1")
	private String address1;
	
	@Column(name="ADDRESS2")
	private String address2;
	
	
	@Column(name="POST_CODE")
	private String post_code;
	
	@Column(name="CITY")
	private String city;
	
	@Column(name="COUNTRY")
	private String country;
	
	@Column(name="TEL_FAX")
	private String tel_fax;
	
	@Column(name="TAX_NO_1")
	private String tax_no_1;
	
	@Column(name="TAX_NO_3")
	private String tax_no_3;
	
	
	
	@Column(name="CLASSIFICATION")
	private String classification;
	
	@Column(name="INDUSTRY")
	private String industry;
	
	@Column(name="CONTACT_PERSON")
	private String contact_person;
	
	@Column(name="SALES_OFFICE")
	private String sales_office;
	
	@Column(name="SALES_GROUP")
	private String sales_group;
	
	@Column(name="CUSTOMER_GROUP")
	private String customer_group;
	
	@Column(name="OLD_CUSTOMER_NUMBER")
	private String old_customer_group;

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
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

	public String getName_1() {
		return name_1;
	}

	public void setName_1(String name_1) {
		this.name_1 = name_1;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSearch_term() {
		return search_term;
	}

	public void setSearch_term(String search_term) {
		this.search_term = search_term;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getTel_fax() {
		return tel_fax;
	}

	public void setTel_fax(String tel_fax) {
		this.tel_fax = tel_fax;
	}

	public String getTax_no_1() {
		return tax_no_1;
	}

	public void setTax_no_1(String tax_no_1) {
		this.tax_no_1 = tax_no_1;
	}

	public String getTax_no_3() {
		return tax_no_3;
	}

	public void setTax_no_3(String tax_no_3) {
		this.tax_no_3 = tax_no_3;
	}

	

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getContact_person() {
		return contact_person;
	}

	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}

	public String getSales_office() {
		return sales_office;
	}

	public void setSales_office(String sales_office) {
		this.sales_office = sales_office;
	}

	public String getSales_group() {
		return sales_group;
	}

	public void setSales_group(String sales_group) {
		this.sales_group = sales_group;
	}

	public String getCustomer_group() {
		return customer_group;
	}

	public void setCustomer_group(String customer_group) {
		this.customer_group = customer_group;
	}

	public String getOld_customer_group() {
		return old_customer_group;
	}

	public void setOld_customer_group(String old_customer_group) {
		this.old_customer_group = old_customer_group;
	}
	
	
	
	
}
