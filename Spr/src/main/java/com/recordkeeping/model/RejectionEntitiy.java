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
@Table(name="REJECTION")
public class RejectionEntitiy {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private int rejection_id;
	
	@Column(name="SNO")
	private int sno;
	
	@Column(name="DATE")
	private Date rejection_date;
	
	@Column(name="PLANTNO")
	private int plantno;
	
	@Column(name="CUSTOMER")
	private String customer;
	
	@Column(name="SHIFT")
	private String shift;
	
	@Column(name="WORK_AREA")
	private String work_area;
	
	@Column(name="MODEL")
	private String car_model;
	
	@Column(name="PART_NAME")
	private String part_name;
	
	@Column(name="FR_RR")
	private String fr_rr;
	
	@Column(name="RH_LH")
	private String rh_lh;
	
	@Column(name="CATEGORY")
	private int category;
	
	@Column(name="E_TRIAL_REJ")
	private String e_trial_rej;
	
	@Column(name="E_PIN_HOLE")
	private int e_pin_hole;
	
	@Column(name="E_WAVINESS")
	private String e_waviness;
	
	@Column(name="E_MATERIAL_SPOT")
	private int e_material_spot;
	
	@Column(name="E_STEEL_EXPOSE")
	private String e_steel_expose;
	
	@Column(name="E_FLAP_LIP_VARIATION")
	private String e_flap_lip_variation;
	
	@Column(name="E_UNBONDING")
	private String e_unbounding;
	
	@Column(name="E_GLUE_SPOT")
	private String e_glue_spot;
	
	@Column(name="E_BURN")
	private String e_burn;
	
	@Column(name="E_BEND_CAMBER")
	private String e_bend_camber;
	
	@Column(name="E_PROFILE_NG")
	private String e_profile_ng;
	
	@Column(name="E_CUT")
	private String e_cut;
	
	@Column(name="E_LINE_MARK")
	private String e_line_mark;
	
	@Column(name="E_SCRATCH")
	private String e_scratch;
	
	@Column(name="E_ZERK")
	private String e_zerk;
	
	@Column(name="E_DENT")
	private String e_dent;
	
	@Column(name="E_BURR")
	private int e_burr;
	
	@Column(name="E_WATER_MARK")
	private int e_water_mark;
	
	@Column(name="E_OTHERS")
	private String e_others;
	
	@Column(name="F_HARD")
	private int f_hard;
	
	@Column(name="F_UNEVEN")
	private String f_uneven;
	
	@Column(name="F_ADHESION_POOR")
	private String f_adhesion_poor;
	
	@Column(name="F_OVER")
	private int f_over;
	
	@Column(name="F_CUT")
	private String f_cut;
	
	@Column(name="F_MISS")
	private int f_miss;
	
	@Column(name="F_GLUE_PATCH")
	private int f_glue_patch;
	
	@Column(name="F_SCRATCH")
	private String f_scratch;
	
	@Column(name="F_OTHERS")
	private String f_others;
	
	@Column(name="M_CUT")
	private int m_cut;
	
	@Column(name="M_DENT")
	private int m_dent;
	
	@Column(name="M_FLASH")
	private int m_Flash;
	
	@Column(name="M_SHORT")
	private String m_short;
	
	@Column(name="M_SHINE_MARK")
	private String m_shine_mark;
	
	@Column(name="M_IMPRESSION_MARK")
	private String m_impression_mark;
	
	@Column(name="M_JOINT_OPEN")
	private String m_joint_open;
	
	@Column(name="M_OTHERS")
	private String m_others;
	
	@Column(name="FN_WELD_JOINT_OPEN")
	private String fn_weld_joint_open;
	
	@Column(name="FN_NOTCHING_NG")
	private String fn_notching_ng;
	
	@Column(name="FN_ELFY")
	private String fn_elfy;
	
	@Column(name="FN_DENT_ASSY")
	private int fn_dent_assy;
	
	@Column(name="FN_SCRATCH_ASSY")
	private String fn_scratch_assy;
	
	@Column(name="FN_LIP_PROBLEM")
	private String fn_lip_problem;
	
	@Column(name="FN_END_CAP")
	private String fn_end_cap;
	
	@Column(name="FN_SHINE_MARK")
	private String fn_shine_mark;
	
	@Column(name="FN_CUT_ASSY")
	private String fn_Cut_assy;
	
	@Column(name="FN_SHORT_LENGTH_ASSY")
	private String fn_short_length_assy;
	
	@Column(name="FN_BIG_LENGTH_ASSY")
	private String fn_big_length_assy;
	
	@Column(name="FN_BEND_ASSY")
	private String fn_bend_assy;
	
