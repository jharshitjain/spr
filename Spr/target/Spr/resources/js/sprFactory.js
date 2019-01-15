app.factory('sprFactory',['$http',function($http){

var urlBase="/Spr/";
var sprFactory={};

sprFactory.insertAssemblyRecord=function(assemblyObj){
	return $http.post(urlBase+"persistAssembly",assemblyObj);
}

sprFactory.insertAssemblyRecordList=function(assemblyObj){
	return $http.post(urlBase+"persistAssemblyList",assemblyObj);
}

sprFactory.insertExtrusionRecord=function(extrusionObj){
	return $http.post(urlBase+"persistExtrusion",extrusionObj);
}

sprFactory.insertExtrusionRecordList=function(extrusionObj){
	return $http.post(urlBase+"persistExtrusionList",extrusionObj);
}

sprFactory.insertFlockingRecord=function(flockingObj){
	return $http.post(urlBase+"persistFlocking",flockingObj);
}
sprFactory.insertFlockingRecordList=function(flockingObj){
	return $http.post(urlBase+"persistFlockingList",flockingObj);
}

sprFactory.insertRejectionRecord=function(rejectionObj){
	return $http.post(urlBase+"persistRejection",rejectionObj);
}

sprFactory.insertCustomerRecord=function(customerObj){
	return $http.post(urlBase+"persistCustomer",customerObj);
}

sprFactory.insertPartRecord=function(partObj){
	return $http.post(urlBase+"persistPart",partObj);
}

sprFactory.insertModelRecord=function(modelObj){
	return $http.post(urlBase+"persistModel",modelObj);
}

sprFactory.insertPlantRecord=function(plantObj){
	return $http.post(urlBase+"persistPlant",plantObj);
}

sprFactory.loadCustomerGroup=function(){
	return $http.get(urlBase+"loadCustomerGroup");
}

sprFactory.loadModel=function(customerGroup){
	return $http.post(urlBase+"loadModel",customerGroup);
}

sprFactory.loadPart=function(customerGroup,model){
	return $http.get(urlBase+"loadPart?customerGroup="+customerGroup+"&model="+model);
}

sprFactory.authenticateForm=function(loginForm){
	return $http.post(urlBase+"authenticateUser",loginForm);
}

sprFactory.getLastSerialNo=function(type){
	return $http.post(urlBase+"GetLastSerialNo",type);
}

sprFactory.loadAssemblyList=function(emp_code,emp_role,plant){
	return $http.get(urlBase+"loadAssemblyList?empCode="+emp_code+"&empRole="+emp_role+"&plant="+plant);
}
//loadExtrusionList

sprFactory.loadExtrusionList=function(emp_code,emp_role,plant){
	return $http.get(urlBase+"loadExtrusionList?empCode="+emp_code+"&empRole="+emp_role+"&plant="+plant);
}

sprFactory.loadFlockingList=function(emp_code,emp_role,plant){
	return $http.get(urlBase+"loadFlockingList?empCode="+emp_code+"&empRole="+emp_role+"&plant="+plant);
}

sprFactory.updateAssemblyRecord=function(assemblyObj){
	return $http.post(urlBase+"updateAssemblyRecord",assemblyObj);
}

sprFactory.updateAssemblyApproveEntry=function(assemblyObj){
	return $http.post(urlBase+"approveAssemblyEntry",assemblyObj);
}

sprFactory.updateExtrusionRecord=function(extrusionObj){
	return $http.post(urlBase+"updateExtrusionRecord",extrusionObj);
}

sprFactory.updateFlockingRecord=function(flockingObj){
	return $http.post(urlBase+"updateFlockingRecord",flockingObj);
}

sprFactory.updateExtrusionApproveEntry=function(extrusionObj){
	return $http.post(urlBase+"approveExtrusionEntry",extrusionObj);
}

sprFactory.updateFlockingApproveEntry=function(flockingObj){
	return $http.post(urlBase+"approveFlockingEntry",flockingObj);
}


return sprFactory;
}

]);