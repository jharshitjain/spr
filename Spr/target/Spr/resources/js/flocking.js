/*
Flocking controller file
It will load all the fields from the form and pass it to the factory service.

*/
app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
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
		'company','hod','flocking_date','plantno','shift','line','customer','car_model','part_name','fr_rr','prod_target','prod_actual','used_man_power','down_time','bd_time','prodrun_time','co_time_target','co_time_actual','no_of_co','startuptime_target','startuptime_actual','no_of_setup','internal_rej'
		];
	
	$scope.flockingRecords=[];
	$scope.flockingRecordsList=[];
	
	
	if($window.sessionStorage.getItem('isAuthenticated')=="true"){
		$scope.flocking_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		$scope.entry_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');
		$scope.user_name=$window.sessionStorage.getItem("user_name");
		$scope.user_plant=$window.sessionStorage.getItem("user_plant");
		$scope.plantno=$window.sessionStorage.getItem("plantno");
		$scope.shift=$window.sessionStorage.getItem("shift");
		$scope.user_code=$window.sessionStorage.getItem("user_code");
		$scope.user_id=$scope.user_code;
		$scope.user_plant_no=$scope.user_plant
		console.log("Retrieving fields from session storage for user - "+ $scope.user_name)
	}
	else{
		$window.location.href="/Spr/index.jsp";
	}
	
	$scope.loadDefaultEntryIndex=function(){
		var entryIndex=parseInt($scope.defaultEntryIndex)-1;
		$scope.removeDefaultObject();
		for(var i=0;i<entryIndex;i++){
			$scope.addRows(i);
		}
	}
	
	$scope.removeDefaultObject=function(){
		$scope.flockingRecordsList.splice(0,1);
	}
	
	$scope.pushRecord=function(flockingRecordEntry){
		$scope.flockingRecords.push(angular.copy(flockingRecordEntry));
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
		$scope.flockingRecordsList.push({
		sno:'',
		company:$scope.company,
		flocking_date:$filter('date')(new Date($scope.flocking_date),'yyyy-MM-dd '),
		entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '),
		user_id:$scope.user_id,
		user_plant_no:$scope.user_plant_no,
		hod:$scope.hod,
		plantno:$scope.plantno,		
		shift:$scope.shift,
		line:$scope.line,
		customer:$scope.customer,
		car_model:$scope.car_model,
		part_name:$scope.part_name,
		fr_rr:$scope.fr_rr,
		prod_target:'',
		prod_actual:'',
		used_man_power:'',
		down_time:'',
		bd_time:'',
		prodrun_time:'',
		co_time_target:'',
		co_time_actual:'',
		no_of_co:'',
		startuptime_target:'',
		startuptime_actual:'',
		no_of_setup:'',
		internal_rej:''
			
		})
	}
	
	
	$scope.logout=function(){
		$window.sessionStorage.setItem("isAuthenticated",null);
	//$window.sessionStorage.reset();
		$window.location.href="/Spr/index.jsp";
	}

	$scope.submitok=function(){
		var updatedSerialNo=parseInt($window.sessionStorage.getItem('flocking_serialno'))+1;
		console.log(" Updating serial number for flocking - Updated serial no: "+updatedSerialNo);
		$window.sessionStorage.setItem('flocking_serialno',updatedSerialNo);
		$window.location.href="/Spr/flocking.jsp";
	}
	$scope.getLastSerialNo=function(){
		sprFactory.getLastSerialNo("FLOCKING").
		then(function(response){
			console.log("Response of getLastSerialNo API call - "+angular.fromJson(response.data));	
			$scope.sno=response.data;
			$scope.assemblyId=response.data;
			$scope.isSprNoGenerated=true;
		});
	}
	
	$scope.insertFlockingRecord=function(event,source){
		event.preventDefault();
		var entryLength=parseInt($scope.flockingRecordsList.length);
		for(var i=0;i<entryLength;i++){			
			$scope.pushRecord($scope.flockingRecordsList[i]);
			//console.log("Entry inserted at index-"+i+" - "+$scope.assemblyRecords);
		}
		$scope.prepareRequestData();
		console.log("Items in flocking Record-"+JSON.stringify($scope.flockingRecords));
		if(!$scope.isEligible){
		if(source=="ADD_NEWROW"){
			
			sprFactory.insertFlockingRecordList(JSON.stringify($scope.flockingRecords)).
			then(function(response){
				//alert(response.data);
				//console.log("Response - "+angular.fromJson(response.data));
				if(response.data.RESPONSEFLAG=="SUCCESS"){
					//alert("Records has inserted successfully.");
					$scope.flushRows();
					$scope.loadDefaultEntryIndex();
					var lastSavedFlockingId=response.data.FLOCKING_ID;
					if($scope.lastInsertedSprNo!=lastSavedFlockingId){
						$scope.lastInsertedSprNo=lastSavedFlockingId
						alert("It seems that some other person has also inserted record for flocking, hence your last updated sprNo is- "+$scope.lastInsertedSprNo);
					}
					$scope.isSprNoGenerated=false;
					$scope.refreshSno();			
					}						
				else
					alert("Error occurred while processing the request.")
			})
		
		}
		else{
			sprFactory.insertFlockingRecordList(JSON.stringify($scope.flockingRecords)).
			then(function(response){
				//alert(response.data);
				//console.log("Response - "+angular.fromJson(response.data));
				if(response.data.RESPONSEFLAG=="SUCCESS"){
					//alert("Records has inserted successfully.");
					var lastSavedFlockingId=response.data.FLOCKING_ID;
					if($scope.lastInsertedSprNo!=lastSavedFlockingId){
						$scope.lastInsertedSprNo=lastSavedFlockingId
						alert("It seems that some other person has also inserted record for flocking, hence your last updated sprNo is- "+$scope.lastInsertedSprNo);
					}
					angular.element($('.processLoader1')).attr('style','display:block');
					angular.element($('.submitButtn')).attr('disabled','true');
					$scope.submitFlag=true;
					
					angular.element($('.ok_button')).attr('style','display:block');
					$window.document.getElementById("ok_button").focus();
					//$window.sessionStorage.setItem('flocking_serialno',0);
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
		var endIndex=$scope.flockingRecordsList.length;
		$scope.flockingRecordsList.splice(startingIndex,endIndex);
		
		// For assembly record array
		var endIndex=$scope.flockingRecords.length;
		$scope.flockingRecords.splice(startingIndex,endIndex);
	}
	
	$scope.prepareRequestData=function(){
		var totalRecordsCount=parseInt($scope.flockingRecords.length);
		var filteredRecordsCount=0;
		var invalidRecordCount=0;
		var validEntryCount=0;
		//prod_target
		var flocking_date=$filter('date')(new Date($window.document.getElementById("flocking_date").value),'yyyy-MM-dd')
		for(var i=0;i<totalRecordsCount;i++){
			if(($scope.flockingRecords[i].prod_target=="" || $scope.flockingRecords[i].prod_target==null)||
					($scope.flockingRecords[i].prod_actual=="" || $scope.flockingRecords[i].prod_actual==null)||
					($scope.flockingRecords[i].used_man_power=="" || $scope.flockingRecords[i].used_man_power==null)||
					($scope.flockingRecords[i].down_time=="" || $scope.flockingRecords[i].down_time==null)||
					($scope.flockingRecords[i].bd_time=="" || $scope.flockingRecords[i].bd_time==null)||
					($scope.flockingRecords[i].prodrun_time=="" || $scope.flockingRecords[i].prodrun_time==null)||
					($scope.flockingRecords[i].co_time_target=="" || $scope.flockingRecords[i].co_time_target==null)||
					($scope.flockingRecords[i].co_time_actual=="" || $scope.flockingRecords[i].co_time_actual==null)||
					($scope.flockingRecords[i].no_of_co=="" || $scope.flockingRecords[i].no_of_co==null)||
					($scope.flockingRecords[i].startuptime_target=="" || $scope.flockingRecords[i].startuptime_target==null)||
					($scope.flockingRecords[i].startuptime_actual=="" || $scope.flockingRecords[i].startuptime_actual==null)||
					($scope.flockingRecords[i].no_of_setup=="" || $scope.flockingRecords[i].no_of_setup==null)||
					($scope.flockingRecords[i].internal_rej=="" || $scope.flockingRecords[i].internal_rej==null)){
				invalidRecordCount=totalRecordsCount-i;
				$scope.flockingRecords.splice(i,invalidRecordCount);
				totalRecordsCount=parseInt($scope.flockingRecords.length);
			}
			else{
				$scope.flockingRecords[i].company=$scope.company;
				$scope.flockingRecords[i].flocking_date=$scope.flocking_date;
				
				$scope.flockingRecords[i].entry_date=$scope.entry_date;
				$scope.flockingRecords[i].hod=$scope.hod;
				$scope.flockingRecords[i].plantno=$scope.plantno;
				$scope.flockingRecords[i].customer=$scope.customer;
				$scope.flockingRecords[i].line=$scope.line;
				$scope.flockingRecords[i].shift=$scope.shift;
				$scope.flockingRecords[i].car_model=$scope.car_model;
				$scope.flockingRecords[i].part_name=$scope.part_name;
				$scope.flockingRecords[i].fr_rr=$scope.fr_rr;
				
				validEntryCount=validEntryCount+1;
				$scope.isEligible=false;
				$scope.eligibleError="";
				$scope.lastInsertedSprNo=$scope.flockingRecords[i].sno;
			}
			
	}
		
		if(validEntryCount<1){
			$scope.isEligible=true;
			$scope.eligibleError="There is no valid entry to save. Please insert full records!!";
		}
		filteredRecordsCount=parseInt($scope.flockingRecords.length);
		console.log("After filter length is - "+filteredRecordsCount);
	}
	
	
	// Old functionality Code
	/*$scope.insertFlockingRecord=function(event){" +

		event.preventDefault();
	
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
		if(!$scope.validateFlockingForm()){
			$scope.errorMessage="Any of the above field is empty. Please cross check !";
			$scope.errorFlag=true;
			return false;
		}
		
		var flockingRecord={
				sno:$scope.sno,
				company:$scope.company,
				flocking_date:$filter('date')(new Date($scope.flocking_date),'yyyy-MM-dd HH:mm:ss'),
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
				shift:$scope.shift,
				prod_target:$scope.prod_target,
				prod_actual:$scope.prod_actual,
				used_man_power:$scope.used_man_power,
				down_time:$scope.down_time,
				bd_time:$scope.bd_time,
				prodrun_time:$scope.prodrun_time,
				co_time_target:$scope.co_time_target,
				co_time_actual:$scope.co_time_actual,
				no_of_co:$scope.no_of_co,
				startuptime_target:$scope.startuptime_target,
				startuptime_actual:$scope.startuptime_actual,
				no_of_setup:$scope.no_of_setup,
				internal_rej:$scope.internal_rej
				
		}
		
		console.log("Request Payload -"+$scope.flockingRecord)
		sprFactory.insertFlockingRecord(flockingRecord).
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
	
	$scope.validateFlockingForm=function(){
		if($scope.sno==null || $scope.company==null || $scope.flocking_date==null ||$scope.user_plant_no==null ||$scope.hod==null
				||$scope.plantno==null||$scope.customer==null||$scope.line==null ||$scope.car_model==null|| $scope.part_name==null|| $scope.fr_rr==null|| $scope.shift==null||
				$scope.prod_target==null|| $scope.prod_actual==null|| $scope.used_man_power==null|| $scope.down_time==null|| $scope.bd_time==null|| $scope.prodrun_time==null|| $scope.co_time_target==null|| $scope.co_time_actual==null||
				$scope.no_of_co==null|| $scope.startuptime_target==null|| $scope.startuptime_actual==null|| $scope.no_of_setup==null|| $scope.internal_rej==null){
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
	if(!$scope.isSprNoGenerated){
		$scope.getLastSerialNo();
	}
	else{
		$scope.sno=parseInt($scope.sno)+1;
		$scope.flockingId=parseInt($scope.flockingId)+1;
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
		console.log("flocking_"+index);
		var sprElement=$window.document.getElementById("flocking_"+index);
		if(sprElement.value==null || sprElement.value=="")
			$scope.refreshSno();
		
		if($scope.flockingRecordsList[index].sno=="" || $scope.flockingRecordsList[index].sno==null){
		$scope.flockingRecordsList[index].sno=parseInt($scope.sno);
		}
		
	}
	
	$scope.validateOtherFields=function(position,index,currentElement){
	console.log("validateOtherFields method called for element "+$scope.allFields[position]);
	var invokeElement=$scope.allFields[position];
	var isHeader=true;
	var modPosition=0;
	var headersFieldCount=10;
	var isError=false;
	var isCurrentElement=false;
	
	if(!$scope.isPatterError){
		if(index==0)
			modPosition=position;
		else
			modPosition=headersFieldCount+13;
		for(var j=0;j<=parseInt(index);j++){
			
			for(var i=0;i<parseInt(modPosition);i++){
				if($scope.allFields[i]+"_"+j==currentElement){
					isCurrentElement=true;
					break;
				}
				if(i<10){
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
			
			
			if(position=='10')
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
			if(modelName=="prod_target" || modelName=="prod_actual"|| modelName=="used_man_power"|| modelName=="down_time"
				|| modelName=="bd_time"|| modelName=="co_time_target"|| modelName=="co_time_actual"||modelName=="prodrun_time"|| modelName=="no_of_co"
					|| modelName=="startuptime_target"|| modelName=="startuptime_actual"|| modelName=="no_of_setup"){
				pattern=/^[0-9]*$/;
			}
			else if(modelName=="internal_rej" ){
				 pattern=/^\-{0,1}\d+(.\d+){0,1}$/;
			}
			if(modelName=="prod_target" || modelName=="prod_actual"||modelName=="down_time"
				|| modelName=="bd_time"|| modelName=="co_time_target"|| modelName=="co_time_actual"|| 
					modelName=="startuptime_target"|| modelName=="startuptime_actual"|| modelName=="internal_rej"
				  ){
				maxLenLimit='6';
			}
			else if(modelName=="used_man_power"){
				maxLenLimit='4';
			}
			else if(modelName=="prodrun_time"){
				maxLenLimit='3';
			}
			else {
				maxLenLimit='2';
			}
			if(modelName=="prod_target" || modelName=="prod_actual"||modelName=="down_time"
				|| modelName=="bd_time"|| modelName=="co_time_target"|| modelName=="co_time_actual"|| 
				modelName=="startuptime_target"|| modelName=="startuptime_actual"|| modelName=="internal_rej" ){
				maxVal='999999';
			}
			else if(modelName=="used_man_power"){
				maxVal='9999';
			}
			else if(modelName=="prodrun_time"){
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
				$scope.isPatterError=true;
				$scope.errorMsg1="This is mandatory field. Please fill this field";
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