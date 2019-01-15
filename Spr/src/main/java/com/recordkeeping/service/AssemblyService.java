package com.recordkeeping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.recordkeeping.model.Assembly;
import com.recordkeeping.model.AssemblyEntity;
import com.recordkeeping.model.Customer;
import com.recordkeeping.model.ExtrusionEntity;
import com.recordkeeping.model.FlockingEntity;
import com.recordkeeping.model.Model;
import com.recordkeeping.model.Part;
import com.recordkeeping.model.Plant;
import com.recordkeeping.model.RejectionEntitiy;

public interface AssemblyService {

	
	//public boolean saveRecordEntity(List<Object> assembly,String type);
	public HashMap<String,String> saveRecordEntity(List<Object> sprRecordList, String type);
	//public boolean saveRecordEntity(AssemblyEntity assembly);
	public HashMap<String,String> saveRecordEntity(AssemblyEntity assembly);

	//public boolean saveRecordEntity(ExtrusionEntity extrusion);
	public HashMap<String,String> saveRecordEntity(ExtrusionEntity extrusion);
	//public boolean saveRecordEntity(FlockingEntity flocking);
	public HashMap<String,String> saveRecordEntity(FlockingEntity flocking);
	//public boolean saveRecordEntity(RejectionEntitiy rejection);
	public HashMap<String,String> saveRecordEntity(RejectionEntitiy rejection);
	public boolean saveRecordEntity(Customer customer);
	public boolean saveRecordEntity(Part part);
	public boolean saveRecordEntity(Model model);
	public boolean saveRecordEntity(Plant plant);
	public Set<String> loadAllCustomerGroup();
	public Set<String> loadModelByCustomerGroup(String customerGroup);
	public HashMap<String,Set<String>> loadPartModelDetailsByCustomerGroup(String customerGroup);
	public Set<String> loadPartDetailsByCustomerGroup(String customerGroup,String model);
	public int fetchLastSerialNO(String type);
	public List<AssemblyEntity> loadAssemblyListService(String emp_code,String emp_role,String plant);
	public List<ExtrusionEntity> loadExtrusionListService(String emp_code,String emp_role,String plant);
	public List<FlockingEntity> loadFlockingListService(String emp_code,String emp_role,String plant);
	public boolean updateRecordEntity(AssemblyEntity assembly);
	public boolean updateRecordEntity(ExtrusionEntity extrusion);
	public boolean updateRecordEntity(FlockingEntity flocking);
	public HashMap<String,String> validateRecord(Object entity,String type);
	public boolean approveEntryService(Object entity,String type);
}
