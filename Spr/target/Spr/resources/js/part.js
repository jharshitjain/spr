app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
	
	
	$scope.errorFlag=false;
	$scope.loaderFlag=true;
	$scope.submitFlag=false;
	if($window.sessionStorage.getItem('isAuthenticated')=="true"){
		$scope.assembly_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd');			
		$scope.user_name=$window.sessionStorage.getItem("user_name");
		$scope.user_plant=$window.sessionStorage.getItem("user_plant");
		$scope.plant=$window.sessionStorage.getItem("plant");
		$scope.shift=$window.sessionStorage.getItem("shift");
		$scope.user_code=$window.sessionStorage.getItem("user_code");
		$scope.user_id=$scope.user_code;
		$scope.user_plant_no=$scope.user_plant
		console.log("Retrieving fields from session storage for user - "+ $scope.user_name)
	}
	else{
		$window.location.href="/Spr/index.jsp";
	}
	$scope.testMethod=function(){
		alert("Test Method called");
	}
	
	$scope.logout=function(){
		$window.sessionStorage.setItem("isAuthenticated",null);
	//$window.sessionStorage.reset();
		$window.location.href="/Spr/index.jsp";
	}

	$scope.submitok=function(){
		$window.location.href="/Spr/part.jsp";
	}
	
	
	$scope.insertPartRecord=function(event){
		event.preventDefault();
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
		if(!$scope.validatePartForm()){
			$scope.errorMessage="Any of the above field is empty. Please cross check !";
			$scope.errorFlag=true;
			return false;
		}
		var partRecord={
				
				company:$scope.company,
				entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd HH:mm:ss'),
				user_id:$scope.user_id,
				user_plant_no:$scope.user_plant_no,
				customer_group:$scope.customer_group,
				car_model:$scope.car_model,
				part_no:$scope.part_no,
				part_name:$scope.part_name,
				extrusion_line_no:$scope.extrusion_line_no,
				extrusion_length_mm:$scope.extrusion_length_mm,
				flocking_line_no:$scope.flocking_line_no,
				plant:$scope.plant
								
		};
		
		console.log("Request Payload -"+$scope.entry_date+" and formatted date - "+ $filter('date')(new Date($scope.entry_date),'yyyy-MM-dd HH:mm:ss'));
		sprFactory.insertPartRecord(partRecord).
		then(function(response){
			//alert(response.data);
			//console.log("Response - "+angular.fromJson(response.data));
			if(response.data==true){
				angular.element($('.processLoader1')).attr('style','display:block');
				$scope.submitFlag=true;
			}
				//alert("Records has inserted successfully.");
			else
				alert("Error occurred while processing the request.")
		})
		
	}
	$scope.validatePartForm=function(){
		if($scope.company==null || $scope.user_plant_no==null ||$scope.customer_group==null ||$scope.car_model==null ||$scope.part_no==null
				||$scope.part_name==null||$scope.extrusion_line_no==null||$scope.flocking_line_no==null||$scope.plant==null){
			console.log("Validation Failed. redirecting back to UI with error message");
			return false;
		}
		return true;
	}
	
	
	$scope.loadCustomerGroup=function(){
		sprFactory.loadCustomerGroup().
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));
			$scope.loaderFlag=false;
			$scope.listOfCustomerGroup=response.data;
		})
		
	}
	
	$scope.loadModelListByCustomerGroup=function(){
		console.log("Customer changed - "+ $scope.customer_group);
		$scope.loaderFlag=true;
		console.log("Calling service to load model for customer group - "+ $scope.customer_group);
		$scope.loadModel($scope.customer_group);
	}
	
	$scope.loadModel=function(customerGroup){
		sprFactory.loadModel(customerGroup).
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));
			$scope.loaderFlag=false;
			$scope.modelList=response.data;
		})
		
	}
	
	
	
	
	
}]);