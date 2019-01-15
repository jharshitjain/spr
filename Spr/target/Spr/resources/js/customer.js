app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
	$scope.errorFlag=false;
	$scope.loaderFlag=false;
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
		$window.location.href="/Spr/customer.jsp";
	}
	
	
	$scope.insertCustomerRecord=function(event){
		event.preventDefault();
		
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
	
		if(!$scope.validateCustomerForm()){
			$scope.errorMessage="Any of the above field is empty. Please cross check !";
			$scope.errorFlag=true;
			return false;
		}
		var customerRecord={				
				company:$scope.company,
				entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '),
				user_id:$scope.user_id,
				user_plant_no:$scope.user_plant_no,
				name_1:$scope.name_1,
				location:$scope.location,
				search_term:$scope.search_term,
				address1:$scope.address1,
				address2:$scope.address2,				
				post_code:$scope.post_code,
				city:$scope.city,
				country:$scope.country,
				tel_fax:$scope.tel_fax,
				tax_no_1:$scope.tax_no_1,
				tax_no_3:$scope.tax_no_3,
				
				classification:$scope.classification,
				industry:$scope.industry,
				contact_person:$scope.contact_person,
				sales_office:$scope.sales_office,
				sales_group:$scope.sales_group,
				customer_group:$scope.customer_group,
				old_customer_group:$scope.old_customer_group
		};
		
		console.log("Request Payload -"+$scope.entry_date+" and formatted date - "+ $filter('date')(new Date($scope.entry_date),'yyyy-MM-dd '));
		sprFactory.insertCustomerRecord(customerRecord).
		then(function(response){
			//alert(response.data);
			//console.log("Response - "+angular.fromJson(response.data));
			if(response.data==true){
				angular.element($('.processLoader1')).attr('style','display:block');
				//alert("Records has inserted successfully.");
				$scope.submitFlag=true;
			}	
			else
				alert("Error occurred while processing the request.")
		})
		
	}
	$scope.validateCustomerForm=function(){
		if($scope.company==null || $scope.user_plant_no==null ||$scope.name_1==null
				||$scope.location==null||$scope.search_term==null||$scope.address1==null ||$scope.address2==null|| $scope.post_code==null|| $scope.city==null|| $scope.country==null||
				$scope.tel_fax==null|| $scope.tax_no_1==null|| $scope.tax_no_3==null|| $scope.classification==null|| $scope.industry==null|| $scope.contact_person==null|| $scope.sales_office==null|| $scope.sales_group==null||
				$scope.customer_group==null|| $scope.old_customer_group==null){
			console.log("Validation Failed. redirecting back to UI with error message");
			return false;
		}
		return true;
	}
	
	
}]);