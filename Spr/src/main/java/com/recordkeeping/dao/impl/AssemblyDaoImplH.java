package com.recordkeeping.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.recordkeeping.dao.AbstractDao;
import com.recordkeeping.dao.AssemblyDao;
import com.recordkeeping.model.Assembly;
import com.recordkeeping.model.AssemblyEntity;
import com.recordkeeping.model.Customer;
import com.recordkeeping.model.ExtrusionEntity;
import com.recordkeeping.model.FlockingEntity;
import com.recordkeeping.model.Model;
import com.recordkeeping.model.RejectionEntitiy;
import com.recordkeeping.model.Part;
import com.recordkeeping.model.Plant;
import com.recordkeeping.util.FetchingType;
import com.recordkeeping.util.OperationType;
import com.sun.corba.se.spi.orb.Operation;

@Repository
@Transactional
@Qualifier("AssemblyDaoH")
public class AssemblyDaoImplH extends AbstractDao implements AssemblyDao {

	public int persistRecord(String operationType,Object entity) throws Exception{
		if(operationType.equals(OperationType.ASSEMBLY.toString()))
			return saveRecord((AssemblyEntity)entity);
		
		if(operationType.equals(OperationType.EXTRUSION.toString()))
			return saveRecord((ExtrusionEntity)entity);
		
		if(operationType.equals(OperationType.FLOCKING.toString()))
			return saveRecord((FlockingEntity) entity);
		
		if(operationType.equals(OperationType.REJECTION.toString()))
			return saveRecord((RejectionEntitiy) entity);
		
		if(operationType.equals(OperationType.CUSTOMER.toString()))
			return saveRecord((Customer) entity);
		
		if(operationType.equals(OperationType.PART.toString()))
			return saveRecord((Part) entity);
		
		if(operationType.equals(OperationType.MODEL.toString()))
			return saveRecord((Model) entity);
		
		if(operationType.equals(OperationType.PLANT.toString()))
			return saveRecord((Plant) entity);
		
		return 0;
	}
	public int saveRecord(AssemblyEntity assembly) throws Exception {
		int status=0;
		persist(assembly);
		status=1;		
		return status;
	}

	
	public static int validateAndGetLatestSprId(String type,int sprId) {
		int spr_id=0;
		AssemblyDao sprDao=new AssemblyDaoImplH();
		int assembly_id=sprDao.fetchLastSerialNo(type);
		int getAssemblyBySpr=sprId-1;
		if(assembly_id==getAssemblyBySpr) {
			return sprId;
		}
		spr_id=assembly_id+1;
		return spr_id;
	}

