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
		'company','hod','extrusion_date','plantno','shift','line','customer','car_model','part_name','fr_rr','trial_or_prod','prod_target','prod_actual','prod_kg','prodplan_time','setuptime_taget','setuptime_actual','co_time_target','co_time_actual','down_time','bd_time','prodrun_time','line_rej_target','line_rej_actual','co_scrap_taget','co_scrap_actual','no_of_co','no_of_Setup','trail_rej'
		];
	
	$scope.extrusionRecords=[];
	$scope.extrusionRecordsList=[];
	
	
	
	
	
	if($window.sessionStorage.getItem('isAuthenticated')=="true"){
		$scope.extrusion_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		$scope.entry_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		$scope.user_name=$window.sessionStorage.getItem("user_name");
		$scope.user_plant=$window.sessionStorage.getItem("user_plant");
		$scope.plantno=$window.sessionStorage.getItem("plantno");
		$scope.shift=$window.sessionStorage.getItem("shift");
		$scope.user_code=$window.sessionStorage.getItem("user_code");
		$scope.user_id=$scope.user_code;
		$scope.user_plant_no=$scope.user_plant
		console.log("Retrieving fields from session storage for user - "+ $scope.user_name)
		console.log("Retrieving fields from session storage for user - "+ $scope.extrusion_date)
	}
	else{
		$window.location.href="/Spr/index.jsp";
	}
	$scope.testMethod=function(){
		var elementOBj=$window.document.getElementById("extrusion_date");
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
		$scope.extrusionRecordsList.splice(0,1);
	}
	
	$scope.pushRecord=function(extrusionRecordEntry){
		$scope.extrusionRecords.push(angular.copy(extrusionRecordEntry));
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
		else if(modelName=="line"){
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
				$scope.errorMsg1="Line is invalid, It should be less than 99";
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
		$scope.extrusionRecordsList.push({
		sno:'',
		company:$scope.company,
		extrusion_date:$filter('date')(new Date($scope.extrusion_date),'yyyy-MM-dd '),
		entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '),
		user_id:$scope.user_id,
		user_plant_no:$scope.user_plant_no,
		hod:$scope.hod,
		plantno:$scope.plantno,
		customer:$scope.customer,
		line:$scope.line,
		
		shift:$scope.shift,
		car_model:$scope.car_model,
		part_name:$scope.part_name,
		fr_rr:$scope.fr_rr,
		trial_or_prod:$scope.trial_or_prod,
		prod_target:'',
		prod_actual:'',
		prod_kg:'',
		prodplan_time:'',
		setuptime_taget:'',
		setuptime_actual:'',
		co_time_target:'',
		co_time_actual:'',
		down_time:'',
		bd_time:'',
		prodrun_time:'',
		line_rej_target:'',
		line_rej_actual:'',
		co_scrap_taget:'',
		co_scrap_actual:'',
		no_of_co:'',
		no_of_Setup:'',
			trail_rej:''	
			
		})
	}
	
	
	
	$scope.logout=function(){
		$window.sessionStorage.setItem("isAuthenticated",null);
	//$window.sessionStorage.reset();
		$window.location.href="/Spr/index.jsp";
	}

	$scope.submitok=function(){
		var updatedSerialNo=parseInt($window.sessionStorage.getItem('extrusion_serialno'))+1;
		console.log(" Updating serial number for extrusion - Updated serial no: "+updatedSerialNo);
		$window.sessionStorage.setItem('extrusion_serialno',updatedSerialNo);
		$window.location.href="/Spr/extrusion.jsp";
	}
	
	$scope.getLastSerialNo=function(){
		sprFactory.getLastSerialNo("EXTRUSION").
		then(function(response){
			console.log("Response of getLastSerialNo API call - "+angular.fromJson(response.data));	
			$scope.sno=response.data;
			$scope.extrusionId=response.data;
			$scope.isSprNoGenerated=true;
		});
	}
	
	$scope.insertExtrusionRecord=function(event,source){
		event.preventDefault();
		var entryLength=parseInt($scope.extrusionRecordsList.length);
		for(var i=0;i<entryLength;i++){			
			$scope.pushRecord($scope.extrusionRecordsList[i]);
			//console.log("Entry inserted at index-"+i+" - "+$scope.assemblyRecords);
		}
		$scope.prepareRequestData();
		console.log("Items in extrusion Record-"+JSON.stringify($scope.extrusionRecords));
		if(!$scope.isEligible){
		if(source=="ADD_NEWROW"){
			
			sprFactory.insertExtrusionRecordList(JSON.stringify($scope.extrusionRecords)).
			then(function(response){
				//alert(response.data);
				//console.log("Response - "+angular.fromJson(response.data));
				if(response.data.RESPONSEFLAG=="SUCCESS"){
					//alert("Records has inserted successfully.");
					$scope.flushRows();
					$scope.loadDefaultEntryIndex();
					var lastSavedExtrusionId=response.data.EXTRUSION_ID;
					if($scope.lastInsertedSprNo!=lastSavedExtrusionId){
						$scope.lastInsertedSprNo=lastSavedExtrusionId
						alert("It seems that some other person has also inserted record for extrusion, hence your last updated sprNo is- "+$scope.lastInsertedSprNo);
					}
					$scope.isSprNoGenerated=false;
					$scope.refreshSno();			
					}						
				else
					alert("Error occurred while processing the request.")
			})
		
		}
		else{
			sprFactory.insertExtrusionRecordList(JSON.stringify($scope.extrusionRecords)).
			then(function(response){
				//alert(response.data);
				//console.log("Response - "+angular.fromJson(response.data));
				if(response.data.RESPONSEFLAG=="SUCCESS"){
					//alert("Records has inserted successfully.");
					$scope.flushRows();
					$scope.loadDefaultEntryIndex();
					var lastSavedExtrusionId=response.data.EXTRUSION_ID;
					if($scope.lastInsertedSprNo!=lastSavedExtrusionId){
						$scope.lastInsertedSprNo=lastSavedExtrusionId
						alert("It seems that some other person has also inserted record for extrusion, hence your last updated sprNo is- "+$scope.lastInsertedSprNo);
					}
					angular.element($('.processLoader1')).attr('style','display:block');
					angular.element($('.submitButtn')).attr('disabled','true');
					$scope.submitFlag=true;
					angular.element($('.ok_button')).attr('style','display:block');
					$window.document.getElementById("ok_button").focus();
					//$window.sessionStorage.setItem('extrusion_serialno',0);
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
		var endIndex=$scope.extrusionRecordsList.length;
		$scope.extrusionRecordsList.splice(startingIndex,endIndex);
		
		// For assembly record array
		var endIndex=$scope.extrusionRecords.length;
		$scope.extrusionRecords.splice(startingIndex,endIndex);
	}
	
	$scope.prepareRequestData=function(){
		var totalRecordsCount=parseInt($scope.extrusionRecords.length);
		var filteredRecordsCount=0;
		var invalidRecordCount=0;
		var validEntryCount=0;
		//prod_target
		var extrusion_date=$filter('date')(new Date($window.document.getElementById("extrusion_date").value),'yyyy-MM-dd')
		for(var i=0;i<totalRecordsCount;i++){
			if(($scope.extrusionRecords[i].prod_target=="" || $scope.extrusionRecords[i].prod_target==null)||
					($scope.extrusionRecords[i].prod_actual=="" || $scope.extrusionRecords[i].prod_actual==null)||
					($scope.extrusionRecords[i].prod_kg=="" || $scope.extrusionRecords[i].prod_kg==null)||
					($scope.extrusionRecords[i].prodplan_time=="" || $scope.extrusionRecords[i].prodplan_time==null)||
					($scope.extrusionRecords[i].setuptime_taget=="" || $scope.extrusionRecords[i].setuptime_taget==null)||
					($scope.extrusionRecords[i].setuptime_actual=="" || $scope.extrusionRecords[i].setuptime_actual==null)||
					($scope.extrusionRecords[i].co_time_target=="" || $scope.extrusionRecords[i].co_time_target==null)||
					($scope.extrusionRecords[i].co_time_actual=="" || $scope.extrusionRecords[i].co_time_actual==null)||
					($scope.extrusionRecords[i].down_time=="" || $scope.extrusionRecords[i].down_time==null)||
					($scope.extrusionRecords[i].bd_time=="" || $scope.extrusionRecords[i].bd_time==null)||
					($scope.extrusionRecords[i].prodrun_time=="" || $scope.extrusionRecords[i].prodrun_time==null)||
					($scope.extrusionRecords[i].line_rej_target=="" || $scope.extrusionRecords[i].line_rej_target==null)||
					($scope.extrusionRecords[i].line_rej_actual=="" || $scope.extrusionRecords[i].line_rej_actual==null)||
					($scope.extrusionRecords[i].co_scrap_taget=="" || $scope.extrusionRecords[i].co_scrap_taget==null)||
					($scope.extrusionRecords[i].co_scrap_actual=="" || $scope.extrusionRecords[i].co_scrap_actual==null)||
					($scope.extrusionRecords[i].no_of_co=="" || $scope.extrusionRecords[i].no_of_co==null)||
					($scope.extrusionRecords[i].no_of_Setup=="" || $scope.extrusionRecords[i].no_of_Setup==null)||
					($scope.extrusionRecords[i].trail_rej=="" || $scope.extrusionRecords[i].trail_rej==null	)){
				invalidRecordCount=totalRecordsCount-i;
				$scope.extrusionRecords.splice(i,invalidRecordCount);
				totalRecordsCount=parseInt($scope.extrusionRecords.length);
			}
			else{
				$scope.extrusionRecords[i].company=$scope.company;
				$scope.extrusionRecords[i].extrusion_date=$scope.extrusion_date;
				
				$scope.extrusionRecords[i].entry_date=$scope.entry_date;
				$scope.extrusionRecords[i].hod=$scope.hod;
				$scope.extrusionRecords[i].plantno=$scope.plantno;
				$scope.extrusionRecords[i].customer=$scope.customer;
				$scope.extrusionRecords[i].line=$scope.line;
				$scope.extrusionRecords[i].shift=$scope.shift;
				$scope.extrusionRecords[i].car_model=$scope.car_model;
				$scope.extrusionRecords[i].part_name=$scope.part_name;
				$scope.extrusionRecords[i].fr_rr=$scope.fr_rr;
				$scope.extrusionRecords[i].trial_or_prod=$scope.trial_or_prod;
				validEntryCount=validEntryCount+1;
				$scope.isEligible=false;
				$scope.eligibleError="";
				$scope.lastInsertedSprNo=$scope.extrusionRecords[i].sno;
			}
			
	}
		
		if(validEntryCount<1){
			$scope.isEligible=true;
			$scope.eligibleError="There is no valid entry to save. Please insert full records!!";
		}
		filteredRecordsCount=parseInt($scope.extrusionRecords.length);
		console.log("After filter length is - "+filteredRecordsCount);
	}
	
	
	
	
	// Old functionality Code
	/*$scope.insertExtrusionRecord=function(event){
		event.preventDefault();
		console.log("Request Recieved-Extrusion");
		
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
		if(!$scope.validateExtrusionForm()){
			$scope.errorMessage="Any of the above field is empty. Please cross check !";
			$scope.errorFlag=true;
			return false;
		}
		
		var extrusionRecord={
				sno:$scope.sno,
				company:$scope.company,
				extrusion_date:$filter('date')(new Date($scope.extrusion_date),'yyyy-MM-dd HH:mm:ss'),
				entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd HH:mm:ss'),
				user_id:$scope.user_id,
				user_plant_no:$scope.user_plant_no,
				hod:$scope.hod,

				plantno:$scope.plantno,
				customer:$scope.customer,
				line:$scope.line,
				car_model:$scope.car_model,
				part_name:$scope.part_name,
				fr_rr:$scope.fr_rr,
				trial_or_prod:$scope.trial_or_prod,
				shift:$scope.shift,
				prod_target:$scope.prod_target,
				prod_actual:$scope.prod_actual,
				prod_kg:$scope.prod_kg,
				prodplan_time:$scope.prodplan_time,
				setuptime_taget:$scope.setuptime_taget,
				setuptime_actual:$scope.setuptime_actual,
				co_time_target:$scope.co_time_target,
				co_time_actual:$scope.co_time_actual,
				down_time:$scope.down_time,
				bd_time:$scope.bd_time,
				prodrun_time:$scope.prodrun_time,
				line_rej_target:$scope.line_rej_target,
				line_rej_actual:$scope.line_rej_actual,
				co_scrap_taget:$scope.co_scrap_taget,
				co_scrap_actual:$scope.co_scrap_actual,
				no_of_co:$scope.no_of_co,
				no_of_Setup:$scope.no_of_Setup,
				trail_rej:$scope.trail_rej
		}
		
		//console.log("Request Payload -"+$scope.extrusion_date)
		sprFactory.insertExtrusionRecord(extrusionRecord).
		then(function(response){
			//console.log("Response status - "+angular.fromJson(response.data));
			if(response.data==true){
				angular.element($('.processLoader1')).attr('style','display:block');
				$scope.submitFlag=true;
			}
				//alert("Records has inserted successfully.");
			else
				alert("Error occurred while processing the request.")
		})
	}*/
	
	$scope.validateExtrusionForm=function(){
		if($scope.sno==null || $scope.company==null || $scope.extrusion_date==null ||$scope.user_plant_no==null ||$scope.hod==null
				||$scope.plantno==null||$scope.customer==null||$scope.line==null ||$scope.car_model==null|| $scope.part_name==null|| $scope.fr_rr==null|| $scope.trial_or_prod==null||
				$scope.shift==null|| $scope.prod_target==null|| $scope.prod_actual==null|| $scope.prod_kg==null|| $scope.prodplan_time==null|| $scope.setuptime_taget==null|| $scope.setuptime_actual==null|| $scope.co_time_target==null||
				$scope.co_time_actual==null|| $scope.down_time==null| $scope.bd_time==null| $scope.prodrun_time==null|| $scope.line_rej_target==null|| $scope.line_rej_actual==null||
				$scope.co_scrap_taget==null|| $scope.co_scrap_actual==null|| $scope.no_of_co==null|| $scope.no_of_Setup==null|| $scope.trail_rej==null){
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
		$scope.extrusionId=parseInt($scope.extrusionId)+1;
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
		$scope.extrusionRecordsList[index].sno=parseInt($scope.sno)+index;
		
		console.log("extrusion_"+index);
		var sprElement=$window.document.getElementById("extrusion_"+index);
		if(sprElement.value==null || sprElement.value=="")
			$scope.refreshSno();
		
		if($scope.extrusionRecordsList[index].sno=="" || $scope.extrusionRecordsList[index].sno==null){
		$scope.extrusionRecordsList[index].sno=$scope.sno;
		}
	}
	
	$scope.validateOtherFields=function(position,index,currentElement){
	console.log("validateOtherFields method called for element "+$scope.allFields[position]);
	var invokeElement=$scope.allFields[position];
	var isHeader=true;
	var modPosition=0;
	var headersFieldCount=11;
	var isError=false;
	var isCurrentElement=false;
	if(!$scope.isPatterError){
		if(index==0)
			modPosition=position;
		else
			modPosition=headersFieldCount+18;
		for(var j=0;j<=parseInt(index);j++){
			
			for(var i=0;i<parseInt(modPosition);i++){
				if($scope.allFields[i]+"_"+j==currentElement){
					isCurrentElement=true;
					break;
				}
				if(i<11){
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
			
			
			if(position=='11')
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
			if(modelName=="prod_target" || modelName=="prod_actual"|| modelName=="prodplan_time"|| modelName=="setuptime_taget"
				|| modelName=="setuptime_actual"|| modelName=="co_time_target"|| modelName=="co_time_actual"|| modelName=="down_time"
					|| modelName=="bd_time"|| modelName=="prodrun_time"|| modelName=="no_of_co"
						|| modelName=="no_of_Setup"){
				pattern=/^[0-9]*$/;
			}
			else if(modelName=="prod_kg" ||modelName=="line_rej_target" ||modelName=="line_rej_actual" ||modelName=="co_scrap_taget" ||
					modelName=="co_scrap_actual"||modelName=="trail_rej" ){
				 pattern=/^\-{0,1}\d+(.\d+){0,1}$/;
			}
			if(modelName=="prod_target" || modelName=="prod_actual"||modelName=="setuptime_taget"
				|| modelName=="setuptime_actual"|| modelName=="co_time_target"|| modelName=="co_time_actual"
					|| modelName=="down_time"|| modelName=="bd_time"||modelName=="prod_kg" ||modelName=="line_rej_target" 
							||modelName=="line_rej_actual" ||modelName=="co_scrap_taget" ||
						modelName=="co_scrap_actual"||modelName=="trail_rej" ){
				maxLenLimit='6';
			}
			else if(modelName=="prodplan_time"||modelName=="prodrun_time"){
				maxLenLimit='3';
			}
			else {
				maxLenLimit='2';
			}
			if(modelName=="prod_target" || modelName=="prod_actual"|| modelName=="setuptime_taget"
				|| modelName=="setuptime_actual"|| modelName=="co_time_target"|| modelName=="co_time_actual"|| modelName=="down_time"
					|| modelName=="bd_time"|| modelName=="prod_kg" ||modelName=="line_rej_target" ||modelName=="line_rej_actual" ||modelName=="co_scrap_taget" ||
						modelName=="co_scrap_actual"||modelName=="trail_rej" ){
				maxVal='999999';
			}
			
			else if(modelName=="prodplan_time"||modelName=="prodrun_time"){
				maxVal='450';
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
				$scope.errorMsg1="This is mandatory field. Please fill this field";
				$scope.isPatterError=true;
				elementObj.focus();
			}
			else{
				$scope.errorFlag1=false;
				$scope.isPatterError=false;
				$scope.errorMsg1="";
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
						$scope.isPatterError=false;
						$scope.errorMsg2="";
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
			if(modelName=='prod_actual'){
				prod_targetElement=$window.document.getElementById("prod_target_"+index);
				$scope.productionActualCheck(prod_targetElement,elementObj);
			}
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
			$elementObj.focus();
		}
		else{
			
			if(parseInt(elementObj.value)>maxAllowActualValue){
				$scope.prodActualErrorFlag=true;
				$scope.isPatterError=true;
				$scope.prodActualErrorMessage="Production actual value should not more than target value, maximum limit is :"+maxAllowActualValue;
				$elementObj.focus();
			}
			else{
				$scope.prodActualErrorFlag=false;
				$scope.isPatterError=false;
				$scope.prodActualErrorMessage="";
			}
		}
	}
	
	
}]);