	@Column(name="FN_OTHERS")
	private String fn_others;
	
	@Column(name="PART_WEIGHT")
	private float part_weight;
	
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

	public int getRejection_id() {
		return rejection_id;
	}

	public void setRejection_id(int rejection_id) {
		this.rejection_id = rejection_id;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public Date getRejection_date() {
		return rejection_date;
	}
	
	@JsonDeserialize(using=CustomJsonDateDeserializer.class)
	public void setRejection_date(Date rejection_date) {
		this.rejection_date = rejection_date;
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

	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getWork_area() {
		return work_area;
	}

	public void setWork_area(String work_area) {
		this.work_area = work_area;
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getE_trial_rej() {
		return e_trial_rej;
	}

	public void setE_trial_rej(String e_trial_rej) {
		this.e_trial_rej = e_trial_rej;
	}

	public int getE_pin_hole() {
		return e_pin_hole;
	}

	public void setE_pin_hole(int e_pin_hole) {
		this.e_pin_hole = e_pin_hole;
	}

	public String getE_waviness() {
		return e_waviness;
	}

	public void setE_waviness(String e_waviness) {
		this.e_waviness = e_waviness;
	}

	public int getE_material_spot() {
		return e_material_spot;
	}

	public void setE_material_spot(int e_material_spot) {
		this.e_material_spot = e_material_spot;
	}

	public String getE_steel_expose() {
		return e_steel_expose;
	}

	public void setE_steel_expose(String e_steel_expose) {
		this.e_steel_expose = e_steel_expose;
	}

	public String getE_flap_lip_variation() {
		return e_flap_lip_variation;
	}

	public void setE_flap_lip_variation(String e_flap_lip_variation) {
		this.e_flap_lip_variation = e_flap_lip_variation;
	}

	public String getE_unbounding() {
		return e_unbounding;
	}

	public void setE_unbounding(String e_unbounding) {
		this.e_unbounding = e_unbounding;
	}

	public String getE_glue_spot() {
		return e_glue_spot;
	}

	public void setE_glue_spot(String e_glue_spot) {
		this.e_glue_spot = e_glue_spot;
	}

	public String getE_burn() {
		return e_burn;
	}

	public void setE_burn(String e_burn) {
		this.e_burn = e_burn;
	}

	public String getE_bend_camber() {
		return e_bend_camber;
	}

	public void setE_bend_camber(String e_bend_camber) {
		this.e_bend_camber = e_bend_camber;
	}

	public String getE_profile_ng() {
		return e_profile_ng;
	}

	public void setE_profile_ng(String e_profile_ng) {
		this.e_profile_ng = e_profile_ng;
	}

	public String getE_cut() {
		return e_cut;
	}

	public void setE_cut(String e_cut) {
		this.e_cut = e_cut;
	}

	public String getE_line_mark() {
		return e_line_mark;
	}

	public void setE_line_mark(String e_line_mark) {
		this.e_line_mark = e_line_mark;
	}

	public String getE_scratch() {
		return e_scratch;
	}

	public void setE_scratch(String e_scratch) {
		this.e_scratch = e_scratch;
	}

	public String getE_zerk() {
		return e_zerk;
	}

	public void setE_zerk(String e_zerk) {
		this.e_zerk = e_zerk;
	}

	public String getE_dent() {
		return e_dent;
	}

	public void setE_dent(String e_dent) {
		this.e_dent = e_dent;
	}

	public int getE_burr() {
		return e_burr;
	}

	public void setE_burr(int e_burr) {
		this.e_burr = e_burr;
	}

	public int getE_water_mark() {
		return e_water_mark;
	}

	public void setE_water_mark(int e_water_mark) {
		this.e_water_mark = e_water_mark;
	}

	public String getE_others() {
		return e_others;
	}

	public void setE_others(String e_others) {
		this.e_others = e_others;
	}

	public int getF_hard() {
		return f_hard;
	}

	public void setF_hard(int f_hard) {
		this.f_hard = f_hard;
	}

	public String getF_uneven() {
		return f_uneven;
	}

	public void setF_uneven(String f_uneven) {
		this.f_uneven = f_uneven;
	}

	public String getF_adhesion_poor() {
		return f_adhesion_poor;
	}

	public void setF_adhesion_poor(String f_adhesion_poor) {
		this.f_adhesion_poor = f_adhesion_poor;
	}

	public int getF_over() {
		return f_over;
	}

	public void setF_over(int f_over) {
		this.f_over = f_over;
	}

	public String getF_cut() {
		return f_cut;
	}

	public void setF_cut(String f_cut) {
		this.f_cut = f_cut;
	}

	public int getF_miss() {
		return f_miss;
	}

	public void setF_miss(int f_miss) {
		this.f_miss = f_miss;
	}

	public int getF_glue_patch() {
		return f_glue_patch;
	}

	public void setF_glue_patch(int f_glue_patch) {
		this.f_glue_patch = f_glue_patch;
	}

	public String getF_scratch() {
		return f_scratch;
	}

	public void setF_scratch(String f_scratch) {
		this.f_scratch = f_scratch;
	}

	public String getF_others() {
		return f_others;
	}

	public void setF_others(String f_others) {
		this.f_others = f_others;
	}

	public int getM_cut() {
		return m_cut;
	}

	public void setM_cut(int m_cut) {
		this.m_cut = m_cut;
	}

	public int getM_dent() {
		return m_dent;
	}

	public void setM_dent(int m_dent) {
		this.m_dent = m_dent;
	}

	public int getM_Flash() {
		return m_Flash;
	}

	public void setM_Flash(int m_Flash) {
		this.m_Flash = m_Flash;
	}

	public String getM_short() {
		return m_short;
	}

	public void setM_short(String m_short) {
		this.m_short = m_short;
	}

	public String getM_shine_mark() {
		return m_shine_mark;
	}

	public void setM_shine_mark(String m_shine_mark) {
		this.m_shine_mark = m_shine_mark;
	}

	public String getM_impression_mark() {
		return m_impression_mark;
	}

	public void setM_impression_mark(String m_impression_mark) {
		this.m_impression_mark = m_impression_mark;
	}

	public String getM_joint_open() {
		return m_joint_open;
	}

	public void setM_joint_open(String m_joint_open) {
		this.m_joint_open = m_joint_open;
	}

	public String getM_others() {
		return m_others;
	}

	public void setM_others(String m_others) {
		this.m_others = m_others;
	}

	public String getFn_weld_joint_open() {
		return fn_weld_joint_open;
	}

	public void setFn_weld_joint_open(String fn_weld_joint_open) {
		this.fn_weld_joint_open = fn_weld_joint_open;
	}

	public String getFn_notching_ng() {
		return fn_notching_ng;
	}

	public void setFn_notching_ng(String fn_notching_ng) {
		this.fn_notching_ng = fn_notching_ng;
	}

	public String getFn_elfy() {
		return fn_elfy;
	}

	public void setFn_elfy(String fn_elfy) {
		this.fn_elfy = fn_elfy;
	}

	public int getFn_dent_assy() {
		return fn_dent_assy;
	}

	public void setFn_dent_assy(int fn_dent_assy) {
		this.fn_dent_assy = fn_dent_assy;
	}

	public String getFn_scratch_assy() {
		return fn_scratch_assy;
	}

	public void setFn_scratch_assy(String fn_scratch_assy) {
		this.fn_scratch_assy = fn_scratch_assy;
	}

	public String getFn_lip_problem() {
		return fn_lip_problem;
	}

	public void setFn_lip_problem(String fn_lip_problem) {
		this.fn_lip_problem = fn_lip_problem;
	}

	public String getFn_end_cap() {
		return fn_end_cap;
	}

	public void setFn_end_cap(String fn_end_cap) {
		this.fn_end_cap = fn_end_cap;
	}

	public String getFn_shine_mark() {
		return fn_shine_mark;
	}

	public void setFn_shine_mark(String fn_shine_mark) {
		this.fn_shine_mark = fn_shine_mark;
	}

	public String getFn_Cut_assy() {
		return fn_Cut_assy;
	}

	public void setFn_Cut_assy(String fn_Cut_assy) {
		this.fn_Cut_assy = fn_Cut_assy;
	}

	public String getFn_short_length_assy() {
		return fn_short_length_assy;
	}

	public void setFn_short_length_assy(String fn_short_length_assy) {
		this.fn_short_length_assy = fn_short_length_assy;
	}

	public String getFn_big_length_assy() {
		return fn_big_length_assy;
	}

	public void setFn_big_length_assy(String fn_big_length_assy) {
		this.fn_big_length_assy = fn_big_length_assy;
	}

	public String getFn_bend_assy() {
		return fn_bend_assy;
	}

	public void setFn_bend_assy(String fn_bend_assy) {
		this.fn_bend_assy = fn_bend_assy;
	}

	public String getFn_others() {
		return fn_others;
	}

	public void setFn_others(String fn_others) {
		this.fn_others = fn_others;
	}

	public float getPart_weight() {
		return part_weight;
	}

	public void setPart_weight(float part_weight) {
		this.part_weight = part_weight;
	}
	
	
	
	
}
