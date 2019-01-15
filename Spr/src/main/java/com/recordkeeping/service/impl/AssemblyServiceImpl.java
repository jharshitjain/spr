package com.recordkeeping.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.recordkeeping.dao.AssemblyDao;
import com.recordkeeping.model.Assembly;
import com.recordkeeping.model.AssemblyEntity;
import com.recordkeeping.model.Customer;
import com.recordkeeping.model.ExtrusionEntity;
import com.recordkeeping.model.FlockingEntity;
import com.recordkeeping.model.Model;
import com.recordkeeping.model.Part;
import com.recordkeeping.model.Plant;
import com.recordkeeping.model.RejectionEntitiy;
import com.recordkeeping.service.AssemblyService;
import com.recordkeeping.util.AssemblyUtil;
import com.recordkeeping.util.FetchingType;
import com.recordkeeping.util.OperationType;

@Service
public class AssemblyServiceImpl implements AssemblyService {

	@Autowired
	@Qualifier("AssemblyDaoH")
	private AssemblyDao assemblydaoObj;


	public HashMap<String,String> saveRecordEntity(AssemblyEntity assembly) {
		int result=0;
		HashMap<String,String> response=new HashMap<String, String>();
		try {
			result = assemblydaoObj.persistRecord(OperationType.ASSEMBLY.toString(),assembly);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		if(result==1) {
			response.put("RESPONSEFLAG","SUCCESS");
			response.put("ASSEMBLY_ID",String.valueOf(assemblydaoObj.fetchLastSerialNo(OperationType.ASSEMBLY.toString())));
		}
		
		return response;
	}
	

	public HashMap<String,String> saveRecordEntity(ExtrusionEntity extrusion) {
		int result=0;
		HashMap<String,String> response=new HashMap<String, String>();
		try {
			result = assemblydaoObj.persistRecord(OperationType.EXTRUSION.toString(),extrusion);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		if(result==1) {
			response.put("RESPONSEFLAG","SUCCESS");
			response.put("EXTRUSION_ID",String.valueOf(assemblydaoObj.fetchLastSerialNo(OperationType.EXTRUSION.toString())));
		}
		
		return response;
	}


	

	public HashMap<String,String> saveRecordEntity(FlockingEntity flocking) {
		int result=0;
		HashMap<String,String> response=new HashMap<String, String>();
		try {
			result = assemblydaoObj.persistRecord(OperationType.FLOCKING.toString(),flocking);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		if(result==1) {
			response.put("RESPONSEFLAG","SUCCESS");
			response.put("FLOCKING_ID",String.valueOf(assemblydaoObj.fetchLastSerialNo(OperationType.FLOCKING.toString())));
		}
		
		return response;
	}

	public HashMap<String,String> saveRecordEntity(RejectionEntitiy rejection) {
		int result=0;
		HashMap<String,String> response=new HashMap<String, String>();
		try {
			result = assemblydaoObj.persistRecord(OperationType.REJECTION.toString(),rejection);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		if(result==1) {
			response.put("RESPONSEFLAG","SUCCESS");
			response.put("REJECTION_ID",String.valueOf(assemblydaoObj.fetchLastSerialNo(OperationType.REJECTION.toString())));
		}
		
		return response;
	}
	
	public boolean saveRecordEntity(Customer customer) {
		int result=0;
		try {
			result = assemblydaoObj.persistRecord(OperationType.CUSTOMER.toString(), customer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==1)
			return true;
		return false;
	}

	public boolean saveRecordEntity(Part part) {
		int result=0;
		try {
			result = assemblydaoObj.persistRecord(OperationType.PART.toString(), part);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==1)
			return true;
		return false;
	}

	public boolean saveRecordEntity(Model model) {
		int result=0;
		try {
			result = assemblydaoObj.persistRecord(OperationType.MODEL.toString(), model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==1)
			return true;
		return false;
	}

	public boolean saveRecordEntity(Plant plant) {
		int result=0;
		try {
			result = assemblydaoObj.persistRecord(OperationType.PLANT.toString(), plant);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==1)
			return true;
		return false;
	}
	
	public Set<String> loadAllCustomerGroup(){
		return assemblydaoObj.loadAllCustomerGroup();
	}
	
	public HashMap<String,Set<String>> loadPartModelDetailsByCustomerGroup(String customerGroup){
		Set<String> modelList=assemblydaoObj.loadModelDetailsByCustomerGroup(customerGroup);
		HashMap<String,Set<String>> partModelObject=new HashMap<String, Set<String>>();
		Iterator<String> modelIterator=modelList.iterator();
		while(modelIterator.hasNext()) {
			String model=modelIterator.next();
			Set<String> partList=assemblydaoObj.loadPartListByModelAndCustomerGrp(model, customerGroup);
			partModelObject.put(model, partList);
		}
		return partModelObject;
	}
	
	public Set<String> loadPartDetailsByCustomerGroup(String customerGroup,String model){
		//Set<String> modelList=assemblydaoObj.loadPartListByModelAndCustomerGrp(model, customerGroup);
		return assemblydaoObj.loadPartListByModelAndCustomerGrp(model, customerGroup);
	}
	
	public Set<String> loadModelByCustomerGroup(String customerGroup){
		return assemblydaoObj.loadModelDetailsByCustomerGroup(customerGroup);
	}

	public int fetchLastSerialNO(String type) {
		// TODO Auto-generated method stub
		return assemblydaoObj.fetchLastSerialNo(type);
	}
	public HashMap<String,String> saveRecordEntity(List<Object> sprRecordList, String type) {
		// TODO Auto-generated method stub
		List<Object> entityObject=sprRecordList;
		Iterator<Object> entityIterator=entityObject.iterator();
		HashMap<String,String> finalResult=null;
		while(entityIterator.hasNext()) {
			if(type.equalsIgnoreCase(OperationType.ASSEMBLY.toString())) {
				AssemblyEntity assemblyRecord=(AssemblyEntity) entityIterator.next();
				finalResult=saveRecordEntity(assemblyRecord);
			}
			else if(type.equalsIgnoreCase(OperationType.EXTRUSION.toString())) {
				ExtrusionEntity extrusionRecord=(ExtrusionEntity) entityIterator.next();
				finalResult=saveRecordEntity(extrusionRecord);
			}
			else if(type.equalsIgnoreCase(OperationType.FLOCKING.toString())) {
				FlockingEntity flockingRecord=(FlockingEntity) entityIterator.next();
				finalResult=saveRecordEntity(flockingRecord);
			}
			else if(type.equalsIgnoreCase(OperationType.REJECTION.toString())) {
				RejectionEntitiy rejectionRecord=(RejectionEntitiy) entityIterator.next();
				finalResult=saveRecordEntity(rejectionRecord);
			}
		}
		
		return finalResult;
	}
	
	public List<AssemblyEntity> loadAssemblyListService(String emp_code,String emp_role,String plant){
		List<AssemblyEntity> loadAssembly=null;
		if(emp_role.equalsIgnoreCase("Team Leader")) {
			loadAssembly=assemblydaoObj.loadAssemblyRecords(emp_code, "", FetchingType.INDIVIDUAL.toString());
			
		}
		else if(emp_role.equalsIgnoreCase("Plant Head")) {
			
			loadAssembly=assemblydaoObj.loadAssemblyRecords(AssemblyUtil.plantFilter(plant));
		}
		else if(emp_role.equalsIgnoreCase("Group Leader")) {
			loadAssembly=assemblydaoObj.loadAssemblyRecords(emp_code, AssemblyUtil.plantFilter(plant), FetchingType.REPORT_TO.toString());
		}
		return loadAssembly;
	}
	
	public List<ExtrusionEntity> loadExtrusionListService(String emp_code,String emp_role,String plant){
		List<ExtrusionEntity> loadExtrusion=null;
		if(emp_role.equalsIgnoreCase("Team Leader")) {
			loadExtrusion=assemblydaoObj.loadExtrusionRecords(emp_code, "", FetchingType.INDIVIDUAL.toString());
			
		}
		else if(emp_role.equalsIgnoreCase("Plant Head")) {
			
			loadExtrusion=assemblydaoObj.loadExtrusionRecords(AssemblyUtil.plantFilter(plant));
		}
		else if(emp_role.equalsIgnoreCase("Group Leader")) {
			loadExtrusion=assemblydaoObj.loadExtrusionRecords(emp_code, AssemblyUtil.plantFilter(plant), FetchingType.REPORT_TO.toString());
		}
		return loadExtrusion;
	}
	
	public List<FlockingEntity> loadFlockingListService(String emp_code,String emp_role,String plant){
		List<FlockingEntity> loadFlocking=null;
		if(emp_role.equalsIgnoreCase("Team Leader")) {
			loadFlocking=assemblydaoObj.loadFlockingRecords(emp_code, "", FetchingType.INDIVIDUAL.toString());
			
		}
		else if(emp_role.equalsIgnoreCase("Plant Head")) {
			
			loadFlocking=assemblydaoObj.loadFlockingRecords(AssemblyUtil.plantFilter(plant));
		}
		else if(emp_role.equalsIgnoreCase("Group Leader")) {
			loadFlocking=assemblydaoObj.loadFlockingRecords(emp_code, AssemblyUtil.plantFilter(plant), FetchingType.REPORT_TO.toString());
		}
		return loadFlocking;
	}
	
	public HashMap<String,String> validateRecord(Object entity,String type){
		HashMap<String, String> response=new HashMap<String, String>();
		if(type.equals("ASSEMBLY")) {
			return AssemblyServiceImpl.assemblyPatternCheck((AssemblyEntity) entity, response, type);			
		}
		
		if(type.equals("EXTRUSION")) {
			return AssemblyServiceImpl.extrusionPatternCheck((ExtrusionEntity)entity, response, type);
		}
		
		if(type.equals("FLOCKING")) {
			return AssemblyServiceImpl.flockingPatternCheck((FlockingEntity)entity, response, type);
		}
		
		return null;
	}
	
	public static HashMap<String,String> assemblyPatternCheck(AssemblyEntity entity,HashMap<String,String> response,String type) {
		HashMap<String,String> patternStore=new HashMap<String, String>();
		patternStore.put("LENGTHVAL1", "6");
		patternStore.put("LENGTHVAL2", "4");
		patternStore.put("LENGTHVAL3", "3");
		patternStore.put("LENGTHVAL4", "2");
		patternStore.put("PATTERN1", "\\d+");
		patternStore.put("PATTERN2", "^[0-9]\\d*(\\.\\d+)?$");
		
		if(type.equals("ASSEMBLY")) {
			AssemblyEntity entityObj= entity;
			System.out.println("Matches - "+ entityObj.getProd_target().matches(patternStore.get("PATTERN1")));
			if(entityObj.getProd_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Prod Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Prod Target value should be numeric !");
				return response;
			}
			
			if(entityObj.getProd_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Prod Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Prod Actual value should be numeric !");
				return response;
			}
			
			if(entityObj.getCellno().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getCellno().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Cell No field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Cell No value should be numeric !");
				return response;
			}
			
			if(entityObj.getUsed_man_power().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL2"));
				if(entityObj.getUsed_man_power().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Used Man Power field length should be equal or less than 4 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Used Man Power value should be numeric !");
				return response;
			}
			
			if(entityObj.getProdplan_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL3"));
				if(entityObj.getProdplan_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Production Plan Time field length should be equal or less than 3 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Production Plan Time value should be numeric !");
				return response;
			}
			if(entityObj.getDown_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getDown_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Down Time field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Down Time value should be numeric !");
				return response;
			}
			
			if(entityObj.getBd_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getBd_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Break Down Time field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Break Down Time value should be numeric !");
				return response;
			}
			
			if(entityObj.getProdrun_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL3"));
				if(entityObj.getProdrun_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Production Run Time field length should be equal or less than 3 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Production Run Time value should be numeric !");
				return response;
			}
			if(entityObj.getNo_of_co().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getNo_of_co().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "No of Change Over field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "No of Change Over value should be numeric !");
				return response;
			}
			if(entityObj.getStartuptime_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getStartuptime_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Start up Time Target field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Start Up Time Target value should be numeric !");
				return response;
			}
			if(entityObj.getStartuptime_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getStartuptime_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Start Up Time Actual field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Start Up Time Actual value should be numeric !");
				return response;
			}
			if(entityObj.getNo_of_setup().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getNo_of_setup().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "No of Setup field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "No of Setup value should be numeric !");
				return response;
			}
			if(entityObj.getInternal_rej().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getInternal_rej().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Internal Rej field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Internal Rej value should be numeric !");
				return response;
			}
			if(entityObj.getCo_time_target().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_time_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Time Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Time Target value should be numeric or in Decimal !");
				return response;
			}
			
			if(entityObj.getCo_time_actual().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_time_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Time Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Time Actual value should be numeric or in Decimal !");
				return response;
			}
			
			if(entityObj.getMldgprocess_scrap().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getMldgprocess_scrap().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Mldg Process Scrap field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Mldg Process Scrap value should be numeric or in Decimal !");
				return response;
			}
			if(entityObj.getMldgstartup_scrap().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getMldgstartup_scrap().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Mldg Process Startup Process field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Mldg Process Startup Process value should be numeric or in Decimal !");
				return response;
			}
			
			if(entityObj.getProcess_scrap().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProcess_scrap().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Process_scrap field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Process_scrap value should be numeric or in Decimal !");
				return response;
			}
		}
		return response;
	}
	
	public static HashMap<String,String> extrusionPatternCheck(ExtrusionEntity entity,HashMap<String,String> response,String type) {
		HashMap<String,String> patternStore=new HashMap<String, String>();
		patternStore.put("LENGTHVAL1", "6");
		//patternStore.put("LENGTHVAL2", "4");
		patternStore.put("LENGTHVAL3", "3");
		patternStore.put("LENGTHVAL4", "2");
		patternStore.put("PATTERN1", "\\d+");
		patternStore.put("PATTERN2", "^[0-9]\\d*(\\.\\d+)?$");
		
		if(type.equals("EXTRUSION")) {
			ExtrusionEntity entityObj=(ExtrusionEntity) entity;
			
			System.out.println("Matches - "+ entityObj.getProd_target().matches(patternStore.get("PATTERN1")));
			if(entityObj.getProd_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Prod Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Prod Target value should be numeric !");
				return response;
			}
			
			if(entityObj.getProd_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Prod Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Prod Actual value should be numeric !");
				return response;
			}
			
			if(entityObj.getLine().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getLine().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Line field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Line value should be numeric !");
				return response;
			}
			
			if(entityObj.getProd_kg().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_kg().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Production Kg field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Production Kg value should be numeric or in decimal !");
				return response;
			}
			
			if(entityObj.getProdplan_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL3"));
				if(entityObj.getProdplan_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Production Plan Time field length should be equal or less than 3 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Production Plan Time value should be numeric !");
				return response;
			}
			if(entityObj.getSetuptime_taget().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getSetuptime_taget().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Set Up Time Target length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Set Up Time Target value should be numeric !");
				return response;
			}
			
			if(entityObj.getSetuptime_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getSetuptime_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Set Up Time Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Set Up Time Actual value should be numeric !");
				return response;
			}
			
			if(entityObj.getCo_time_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_time_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Time Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Time Target value should be numeric !");
				return response;
			}
			if(entityObj.getCo_time_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_time_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Time Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Time Actual value should be numeric !");
				return response;
			}
			if(entityObj.getDown_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getDown_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Down Time field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Down Time value should be numeric !");
				return response;
			}
			if(entityObj.getBd_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getBd_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Break Down Time field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Break Down Time value should be numeric !");
				return response;
			}
			if(entityObj.getProdrun_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL3"));
				if(entityObj.getProdrun_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Production Run Time field length should be equal or less than 3 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Production Run Time value should be numeric !");
				return response;
			}
			if(entityObj.getNo_of_co().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getNo_of_co().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "No OF Change Over field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "No of Change Over value should be numeric !");
				return response;
			}
			if(entityObj.getNo_of_Setup().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getNo_of_Setup().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "No Of Setup field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "No Of Setup value should be numeric  !");
				return response;
			}
			
			if(entityObj.getLine_rej_target().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getLine_rej_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Line Rejection Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Line Rejection Target value should be numeric or in Decimal !");
				return response;
			}
			
			if(entityObj.getLine_rej_actual().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getLine_rej_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Line Rejection Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Line Rejection Actual value should be numeric or in Decimal !");
				return response;
			}
			if(entityObj.getCo_scrap_taget().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_scrap_taget().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Scrap Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Scrap Target value should be numeric or in Decimal !");
				return response;
			}
			
			if(entityObj.getCo_scrap_actual().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_scrap_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Scrap Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Scrap Actual value should be numeric or in Decimal !");
				return response;
			}
			
			if(entityObj.getTrail_rej().matches(patternStore.get("PATTERN2"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getTrail_rej().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Trail Rejection field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Trail Rejection value should be numeric or in Decimal !");
				return response;
			}
			
			
		}
		return response;
	}
	
	
	
	
	public static HashMap<String,String> flockingPatternCheck(FlockingEntity entity,HashMap<String,String> response,String type) {
		HashMap<String,String> patternStore=new HashMap<String, String>();
		patternStore.put("LENGTHVAL1", "6");
		patternStore.put("LENGTHVAL2", "4");
		patternStore.put("LENGTHVAL3", "3");
		patternStore.put("LENGTHVAL4", "2");
		patternStore.put("PATTERN1", "\\d+");
		patternStore.put("PATTERN2", "^[0-9]\\d*(\\.\\d+)?$");
		
		if(type.equals("FLOCKING")) {
			FlockingEntity entityObj=(FlockingEntity) entity;
			
			System.out.println("Matches - "+ entityObj.getProd_target().matches(patternStore.get("PATTERN1")));
			if(entityObj.getProd_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Prod Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Prod Target value should be numeric !");
				return response;
			}
			
			if(entityObj.getProd_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getProd_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Prod Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Prod Actual value should be numeric !");
				return response;
			}
			
			if(entityObj.getLine().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getLine().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Line field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Line value should be numeric !");
				return response;
			}
			
			if(entityObj.getUsed_man_power().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL2"));
				if(entityObj.getUsed_man_power().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Used Man Power field length should be equal or less than 4 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Used Man Power value should be numeric !");
				return response;
			}
			
			if(entityObj.getDown_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getDown_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Down Time field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Down Time value should be numeric !");
				return response;
			}
			if(entityObj.getBd_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getBd_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Break Down Time length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Break Down Time value should be numeric !");
				return response;
			}
			
			if(entityObj.getCo_time_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_time_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Time Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Time Target value should be numeric !");
				return response;
			}
			
			if(entityObj.getCo_time_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getCo_time_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Change Over Time Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Change Over Time Actual value should be numeric !");
				return response;
			}
			if(entityObj.getProdrun_time().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL3"));
				if(entityObj.getProdrun_time().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Production Run Time field length should be equal or less than 3 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Production Run Time value should be numeric !");
				return response;
			}
			if(entityObj.getNo_of_co().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getNo_of_co().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "No Of Change Over length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "No Of Change Over value should be numeric !");
				return response;
			}
			if(entityObj.getStartuptime_target().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getStartuptime_target().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Start up Time Target field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Start up Time Target value should be numeric !");
				return response;
			}
			if(entityObj.getStartuptime_actual().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getStartuptime_actual().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Start Up Time Actual field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Start Up Time Actual value should be numeric !");
				return response;
			}
			if(entityObj.getNo_of_setup().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL4"));
				if(entityObj.getNo_of_setup().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "No OF Set Up Over field length should be equal or less than 2 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "No of Set Up value should be numeric !");
				return response;
			}
			if(entityObj.getInternal_rej().matches(patternStore.get("PATTERN1"))) {
				int lengthVal=Integer.parseInt(patternStore.get("LENGTHVAL1"));
				if(entityObj.getInternal_rej().length()<=lengthVal) {
					response.put("VALIDATIONFLAG", "SUCCESS");
				}
				else {
					response.put("VALIDATIONFLAG", "FAILED");
					response.put("ERRORMESSAGE", "Internal Rejection field length should be equal or less than 6 !");
					return response;
				}
			}
			else {
				response.put("VALIDATIONFLAG", "FAILED");
				response.put("ERRORMESSAGE", "Internal Rejection value should be numeric or decimal  !");
				return response;
			}
			
			
			
			
		}
		return response;
	}
	
/*	public HashMap<String,String> blankCheck(Object entity,HashMap<String,String> response,String type) {
		if(type.equals("ASSEMBLY")) {
			AssemblyEntity assemblyEntity=(AssemblyEntity) entity;
			if(((assemblyEntity.getHod().equals("")) || (assemblyEntity.getHod()==null)) || (assemblyEntity.getCellno().equals("") || assemblyEntity.getCellno()==null)
					|| (assemblyEntity.getProd_target().equals("") || assemblyEntity.getProd_target()==null) || ((assemblyEntity.getProd_actual().equals("") || assemblyEntity.getProd_actual()==null))
					||(assemblyEntity.getUsed_man_power().equals("") || assemblyEntity.getUsed_man_power()==null)||(assemblyEntity.getProdplan_time().equals("") || assemblyEntity.getProdplan_time()==null)
					||(assemblyEntity.getDown_time().equals("") || assemblyEntity.getDown_time()==null)||(assemblyEntity.getBd_time().equals("") || assemblyEntity.getBd_time()==null)
					||(assemblyEntity.getProdrun_time().equals("") || assemblyEntity.getProdrun_time()==null)||(assemblyEntity.getCo_time_target().equals("") || assemblyEntity.getCo_time_target()==null)
					||(assemblyEntity.getCo_time_actual().equals("") || assemblyEntity.getCo_time_actual()==null)||(assemblyEntity.getNo_of_co().equals("") || assemblyEntity.getNo_of_co()==null)||
					(assemblyEntity.getStartuptime_target().equals("") || assemblyEntity.getStartuptime_target()==null)||(assemblyEntity.getStartuptime_actual().equals("") || assemblyEntity.getStartuptime_actual()==null)||
					(assemblyEntity.getNo_of_setup().equals("") || assemblyEntity.getNo_of_setup()==null)||
					(assemblyEntity.getInternal_rej().equals("") || assemblyEntity.getInternal_rej()==null)||
					(assemblyEntity.getMldgprocess_scrap().equals("") || assemblyEntity.getMldgprocess_scrap()==null)||(assemblyEntity.getMldgstartup_scrap().equals("") || assemblyEntity.getMldgstartup_scrap()==null)||
					(assemblyEntity.getProcess_scrap().equals("") || assemblyEntity.getProcess_scrap()==null)) {
				response.put("RESPONSEFLAG", "TRUE");
			}
				
		}
		
		return null;
	}*/
	public boolean updateRecordEntity(AssemblyEntity assembly) {
		int result=assemblydaoObj.updateAssemblyRecord(assembly);
		if(result==1)
			return true;
		return false;
	}
	
	public boolean updateRecordEntity(ExtrusionEntity extrusion) {
		int result=assemblydaoObj.updateExtrusionRecord(extrusion);
		if(result==1)
			return true;
		return false;
	}
	
	public boolean updateRecordEntity(FlockingEntity flocking) {
		int result=assemblydaoObj.updateFlockingRecord(flocking);
		if(result==1)
			return true;
		return false;
	}


	
	public boolean approveEntryService(Object entity,String type) {
		int result=0;
		if(type.equals("ASSEMBLY")) {
			AssemblyEntity assembly=(AssemblyEntity) entity;
			result=assemblydaoObj.updateApproveStatus(assembly.getIsApproved(), assembly.getApprovedBy(), assembly.getApproveDate(), assembly.getModifyDate(), assembly.getAssembly_id(),type);
			if(result==1)
				return true;
		}
		else if(type.equals("EXTRUSION")) {
			ExtrusionEntity extrusion=(ExtrusionEntity) entity;
			result=assemblydaoObj.updateApproveStatus(extrusion.getIsApproved(), extrusion.getApprovedBy(), extrusion.getApproveDate(), extrusion.getModifyDate(), extrusion.getExtrusion_id(),type);
			if(result==1)
				return true;
		}
		
		else if(type.equals("EXTRUSION")) {
			FlockingEntity flocking=(FlockingEntity) entity;
			result=assemblydaoObj.updateApproveStatus(flocking.getIsApproved(), flocking.getApprovedBy(), flocking.getApproveDate(), flocking.getModifyDate(), flocking.getFlocking_id(),type);
			if(result==1)
				return true;
		}
			
		return false;
	}

}
