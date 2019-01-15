/*
Assembly controller file
It will load all the fields from the form and pass it to the factory service.

*/
app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
	
	//$scope.loadCustomerGroup();
	//$scope.testMethod();
	$scope.loaderFlag=true;
	$scope.errorFlag1=false;
	$scope.errorFlag2=false;
	$scope.errorMsg1="";
	$scope.errorMsg2="";
	$scope.submitFlag=false;
	$scope.prodActualErrorFlag=false;
	$scope.prodActualErrorMessage="";
	$scope.isEligible=false;
	$scope.eligibleError="";
	$scope.isPatterError=false;
	$scope.isSprNoGenerated=false;
	$scope.lastInsertedSprNo=0;
	/* Configuration Flag*/
	$scope.defaultEntryIndex=25;
	$scope.allFields=[
		'company','hod','assembly_date','plantno','shift','cellno','insert_mould','customer','car_model','part_name','fr_rr','rh_lh','prod_target','prod_actual','used_man_power','prodplan_time','down_time','bd_time','prodrun_time','co_time_target','co_time_actual','no_of_co','startuptime_target','startuptime_actual','no_of_setup','internal_rej','mldgprocess_scrap','mldgstartup_scrap','process_scrap'
		];
	
	$scope.assemblyRecords=[];
	$scope.assemblyRecordsList=[];
	/*$scope.assemblyRecordsList=[{
		sno:'',
		company:'',
		assembly_date:'',
		entry_date:'',
		user_id:'',
		user_plant_no:'',
		hod:'',
		plantno:'',
		customer:'',
		cellno:'',
		insert_mould:'',
		shift:'',
		car_model:'',
		part_name:'',
		fr_rr:'',
		rh_lh:'',
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
		
	}];*/
	
	
	
	if($window.sessionStorage.getItem('isAuthenticated')=="true"){
		
		$scope.assembly_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		$scope.entry_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		$scope.user_name=$window.sessionStorage.getItem("user_name");
		$scope.user_plant=$window.sessionStorage.getItem("user_plant");
		$scope.plantno=$window.sessionStorage.getItem("plantno");
		$scope.shift=$window.sessionStorage.getItem("shift");
		$scope.user_code=$window.sessionStorage.getItem("user_code");
		$scope.user_id=$scope.user_code;
		$scope.user_plant_no=$scope.user_plant;
		$scope.user_role=$window.sessionStorage.getItem("user_role");
		console.log("Retrieving fields from session storage for user - "+ $scope.user_name)
		console.log("Retrieving fields from session storage for user - "+ $scope.assembly_date)
	}
	else{
		$window.location.href="/Spr/index.jsp";
	}
	$scope.testMethod=function(){
		var elementOBj=$window.document.getElementById("assembly_date");
		console.log("Element value- "+elementOBj.value);
	}
	
	$scope.loadDefaultEntryIndex=function(){
		var entryIndex=parseInt($scope.defaultEntryIndex)-1;
		$scope.removeDefaultObject();
		for(var i=0;i<entryIndex;i++){
			$scope.addRows(i);
		}
	}
	
	$scope.removeDefaultObject=function(){
		$scope.assemblyRecordsList.splice(0,1);
	}
	
	$scope.pushRecord=function(assemblyRecordEntry){
		$scope.assemblyRecords.push(angular.copy(assemblyRecordEntry));
		//console.log("Assembly Record added into the main array- Current count is -"+$scope.assemblyRecords.length);
	}
	
	$scope.validateHeaderField=function(modelName){
		console.log("Validate Header Field - "+modelName);
		var elementObj=$window.document.getElementById(modelName);
		if(elementObj.value==null || elementObj.value==""){
			$scope.errorFlag1=true;
			$scope.errorMsg1=modelName+" is mandatory field, Please fill this one";
			//elementObj=$window.document.getElementById(modelName)
			elementObj.focus();
		}
		else if(modelName=="cellno"){
			maxVal='99';
			var pattern=/^[0-9]*$/;
			if(!pattern.test(elementObj.value)){
				$scope.errorFlag1=true;				
				$scope.errorMsg1="Invalid data entered, Please enter the valid data !!";
				elementObj.focus();
			}
			else{
				$scope.errorFlag1=false;
				$scope.errorMsg1="";
			}
			if(parseInt(elementObj.value)>parseInt(maxVal)){
				$scope.errorFlag1=true;
				$scope.errorMsg1="Cell no is invalid, It should be less than 99";
				//elementObj=$window.document.getElementById(modelName)
				elementObj.focus();
			}
			else{
				$scope.errorFlag1=false;
				$scope.errorMsg1="";
			}
		}
		else{
			$scope.errorFlag1=false;
			$scope.errorMsg1="";
		}
		
		
	}
	$scope.addRows=function(index){
		$scope.assemblyRecordsList.push({
		
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
		//assembly_id:'',
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
		process_scrap:'',
		isApproved:'',
		approvedBy:'',
		approveDate:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '),
		modifyDate:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd ')
		})
	}
	
	
	

	$scope.logout=function(){
		$window.sessionStorage.setItem("isAuthenticated",null);
	//$window.sessionStorage.reset();
		$window.location.href="/Spr/index.jsp";
	}

	$scope.submitok=function(){
		var updatedSerialNo=parseInt($window.sessionStorage.getItem('assembly_serialno'))+1;
		console.log(" Updating serial number for assembly - Updated serial no: "+updatedSerialNo);
		$window.sessionStorage.setItem('assembly_serialno',updatedSerialNo);
		$window.location.href="/Spr/assembly.jsp";
	}
	
	$scope.getLastSerialNo=function(){
		sprFactory.getLastSerialNo("ASSEMBLY").
		then(function(response){
			console.log("Response of getLastSerialNo API call - "+angular.fromJson(response.data));	
			//$window.sessionStorage.setItem('assembly_serialno',response.data+1);
			$scope.sno=response.data;
			$scope.assemblyId=response.data;
			$scope.isSprNoGenerated=true;
		});
	}
	
	$scope.insertAssemblyRecord=function(event,source){
		event.preventDefault();
		var entryLength=parseInt($scope.assemblyRecordsList.length);
		for(var i=0;i<entryLength;i++){			
			$scope.pushRecord($scope.assemblyRecordsList[i]);
			//console.log("Entry inserted at index-"+i+" - "+$scope.assemblyRecords);
		}
		$scope.prepareRequestData();
		console.log("Items in assembly Record-"+JSON.stringify($scope.assemblyRecords));
		if(!$scope.isEligible){
			if(source=="ADD_NEWROW"){
				
				sprFactory.insertAssemblyRecordList(JSON.stringify($scope.assemblyRecords)).
				then(function(response){
					//alert(response.data);
					//console.log("Response - "+angular.fromJson(response.data));
					if(response.data.RESPONSEFLAG=="SUCCESS"){
						//alert("Records has inserted successfully.");
						$scope.flushRows();
						$scope.loadDefaultEntryIndex();
						/*$window.sessionStorage.setItem('assembly_serialno',0);
						$scope.refreshSno();*/
						var lastSavedAssemblyId=response.data.ASSEMBLY_ID;
						if($scope.lastInsertedSprNo!=lastSavedAssemblyId){
							$scope.lastInsertedSprNo=lastSavedAssemblyId
							alert("It seems that some other person has also inserted record for assembly, hence your last updated sprNo is- "+$scope.lastInsertedSprNo);
						}
						$scope.isSprNoGenerated=false;
						$scope.refreshSno();
							
					}						
					else
						alert("Error occurred while processing the request.")
				})
			
			}
			else{
				sprFactory.insertAssemblyRecordList(JSON.stringify($scope.assemblyRecords)).
				then(function(response){
					//alert(response.data);
					//console.log("Response - "+angular.fromJson(response.data));
					if(response.data.RESPONSEFLAG=="SUCCESS"){
						//alert("Records has inserted successfully.");
						var lastSavedAssemblyId=response.data.ASSEMBLY_ID;
						if($scope.lastInsertedSprNo!=lastSavedAssemblyId){
							$scope.lastInsertedSprNo=lastSavedAssemblyId
							alert("It seems that some other person has also inserted record for assembly, hence your last updated sprNo is- "+$scope.lastInsertedSprNo);
						}
						angular.element($('.processLoader1')).attr('style','display:block');
						
						angular.element($('.submitButtn')).attr('disabled','true');
						$scope.submitFlag=true;
						angular.element($('.ok_button')).attr('style','display:block');
						$window.document.getElementById("ok_button").focus();
						//$window.sessionStorage.setItem('assembly_serialno',0);
						$scope.refreshSno();
					}						
					else
						alert("Error occurred while processing the request.")
				})
			}
		}
		
		/*for(var i=0;i<entryLength;i++){			
			$scope.pushRecord($scope.assemblyRecordsList[i]);
			//console.log("Entry inserted at index-"+i+" - "+$scope.assemblyRecords);
		}
		
		console.log("Items in assembly List-"+$scope.assemblyRecordsList);
		console.log("Items in assembly Record-"+$scope.assemblyRecords);*/
		
	}
	
	$scope.flushRows=function(){
		var startingIndex=0;
		var endIndex=$scope.assemblyRecordsList.length;
		$scope.assemblyRecordsList.splice(startingIndex,endIndex);
		
		// For assembly record array
		var endIndex=$scope.assemblyRecords.length;
		$scope.assemblyRecords.splice(startingIndex,endIndex);
	}
	
	$scope.prepareRequestData=function(){
		var totalRecordsCount=parseInt($scope.assemblyRecords.length);
		var filteredRecordsCount=0;
		var invalidRecordCount=0;
		var validEntryCount=0;
		//prod_target
		var assembly_date=$filter('date')(new Date($window.document.getElementById("assembly_date").value),'yyyy-MM-dd')
		
		for(var i=0;i<totalRecordsCount;i++){
			if(($scope.assemblyRecords[i].prod_target=="" || $scope.assemblyRecords[i].prod_target==null)||
					($scope.assemblyRecords[i].prod_actual=="" || $scope.assemblyRecords[i].prod_actual==null)||
					($scope.assemblyRecords[i].used_man_power=="" || $scope.assemblyRecords[i].used_man_power==null)||
					($scope.assemblyRecords[i].prodplan_time=="" || $scope.assemblyRecords[i].prodplan_time==null)||
					($scope.assemblyRecords[i].down_time=="" || $scope.assemblyRecords[i].down_time==null)||
					($scope.assemblyRecords[i].bd_time=="" || $scope.assemblyRecords[i].bd_time==null)||
					($scope.assemblyRecords[i].prodrun_time=="" || $scope.assemblyRecords[i].prodrun_time==null)||
					($scope.assemblyRecords[i].co_time_target=="" || $scope.assemblyRecords[i].co_time_target==null)||
					($scope.assemblyRecords[i].co_time_actual=="" || $scope.assemblyRecords[i].co_time_actual==null)||
					($scope.assemblyRecords[i].no_of_co=="" || $scope.assemblyRecords[i].no_of_co==null)||
					($scope.assemblyRecords[i].startuptime_target=="" || $scope.assemblyRecords[i].startuptime_target==null)||
					($scope.assemblyRecords[i].startuptime_actual=="" || $scope.assemblyRecords[i].startuptime_actual==null)||
					($scope.assemblyRecords[i].no_of_setup=="" || $scope.assemblyRecords[i].no_of_setup==null)||
					($scope.assemblyRecords[i].internal_rej=="" || $scope.assemblyRecords[i].internal_rej==null)||
					($scope.assemblyRecords[i].mldgprocess_scrap=="" || $scope.assemblyRecords[i].mldgprocess_scrap==null)||
					($scope.assemblyRecords[i].mldgstartup_scrap=="" || $scope.assemblyRecords[i].mldgstartup_scrap==null)||
					($scope.assemblyRecords[i].process_scrap=="" || $scope.assemblyRecords[i].process_scrap==null)){
				invalidRecordCount=totalRecordsCount-i;
				$scope.assemblyRecords.splice(i,invalidRecordCount);
				totalRecordsCount=parseInt($scope.assemblyRecords.length);
			}
			else{
				$scope.assemblyRecords[i].company=$scope.company;
				$scope.assemblyRecords[i].assembly_date=assembly_date;
				
				$scope.assemblyRecords[i].entry_date=$scope.entry_date;
				$scope.assemblyRecords[i].hod=$scope.hod;
				$scope.assemblyRecords[i].plantno=$scope.plantno;
				$scope.assemblyRecords[i].customer=$scope.customer;
				$scope.assemblyRecords[i].cellno=$scope.cellno;
				$scope.assemblyRecords[i].insert_mould=$scope.insert_mould;
				$scope.assemblyRecords[i].shift=$scope.shift;
				$scope.assemblyRecords[i].car_model=$scope.car_model;
				$scope.assemblyRecords[i].part_name=$scope.part_name;
				$scope.assemblyRecords[i].fr_rr=$scope.fr_rr;
				$scope.assemblyRecords[i].rh_lh=$scope.rh_lh;
				if($scope.user_role=="TEAM LEADER"){
					$scope.assemblyRecords[i].isApproved=0;
					$scope.assemblyRecords[i].approvedBy=0
				}
				else if($scope.user_role=="GROUP LEADER"){
					$scope.assemblyRecords[i].isApproved=0;
					$scope.assemblyRecords[i].approvedBy=1;
				}
				validEntryCount=validEntryCount+1;
				$scope.isEligible=false;
				$scope.eligibleError="";
				$scope.lastInsertedSprNo=$scope.assemblyRecords[i].sno;
			}
			

	}
		
		if(validEntryCount<1){
			$scope.isEligible=true;
			$scope.eligibleError="There is no valid entry to save. Please insert full records!!";
		}
		filteredRecordsCount=parseInt($scope.assemblyRecords.length);
		console.log("After filter length is - "+filteredRecordsCount);
	}

	
	$scope.validateAssemblyForm=function(){
		if($scope.sno==null || $scope.company==null || $scope.assembly_date==null ||$scope.user_plant_no==null ||$scope.hod==null
				||$scope.plantno==null||$scope.customer==null||$scope.cellno==null ||$scope.insert_mould==null|| $scope.shift==null|| $scope.car_model==null|| $scope.part_name==null||
				$scope.fr_rr==null|| $scope.rh_lh==null|| $scope.prod_target==null|| $scope.prod_actual==null|| $scope.used_man_power==null||$scope.prodplan_time==null|| $scope.down_time==null|| $scope.bd_time==null|| $scope.prodrun_time==null||
				$scope.co_time_target==null|| $scope.co_time_actual==null|| $scope.no_of_co==null|| $scope.startuptime_target==null|| $scope.startuptime_actual==null|| $scope.no_of_setup==null||
				$scope.internal_rej==null||$scope.mldgprocess_scrap==null||$scope.mldgstartup_scrap==null|| $scope.process_scrap==null){
			console.log("Validation Failed. redirecting back to UI with error message");
			return false;
		}
		return true;
	}
	
	$scope.loadCustomerGroup=function(){
		$scope.isSprNoGenerated=false;
		$scope.refreshSno();
		$scope.loadDefaultEntryIndex();
		sprFactory.loadCustomerGroup().
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));	
			$scope.loaderFlag=false;
			$scope.listOfCustomerGroup=response.data;
			
		})
		
	}
	
	$scope.refreshSno=function(){
		/*if($window.sessionStorage.getItem('assembly_serialno')=='0'){
			$scope.getLastSerialNo();
		}
		else{
			$scope.sno=$window.sessionStorage.getItem('assembly_serialno');
		}*/
		
		if(!$scope.isSprNoGenerated){
			$scope.getLastSerialNo();
		}
		else{
			$scope.sno=parseInt($scope.sno)+1;
			$scope.assemblyId=parseInt($scope.assemblyId)+1;
		}
	}
	
	$scope.loadModelListByCustomerGroup=function(){
		console.log("Customer changed - "+ $scope.customer);
		$scope.loaderFlag=true;
		console.log("Calling service to load model for customer group - "+ $scope.customer);
		$scope.loadModel($scope.customer);
	}
	
	$scope.loadPartListByCustomerGroupAndModel=function(){
		console.log("Model Changed - "+ $scope.car_model);
		$scope.loaderFlag=true;
		console.log("Calling service to load part for customer group - "+ $scope.customer+ " and model - "+$scope.car_model);
		$scope.loadPart($scope.customer,$scope.car_model);
	}
	
	
	$scope.loadModel=function(customerGroup){
		sprFactory.loadModel(customerGroup).
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));
			$scope.loaderFlag=false;
			$scope.modelList=response.data;
		})
		
	}
	$scope.generateSprNo=function(index){
		console.log("assembly_"+index);
		var sprElement=$window.document.getElementById("assembly_"+index);
		if(sprElement.value==null || sprElement.value=="")
			$scope.refreshSno();
			
		
		if($scope.assemblyRecordsList[index].sno=="" || $scope.assemblyRecordsList[index].sno==null){
			$scope.assemblyRecordsList[index].sno=$scope.sno;
		}
	}
	
	$scope.validateOtherFields=function(position,index,currentElement){
	console.log("validateOtherFields method called for element "+$scope.allFields[position]);
	var invokeElement=$scope.allFields[position];
	var isHeader=true;
	var modPosition=0;
	var headersFieldCount=12;
	var isError=false;
	var isCurrentElement=false;
	if(!$scope.isPatterError){
		if(index==0)
			modPosition=position;
		else
			modPosition=headersFieldCount+17;
		for(var j=0;j<=parseInt(index);j++){
			
			for(var i=0;i<parseInt(modPosition);i++){
				if($scope.allFields[i]+"_"+j==currentElement){
					isCurrentElement=true;
					break;
				}
				if(i<12){
					var elementOBj=$window.document.getElementById($scope.allFields[i]);
				}
				else{
					var elementOBj=$window.document.getElementById($scope.allFields[i]+"_"+j);
					isHeader=false;
				}
				
				if($scope.isBlank(elementOBj)){
					$scope.errorFlag1=true;
					$scope.errorFlag1=true;
					if(isHeader==true)
						$scope.errorMsg1=$scope.allFields[i]+" is mandatory field. Please fill this field";
					else
						$scope.errorMsg1=$scope.allFields[i]+" at index "+j+" is mandatory field. Please fill this field";
					$scope.errorMsg2=invokeElement;
					isError=true;
					elementOBj.focus();
					break;
				}
				else{
					//$scope.errorFlag1=false;
					//$scope.errorMsg1="";
					$scope.errorFlag2=false;
					$scope.errorMsg2="";
				}
					
			}
			if(isError || isCurrentElement){
				break;
				//return;
			}
				
		}
			
			
			if(position=='12')
				$scope.generateSprNo(index);
		
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
	$scope.validateField=function(element,index,modelName,keyEvent){
		console.log("Validate Field method called");
		var processFlag=true;
		
		if(modelName==$scope.errorMsg2){
			processFlag=false;
		}
		var pattern="";
		var maxLenLimit=0;
		var maxVal=0;
		
		
		if(processFlag==true){
			if(modelName=="prod_target" || modelName=="prod_actual"|| modelName=="used_man_power"|| modelName=="prodplan_time"
				|| modelName=="down_time"|| modelName=="bd_time"|| modelName=="prodrun_time"|| modelName=="no_of_co"
					|| modelName=="startuptime_target"|| modelName=="startuptime_actual"|| modelName=="no_of_setup"
						|| modelName=="internal_rej"){
				pattern=/^[0-9]*$/;
			}
			else if(modelName=="co_time_target" ||modelName=="co_time_actual" ||modelName=="mldgprocess_scrap" ||modelName=="mldgstartup_scrap" ||
					modelName=="process_scrap" ){
				 pattern=/^\-{0,1}\d+(.\d+){0,1}$/;
			}
			if(modelName=="prod_target" ||modelName=="prod_actual" ||modelName=="down_time" ||modelName=="bd_time" ||
					modelName=="co_time_target" ||modelName=="co_time_actual" ||modelName=="internal_rej"
						||modelName=="mldgprocess_scrap"||modelName=="mldgstartup_scrap"||modelName=="process_scrap"){
				maxLenLimit='6';
			}
			else if(modelName=="used_man_power" ){    
				maxLenLimit='4';
			}
			else if(modelName=="prodplan_time"||modelName=="prodrun_time"){
				maxLenLimit='3';
			}
			else {
				maxLenLimit='2';
			}
			
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
			else if(modelName=="startuptime_target"||modelName=="startuptime_actual"){
				maxVal='30';
			}
			else {
				maxVal='10';
			}
			var elementObj=$window.document.getElementById(element);
			//alert(elementObj);
			//if($scope.assemblyRecordsList[index].modelName=="" || $scope.assemblyRecordsList[index].modelName==null){
			if(keyEvent.which!=9){
				
				if(elementObj.value=="" || elementObj.value==null){
					$scope.errorFlag1=true;
					$scope.isPatterError=true;
					$scope.errorMsg1="This is mandatory field. Please fill this field";
					elementObj.focus();
				}
				else{
					$scope.errorFlag1=false;
					$scope.errorMsg1="";
					$scope.isPatterError=false;	
					if(!pattern.test(elementObj.value)){
						$scope.errorFlag2=true;
						$scope.isPatterError=true;
						$scope.errorMsg2="Invalid data entered, Please enter the valid data !!";
						elementObj.focus();
					}
					else{
						if(elementObj.value.length>parseInt(maxLenLimit)){
							$scope.errorFlag2=true;
							$scope.isPatterError=true;
						$scope.errorMsg2="Length should not be more than "+maxLenLimit+" digit ";
						elementObj.focus();
						}
						else{
							$scope.errorFlag2=false;
							$scope.errorMsg2="";
							$scope.isPatterError=false;
						}
						
						if(elementObj.value>parseInt(maxVal)){
							$scope.errorFlag2=true;
							$scope.isPatterError=true;
							$scope.errorMsg2="value should not be more than "+maxVal+" digit ";
							elementObj.focus();
						}
						else{
							$scope.errorFlag2=false;
							$scope.isPatterError=false;
							$scope.errorMsg2="";
						}
						
					}
				}
			}
			
			
			
			if(modelName=='prod_actual'){
				prod_targetElement=$window.document.getElementById("prod_target_"+index);
				$scope.productionActualCheck(prod_targetElement,elementObj);
			}
		
		}
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
	
	$scope.productionActualCheck=function(prod_targetElement,elementObj){
		var productionTarget=parseInt(prod_targetElement.value);
		var maxAllowActualValue=parseInt(productionTarget+(productionTarget*20/100));
		if(productionTarget=="" || productionTarget==null){
			$scope.prodActualErrorFlag=true;
			$scope.isPatterError=true;			
			$scope.prodActualErrorMessage="Please fill prodcuction target first.";
			elementObj.focus();
		}
		else{
			
			if(parseInt(elementObj.value)>maxAllowActualValue){
				$scope.prodActualErrorFlag=true;
				$scope.isPatterError=true;				
				$scope.prodActualErrorMessage="Production actual value should not more than target value, maximum limit is :"+maxAllowActualValue;
				elementObj.focus();
			}
			else{
				$scope.prodActualErrorFlag=false;
				$scope.isPatterError=false;
				$scope.prodActualErrorMessage="";
			}
		}
	}
	
	
}]);