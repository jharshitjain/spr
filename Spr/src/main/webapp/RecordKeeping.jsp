<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Record Keeping Tool</title>
	<script data-require="angular.js@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular.js"></script>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<script type="text/javascript">
	var app=angular.module('sprApp',[]);
	
	app.controller('sprController',function($scope){
		$scope.assemblyFormFlag="true";
		$scope.extrusionFormFlag="false";
		$scope.flockingFormFlag="false";
		$scope.rejectionFormFlag="false";
		
		$scope.changeActiveLink=function(activeLink,activeId){
			//removeActiveClass();
			var myEl = angular.element( document.querySelector( '#'+activeId ) );
			myEl.addClass('active'); 
			$scope.removeActiveClass(activeLink);
			//angular.element( document.querySelector( '#assemblyLink' ) ).removeClass('active');
			//angular.element( document.querySelector( '#flockingLink' ) ).removeClass('active');
			//angular.element( document.querySelector( '#rejectionLink' ) ).removeClass('active');
		}
		
		
		$scope.removeActiveClass=function(activeLinkCat){
			if(activeLinkCat=='EXTRUSION'){
				angular.element( document.querySelector( '#assemblyLink' ) ).removeClass('active');
				angular.element( document.querySelector( '#flockingLink' ) ).removeClass('active');
				angular.element( document.querySelector( '#rejectionLink' ) ).removeClass('active');
				$scope.assemblyFormFlag="false";
				$scope.extrusionFormFlag="true";
				$scope.flockingFormFlag="false";
				$scope.rejectionFormFlag="false";
			}
			if(activeLinkCat=='ASSEMBLY'){
				angular.element( document.querySelector( '#extrusionLink' ) ).removeClass('active');
				angular.element( document.querySelector( '#flockingLink' ) ).removeClass('active');
				angular.element( document.querySelector( '#rejectionLink' ) ).removeClass('active');
				$scope.assemblyFormFlag="true";
				$scope.extrusionFormFlag="false";
				$scope.flockingFormFlag="false";
				$scope.rejectionFormFlag="false";
			}
			if(activeLinkCat=='FLOCKING'){
				angular.element( document.querySelector( '#assemblyLink' ) ).removeClass('active');
				angular.element( document.querySelector( '#extrusionLink' ) ).removeClass('active');				
				angular.element( document.querySelector( '#rejectionLink' ) ).removeClass('active');
				$scope.assemblyFormFlag="false";
				$scope.extrusionFormFlag="false";
				$scope.flockingFormFlag="true";
				$scope.rejectionFormFlag="false";
			}
			if(activeLinkCat=='REJECTION'){
				angular.element( document.querySelector( '#assemblyLink' ) ).removeClass('active');
				angular.element( document.querySelector( '#extrusionLink' ) ).removeClass('active');				
				angular.element( document.querySelector( '#flockingLink' ) ).removeClass('active');
				$scope.assemblyFormFlag="false";
				$scope.extrusionFormFlag="false";
				$scope.flockingFormFlag="false";
				$scope.rejectionFormFlag="true";
			}
			

		}
		
	})
	</script>
	</head>
<body>

<div class="container" ng-app="sprApp" ng-controller="sprController">

<div class="row">
	<div class="col-sm-12">

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
  <a class="navbar-brand" href="#">
    <img src="resources/logo.jpg" width="50" height="50" alt="">
  </a>
  <a class="navbar-brand" href="#">
    <img src="resources/spr.png" width="50" height="50" alt="">    
  </a>
  <span style="color:#fff">SPR System</span>
</nav>
	</div>
</div>

<div class="row" style="margin-top:100px">
	<div class="col-sm-2">
	<div class='list-group' style="position:fixed">
		<button class="list-group-item list-group-item-action active" id="assemblyLink" name="assemblyLink" ng-click="changeActiveLink('ASSEMBLY','assemblyLink')">Assembly</button>
		<button class="list-group-item list-group-item-action" id="extrusionLink" name="extrusionLink" ng-click="changeActiveLink('EXTRUSION','extrusionLink')">Extrusion</button>
		<button class="list-group-item list-group-item-action" id="flockingLink" name="flockingLink" ng-click="changeActiveLink('FLOCKING','flockingLink')">Flocking</button>
		<button class="list-group-item list-group-item-action" id="rejectionLink" name="rejectionLink" ng-click="changeActiveLink('REJECTION','rejectionLink')">Rejection</button>

	</div>
