app.controller('sprContrlr',['$scope','sprFactory','$filter',function($scope,sprFactory,$filter){
	
	$scope.insertPlantRecord=function(event){
		event.preventDefault();
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
		var plantRecord={
				company:$scope.company,
				plant_no:$scope.plant_no,
				location:$scope.location,
				entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd HH:mm:ss'),
				user_id:$scope.user_id,
				user_plant_no:$scope.user_plant_no
				
								
		};
		
		console.log("Request Payload -"+$scope.entry_date+" and formatted date - "+ $filter('date')(new Date($scope.entry_date),'yyyy-MM-dd HH:mm:ss'));
		sprFactory.insertPlantRecord(plantRecord).
		then(function(response){
			alert(response.data);
			console.log("Response - "+angular.fromJson(response.data));
			if(response.data==true)
				alert("Records has inserted successfully.");
			else
				alert("Error occurred while processing the request.")
		})
		
	}
}]);