	public int saveRecord(Assembly assembly) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int saveRecord(ExtrusionEntity assembly) {
		int status=0;
		try{
			persist(assembly);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	public int saveRecord(FlockingEntity assembly) {
		int status=0;
		try{
			persist(assembly);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	public int saveRecord(RejectionEntitiy assembly) {
		int status=0;
		try{
			persist(assembly);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	public int saveRecord(Customer customer) {
		int status=0;
		try{
			persist(customer);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	public int saveRecord(Part part) {
		int status=0;
		try{
			persist(part);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	public int saveRecord(Model model) {
		int status=0;
		try{
			persist(model);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	public int saveRecord(Plant plant) {
		int status=0;
		try{
			persist(plant);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
	@SuppressWarnings("unchecked")
	public Set<String> loadAllCustomerGroup(){
		Set<String> customergrpList;
		Query query=getSession().createQuery("select distinct customer_group from Customer order by customer_group");
		customergrpList=new HashSet<String>( query.list());
		//customergrpList.addAll((HashSet<String>) query.list());
		return customergrpList;
	}
	
	public Set<String> loadModelDetailsByCustomerGroup(String customerGroup){
		Set<String> modelList;
		Query query=getSession().createQuery("select distinct model_name from Model where model_no='"+customerGroup+"' order by model_name");
		modelList=new HashSet<String>( query.list());
		//customergrpList.addAll((HashSet<String>) query.list());
		return modelList;
	}
	
	public Set<String> loadPartListByModelAndCustomerGrp(String model,String customerGroup){
		
		Set<String> partList;
		
		Query query=getSession().createQuery("select distinct part_name from Part where car_model='"+model+"' and customer_group='"+customerGroup+"' order by part_name");
		partList=new HashSet<String>(query.list());
		
		return partList;
	}
	public int fetchLastSerialNo(String type) {
		String serialNoQuery="";
		if(type.equals("ASSEMBLY"))
			serialNoQuery="select  MAX(assembly_id) from AssemblyEntity";
		else if(type.equals("FLOCKING"))
			serialNoQuery="select MAX(flocking_id) from FlockingEntity";
		else if(type.equals("EXTRUSION"))
			serialNoQuery="select MAX(extrusion_id) from ExtrusionEntity";
		else if(type.equals("REJECTION"))
			serialNoQuery="select MAX(rejection_id) from RejectionEntity ";
		
		
		Query query=getSession().createQuery(serialNoQuery);
		int serialNo=0;
		 
		serialNo=(Integer) query.uniqueResult();
		return serialNo;
	}
	
	public List<AssemblyEntity> loadAssemblyRecords(String emp_code,String plantFilter,String fetchingType) {
		
		List<AssemblyEntity> assemblyList;
		Query query;
		if(fetchingType.equals(FetchingType.INDIVIDUAL.toString()))
			query=getSession().createQuery("from AssemblyEntity where user_id='"+emp_code+"' order by assembly_id desc");
		else
			query=getSession().createQuery("from AssemblyEntity where user_id IN (select distinct emp_code from EmployeeEntity where reports_to='"+emp_code+"') or user_id='"+emp_code+"'  order by assembly_id desc");
		assemblyList=query.list();							
		return assemblyList;
	}
	
public List<ExtrusionEntity> loadExtrusionRecords(String emp_code,String plantFilter,String fetchingType) {
		
	List<ExtrusionEntity> extrusionList;
		Query query;
		if(fetchingType.equals(FetchingType.INDIVIDUAL.toString()))
			query=getSession().createQuery("from ExtrusionEntity where user_id='"+emp_code+"' order by extrusion_id desc");
		else
			query=getSession().createQuery("from ExtrusionEntity where user_id IN (select distinct emp_code from EmployeeEntity where reports_to='"+emp_code+"') or user_id='"+emp_code+"'  order by extrusion_id desc");
		extrusionList=query.list();							
		return extrusionList;
	}
	
public List<FlockingEntity> loadFlockingRecords(String emp_code,String plantFilter,String fetchingType) {
	
	List<FlockingEntity> flockingList;
		Query query;
		if(fetchingType.equals(FetchingType.INDIVIDUAL.toString()))
			query=getSession().createQuery("from FlockingEntity where user_id='"+emp_code+"' order by flocking_id desc");
		else
			query=getSession().createQuery("from FlockingEntity where user_id IN (select distinct emp_code from EmployeeEntity where reports_to='"+emp_code+"') or user_id='"+emp_code+"'  order by flocking_id desc");
		flockingList=query.list();							
		return flockingList;
	}
	public List<AssemblyEntity> loadAssemblyRecords(String plantFilter) {
		
		List<AssemblyEntity> assemblyList;
		
		Query query=getSession().createQuery("from AssemblyEntity where plantno in ("+plantFilter+")  order by assembly_id desc");
		assemblyList=query.list();
		return assemblyList;
	}
	
public List<ExtrusionEntity> loadExtrusionRecords(String plantFilter) {
		
		List<ExtrusionEntity> extrusionList;
		
		Query query=getSession().createQuery("from ExtrusionEntity where plantno in ("+plantFilter+")  order by extrusion_id desc");
		extrusionList=query.list();
		return extrusionList;
	}


public List<FlockingEntity> loadFlockingRecords(String plantFilter) {
	
	List<FlockingEntity> flockingList;
	
	Query query=getSession().createQuery("from FlockingEntity where plantno in ("+plantFilter+")  order by flocking_id desc");
	flockingList=query.list();
	return flockingList;
}
	
	public int updateAssemblyRecord(AssemblyEntity assemblyEntity) {
		
		int status=0;
		try{
			update(assemblyEntity);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}
	
public int updateExtrusionRecord(ExtrusionEntity extrusionEntity) {
		
		int status=0;
		try{
			update(extrusionEntity);
			status=1;
		}
		catch(Exception ex){
			System.out.println("Error Occurred :- "+ex.toString());
		}
		return status;
	}

public int updateFlockingRecord(FlockingEntity flockingEntity) {
	
	int status=0;
	try{
		update(flockingEntity);
		status=1;
	}
	catch(Exception ex){
		System.out.println("Error Occurred :- "+ex.toString());
	}
	return status;
}
	
	public int updateApproveStatus(int isApproved,int approvedBy,Date approved_date,Date modify_date,int id,String type ) {
		String approveStatusQuery="";
		if(type.equals("ASSEMBLY")) {
			approveStatusQuery="update AssemblyEntity set isApproved=?,approvedBy=?,approveDate=?,modifyDate=? where assembly_id=?";
		}
		else if(type.equals("EXTRUSION")) {
			approveStatusQuery="update ExtrusionEntity set isApproved=?,approvedBy=?,approveDate=?,modifyDate=? where extrusion_id=?";
		}
		else if(type.equals("FLOCKING")) {
			approveStatusQuery="update FlockingEntity set isApproved=?,approvedBy=?,approveDate=?,modifyDate=? where flocking_id=?";
		}
		
		Query query=getSession().createQuery(approveStatusQuery);
		query.setParameter(0, isApproved);
		query.setParameter(1, approvedBy);
		query.setParameter(2, approved_date);
		query.setParameter(3, modify_date);
		query.setParameter(4, id);
		
		int result=query.executeUpdate();
		return result;
		
	}
	
	
	
	
	

}