</div>
	<div class="col-sm-10">
		<!--  FORM 1  -->
		<form class="assemnly_form" ng-show="assemblyFormFlag">
		<div class="row">
		<!-- -first column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>SNO</label>
					<input class="form-control" type="text" id="assembly_sno" name="assembly_sno">
				</div>

				<div class="form-group">
					<label>Customer</label>
					<input class="form-control" type="text" id="assembly_customer" name="assembly_customer">
				</div>

				<div class="form-group">
					<label>Shift</label>
					<input class="form-control" type="text" id="assembly_shift" name="assembly_shift">
				</div>

				<div class="form-group">
					<label>FR RR</label>
					<input class="form-control" type="text" id="assembly_fr_rr" name="assembly_fr_rr">
				</div>

				<div class="form-group">
					<label>Prod Actual</label>
					<input class="form-control" type="text" id="assembly_prodactual" name="assembly_prodactual">
				</div>
				
				<div class="form-group">
					<label>BD Time</label>
					<input class="form-control" type="text" id="assembly_bd_time" name="assembly_bd_time">
				</div>
				
				<div class="form-group">
					<label>Co Time Actual</label>
					<input class="form-control" type="text" id="assembly_cotimeactual" name="assembly_cotimeactual">
				</div>
				
				<div class="form-group">
					<label>Start up time actual</label>
					<input class="form-control" type="text" id="assembly_startuptimeactual" name="assembly_startuptimeactual">
				</div>
				
				<div class="form-group">
					<label>Process Scrap</label>
					<input class="form-control" type="text" id="assembly_processscrap" name="assembly_processscrap">
				</div>
				



			</div>
			<!-- -second column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Assembly Date</label>
					<input class="form-control" type="text" id="assembly_date" name="assembly_date" placeholder="Eg: yyyy-MM-dd HH:mm:ss">
				</div>

				<div class="form-group">
					<label>Cell No</label>
					<input class="form-control" type="text" id="assembly_cellno" name="assembly_cellno">
				</div>

				<div class="form-group">
					<label>Car Model</label>
					<input class="form-control" type="text" id="assembly_carmodel" name="assembly_carmodel">
				</div>

				<div class="form-group">
					<label>RH LH</label>
					<input class="form-control" type="text" id="assembly_rh_lh" name="assembly_rh_lh">
				</div>

				<div class="form-group">
					<label>Used Man Power</label>
					<input class="form-control" type="text" id="assembly_usedmanpower" name="assembly_usermanpower">
				</div>
				
				<div class="form-group">
					<label>Prod Run Time</label>
					<input class="form-control" type="text" id="assembly_prodruntime" name="assembly_prodruntime">
				</div>
				
				<div class="form-group">
					<label>No Of Co</label>
					<input class="form-control" type="text" id="assembly_noofco" name="assembly_noofco">
				</div>
				
				<div class="form-group">
					<label>No Of set up</label>
					<input class="form-control" type="text" id="assembly_noofsetup" name="assembly_noofsetup">
				</div>
				
				<br/>
				




			</div>
			
			<!-- -third column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Plant No</label>
					<input class="form-control" type="text" id="assembly_plantno" name="assembly_plantno">
				</div>

				<div class="form-group">
					<label>Insert Mould</label>
					<input class="form-control" type="text" id="assembly_insertmould" name="assembly_insertmould">
				</div>

				<div class="form-group">
					<label>Part Name</label>
					<input class="form-control" type="text" id="assembly_partmodel" name="assembly_partmodel">
				</div>

				<div class="form-group">
					<label>Prod Target</label>
					<input class="form-control" type="text" id="assembly_Prodtarget" name="assembly_prodtarget">
				</div>

				<div class="form-group">
					<label>Down Time</label>
					<input class="form-control" type="text" id="assembly_downtime" name="assembly_downtime">
				</div>
				
				<div class="form-group">
					<label>Co Time Target</label>
					<input class="form-control" type="text" id="assembly_cotimetarget" name="assembly_cotimetarget">
				</div>
				
				<div class="form-group">
					<label>Start up time target</label>
					<input class="form-control" type="text" id="assembly_startuptimetarget" name="assembly_startuptimetarget">
				</div>
				<div class="form-group">
					<label>Internal Rej</label>
					<input class="form-control" type="text" id="assembly_internalrej" name="assembly_internalrej">
				</div>
				
				<!-- <div class="form-group" style="opacity:0">
					<label>Internal Rej</label>
					<input class="form-control" type="text" id="assembly_internalrej" name="assembly_internalrej">
				</div> -->
				
				
				<!-- Submit -->
				<div class="form-group">
				<br/>
				<br/>
				<br/>
				<br/>	
					<input class="form-control btn-primary" type="button" value="Save">
				</div>

			</div>
		</div>	
		</form>
		
		
		<!--  FORM 2 - EXTRUSION  -->
		<form class="extrusion_form" ng-show="extrusionFormFlag">
		<div class="row">
		<!-- -first column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>SNO</label>
					<input class="form-control" type="text" id="extrusion_sno" name="extrusion_sno">
				</div>

				<div class="form-group">
					<label>Customer</label>
					<input class="form-control" type="text" id="extrusion_customer" name="extrusion_customer">
				</div>
				
				<div class="form-group">
					<label>Part Name</label>
					<input class="form-control" type="text" id="extrusion_partmodel" name="extrusion_partmodel">
				</div>


				<div class="form-group">
					<label>Shift</label>
					<input class="form-control" type="text" id="extrusion_shift" name="extrusion_shift">
				</div>
		
				<div class="form-group">
					<label>Prod KG</label>
					<input class="form-control" type="text" id="extrusion_prodkg" name="extrusion_prodkg">
				</div>
				
				<div class="form-group">
					<label>Co Time Target</label>
					<input class="form-control" type="text" id="extrusion_cotimetarget" name="extrusion_cotimetarget">
				</div>
		
		
				<div class="form-group">
					<label>BD Time</label>
					<input class="form-control" type="text" id="extrusion_bd_time" name="extrusion_bd_time">
				</div>
				
							
				<div class="form-group">
					<label>Line Rej Actual</label>
					<input class="form-control" type="text" id="extrusion_linerejactual" name="extrusion_linerejactual">
				</div>
				
				<div class="form-group">
					<label>No Of Co</label>
					<input class="form-control" type="text" id="extrusion_noofco" name="extrusion_noofco">
				</div>		
	

			</div>
			<!-- -second column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Extrusion Date</label>
					<input class="form-control" type="text" id="extrusion_date" name="extrusion_date" placeholder="Eg: yyyy-MM-dd HH:mm:ss">
				</div>

				<div class="form-group">
					<label>Line</label>
					<input class="form-control" type="text" id="extrusion_line" name="extrusion_line">
				</div>
				
				<div class="form-group">
					<label>FR RR</label>
					<input class="form-control" type="text" id="extrusion_fr_rr" name="extrusion_fr_rr">
				</div>
				
				<div class="form-group">
					<label>Prod Target</label>
					<input class="form-control" type="text" id="extrusion_Prodtarget" name="extrusion_Prodtarget">
				</div>
	
				<div class="form-group">
					<label>Set up time target</label>
					<input class="form-control" type="text" id="extrusion_setuptimetarget" name="extrusion_setuptimetarget">
				</div>

				<div class="form-group">
					<label>Co Time Actual</label>
					<input class="form-control" type="text" id="extrusion_cotimeactual" name="extrusion_cotimeactual">
				</div>
	
				<div class="form-group">
					<label>Prod Run Time</label>
					<input class="form-control" type="text" id="extrusion_prodruntime" name="extrusion_prodruntime">
				</div>
				
				<div class="form-group">
					<label>CO Scrap Target</label>
					<input class="form-control" type="text" id="extrusion_coscraptarget" name="extrusion_coscraptarget">
				</div>
				
				
				<div class="form-group">
					<label>No Of set up</label>
					<input class="form-control" type="text" id="extrusion_noofsetup" name="extrusion_noofsetup">
				</div>
				
				<br/>
				

			</div>
			
			<!-- -third column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Plant No</label>
					<input class="form-control" type="text" id="extrusion_plantno" name="extrusion_plantno">
				</div>

				<div class="form-group">
					<label>Car Model</label>
					<input class="form-control" type="text" id="extrusion_carmodel" name="extrusion_carmodel">
				</div>

				<div class="form-group">
					<label>Trail or Prod</label>
					<input class="form-control" type="text" id="extrusion_trialorprod" name="extrusion_trialorprod">
				</div>
				
				<div class="form-group">
					<label>Prod Actual</label>
					<input class="form-control" type="text" id="extrusion_prodactual" name="extrusion_prodactual">
				</div>
				<div class="form-group">
					<label>Set up time actual</label>
					<input class="form-control" type="text" id="extrusion_setuptimeactual" name="extrusion_setuptimeactual">
				</div>
				
				<div class="form-group">
					<label>Down Time</label>
					<input class="form-control" type="text" id="extrusion_downtime" name="extrusion_downtime">
				</div>
				
							
				<div class="form-group">
					<label>Line Rej Target</label>
					<input class="form-control" type="text" id="extrusion_linerejtarget" name="extrusion_linerejtarget">
				</div>
				<div class="form-group">
					<label>CO Scrap Actual</label>
					<input class="form-control" type="text" id="extrusion_coscrapactual" name="extrusion_coscrapactual">
				</div>
				
				<div class="form-group">
					<label>Trial REJ</label>
					<input class="form-control" type="text" id="extrusion_trialrej" name="extrusion_trialrej">
				</div>
				
				<!-- <div class="form-group" style="opacity:0">
					<label>Internal Rej</label>
					<input class="form-control" type="text" id="assembly_internalrej" name="assembly_internalrej">
				</div> -->
				
				
				<!-- Submit -->
				<div class="form-group">				
					<input class="form-control btn-primary" type="button" value="Save">
				</div>

			</div>
		</div>	
		</form>
		
		
		
		<!--  FORM 3 - FLOCKING  -->
		<form class="flocking_form" ng-show="flockingFormFlag">
		<div class="row">
		<!-- -first column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>SNO</label>
					<input class="form-control" type="text" id="flocking_sno" name="flocking_sno">
				</div>

				<div class="form-group">
					<label>Customer</label>
					<input class="form-control" type="text" id="flocking_customer" name="flocking_customer">
				</div>
				
				<div class="form-group">
					<label>Part Name</label>
					<input class="form-control" type="text" id="flocking_partmodel" name="flocking_partmodel">
				</div>

						
				<div class="form-group">
					<label>Prod Target</label>
					<input class="form-control" type="text" id="flocking_Prodtarget" name="flocking_Prodtarget">
				</div>
				
				<div class="form-group">
					<label>Down Time</label>
					<input class="form-control" type="text" id="flocking_downtime" name="flocking_downtime">
				</div>
				
				<div class="form-group">
					<label>Co Time Target</label>
					<input class="form-control" type="text" id="flocking_cotimetarget" name="flocking_cotimetarget">
				</div>
				
				<div class="form-group">
					<label>Start up time target</label>
					<input class="form-control" type="text" id="flocking_startuptimetarget" name="flocking_startuptimetarget">
				</div>
				
				<div class="form-group">
					<label>Internal REJ</label>
					<input class="form-control" type="text" id="flocking_internalrej" name="flocking_internalrej">
				</div>

			</div>
			<!-- -second column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Flocking Date</label>
					<input class="form-control" type="text" id="flocking_date" name="flocking_date" placeholder="Eg: yyyy-MM-dd HH:mm:ss">
				</div>

				<div class="form-group">
					<label>Line</label>
					<input class="form-control" type="text" id="flocking_line" name="flocking_line">
				</div>
				
				<div class="form-group">
					<label>FR RR</label>
					<input class="form-control" type="text" id="flocking_fr_rr" name="flocking_fr_rr">
				</div>
				
				<div class="form-group">
					<label>Prod Actual</label>
					<input class="form-control" type="text" id="flocking_prodactual" name="flocking_prodactual">
				</div>
								
	
				<div class="form-group">
					<label>BD Time</label>
					<input class="form-control" type="text" id="flocking_bd_time" name="flocking_bd_time">
				</div>
				
				<div class="form-group">
					<label>Co Time Actual</label>
					<input class="form-control" type="text" id="flocking_cotimeactual" name="flocking_cotimeactual">
				</div>
	
				<div class="form-group">
					<label>Start up time actual</label>
					<input class="form-control" type="text" id="flocking_startuptimeactual" name="flocking_startuptimeactual">
				</div>
				
				<br/>
				

			</div>
			
			<!-- -third column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Plant No</label>
					<input class="form-control" type="text" id="flocking_plantno" name="flocking_plantno">
				</div>

				<div class="form-group">
					<label>Car Model</label>
					<input class="form-control" type="text" id="flocking_carmodel" name="flocking_carmodel">
				</div>
				
				<div class="form-group">
					<label>Shift</label>
					<input class="form-control" type="text" id="flocking_shift" name="flocking_shift">
				</div>

				
				
				<div class="form-group">
					<label>Used man power</label>
					<input class="form-control" type="text" id="flocking_usedmanpower" name="flocking_usedmanpower">
				</div>
							
				<div class="form-group">
					<label>Prod Run Time</label>
					<input class="form-control" type="text" id="flocking_prodruntime" name="flocking_prodruntime">
				</div>
				
				<div class="form-group">
					<label>No Of Co</label>
					<input class="form-control" type="text" id="flocking_noofco" name="flocking_noofco">
				</div>	
				
				<div class="form-group">
					<label>No Of set up</label>
					<input class="form-control" type="text" id="flocking_noofsetup" name="flocking_noofsetup">
				</div>
				
				<!-- <div class="form-group" style="opacity:0">
					<label>Internal Rej</label>
					<input class="form-control" type="text" id="assembly_internalrej" name="assembly_internalrej">
				</div> -->
				
				
				<!-- Submit -->
				<div class="form-group">
				<br/>
				<br/>
				<br/>
				<br/>				
					<input class="form-control btn-primary" type="button" value="Save">
				</div>

			</div>
		</div>	
		</form>
	

