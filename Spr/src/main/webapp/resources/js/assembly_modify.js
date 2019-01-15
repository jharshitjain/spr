//Angularjs row editables and jquery.datatable  with ui.bootstrap and ui.utils
//Onces edit button is pressed table row order will change editable row will come in current pages top so don't get confuse

//var app=angular.module('formvalid', ['ui.bootstrap','ui.utils']);
app.controller('validationCtrl',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
//	app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
	
	$scope.defaultFilter=[];
	$scope.loaderFlag=true;
	$scope.assemblyList=[];
	$scope.editFlag=true;
	$scope.approveFlag=true;
	$scope.saveFlag=false;
	
	$scope.validatableFields=['hod','cellno','prod_target','prod_actual','used_man_power','prodplan_time','down_time','bd_time','prodrun_time','co_time_target','co_time_actual','no_of_co','startuptime_target','startuptime_actual','no_of_setup','internal_rej','mldgprocess_scrap','mldgstartup_scrap','process_scrap'];
	
	//In order to resolve data table issue.####
	$scope.loadDefaultAssemblyList=function(){
		$scope.assemblyList.push({		
		company:$scope.company,
		assembly_date:$filter('date')(new Date($scope.assembly_date),'yyyy-MM-dd '),
		entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '),
		user_id:$scope.user_id,
		user_plant_no:$scope.user_plant_no,
		hod:$scope.hod,
		plantno:$scope.plantno,
		customer:$scope.customer,
		cellno:$scope.cellno,
		insert_mould:$scope.insert_mould,
		shift:$scope.shift,
		car_model:$scope.car_model,
		part_name:$scope.part_name,
		fr_rr:$scope.fr_rr,
		rh_lh:$scope.rh_lh,
		sno:'',
		prod_target:'',
		prod_actual:'',
		used_man_power:'',
		prodplan_time:'',
		down_time:'',
		bd_time:'',
		prodrun_time:'',
		co_time_target:'',
		co_time_actual:'',
		no_of_co:'',
		startuptime_target:'',
		startuptime_actual:'',
		no_of_setup:'',
		internal_rej:'',
		mldgprocess_scrap:'',
		mldgstartup_scrap:'',
		process_scrap:''
		})
	}
	$scope.removeDefaultObject=function(){
		$scope.assemblyRecordsList.splice(0,1);
	}
	
if($window.sessionStorage.getItem('isAuthenticated')=="true"){
		$scope.isEligible=true;
		
		$scope.user_name=$window.sessionStorage.getItem("user_name");
		$scope.user_plant=$window.sessionStorage.getItem("user_plant");
		$scope.plantno=$window.sessionStorage.getItem("plantno");
		$scope.shift=$window.sessionStorage.getItem("shift");
		$scope.user_code=$window.sessionStorage.getItem("user_code");
		$scope.user_role=$window.sessionStorage.getItem("user_role");
		$scope.user_id=$scope.user_code;
		$scope.user_plant_no=$scope.user_plant
		console.log("Retrieving fields from session storage for user - "+ $scope.user_name)
		
	}
	else{
		$window.location.href="/Spr/index.jsp";
	}
	if($window.sessionStorage.getItem('isAuthenticated')=="true"){
		$scope.emp_code=$window.sessionStorage.getItem("user_code");
		$scope.user_role=$window.sessionStorage.getItem("user_role");
		$scope.plantList="";
		
		if($window.sessionStorage.getItem("user_plant_1")==1){
			$scope.plantList="1,";
		}
		
		if($window.sessionStorage.getItem("user_plant_2")==1){
			$scope.plantList=$scope.plantList+"2,"
		}
		
		if($window.sessionStorage.getItem("user_plant_5")==1){
			$scope.plantList=$scope.plantList+"5,"
		}
		
		if($window.sessionStorage.getItem("user_plant_6")==1){
			$scope.plantList=$scope.plantList+"6,"
		}
		
	}
	else{
		$window.location.href="/Spr/index.jsp";
	}

	
	$scope.removeDefaultObject=function(){
		$scope.assemblyList.splice(0,1);
	}
  $scope.loadAssemblyList=function(){
	  //$scope.loadDefaultAssemblyList();
	  
	  /*if($scope.user_role=="TEAM LEADER"){
		  $scope.isApprover=false;
	  }
	  else if($scope.user_role=="GROUP LEADER")*/
	  
	  $scope.loadCustomerGroup();
	  sprFactory.loadAssemblyList($scope.emp_code,$scope.user_role,$scope.plantList).
		then(function(response){
			//$scope.removeDefaultObject();
			//console.log("Response - "+angular.fromJson(response.data));	
			$scope.loaderFlag=false;
			$scope.assemblyList=response.data;
			$scope.curPage = 1,
			$scope.itemsPerPage = 10,
			$scope.maxSize = 5;
		})
		
	  
  }
  $scope.test=function()
  {
	  console.log("approved button clicked");
  }
    
    this.assemblyRecord = $scope.assemblyList;
  
  
  $scope.numOfPages = function () {
    return Math.ceil($scope.assemblyList.length / $scope.itemsPerPage);
    
  };
  
    $scope.$watch('curPage + numPerPage', function() {
    var begin = (($scope.curPage - 1) * $scope.itemsPerPage),
    end = begin + $scope.itemsPerPage;
    
    $scope.filteredItems = $scope.assemblyList.slice(begin, end);
  });
    
  $scope.edit=function(index,assemblyRecord){
	 // angular.element($('.save')).attr('style','display:block');
	 /* $scope.editFlag=false;
	  $scope.approveFlag=false;
	  $scope.saveFlag=true;*/
	  if((($scope.user_role=="TEAM LEADER")) && (assemblyRecord.isApproved=='0')){
		  $scope.openElement(index);
	  }
	  
	  if((($scope.user_role=="GROUP LEADER")) && ((assemblyRecord.isApproved=='1') || (assemblyRecord.isApproved=='0')) && ((assemblyRecord.approvedBy=='1') || (assemblyRecord.approvedBy=='0')) ){
		  $scope.openElement(index);
	  }
	
	  
  } 
  
  $scope.cancel=function(index,assemblyRecord){
	 // $scope.closeElement(index,assemblyRecord);
	  $window.location.href="/Spr/assembly_modify.jsp";
  }
  
  $scope.openElement=function(index){
	  $window.document.getElementById("saveElement_"+index).style.display='';
	  $window.document.getElementById("cancelElement_"+index).style.display='';
	  
	  $window.document.getElementById("company_"+index).style.display='block';
	  $window.document.getElementById("hod_"+index).style.display='block';	  
	  $window.document.getElementById("user_id_"+index).style.display='block';
	  $window.document.getElementById("user_plant_no_"+index).style.display='block';
	  $window.document.getElementById("assembly_date_"+index).style.display='block';
	  $window.document.getElementById("plantno_"+index).style.display='block';
	  $window.document.getElementById("shift_"+index).style.display='block';
	  $window.document.getElementById("cellno_"+index).style.display='block';
	  $window.document.getElementById("insert_mould_"+index).style.display='block';
	  $window.document.getElementById("customer_"+index).style.display='block';
	  $window.document.getElementById("car_model_"+index).style.display='block';
	  $window.document.getElementById("part_name_"+index).style.display='block';
	  $window.document.getElementById("fr_rr_"+index).style.display='block';
	  $window.document.getElementById("rh_lh_"+index).style.display='block';
	  $window.document.getElementById("prod_target_"+index).style.display='block';
	  $window.document.getElementById("prod_actual_"+index).style.display='block';
	  $window.document.getElementById("used_man_power_"+index).style.display='block';
	  $window.document.getElementById("prodplan_time_"+index).style.display='block';
	  $window.document.getElementById("down_time_"+index).style.display='block';
	  $window.document.getElementById("bd_time_"+index).style.display='block';
	  $window.document.getElementById("prodrun_time_"+index).style.display='block';
	  $window.document.getElementById("co_time_target_"+index).style.display='block';
	  $window.document.getElementById("co_time_actual_"+index).style.display='block';
	  $window.document.getElementById("no_of_co_"+index).style.display='block';
	  $window.document.getElementById("startuptime_target_"+index).style.display='block';
	  $window.document.getElementById("startuptime_actual_"+index).style.display='block';
	  $window.document.getElementById("no_of_setup_"+index).style.display='block';
	  $window.document.getElementById("internal_rej_"+index).style.display='block';
	  $window.document.getElementById("mldgprocess_scrap_"+index).style.display='block';
	  $window.document.getElementById("mldgstartup_scrap_"+index).style.display='block';
	  $window.document.getElementById("process_scrap_"+index).style.display='block';
	  
	  $window.document.getElementById("editElement_"+index).style.display='none';
	  $window.document.getElementById("approveElement_"+index).style.display='none';
	  
	  
	  $window.document.getElementById("span_company_"+index).style.display='none';
	  $window.document.getElementById("span_hod_"+index).style.display='none';
	  $window.document.getElementById("span_user_id_"+index).style.display='none';
	  $window.document.getElementById("span_user_plant_no_"+index).style.display='none';
	  $window.document.getElementById("span_assembly_date_"+index).style.display='none';
	  $window.document.getElementById("span_plantno_"+index).style.display='none';
	  $window.document.getElementById("span_shift_"+index).style.display='none';
	  $window.document.getElementById("span_cellno_"+index).style.display='none';
	  $window.document.getElementById("span_insert_mould_"+index).style.display='none';
	  $window.document.getElementById("span_customer_"+index).style.display='none';
	  $window.document.getElementById("span_car_model_"+index).style.display='none';
	  $window.document.getElementById("span_part_name_"+index).style.display='none';
	  $window.document.getElementById("span_fr_rr_"+index).style.display='none';
	  $window.document.getElementById("span_rh_lh_"+index).style.display='none';
	  $window.document.getElementById("span_prod_target_"+index).style.display='none';
	  $window.document.getElementById("span_prod_actual_"+index).style.display='none';
	  $window.document.getElementById("span_used_man_power_"+index).style.display='none';
	  $window.document.getElementById("span_prodplan_time_"+index).style.display='none';
	  $window.document.getElementById("span_down_time_"+index).style.display='none';
	  $window.document.getElementById("span_bd_time_"+index).style.display='none';
	  $window.document.getElementById("span_prodrun_time_"+index).style.display='none';
	  $window.document.getElementById("span_co_time_target_"+index).style.display='none';
	  $window.document.getElementById("span_co_time_actual_"+index).style.display='none';
	  $window.document.getElementById("span_no_of_co_"+index).style.display='none';
	  $window.document.getElementById("span_startuptime_target_"+index).style.display='none';
	  $window.document.getElementById("span_startuptime_actual_"+index).style.display='none';
	  $window.document.getElementById("span_no_of_setup_"+index).style.display='none';
	  $window.document.getElementById("span_internal_rej_"+index).style.display='none';
	  $window.document.getElementById("span_mldgprocess_scrap_"+index).style.display='none';
	  $window.document.getElementById("span_mldgstartup_scrap_"+index).style.display='none';
	  $window.document.getElementById("span_process_scrap_"+index).style.display='none';
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
  }
  
  $scope.closeElement=function(index,assemblyRecord){
	  $window.document.getElementById("saveElement_"+index).style.display='none';
	  $window.document.getElementById("cancelElement_"+index).style.display='none';
	  
	  $window.document.getElementById("company_"+index).style.display='none';
	  $window.document.getElementById("hod_"+index).style.display='none';	  
	  $window.document.getElementById("user_id_"+index).style.display='none';
	  $window.document.getElementById("user_plant_no_"+index).style.display='none';
	  $window.document.getElementById("assembly_date_"+index).style.display='none';
	  $window.document.getElementById("plantno_"+index).style.display='none';
	  $window.document.getElementById("shift_"+index).style.display='none';
	  $window.document.getElementById("cellno_"+index).style.display='none';
	  $window.document.getElementById("insert_mould_"+index).style.display='none';
	  $window.document.getElementById("customer_"+index).style.display='none';
	  $window.document.getElementById("car_model_"+index).style.display='none';
	  $window.document.getElementById("part_name_"+index).style.display='none';
	  $window.document.getElementById("fr_rr_"+index).style.display='none';
	  $window.document.getElementById("rh_lh_"+index).style.display='none';
	  $window.document.getElementById("prod_target_"+index).style.display='none';
	  $window.document.getElementById("prod_actual_"+index).style.display='none';
	  $window.document.getElementById("used_man_power_"+index).style.display='none';
	  $window.document.getElementById("prodplan_time_"+index).style.display='none';
	  $window.document.getElementById("down_time_"+index).style.display='none';
	  $window.document.getElementById("bd_time_"+index).style.display='none';
	  $window.document.getElementById("prodrun_time_"+index).style.display='none';
	  $window.document.getElementById("co_time_target_"+index).style.display='none';
	  $window.document.getElementById("co_time_actual_"+index).style.display='none';
	  $window.document.getElementById("no_of_co_"+index).style.display='none';
	  $window.document.getElementById("startuptime_target_"+index).style.display='none';
	  $window.document.getElementById("startuptime_actual_"+index).style.display='none';
	  $window.document.getElementById("no_of_setup_"+index).style.display='none';
	  $window.document.getElementById("internal_rej_"+index).style.display='none';
	  $window.document.getElementById("mldgprocess_scrap_"+index).style.display='none';
	  $window.document.getElementById("mldgstartup_scrap_"+index).style.display='none';
	  $window.document.getElementById("process_scrap_"+index).style.display='none';
	  
	  $window.document.getElementById("editElement_"+index).style.display='';
	  //(user_role=='GROUP LEADER' && assemblyRecord.isApproved=='0') ||
	  //(user_role=='PLANT HEAD' && assemblyRecord.approvedBy=='1') "
	  if((user_role=='GROUP LEADER' && assemblyRecord.isApproved=='0') || (user_role=='PLANT HEAD' && assemblyRecord.approvedBy=='1')){
		  $window.document.getElementById("approveElement_"+index).style.display='';
	  }
		  

	  $window.document.getElementById("span_company_"+index).style.display='block';
	  $window.document.getElementById("span_hod_"+index).style.display='block';
	  $window.document.getElementById("span_user_id_"+index).style.display='block';
	  $window.document.getElementById("span_user_plant_no_"+index).style.display='block';
	  $window.document.getElementById("span_assembly_date_"+index).style.display='block';
	  $window.document.getElementById("span_plantno_"+index).style.display='block';
	  $window.document.getElementById("span_shift_"+index).style.display='block';
	  $window.document.getElementById("span_cellno_"+index).style.display='block';
	  $window.document.getElementById("span_insert_mould_"+index).style.display='block';
	  $window.document.getElementById("span_customer_"+index).style.display='block';
	  $window.document.getElementById("span_car_model_"+index).style.display='block';
	  $window.document.getElementById("span_part_name_"+index).style.display='block';
	  $window.document.getElementById("span_fr_rr_"+index).style.display='block';
	  $window.document.getElementById("span_rh_lh_"+index).style.display='block';
	  $window.document.getElementById("span_prod_target_"+index).style.display='block';
	  $window.document.getElementById("span_prod_actual_"+index).style.display='block';
	  $window.document.getElementById("span_used_man_power_"+index).style.display='block';
	  $window.document.getElementById("span_prodplan_time_"+index).style.display='block';
	  $window.document.getElementById("span_down_time_"+index).style.display='block';
	  $window.document.getElementById("span_bd_time_"+index).style.display='block';
	  $window.document.getElementById("span_prodrun_time_"+index).style.display='block';
	  $window.document.getElementById("span_co_time_target_"+index).style.display='block';
	  $window.document.getElementById("span_co_time_actual_"+index).style.display='block';
	  $window.document.getElementById("span_no_of_co_"+index).style.display='block';
	  $window.document.getElementById("span_startuptime_target_"+index).style.display='block';
	  $window.document.getElementById("span_startuptime_actual_"+index).style.display='block';
	  $window.document.getElementById("span_no_of_setup_"+index).style.display='block';
	  $window.document.getElementById("span_internal_rej_"+index).style.display='block';
	  $window.document.getElementById("span_mldgprocess_scrap_"+index).style.display='block';
	  $window.document.getElementById("span_mldgstartup_scrap_"+index).style.display='block';
	  $window.document.getElementById("span_process_scrap_"+index).style.display='block';
  }
    
  $scope.logout=function(){
		$window.sessionStorage.setItem("isAuthenticated",null);
	//$window.sessionStorage.reset();
		$window.location.href="/Spr/index.jsp";
	}
  
	$scope.loadCustomerGroup=function(){
						
		sprFactory.loadCustomerGroup().
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));	
			$scope.loaderFlag=false;
			$scope.listOfCustomerGroup=response.data;
			
		})
		
	}
	
	$scope.loadModelListByCustomerGroup=function(index,elementName){
		var customer=$window.document.getElementById(elementName+index).value;
		console.log("Customer changed - "+ customer);
		
		$scope.loaderFlag=true;
		console.log("Calling service to load model for customer group - "+ $scope.customer);
		$scope.loadModel(customer);
	}
	
	$scope.loadPartListByCustomerGroupAndModel=function(index,customerName,elementName){
		var model=$window.document.getElementById(elementName+index).value;
		var customer=$window.document.getElementById(customerName+index).value;
		console.log("Model Changed - "+ model);
		$scope.loaderFlag=true;
		console.log("Calling service to load part for customer group - "+ customer+ " and model - "+model);
		$scope.loadPart(customer,model);
	}
	
	
	$scope.loadModel=function(customerGroup){
		sprFactory.loadModel(customerGroup).
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));
			$scope.loaderFlag=false;
			$scope.modelList=response.data;
		})
		
	}
	
	$scope.loadPart=function(customerGroup,model){
		/*var parameters={
				customerGroup:customerGroup,
				model:model
		}
		
		var config={
				params:parameters
		}*/
		sprFactory.loadPart(customerGroup,model).
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));
			$scope.loaderFlag=false;
			$scope.partList=response.data;
		})
		
	}
	
	
	$scope.updateAssemblyRecord=function(index){
		
		
		$scope.validate(index);
		if(!$scope.isFailed){
			var assemblyRecord={
					assembly_id:$window.document.getElementById('assembly_id_'+index).value,
					sno:$window.document.getElementById('sno_'+index).value,
					assembly_date:$filter('date')(new Date($window.document.getElementById("assembly_date_"+index).value),'yyyy-MM-dd '),
					entry_date:$filter('date')(new Date($window.document.getElementById("entry_date_"+index).value),'yyyy-MM-dd '),
					user_id:$window.document.getElementById("user_id_"+index).value,
					user_plant_no:$window.document.getElementById("user_plant_no_"+index).value,				
					modifyDate:$filter('date')(new Date(new Date()),'yyyy-MM-dd'),
					company:$window.document.getElementById("company_"+index).value,																
					hod:$window.document.getElementById("hod_"+index).value,
					plantno:$window.document.getElementById("plantno_"+index).value,
					customer:$window.document.getElementById("customer_"+index).value,
					cellno:$window.document.getElementById("cellno_"+index).value,
					insert_mould:$window.document.getElementById("insert_mould_"+index).value,
					shift:$window.document.getElementById("shift_"+index).value,
					car_model:$window.document.getElementById("car_model_"+index).value,
					part_name:$window.document.getElementById("part_name_"+index).value,
					fr_rr:$window.document.getElementById("fr_rr_"+index).value,
					rh_lh:$window.document.getElementById("rh_lh_"+index).value,
					prod_target:$window.document.getElementById("prod_target_"+index).value,
					prod_actual:$window.document.getElementById("prod_actual_"+index).value,
					used_man_power:$window.document.getElementById("used_man_power_"+index).value,
					prodplan_time:$window.document.getElementById("prodplan_time_"+index).value,
					down_time:$window.document.getElementById("down_time_"+index).value,
					bd_time:$window.document.getElementById("bd_time_"+index).value,
					prodrun_time:$window.document.getElementById("prodrun_time_"+index).value,
					co_time_target:$window.document.getElementById("co_time_target_"+index).value,
					co_time_actual:$window.document.getElementById("co_time_actual_"+index).value,
					no_of_co:$window.document.getElementById("no_of_co_"+index).value,
					startuptime_target:$window.document.getElementById("startuptime_target_"+index).value,
					startuptime_actual:$window.document.getElementById("startuptime_actual_"+index).value,
					no_of_setup:$window.document.getElementById("no_of_setup_"+index).value,
					internal_rej:$window.document.getElementById("internal_rej_"+index).value,
					mldgprocess_scrap:$window.document.getElementById("mldgprocess_scrap_"+index).value,
					mldgstartup_scrap:$window.document.getElementById("mldgstartup_scrap_"+index).value,
					process_scrap:$window.document.getElementById("process_scrap_"+index).value				
			};
					
			console.log("Request Payload - "+assemblyRecord.assembly_date);
			
				
			sprFactory.updateAssemblyRecord(assemblyRecord).
			then(function(response){
				console.log("Update Api Response :"+response.data.VALIDATIONFLAG);
				if(response.data.VALIDATIONFLAG=='FAILED'){
					$scope.errorFlag2=true;
					$scope.errorMsg2=response.data.ERRORMESSAGE;
				}
				else{
					$window.location.href="/Spr/assembly_modify.jsp";
				}
			});
		}
		
		
		
	}
	
	$scope.validate=function(index){
		for(var i=0;i<19;i++){
			var elementName=$scope.validatableFields[i]+"_"+index;
			$scope.validateElement(elementName);
			if(!$scope.isFailed){
				$scope.validateField(elementName,$scope.validatableFields[i],index);
				if($scope.isFailed)
					return;
			}
				
		}
	}
	
	$scope.validateElement=function(elementName){
		var elementObj=$window.document.getElementById(elementName);		
		if($scope.isBlank(elementObj)){			
			$scope.errorMsg1="Field cannot be blank. Please check and fill properly.";
			$scope.errorFlag1=true;
			elementObj.focus();
			$scope.isFailed=true;
		}
		else{
			$scope.errorFlag1=false;
			$scope.errorMsg1="";
			$scope.isFailed=false;
		}
	}
	
	$scope.isBlank=function(elementOBj){
		
		if(elementOBj.value=="" || elementOBj.value==null){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	$scope.validateField=function(element,modelName,index){
		console.log("Validate Field method called");
		var maxVal=0;
		if(modelName=="prod_target" ||modelName=="prod_actual" ||modelName=="down_time" ||modelName=="bd_time" ||
				modelName=="co_time_target" ||modelName=="co_time_actual" ||modelName=="internal_rej"
					||modelName=="mldgprocess_scrap"||modelName=="mldgstartup_scrap"||modelName=="process_scrap"){
			maxVal='999999';
		}
		else if(modelName=="used_man_power" ){    
			maxVal='9999';
		}
		else if(modelName=="prodplan_time"||modelName=="prodrun_time"){
			maxVal='450';
		}
		else if(modelName=="cellno"){
			maxVal='99';
		}
		else if(modelName=="startuptime_target"||modelName=="startuptime_actual"){
			maxVal='30';
		}
		else {
			maxVal='10';
		}
		
		var elementObj=$window.document.getElementById(element);
		
		if(elementObj.value>parseInt(maxVal)){
			$scope.errorFlag2=true;
			$scope.isFailed=true;
			$scope.errorMsg2="value should not be more than "+maxVal+" digit ";
			elementObj.focus();
		}
		else{
			$scope.errorFlag2=false;
			$scope.isFailed=false;
			$scope.errorMsg2="";
		}
		
			if(modelName=='prod_actual'){
				prod_targetElement=$window.document.getElementById("prod_target_"+index);
				$scope.productionActualCheck(prod_targetElement,elementObj);
			}
		
		//}
	}
	
	$scope.productionActualCheck=function(prod_targetElement,elementObj){
		var productionTarget=parseInt(prod_targetElement.value);
		var maxAllowActualValue=parseInt(productionTarget+(productionTarget*20/100));
		if(productionTarget=="" || productionTarget==null){
			$scope.prodActualErrorFlag=true;
			$scope.prodActualErrorMessage="Please fill prodcuction target first.";
			$scope.isFailed=true;
			elementObj.focus();
			return;
		}
		else{
			
			if(parseInt(elementObj.value)>maxAllowActualValue){
				$scope.prodActualErrorFlag=true;
				$scope.isFailed=true;
				$scope.prodActualErrorMessage="Production actual value should not more than target value, maximum limit is :"+maxAllowActualValue;
				elementObj.focus();
				return;
			}
			else{
				$scope.prodActualErrorFlag=false;
				$scope.isFailed=false;
				$scope.prodActualErrorMessage="";
			}
		}
	}
	
	$scope.approveEntry=function(index,assembly_id,type){
		//sprFactory.updateApproveEntry
		//isApproved,approvedBy,approvedDate
		var isApprove=1;
		var approveBy=0;
		var assemblyId=0;
		if($scope.user_role="GROUP LEADER")
			approveBy=1;
		else
			approveBy=2;
		var approvedDate=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		
		if(type=="APPROVE_ALL"){
			assemblyId=assembly_id
		}
		else{
			assemblyId=$window.document.getElementById('assembly_id_'+index).value;
		}
		var assemblyRecord={
				assembly_id:assemblyId,
				isApproved:isApprove,
				approvedBy:approveBy,
				approveDate:approvedDate,
				modifyDate:approvedDate
		}
		
		sprFactory.updateAssemblyApproveEntry(assemblyRecord).
		then(function(response){
			console.log("Update Api Response :"+response.data.VALIDATIONFLAG);
			if(response.data=='APPROVED'){
				$window.location.href="/Spr/assembly_modify.jsp";
			}
			
		});
		
	}
	
	$scope.approveAllEntry=function(){
		//$scope.assemblyList
		
		for(var i=0;i<$scope.filteredItems.length;i++){
			var approvedBy=$scope.filteredItems[i].approvedBy;
			if($scope.user_role="GROUP LEADER"){				
				if(approvedBy=='0'){
					$scope.approveEntry(0,$scope.filteredItems[i].assembly_id,'APPROVE_ALL')
				}
			}
			else if($scope.user_role="PLANT HEAD"){
				if(approvedBy=='0' || approvedBy=='1'){
					$scope.approveEntry(0,$scope.filteredItems[i].assembly_id,'APPROVE_ALL')
				}
			}
		}
	}
	
	
	
	
  

}]);
