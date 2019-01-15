/*
Rejection controller file
It will load all the fields from the form and pass it to the factory service.

*/
app.controller('sprContrlr',['$scope','sprFactory','$filter',function($scope,sprFactory,$filter){
	$scope.rejection_date=$filter('date')(new Date(new Date()),'yyyy-MM-dd')
	$scope.errorFlag=false;
	$scope.insertRejectionRecord=function(event){
		event.preventDefault();
		console.log("Request Recieved-REJECTION");
		$scope.entry_date=new Date();
		console.log("Entry Date - "+$scope.entry_date);
		if(!$scope.validateRejectionForm()){
			$scope.errorMessage="Any of the above field is empty. Please cross check !";
			$scope.errorFlag=true;
			return false;
		}
		
		var rejectionRecord={
				sno:$scope.sno,
				company:$scope.company,
				rejection_date:$filter('date')(new Date($scope.rejection_date),'yyyy-MM-dd HH:mm:ss'),
				entry_date:$filter('date')(new Date($scope.entry_date),'yyyy-MM-dd HH:mm:ss'),
				user_id:$scope.user_id,
				user_plant_no:$scope.user_plant_no,
				hod:$scope.hod,
				plantno:$scope.plantno,
				customer:$scope.customer,
				shift:$scope.shift,
				work_area:$scope.work_area,
				car_model:$scope.car_model,
				part_name:$scope.part_name,
				fr_rr:$scope.fr_rr,
				rh_lh:$scope.rh_lh,
				category:$scope.category,
				e_trial_rej:$scope.e_trial_rej,
				e_pin_hole:$scope.e_pin_hole,
				e_waviness:$scope.e_waviness,
				e_material_spot:$scope.e_material_spot,
				e_steel_expose:$scope.e_steel_expose,
				e_flap_lip_variation:$scope.e_flap_lip_variation,
				e_unbounding:$scope.e_unbounding,
				e_glue_spot:$scope.e_glue_spot,
				e_burn:$scope.e_burn,
				e_bend_camber:$scope.e_bend_camber,
				e_profile_ng:$scope.e_profile_ng,
				e_cut:$scope.e_cut,
				e_line_mark:$scope.e_line_mark,
				e_scratch:$scope.e_scratch,
				e_zerk:$scope.e_zerk,
				e_dent:$scope.e_dent,
				e_burr:$scope.e_burr,
				e_water_mark:$scope.e_water_mark,
				e_others:$scope.e_others,
				f_hard:$scope.f_hard,
				f_uneven:$scope.f_uneven,
				f_adhesion_poor:$scope.f_adhesion_poor,
				f_over:$scope.f_over,
				f_cut:$scope.f_cut,
				f_miss:$scope.f_miss,
				f_glue_patch:$scope.f_glue_patch,
				f_scratch:$scope.f_scratch,
				f_others:$scope.f_others,
				m_cut:$scope.m_cut,
				m_dent:$scope.m_dent,
				m_Flash:$scope.m_Flash,
				m_short:$scope.m_short,
				m_shine_mark:$scope.m_shine_mark,
				m_impression_mark:$scope.m_impression_mark,
				m_joint_open:$scope.m_joint_open,
				m_others:$scope.m_others,
				fn_weld_joint_open:$scope.fn_weld_joint_open,
				fn_notching_ng:$scope.fn_notching_ng,
				fn_elfy:$scope.fn_elfy,
				fn_dent_assy:$scope.fn_dent_assy,
				fn_scratch_assy:$scope.fn_scratch_assy,
				fn_lip_problem:$scope.fn_lip_problem,
				fn_end_cap:$scope.fn_end_cap,
				fn_shine_mark:$scope.fn_shine_mark,
				fn_Cut_assy:$scope.fn_Cut_assy,
				fn_short_length_assy:$scope.fn_short_length_assy,
				fn_big_length_assy:$scope.fn_big_length_assy,
				fn_bend_assy:$scope.fn_bend_assy,
				fn_others:$scope.fn_others,
				part_weight:$scope.part_weight						
		}
		
		console.log("Request Payload -"+$scope.rejection_date)
		sprFactory.insertRejectionRecord(rejectionRecord).
		then(function(response){
			console.log("Response status - "+angular.fromJson(response.data));
			if(response.data==true)
				alert("Records has inserted successfully.");
			else
				alert("Error occurred while processing the request.")
		})
	}
	$scope.validateRejectionForm=function(){
		if($scope.sno==null || $scope.company==null || $scope.rejection_date==null ||$scope.user_plant_no==null ||$scope.hod==null
				||$scope.plantno==null||$scope.customer==null||$scope.shift==null ||$scope.work_area==null|| $scope.car_model==null|| $scope.part_name==null|| $scope.fr_rr==null||
				$scope.rh_lh==null|| $scope.category==null|| $scope.e_trial_rej==null|| $scope.e_pin_hole==null|| $scope.e_waviness==null|| $scope.e_material_spot==null|| $scope.e_steel_expose==null|| $scope.e_flap_lip_variation==null||
				$scope.e_unbounding==null|| $scope.e_glue_spot==null| $scope.e_burn==null| $scope.e_bend_camber==null|| $scope.e_profile_ng==null|| $scope.e_cut==null||
				$scope.e_line_mark==null|| $scope.e_scratch==null|| $scope.e_zerk==null|| $scope.e_dent==null|| $scope.e_burr==null||
				$scope.e_water_mark==null|| $scope.e_others==null|| $scope.f_hard==null|| $scope.f_uneven==null|| $scope.f_adhesion_poor==null||
				$scope.f_over==null|| $scope.f_cut==null|| $scope.f_miss==null|| $scope.f_glue_patch==null|| $scope.f_scratch==null|| 
				$scope.f_others==null|| $scope.m_cut==null|| $scope.m_dent==null|| $scope.m_Flash==null|| $scope.m_short==null
				|| $scope.m_shine_mark==null|| $scope.m_impression_mark==null|| $scope.m_joint_open==null|| $scope.m_others==null|| $scope.fn_weld_joint_open==null
				|| $scope.fn_notching_ng==null|| $scope.fn_elfy==null|| $scope.fn_dent_assy==null|| $scope.fn_scratch_assy==null|| $scope.fn_lip_problem==null
				|| $scope.fn_end_cap==null|| $scope.fn_shine_mark==null|| $scope.fn_Cut_assy==null|| $scope.fn_short_length_assy==null|| $scope.fn_big_length_assy ==null
				|| $scope.fn_bend_assy==null|| $scope.fn_others==null|| $scope.part_weight==null){
			console.log("Validation Failed. redirecting back to UI with error message");
			return false;
		}
		return true;
	}
	
}])