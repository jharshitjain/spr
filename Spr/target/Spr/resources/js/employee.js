app.controller('sprContrlr',['$scope','sprFactory','$filter','$window',function($scope,sprFactory,$filter,$window){
	$scope.errorFlag=false;
		$scope.authenticateUser=function(event){
			event.preventDefault();
			console.log("Authenticate User - "+ $scope.emp_code+" and Role - "+$scope.role);
			$scope.loginForm={
					emp_code:$scope.emp_code,
					pwd:$scope.pwd,
					role:$scope.role
			};
			
				
				if(!$scope.validateAssemblyForm()){
					$scope.errorMessage="Any of the above field is empty. Please cross check !";
					$scope.errorFlag=true;
					return false;
				}
			sprFactory.authenticateForm($scope.loginForm).
			then(function(response){				
				console.log("Response - "+angular.fromJson(response));
				if(response.data.emp_code!=null){
					//alert("Authenticatin done - "+response.data.emp_code);
					$window.sessionStorage.setItem('user_name',response.data.emp_name);
					$window.sessionStorage.setItem('user_plant',response.data.plant);
					$window.sessionStorage.setItem('user_role',response.data.role);
					$window.sessionStorage.setItem('user_code',response.data.emp_code);
					$window.sessionStorage.setItem('user_plant_1',response.data.plant_1);
					$window.sessionStorage.setItem('user_plant_2',response.data.plant_2);
					$window.sessionStorage.setItem('user_plant_5',response.data.plant_5);
					$window.sessionStorage.setItem('user_plant_6',response.data.plant_6);
					$window.sessionStorage.setItem('isAuthenticated',true);
					$window.sessionStorage.setItem('assembly_serialno','0');
					$window.sessionStorage.setItem('extrusion_serialno','0');
					$window.sessionStorage.setItem('flocking_serialno','0');
					$window.sessionStorage.setItem('rejection_serialno','0');
					
					$window.location.href="/Spr/assembly.jsp";
				}
					
				else
					$scope.errorMessage="Invalid credential, Please try again with correct credential";
					$scope.errorFlag=true;
			})
		}
			$scope.validateAssemblyForm=function(){
				if($scope.emp_code==null || $scope.pwd==null || $scope.role==null ){
					console.log("Validation Failed. redirecting back to UI with error message");
					return false;
				}
				return true;
			}
			
		
}]);