<!--  FORM 4 - REJECTION -->
		<form class="rejection_form" ng-show="rejectionFormFlag">
		<div class="row">
		<!-- -first column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>SNO</label>
					<input class="form-control" type="text" id="rejection_sno" name="rejection_sno">
				</div>

				<div class="form-group">
					<label>Customer</label>
					<input class="form-control" type="text" id="rejection_customer" name="rejection_customer">
				</div>
				
				<div class="form-group">
					<label>Car Model</label>
					<input class="form-control" type="text" id="rejection_carmodel" name="rejection_carmodel">
				</div>
				
				<div class="form-group">
					<label>RH LH</label>
					<input class="form-control" type="text" id="rejection_rhlh" name="rejection_rhlh">
				</div>
						
				<div class="form-group">
					<label>E Pin Hole</label>
					<input class="form-control" type="text" id="rejection_epinhole" name="rejection_epinhole">
				</div>
				
				<div class="form-group">
					<label>E Steel Expose</label>
					<input class="form-control" type="text" id="rejection_esteelexpose" name="rejection_esteelexpose">
				</div>
				
				<div class="form-group">
					<label>E Glue Spot</label>
					<input class="form-control" type="text" id="rejection_egluespot" name="rejection_egluespot">
				</div>
				
				<div class="form-group">
					<label>E Profile NG</label>
					<input class="form-control" type="text" id="rejection_eprofileng" name="rejection_eprofileng">
				</div>
				
				<div class="form-group">
					<label>E Scratch</label>
					<input class="form-control" type="text" id="rejection_escratch" name="rejection_escratch">
				</div>
				
				<div class="form-group">
					<label>E Burr</label>
					<input class="form-control" type="text" id="rejection_eburr" name="rejection_eburr">
				</div>
				
				<div class="form-group">
					<label>F Hard</label>
					<input class="form-control" type="text" id="rejection_fhard" name="rejection_fhard">
				</div>
				
				<div class="form-group">
					<label>F Over</label>
					<input class="form-control" type="text" id="rejection_fover" name="rejection_fover">
				</div>
				
				<div class="form-group">
					<label>F Glue Patch</label>
					<input class="form-control" type="text" id="rejection_fgluepatch" name="rejection_fgluepatch">
				</div>
				
				<div class="form-group">
					<label>M Cut</label>
					<input class="form-control" type="text" id="rejection_mcut" name="rejection_mcut">
				</div>
				
				<div class="form-group">
					<label>M Short</label>
					<input class="form-control" type="text" id="rejection_mshort" name="rejection_mshort">
				</div>
				
				<div class="form-group">
					<label>M Joint Open</label>
					<input class="form-control" type="text" id="rejection_mjointopen" name="rejection_mjointopen">
				</div>
				
				<div class="form-group">
					<label>FN Notching NG</label>
					<input class="form-control" type="text" id="rejection_fnnotchingng" name="rejection_fnnotchingng">
				</div>
				
				<div class="form-group">
					<label>FN Scratch Assy</label>
					<input class="form-control" type="text" id="rejection_fnscratchassy" name="rejection_fnscratchassy">
				</div>
				
				<div class="form-group">
					<label>FN Shine Mark</label>
					<input class="form-control" type="text" id="rejection_fnshinemark" name="rejection_fnshinemark">
				</div>
				
				<div class="form-group">
					<label>FN Big Length Assy</label>
					<input class="form-control" type="text" id="rejection_fnbiglengthassy" name="rejection_fnbiglengthassy">
				</div>
				
				<div class="form-group">
					<label>Part Weight</label>
					<input class="form-control" type="text" id="rejection_fnpartweight" name="rejection_fnpartweight">
				</div>

			</div>
			<!-- -second column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Rejection Date</label>
					<input class="form-control" type="text" id="rejection_date" name="rejection_date" placeholder="Eg: yyyy-MM-dd HH:mm:ss">
				</div>
				
				<div class="form-group">
					<label>Shift</label>
					<input class="form-control" type="text" id="rejection_shift" name="rejection_shift">
				</div>
				
				<div class="form-group">
					<label>Part Name</label>
					<input class="form-control" type="text" id="rejection_partmodel" name="rejection_partmodel">
				</div>
				


				<div class="form-group">
					<label>Category</label>
					<input class="form-control" type="text" id="rejection_category" name="rejection_category">
				</div>
				
				
				
				<div class="form-group">
					<label>E Waviness</label>
					<input class="form-control" type="text" id="rejection_ewaviness" name="rejection_ewaviness">
				</div>
								
	
				<div class="form-group">
					<label>E Flip LIP Variation</label>
					<input class="form-control" type="text" id="rejection_efliplipvariation" name="rejection_efliplipvariation">
				</div>
				
				<div class="form-group">
					<label>E Burn</label>
					<input class="form-control" type="text" id="rejection_eburn" name="rejection_eburn">
				</div>
	
				<div class="form-group">
					<label>E Cut</label>
					<input class="form-control" type="text" id="rejection_ecut" name="rejection_ecut">
				</div>
				
				<div class="form-group">
					<label>E Zerk</label>
					<input class="form-control" type="text" id="rejection_ezerk" name="rejection_ezerk">
				</div>
				
				<div class="form-group">
					<label>E Water Mark</label>
					<input class="form-control" type="text" id="rejection_ewatermark" name="rejection_ewatermark">
				</div>
				
				<div class="form-group">
					<label>F Uneven</label>
					<input class="form-control" type="text" id="rejection_funeven" name="rejection_funeven">
				</div>
				
				<div class="form-group">
					<label>F Cut</label>
					<input class="form-control" type="text" id="rejection_fcut" name="rejection_fcut">
				</div>
				
				<div class="form-group">
					<label>F Scratch</label>
					<input class="form-control" type="text" id="rejection_fscratch" name="rejection_fscratch">
				</div>
				
				<div class="form-group">
					<label>M Dent</label>
					<input class="form-control" type="text" id="rejection_mdent" name="rejection_mdent">
				</div>
				
				<div class="form-group">
					<label>M Shine Mark</label>
					<input class="form-control" type="text" id="rejection_mshinemark" name="rejection_mshinemark">
				</div>
				
				<div class="form-group">
					<label>M Others</label>
					<input class="form-control" type="text" id="rejection_mothers" name="rejection_mothers">
				</div>
				
				<div class="form-group">
					<label>FN Elfy</label>
					<input class="form-control" type="text" id="rejection_fnelfy" name="rejection_fnelfy">
				</div>
				
				<div class="form-group">
					<label>FN LIP Problem</label>
					<input class="form-control" type="text" id="rejection_fnlipproblem" name="rejection_fnlipproblem">
				</div>
				
				<div class="form-group">
					<label>FN Cut Assy</label>
					<input class="form-control" type="text" id="rejection_fncutassy" name="rejection_fncutassy">
				</div>
				
				<div class="form-group">
					<label>FN Bend Assy</label>
					<input class="form-control" type="text" id="rejection_fnbendassy" name="rejection_fnbendassy">
				</div>
				<br/>
				

			</div>
			
			<!-- -third column -->
			<div class="col-sm-4">
				<div class="form-group">
					<label>Plant No</label>
					<input class="form-control" type="text" id="rejection_plantno" name="rejection_plantno">
				</div>

				<div class="form-group">
					<label>Work Area</label>
					<input class="form-control" type="text" id="rejection_workarea" name="rejection_workarea">
				</div>
				
				<div class="form-group">
					<label>FR RR</label>
					<input class="form-control" type="text" id="rejection_fr_rr" name="rejection_fr_rr">
				</div>
				
				<div class="form-group">
					<label>E Trail REJ</label>
					<input class="form-control" type="text" id="rejection_etrialrej" name="rejection_etrialrej">
				</div>
							
				<div class="form-group">
					<label>E Material Spot</label>
					<input class="form-control" type="text" id="rejection_ematerialspot" name="rejection_ematerialspot">
				</div>
				
				<div class="form-group">
					<label>E Unbonding</label>
					<input class="form-control" type="text" id="rejection_eunbonding" name="rejection_eunbonding">
				</div>	
				
				<div class="form-group">
					<label>E Bend Camber</label>
					<input class="form-control" type="text" id="rejection_ebendcamber" name="rejection_ebendcamber">
				</div>
				
				<div class="form-group">
					<label>E Line Mark</label>
					<input class="form-control" type="text" id="rejection_elinemark" name="rejection_elinemark">
				</div>
				
				<div class="form-group">
					<label>E Dent</label>
					<input class="form-control" type="text" id="rejection_edent" name="rejection_edent">
				</div>
				
				<div class="form-group">
					<label>E Others</label>
					<input class="form-control" type="text" id="rejection_eothers" name="rejection_eothers">
				</div>
				
				<div class="form-group">
					<label>F Adhesion Poor</label>
					<input class="form-control" type="text" id="rejection_fadhesionpoor" name="rejection_fadhesionpoor">
				</div>
				
				<div class="form-group">
					<label>F Miss</label>
					<input class="form-control" type="text" id="rejection_fmiss" name="rejection_fmiss">
				</div>
				
				<div class="form-group">
					<label>F Others</label>
					<input class="form-control" type="text" id="rejection_fothers" name="rejection_fothers">
				</div>
				
				<div class="form-group">
					<label>M Flash</label>
					<input class="form-control" type="text" id="rejection_mflash" name="rejection_mflash">
				</div>
				
				<div class="form-group">
					<label>M Impression Mark</label>
					<input class="form-control" type="text" id="rejection_mimpressionmark" name="rejection_mimpressionmark">
				</div>
				
				<div class="form-group">
					<label>FN Weld Joint Open</label>
					<input class="form-control" type="text" id="rejection_fnweldjointopen" name="rejection_fnweldjointopen">
				</div>
				
				<div class="form-group">
					<label>FN Dent Assy</label>
					<input class="form-control" type="text" id="rejection_fndentassy" name="rejection_fndentassy">
				</div>
				
				<div class="form-group">
					<label>FN End Cap</label>
					<input class="form-control" type="text" id="rejection_fnendcap" name="rejection_fnendcap">
				</div>
				
				<div class="form-group">
					<label>FN Short Length Assy</label>
					<input class="form-control" type="text" id="rejection_fnshortlengthassy" name="rejection_fnshortlengthassy">
				</div>
				
				<div class="form-group">
					<label>FN Others</label>
					<input class="form-control" type="text" id="rejection_fnothers" name="rejection_fnothers">
				</div>
				
				<!-- <div class="form-group" style="opacity:0">
					<label>Internal Rej</label>
					<input class="form-control" type="text" id="assembly_internalrej" name="assembly_internalrej">
				</div> -->
				
				
				<!-- Submit -->
				<div class="form-group">
				<br/>
				<br/>
				<br/>
				<br/>				
					<input class="form-control btn-primary" type="button" value="Save">
				</div>

			</div>
		</div>	
		</form>
		
	</div>
</div>
</div>


<!-------JS-------->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</body>
</html>