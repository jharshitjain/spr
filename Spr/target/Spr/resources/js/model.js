app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
	
	$scope.errorFlag=false;
	$scope.loaderFlag=true;
	$scope.submitFlag=false;
	if($window.sessionStorage.getItem('isAuthenticated')=="true"){
					
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
	$scope.testMethod=function(){
		alert("Test Method called");
	}
	
	$scope.logout=function(){
		$window.sessionStorage.setItem("isAuthenticated",null);
	//$window.sessionStorage.reset();
		$window.location.href="/Spr/index.jsp";
	}

	$scope.submitok=function(){
		$window.location.href="/Spr/model.jsp";
	}
	
	$scope.insertModelRecord=function(event){
		event.preventDefault();
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
		if(!$scope.validateModelForm()){
			$scope.errorMessage="Any of the above field is empty. Please cross check !";
			$scope.errorFlag=true;
			return false;
		}
		
		var modelRecord={
				company:$scope.company,
				model_no:$scope.model_no,
				model_name:$scope.model_name,
				entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '),
				user_id:$scope.user_id,
				user_plant_no:$scope.user_plant_no
				
								
		};
		
		console.log("Request Payload -"+$scope.entry_date+" and formatted date - "+ $filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '));
		sprFactory.insertModelRecord(modelRecord).
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
	$scope.validateModelForm=function(){
		if($scope.company==null || $scope.model_no==null ||$scope.model_name==null ||$scope.user_plant_no==null){
			console.log("Validation Failed. redirecting back to UI with error message");
			return false;
		}
		return true;
	}
	
	
	$scope.loadCustomerGroup=function(){
		$scope.loaderFlag=true;
		sprFactory.loadCustomerGroup().
		then(function(response){
			console.log("Response - "+angular.fromJson(response.data));
			$scope.loaderFlag=false;
			$scope.listOfCustomerGroup=response.data;
			
		})
		
	}
}]);