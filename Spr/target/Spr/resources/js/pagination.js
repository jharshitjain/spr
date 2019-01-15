var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);
var sprFactoryP={};
app.factory('sprFactoryP',['$http',function($http){
	sprFactoryP.loadAssemblyList=function(emp_code,emp_role,plant){
		return $http.get("/Spr/loadAssemblyList?empCode="+emp_code+"&empRole="+emp_role+"&plant="+plant);
	}
	
	return sprFactoryP;
}]);

app.controller('listdata',['$scope','sprFactoryP','$filter','$window',function($scope,sprFactoryP,$filter,$window){
	$scope.users = []; //declare an empty array
	/*$http.get("mockJson/mock.json").success(function(response){ 
		$scope.users = response;  //ajax request to fetch data into $scope.data
	});*/
	
	$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
	
	$scope.loadAssemblyList=function(){
		  //$scope.loadDefaultAssemblyList();
		 // $scope.loadCustomerGroup();
		sprFactoryP.loadAssemblyList('e00146','TEAM LEADER','1').
			then(function(response){
				//$scope.removeDefaultObject();
				console.log("Response - "+angular.fromJson(response.data));	
				$scope.loaderFlag=false;
				$scope.users=response.data;
				
			});
			
		  
	  }
	
}]);
