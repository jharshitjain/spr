package com.recordkeeping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.recordkeeping.model.Assembly;
import com.recordkeeping.model.AssemblyEntity;
import com.recordkeeping.model.Customer;
import com.recordkeeping.model.EmployeeEntity;
import com.recordkeeping.model.ExtrusionEntity;
import com.recordkeeping.model.FlockingEntity;
import com.recordkeeping.model.Model;
import com.recordkeeping.model.Part;
import com.recordkeeping.model.Plant;
import com.recordkeeping.model.RejectionEntitiy;
import com.recordkeeping.service.AssemblyService;
import com.recordkeeping.service.EmployeeService;

@RestController
public class RecordKeepingController {
	
	public RecordKeepingController() {
		System.out.println("Controller constructor called");
	}
	@Autowired
	private AssemblyService assemblyService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(path="/persistAssembly",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public HashMap<String,String> storeAssemblyRecord(@RequestBody AssemblyEntity assembly){
		System.out.println("Request Received"+assembly.getCustomer()+" Assembly Date is - "+ assembly.getAssembly_date());
		HashMap<String, String> result=assemblyService.saveRecordEntity(assembly);
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistAssemblyList" ,produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public HashMap<String,String> storeAssemblyList(@RequestBody List<AssemblyEntity> assembly){
		System.out.println("Request Received"+assembly.toString());
		List<Object> recordList=new ArrayList<Object>();
		Iterator<AssemblyEntity> entityIterator=assembly.iterator();
		while(entityIterator.hasNext()) {
			recordList.add(entityIterator.next());
		}
		
		HashMap<String,String> result=assemblyService.saveRecordEntity(recordList,"ASSEMBLY");
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistExtrusion",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public  HashMap<String,String> storeExtrusionRecord(@RequestBody ExtrusionEntity extrusion){
		System.out.println("Request Received");
		 HashMap<String,String> result=assemblyService.saveRecordEntity(extrusion);
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistExtrusionList",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public  HashMap<String,String> storeExtrusionList(@RequestBody List<ExtrusionEntity> extrusion){
		System.out.println("Request Received"+extrusion.toString());
		List<Object> recordList=new ArrayList<Object>();
		Iterator<ExtrusionEntity> entityIterator=extrusion.iterator();
		while(entityIterator.hasNext()) {
			recordList.add(entityIterator.next());
		}
		
		 HashMap<String,String> result=assemblyService.saveRecordEntity(recordList,"EXTRUSION");
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistFlocking",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public  HashMap<String,String> storeFlockingRecord(@RequestBody FlockingEntity flocking){
		System.out.println("Request Received");
		 HashMap<String,String> result=assemblyService.saveRecordEntity(flocking);
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistFlockingList",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public  HashMap<String,String> storeFlockingRecord(@RequestBody List<FlockingEntity> flocking){
		System.out.println("Request Received"+flocking.toString());
		List<Object> recordList=new ArrayList<Object>();
		Iterator<FlockingEntity> entityIterator=flocking.iterator();
		while(entityIterator.hasNext()) {
			recordList.add(entityIterator.next());
		}
		
		 HashMap<String,String> result=assemblyService.saveRecordEntity(recordList,"FLOCKING");
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistRejection",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public  HashMap<String,String> storeRejectionRecord(@RequestBody RejectionEntitiy rejection){
		System.out.println("Request Received");
		 HashMap<String,String> result=assemblyService.saveRecordEntity(rejection);
		System.out.println("Controller result - "+result.get("RESPONSEFLAG"));
		return result;
	}
	
	@RequestMapping(path="/persistCustomer",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public boolean storeRejectionRecord(@RequestBody Customer customer){
		System.out.println("Request Received");
		boolean result=assemblyService.saveRecordEntity(customer);
		System.out.println("Controller result - "+result);
		return result;
	}
	
	@RequestMapping(path="/persistPart",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public boolean storeRejectionRecord(@RequestBody Part part){
		System.out.println("Request Received");
		boolean result=assemblyService.saveRecordEntity(part);
		System.out.println("Controller result - "+result);
		return result;
	}
	
	@RequestMapping(path="/persistModel",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public boolean storeRejectionRecord(@RequestBody Model model){
		System.out.println("Request Received");
		boolean result=assemblyService.saveRecordEntity(model);
		System.out.println("Controller result - "+result);
		return result;
	}
	
	@RequestMapping(path="/persistPlant",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public boolean storeRejectionRecord(@RequestBody Plant plant){
		System.out.println("Request Received");
		boolean result=assemblyService.saveRecordEntity(plant);
		System.out.println("Controller result - "+result);
		return result;
	}
	
	@RequestMapping(path="/loadCustomerGroup",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public Set<String> loadCustomerGroup(){			
		
		return assemblyService.loadAllCustomerGroup();
	}
	
	@RequestMapping(path="/loadModel",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public Set<String> loadModelList(@RequestBody String customerGroup){			
		
		return assemblyService.loadModelByCustomerGroup(customerGroup);
	}
	
	@RequestMapping(path="/loadPart",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public  Set<String> loadPartList(@RequestParam String customerGroup,@RequestParam String model){					
		return assemblyService.loadPartDetailsByCustomerGroup(customerGroup,model);
	}
	
	@RequestMapping(path="/authenticateUser",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public ResponseEntity<EmployeeEntity> authentication(@RequestBody EmployeeEntity employee){	
		System.out.println("Authenticate Service Called");
		ResponseEntity<EmployeeEntity> entity=new ResponseEntity<EmployeeEntity>( employeeService.authenticateService(employee), HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(path="/GetLastSerialNo",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public ResponseEntity<Integer> authentication(@RequestBody String type){			
		ResponseEntity<Integer> entity=new ResponseEntity<Integer>( assemblyService.fetchLastSerialNO(type), HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(path="/loadAssemblyList",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public List<AssemblyEntity> loadAssemblyList(@RequestParam String empCode,@RequestParam String empRole,String plant){			
		System.out.println("Load Assembly List called- "+empCode);
		return assemblyService.loadAssemblyListService(empCode, empRole, plant);
	}
	
	@RequestMapping(path="/loadExtrusionList",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public List<ExtrusionEntity> loadExtrusionList(@RequestParam String empCode,@RequestParam String empRole,String plant){			
		System.out.println("Load Extrusion List called- "+empCode);
		return assemblyService.loadExtrusionListService(empCode, empRole, plant);
	}
	
	@RequestMapping(path="/loadFlockingList",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public List<FlockingEntity> loadFlockingList(@RequestParam String empCode,@RequestParam String empRole,String plant){			
		System.out.println("Load Extrusion List called- "+empCode);
		return assemblyService.loadFlockingListService(empCode, empRole, plant);
	}
	
	@RequestMapping(path="/Test",produces=	MediaType.TEXT_PLAIN_VALUE,method=RequestMethod.POST)
	public String TestV(){
		System.out.println("Test Succesfull- Record Keeping Record");
		return "Success";
	}
	
	@RequestMapping(path="/updateAssemblyRecord",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public HashMap<String,String> updateAssemblyRecord(@RequestBody AssemblyEntity assembly){
		System.out.println("Request Received"+assembly.getCustomer()+" Assembly Date is - "+ assembly.getAssembly_date());
		HashMap<String, String> response=assemblyService.validateRecord(assembly, "ASSEMBLY");
		if(response.get("VALIDATIONFLAG").equals("SUCCESS")) {
			boolean result=assemblyService.updateRecordEntity(assembly);
			System.out.println("Controller result - "+result);
			return response;
		}
		
		/*
		*/
		return response;
	}
	
	@RequestMapping(path="/updateExtrusionRecord",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public HashMap<String,String> updateExtrusionRecord(@RequestBody ExtrusionEntity extrusion){
		System.out.println("Request Received"+extrusion.getCustomer()+" Extrusion Date is - "+ extrusion.getExtrusion_date());
		HashMap<String, String> response=assemblyService.validateRecord(extrusion, "EXTRUSION");
		if(response.get("VALIDATIONFLAG").equals("SUCCESS")) {
			boolean result=assemblyService.updateRecordEntity(extrusion);
			System.out.println("Controller result - "+result);
			return response;
		}
		
		/*
		*/
		return response;
	}
	
	@RequestMapping(path="/updateFlockingRecord",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public HashMap<String,String> updateFlockingRecord(@RequestBody FlockingEntity flocking){
		System.out.println("Request Received"+flocking.getCustomer()+" Extrusion Date is - "+ flocking.getFlocking_date());
		HashMap<String, String> response=assemblyService.validateRecord(flocking, "FLOCKING");
		if(response.get("VALIDATIONFLAG").equals("SUCCESS")) {
			boolean result=assemblyService.updateRecordEntity(flocking);
			System.out.println("Controller result - "+result);
			return response;
		}
		
		/*
		*/
		return response;
	}
	
	//
	@RequestMapping(path="/approveAssemblyEntry",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public String approveAssemblyEntry(@RequestBody AssemblyEntity assembly){			
		System.out.println("Approve Entry called - "+assembly.getAssembly_id());
		boolean result=assemblyService.approveEntryService(assembly, "ASSEMBLY");
		if(result)
			return "APPROVED";
		
		return "FAILED";
	}
	
	@RequestMapping(path="/approveExtrusionEntry",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public String approveExtrusionEntry(@RequestBody ExtrusionEntity extrusion){			
		System.out.println("Approve Entry called - "+extrusion.getExtrusion_id());
		boolean result=assemblyService.approveEntryService(extrusion, "EXTRUSION");
		if(result)
			return "APPROVED";
		
		return "FAILED";
	}
	
	@RequestMapping(path="/approveFlockingEntry",produces=	MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.POST)
	public String approveFlockingEntry(@RequestBody FlockingEntity flocking){			
		System.out.println("Approve Entry called - "+flocking.getFlocking_id());
		boolean result=assemblyService.approveEntryService(flocking, "FLOCKING");
		if(result)
			return "APPROVED";
		
		return "FAILED";
	}
	

}
