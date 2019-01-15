<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
    <title>SPR dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Communal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/2.0.0/ui-bootstrap-tpls.min.js"></script>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    
<link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="resources/css/bootstrap.css" rel='stylesheet' type='text/css' />

    <!-- Custom CSS -->
     <link href="resources/css/loader.css" rel='stylesheet' type='text/css' />
    <link href="resources/css/style.css" rel='stylesheet' type='text/css' />
    <!-- font-awesome icons -->
    <link href="resources/css/fontawesome-all.min.css" rel="stylesheet">
    <!-- //Custom Theme files -->

    <!-- side nav css file -->
    <link href='resources/css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css' />
    <!-- //side nav css file -->
    <!-- web fonts -->
    <!-- logo -->
    <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
    <!-- titles -->
    <link href="//fonts.googleapis.com/css?family=Yanone+Kaffeesatz:200,300,400,700" rel="stylesheet">
    <!-- body -->
    <link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
    <!--//web fonts-->

<script>
$(function(){  

    $.datepicker.setDefaults({
        changeMonth: true,
        changeYear: false,
        dateFormat: 'yy-mm-dd'});
    
    $('#assembly_date').datepicker({
        minDate: '-30d',
        maxDate: '+0d',
        onSelect: function(dateStr) {
        	//alert(dateStr);
            var min = $(this).datepicker('getDate') || new Date(); // Selected date or today if none
            var max = new Date(min.getTime());
            //alert(min+" - - - "+max);
            //$('#q').val(dateStr);
          //  max.setMonth(max.getMonth() + 1); // Add one month
         
        }
    });
 });


	</script>
	<!--style for table
 <style>
    
.sprTable {
    border-collapse: collapse;
    table-layout: auto;
  width: 100% ;
  overflow-x: scroll;
    display: block;
    
}
.sprTable thead {
  
    background-color: #EFEFEF;
   
}
.sprTable thead, .sprTable tbody {
 
    display: block;
     
}
.sprTable tbody {
 overflow-x: hidden;
  overflow-y: scroll;
    height: 250px;
}
.sprTable tr{
width:auto;
}
.sprTable td, .sprTable th {
    text-color:coral;
    height: 25px;
    border: solid 2px black;
     overflow:hidden;
    
      min-width:96px;
    max-width:96px;
}



</style>-->

 
<!--style end for table-->
<style>
.table-header
{

    position: relative;
    display: block;
    background-color: #EFEFEF;
     
}
.table-body
{
    overflow: auto;
    height: 400px;
   border: solid 2px black;
}

.header-cell
{
    text-color:coral;
    height: 25px;
    border: solid 2px black;
    border-collapse: collapse;
     min-width:96px;
     max-width:96px;
     
}

.body-cell {
  text-color:coral;
    height: 25px;
    
    border: solid 2px black;
     min-width:96px;
     max-width:96px;
}
</style>
</head>

<body class="cbp-spmenu-push" ng-app="sprApp" ng-controller="sprContrlr" ng-init="loadCustomerGroup()">

<div id="myModal" class="processLoader1" ng-show="submitFlag" style="display:none" >
<div class="processLoader-content1" style="width:60%;">
    
<img src="resources/images/logo.png" alt="Italian Trulli"  >
   <h1 style="display:inline-block;">Data Submitted Successfully for <span style="color:grey;"><u></br>Plant:-{{plantno}}/Rejection/Shift:-{{shift}}/Spr no till {{lastInsertedSprNo}}</u></span></h1>
	<center><button id="ok_button" name="ok_button" ng-click="submitok()" >OK</button></center>
  </div>

</div>

<div id="myModal " class="processLoader " ng-show="loaderFlag" >

  <!-- Modal content -->
  <div class="processLoader-content" style="width:30%">
    
	<center><img src="resources/images/loader.gif" alt="Italian Trulli"  >
  </center>  
  </div>

</div>

    <div class="main-content" >
   

        <div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
            <!--left-fixed -navigation-->
            <aside class="sidebar-left transactionLink"  >
                 <img src="resources/images/logo.png" alt="Italian Trulli"  style="width:160px; height:90px; display: inline-block">
               
                <ul class="sidebar-menu" >
                 <li class="treeview">
                        <a href="#">
                            <i class="fas fa-home"></i>
                            <span>Assembly</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="assembly.jsp">
                                    <i class="fa fa-angle-right"></i>Add New</a>
                            </li>
                            <li>
                                <a href="assembly_modify.jsp">
                                    <i class="fa fa-angle-right"></i>Edit/Modify</a>
                            </li>
                            

                        </ul>
                    </li>
                   <li class="treeview">
                        <a href="#">
                            <i class="fas fa-home"></i>
                            <span>Extrusion</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="extrusion.jsp">
                                    <i class="fa fa-angle-right"></i>Add New</a>
                            </li>
                            <li>
                                <a href="extrusion_modify.jsp">
                                    <i class="fa fa-angle-right"></i>Edit/Modify</a>
                            </li>
                            

                        </ul>
                    </li>
                    
                    <li class="treeview">
                        <a href="#">
                            <i class="fas fa-home"></i>
                            <span>Flocking</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="flocking.jsp">
                                    <i class="fa fa-angle-right"></i>Add New</a>
                            </li>
                            <li>
                                <a href="flocking_modify.jsp">
                                    <i class="fa fa-angle-right"></i>Edit/Modify</a>
                            </li>
                            

                        </ul>
                    </li>
                   <li class="treeview">
                        <a href="#">
                            <i class="fas fa-home"></i>
                            <span>Rejection</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li>
                                <a href="rejection.jsp">
                                    <i class="fa fa-angle-right"></i>Add New</a>
                            </li>
                            <li>
                                <a href="rejection_modify.jsp">
                                    <i class="fa fa-angle-right"></i>Edit/Modify</a>
                            </li>
                            

                        </ul>
                    </li>
                               
                    <li class="treeview">
                        <a href="customer.jsp">
                            <i class="fas fa-home"></i>
                            <span>Add New Customer</span>
                        </a>
                    </li>
                    
                         <li class="treeview">
                        <a href="model.jsp">
                            <i class="fas fa-home"></i>
                            <span>Add New Model</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="part.jsp">
                            <i class="fas fa-home"></i>
                            <span>Add New Part</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="plant.jsp" >
                            <i class="fas fa-home"></i>
                            <span>Add New Plant</span>
                        </a>
                    </li>
                </ul>
               
            </aside>
        </div>
    </div>
    <!--left-fixed -navigation-->
    <!-- header-starts -->
    <header class="header-section">
        <div class="header-left  clearfix">
            <!--logo start-->
            <div class="brand">
                <button id="showLeftPush">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            <!--logo end-->
        </div>
        
    </header>
    <!-- //header-ends -->
    <!-- main content start-->
    <div id="page-wrapper">
        <!-- inner banner -->
        <div class="inner-banner">
        
       
                
                   
                        
                        <h3 style="text-align:right; padding-top: 10px; padding-right: 50px;">
                       User Name:-{{user_name}}</br>User Plant:-{{user_plant}}</br>Emp Id:-{{user_code}}</h3>

        </div>
        <!-- //inner banner -->
        <!-- breadcrumbs -->
        <div class="inner-bc">
        
            <div class="container">
            
                <nav aria-label="breadcrumb">
                <div class="contact-form" style="float: right; padding-right: 50px; padding-top: 10px;">
                 <input type="button" value="LOGOUT"  display:inline-block;" ng-click="logout()">
                    </div>
                       
                       <center> <h1  aria-current="page" style="display:inline-block;" >
                        REJECTION</h1>
                   </center>
                   
                </nav>
                
            </div>
        </div>  
        <!-- //breadcrumbs -->

        <!-- contact -->
        <section class="wthree-row pt-0 pb-5 w3-contact">
            <div class="container-fluid py-sm-1 pt-0 pb-5">
                
                <div class="row ">
                    <div class="col-lg-12 wthree-form-left">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            
                           <form action="#" method="post" name="rejection_form">
				<div class="contact-grids1 w3agile-6">
					<div class="row">
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Company</label>
							<select type="text" id="company" class="form-control" name="company" ng-blur="validateHeaderField('company')" ng-model="company"  required>
							 <option value="" hidden>Select for the company</option>
                                                          
                                                
							 <option value="PPAP">PPAP</option>
    <option value="PTI">PTI</option>
    </select>
						<span style="color:red" ng-show="rejection_form.company.$touched && rejection_form.company.$invalid">*Cannot Leave Empty </span>
						</div>
						
					
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">H.O.D</label>
							<input type="text" id="hod" class="form-control" name="hod" ng-model="hod" placeholder="Data can be in character or in numeric way"  ng-pattern="/^[-@./#&+\w\s]*$/" required>
						   
						    <span style="color:red" ng-show="rejection_form.hod.$touched && rejection_form.hod.$invalid">*Cannot Leave Empty OR Invalid Data. </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User ID</label>
							<input type="text" id="user_id"  class="form-control" name="user_id" ng-model="user_id"  placeholder="" required readonly>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User Plant No</label>
							<input type="text" id="user_plant_no"  class="form-control" name="user_plant_no" ng-model="user_plant_no"  placeholder="" required readonly>
						
						<span style="color:red" ng-show="rejection_form.user_plant_no.$touched && rejection_form.user_plant_no.$invalid">*Cannot Leave Empty </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Rejection Date</label>
							<input type="text"  id="rejection_date"  class="form-control"   name="rejection_date" ng-model="assembly_date" placeholder="" required >
							<span style="color:red" ng-show="rejection_form.rejection_date.$touched && rejection_form.rejection_date.$invalid">*Cannot Leave Empty </span>
							
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Plant No.</label>
							<select type="text" id="plantno"  class="form-control" ng-blur="validateHeaderField('plantno')" name="plantno" ng-model="plantno" placeholder="" required>
						<option value="" hidden>Select For the Plant No. </option>
							 <option value="Plant1">Plant-1</option>
    <option value="Plant2">Plant-2</option>
     <option value="Plant5">Plant-5</option>
    </select>
						<span style="color:red" ng-show="rejection_form.plantno.$touched && rejection_form.plantno.$invalid">*Cannot Leave Empty </span>
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Shift</label>
							<select type="text" id="shift"  class="form-control" name="shift" ng-blur="validateHeaderField('shift')" placeholder="" ng-model="shift" required>
							<option value="" hidden>Select for the Shift </option>
							 <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="G">G</option>
    </select>
    <span style="color:red" ng-show="rejection_form.shift.$touched && rejection_form.shift.$invalid">*Cannot Leave Empty </span>
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Work Area</label>
							<input type="text" class="form-control" id="work_area" name="work_area" ng-model="work_area" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required="">
						<span style="color:red" ng-show="rejection_form.work_area.$touched && rejection_form.work_area.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
                        	
						</div>
						
   
						
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group" id="myBtn">
						
							<label class="col-form-label">Customer</label>
							<select type="text" id="customer"  class="form-control" name="customer" ng-blur="validateHeaderField('customer')" ng-model="customer" ng-change="loadModelListByCustomerGroup()" placeholder="" required>
						<option value="" selected>Select For the Customer Name </option>
							 <option ng-repeat="customerGroup in listOfCustomerGroup | orderBy" value="{{customerGroup}}">{{customerGroup}}</option>
							 <!--<ng-options="customerGroup in listOfCustomerGroup">-->
   
    </select>
						<span style="color:red" ng-show="rejection_form.customer.$touched && rejection_form.customer.$invalid">*Cannot Leave Empty </span>
						</div>
						
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Car Model</label>
							<select type="text" id="car_model"  class="form-control" name="car_model" ng-blur="validateHeaderField('car_model')" placeholder="" ng-model="car_model" ng-change="loadPartListByCustomerGroupAndModel()" required>
						<option value="" selected>Select for the Model </option>
							 <option ng-repeat="model in modelList | orderBy" value="{{model}}">{{model}}</option>
  
    </select>
						<span style="color:red" ng-show="rejection_form.car_model.$touched && rejection_form.car_model.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Part Name</label>
							<select type="text" id="part_name" class="form-control" name="part_name" ng-blur="validateHeaderField('part_name')" placeholder="" ng-model="part_name"  required>
						<option value="" selected>Select for the Part name </option>
							 <option ng-repeat="part in partList" value={{part}}>{{part}}</option>
			    </select>
						<span style="color:red" ng-show="rejection_form.part_name.$touched && rejection_form.part_name.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Fr RR</label>
							<select type="text" id="fr_rr"  class="form-control" name="fr_rr" ng-blur="validateHeaderField('fr_rr')" placeholder="" ng-model="fr_rr" required>
						    <option value="" hidden>Select from the list </option>
							 <option value="FR">FR</option>
    <option value="RR">RR</option>
    </select>
						<span style="color:red" ng-show="rejection_form.fr_rr.$touched && rejection_form.fr_rr.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">RH LH</label>
							<select type="text" id="rh_lh" class="form-control" name="rh_lh" ng-blur="validateHeaderField('rh_lh')" placeholder="" ng-model="rh_lh" required>
						    <option value="" hidden>select from the list </option>
							 <option value="RH">RH</option>
    <option value="LH">LH</option>
	<option value="Null">Null</option>
    </select> 
						<span style="color:red" ng-show="rejection_form.rh_lh.$touched && rejection_form.rh_lh.$invalid">*Cannot Leave Empty </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Category</label>
							<input type="text" class="form-control" id="category" name="category" ng-model="category" placeholder="Data should only contain numeric value" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="rejection_form.category.$touched && rejection_form.category.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
						    
						</div>
						
						
						
						
						</div>
	
					</br>
					<div class="contact-form">
						<input type="button" value="Add More Rows" ng-click="insertRejectionRecord($event,'ADD_NEWROW')" >
						
					</div>
					<span style="color:grey;font-size:1.5em;" ng-show="errorFlag1"><b><span style="color:red;">*</span>{{errorMsg1}}</b></span></br>
					<span style="color:grey;font-size:1.5em;" ng-show="errorFlag2"><b><span style="color:red;">*</span>{{errorMsg2}}</b></span></br>
					<span style="color:grey;font-size:1.5em;" ng-show="prodActualErrorFlag"><b><span style="color:red;">*</span>{{prodActualErrorMessage}}</b></span></br>
			<span style="color:grey;font-size:1.5em;" ng-show="isEligible"><b><span style="color:red;">*</span>{{eligibleError}}</b></span>
			
			<div class="container-fluid">
			<div class="row">
			
			<div class="table-body">
  <table id="bodytable">
   <thead class="table-header">
      <tr>
        <th class="header-cell col1">SPR No.</th>
        <th class="header-cell col1">E Trail REJ</th>
        <th class="header-cell col1">E Pin Hole</th>
        <th class="header-cell col1">E Waviness</th>
        <th class="header-cell col1">E Material Spot</th>
        <th class="header-cell col1">E Steel Expose</th>
        <th class="header-cell col1">E Flip LIP Variation</th>
        <th class="header-cell col1">E Unbonding</th>
        <th class="header-cell col1">E Glue Spot</th>
        <th class="header-cell col1">E Burn</th>
        <th class="header-cell col1">E Bend Camber</th>
        <th class="header-cell col1">E Profile NG</th>
        <th class="header-cell col1">E Cut</th>
        <th class="header-cell col1">E Line Mark</th>
        <th class="header-cell col1">E Scratch</th>
        <th class="header-cell col1">E Zerk</th>
        <th class="header-cell col1">E Dent</th>
        <th class="header-cell col1">E Burr</th>
        <th class="header-cell col1">E Water Mark</th>
        <th class="header-cell col1">E Others</th>
        <th class="header-cell col1">F Hard</th>
        <th class="header-cell col1">F Uneven</th>
        <th class="header-cell col1">F Adhesion Poor</th>
        <th class="header-cell col1">F Over</th>
        <th class="header-cell col1">F Cut</th>
        <th class="header-cell col1">F Miss</th>
        <th class="header-cell col1">F Glue Patch</th>
        <th class="header-cell col1">F Scratch</th>
        <th class="header-cell col1">F Others</th>
        <th class="header-cell col1">M Cut</th>
        <th class="header-cell col1">M Dent</th>
        <th class="header-cell col1">M Flash</th>
        <th class="header-cell col1">M Short</th>
        <th class="header-cell col1">M Shine Mark</th>
        <th class="header-cell col1">M Impression Mark</th>
        <th class="header-cell col1">M Joint Open</th>
        <th class="header-cell col1">M Others</th>
        <th class="header-cell col1">FN Weld Joint Open</th>
        <th class="header-cell col1">FN Notching NG</th>
        <th class="header-cell col1">FN Elfy</th>
        <th class="header-cell col1">FN Dent Assy</th>
        <th class="header-cell col1">FN Scratch Assy</th>
        <th class="header-cell col1">FN LIP Problem</th>
        <th class="header-cell col1">FN End Cap</th>
        <th class="header-cell col1">FN Shine Mark</th>
        <th class="header-cell col1">FN Cut Assy</th>
        <th class="header-cell col1">FN Short Length Assy</th>
        <th class="header-cell col1">FN Big Length Assy</th>
        <th class="header-cell col1">FN Bend Assy</th>
        <th class="header-cell col1">FN Others</th>
        <th class="header-cell col1">Part Weight</th>
        
      </tr>
    </thead>
  
    <tbody style="display: block;">
      <tr ng-repeat="rejectionEntry in rejectionRecordsList">
      <td class="body-cell col1" style="display:none">
        <input type="text" id="sprNo_$index" class="form-control" name="sprNo_$index" style="display:none" ng-model="rejectionEntry.rejection_id"   required readonly >
       
        </td>
        <td class="body-cell col1" >
        <input type="text" id="rejection_{{$index}}" name="rejection_{{$index}}" class="form-control"  ng-model="rejectionEntry.sno"    required readonly >
       
        </td>
         <td class="body-cell col1"> <input type="text" id="e_trial_rej_{{$index}}" class="form-control" name="e_trial_rej_{{$index}}" ng-focus="validateOtherFields(13,$index,'e_trial_rej_'+$index)" ng-blur="validateField('e_trial_rej_'+$index,$index,'e_trial_rej',$event)" ng-model="rejectionEntry.e_trial_rej"  required>
						     </td>
						      
            <td class="body-cell col1"> <input type="text" id="e_pin_hole_{{$index}}" class="form-control" name="e_pin_hole_{{$index}}" ng-focus="validateOtherFields(14,$index,'e_pin_hole_'+$index)" ng-blur="validateField('e_pin_hole_'+$index,$index,'e_pin_hole',$event)" ng-model="rejectionEntry.e_pin_hole"  required>
            			  </td>
         
            <td class="body-cell col1"> <input type="text" id="e_waviness_{{$index}}" class="form-control" name="e_waviness_{{$index}}" ng-focus="validateOtherFields(15,$index,'e_waviness_'+$index)" ng-blur="validateField('e_waviness_'+$index,$index,'e_waviness',$event)" ng-model="rejectionEntry.e_waviness"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="e_material_spot_{{$index}}" class="form-control" name="e_material_spot_{{$index}}" ng-focus="validateOtherFields(16,$index,'e_material_spot_'+$index)" ng-blur="validateField('e_material_spot_'+$index,$index,'e_material_spot',$event)" ng-model="rejectionEntry.e_material_spot"  required>
            			  </td>
            
            <td class="body-cell col1"> <input type="text" id="e_steel_expose_{{$index}}" class="form-control" name="e_steel_expose_{{$index}}" ng-focus="validateOtherFields(17,$index,'e_steel_expose_'+$index)" ng-blur="validateField('e_steel_expose_'+$index,$index,'e_steel_expose',$event)" ng-model="rejectionEntry.e_steel_expose"  required>
            			  </td>
						   
             <td class="body-cell col1"> <input type="text" id="e_flap_lip_variation_{{$index}}" class="form-control" name="e_flap_lip_variation_{{$index}}" ng-focus="validateOtherFields(18,$index,'e_flap_lip_variation_'+$index)" ng-blur="validateField('e_flap_lip_variation_'+$index,$index,'e_flap_lip_variation',$event)" ng-model="rejectionEntry.e_flap_lip_variation"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="e_unbounding_{{$index}}" class="form-control" name="e_unbounding_{{$index}}" ng-focus="validateOtherFields(19,$index,'e_unbounding_'+$index)" ng-blur="validateField('e_unbounding_'+$index,$index,'e_unbounding',$event)" ng-model="rejectionEntry.e_unbounding"  required>
            			  </td>
						
            <td class="body-cell col1"> <input type="text" id="e_glue_spot_{{$index}}" class="form-control" name="e_glue_spot_{{$index}}" ng-focus="validateOtherFields(20,$index,'e_glue_spot_'+$index)" ng-blur="validateField('e_glue_spot_'+$index,$index,'e_glue_spot',$event)" ng-model="rejectionEntry.e_glue_spot"  required>
            			  </td>
                        		
            <td class="body-cell col1"> <input type="text" id="e_burn_{{$index}}" class="form-control" name="e_burn_{{$index}}" ng-focus="validateOtherFields(21,$index,'e_burn_'+$index)" ng-blur="validateField('e_burn_'+$index,$index,'e_burn',$event)" ng-model="rejectionEntry.e_burn"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="e_bend_camber_{{$index}}" class="form-control" name="e_bend_camber_{{$index}}" ng-focus="validateOtherFields(22,$index,'e_bend_camber_'+$index)" ng-blur="validateField('e_bend_camber_'+$index,$index,'e_bend_camber',$event)" ng-model="rejectionEntry.e_bend_camber"  required>
            			  </td>
						   
             <td class="body-cell col1"> <input type="text" id="e_profile_ng_{{$index}}" class="form-control" name="e_profile_ng_{{$index}}" ng-focus="validateOtherFields(23,$index,'e_profile_ng_'+$index)" ng-blur="validateField('e_profile_ng_'+$index,$index,'e_profile_ng',$event)" ng-model="rejectionEntry.e_profile_ng"  required>
            			  </td>
                        		
            <td class="body-cell col1"> <input type="text" id="e_cut_{{$index}}" class="form-control" name="e_cut_{{$index}}" ng-focus="validateOtherFields(24,$index,'e_cut_'+$index)" ng-blur="validateField('e_cut_'+$index,$index,'e_cut',$event)" ng-model="rejectionEntry.e_cut"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="e_line_mark_{{$index}}" class="form-control" name="e_line_mark_{{$index}}" ng-focus="validateOtherFields(25,$index,'e_line_mark_'+$index)" ng-blur="validateField('e_line_mark_'+$index,$index,'e_line_mark',$event)" ng-model="rejectionEntry.e_line_mark"  required>
            			  </td>
						   
            <td class="body-cell col1"> <input type="text" id="e_scratch_{{$index}}" class="form-control" name="e_scratch_{{$index}}" ng-focus="validateOtherFields(26,$index,'e_scratch_'+$index)" ng-blur="validateField('e_scratch_'+$index,$index,'e_scratch',$event)" ng-model="rejectionEntry.e_scratch"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="e_zerk_{{$index}}" class="form-control" name="e_zerk_{{$index}}" ng-focus="validateOtherFields(27,$index,'e_zerk_'+$index)" ng-blur="validateField('e_zerk_'+$index,$index,'e_zerk',$event)" ng-model="rejectionEntry.e_zerk"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="e_dent_{{$index}}" class="form-control" name="e_dent_{{$index}}" ng-focus="validateOtherFields(28,$index,'e_dent_'+$index)" ng-blur="validateField('e_dent_'+$index,$index,'e_dent',$event)" ng-model="rejectionEntry.e_dent"  required>
            			  </td>
             <td class="body-cell col1"> <input type="text" id="e_burr_{{$index}}" class="form-control" name="e_burr_{{$index}}" ng-focus="validateOtherFields(29,$index,'e_burr_'+$index)" ng-blur="validateField('e_burr_'+$index,$index,'e_burr',$event)" ng-model="rejectionEntry.e_burr"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="e_water_mark_{{$index}}" class="form-control" name="e_water_mark_{{$index}}" ng-focus="validateOtherFields(30,$index,'e_water_mark_'+$index)" ng-blur="validateField('e_water_mark_'+$index,$index,'e_water_mark',$event)" ng-model="rejectionEntry.e_water_mark"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="e_others_{{$index}}" class="form-control" name="e_others_{{$index}}" ng-focus="validateOtherFields(31,$index,'e_others_'+$index)" ng-blur="validateField('e_others_'+$index,$index,'e_others',$event)" ng-model="rejectionEntry.e_others"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="f_hard_{{$index}}" class="form-control" name="f_hard_{{$index}}" ng-focus="validateOtherFields(32,$index,'f_hard_'+$index)" ng-blur="validateField('f_hard_'+$index,$index,'f_hard',$event)" ng-model="rejectionEntry.f_hard"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="f_uneven_{{$index}}" class="form-control" name="f_uneven_{{$index}}" ng-focus="validateOtherFields(33,$index,'f_uneven_'+$index)" ng-blur="validateField('f_uneven_'+$index,$index,'f_uneven',$event)" ng-model="rejectionEntry.f_uneven"  required>
            			  </td>
            
            <td class="body-cell col1"> <input type="text" id="f_adhesion_poor_{{$index}}" class="form-control" name="f_adhesion_poor_{{$index}}" ng-focus="validateOtherFields(34,$index,'f_adhesion_poor_'+$index)" ng-blur="validateField('f_adhesion_poor_'+$index,$index,'f_adhesion_poor',$event)" ng-model="rejectionEntry.f_adhesion_poor"  required>
            			  </td>
						   
             <td class="body-cell col1"> <input type="text" id="f_over_{{$index}}" class="form-control" name="f_over_{{$index}}" ng-focus="validateOtherFields(35,$index,'f_over_'+$index)" ng-blur="validateField('f_over_'+$index,$index,'f_over',$event)" ng-model="rejectionEntry.f_over"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="f_cut_{{$index}}" class="form-control" name="f_cut_{{$index}}" ng-focus="validateOtherFields(36,$index,'f_cut_'+$index)" ng-blur="validateField('f_cut_'+$index,$index,'f_cut',$event)" ng-model="rejectionEntry.f_cut"  required>
            			  </td>
						
            <td class="body-cell col1"> <input type="text" id="f_miss_{{$index}}" class="form-control" name="f_miss_{{$index}}" ng-focus="validateOtherFields(37,$index,'f_miss_'+$index)" ng-blur="validateField('f_miss_'+$index,$index,'f_miss',$event)" ng-model="rejectionEntry.f_miss"  required>
            			  </td>
                        		
            <td class="body-cell col1"> <input type="text" id="f_glue_patch_{{$index}}" class="form-control" name="f_glue_patch_{{$index}}" ng-focus="validateOtherFields(38,$index,'f_glue_patch_'+$index)" ng-blur="validateField('f_glue_patch_'+$index,$index,'f_glue_patch',$event)" ng-model="rejectionEntry.f_glue_patch"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="f_scratch_{{$index}}" class="form-control" name="f_scratch_{{$index}}" ng-focus="validateOtherFields(39,$index,'f_scratch_'+$index)" ng-blur="validateField('f_scratch_'+$index,$index,'f_scratch',$event)" ng-model="rejectionEntry.f_scratch"  required>
            			  </td>
						   
             <td class="body-cell col1"> <input type="text" id="f_others_{{$index}}" class="form-control" name="f_others_{{$index}}" ng-focus="validateOtherFields(40,$index,'f_others_'+$index)" ng-blur="validateField('f_others_'+$index,$index,'f_others',$event)" ng-model="rejectionEntry.f_others"  required>
            			  </td>
                        		
            <td class="body-cell col1"> <input type="text" id="m_cut_{{$index}}" class="form-control" name="m_cut_{{$index}}" ng-focus="validateOtherFields(41,$index,'m_cut_'+$index)" ng-blur="validateField('m_cut_'+$index,$index,'m_cut',$event)" ng-model="rejectionEntry.m_cut"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="m_dent_{{$index}}" class="form-control" name="m_dent_{{$index}}" ng-focus="validateOtherFields(42,$index,'m_dent_'+$index)" ng-blur="validateField('m_dent_'+$index,$index,'m_dent',$event)" ng-model="rejectionEntry.m_dent"  required>
            			  </td>
						   
            <td class="body-cell col1"> <input type="text" id="m_Flash_{{$index}}" class="form-control" name="m_Flash_{{$index}}" ng-focus="validateOtherFields(43,$index,'m_Flash_'+$index)" ng-blur="validateField('m_Flash_'+$index,$index,'m_Flash',$event)" ng-model="rejectionEntry.m_Flash"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="m_short_{{$index}}" class="form-control" name="m_short_{{$index}}" ng-focus="validateOtherFields(44,$index,'m_short_'+$index)" ng-blur="validateField('m_short_'+$index,$index,'m_short',$event)" ng-model="rejectionEntry.m_short"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="m_shine_mark_{{$index}}" class="form-control" name="m_shine_mark_{{$index}}" ng-focus="validateOtherFields(45,$index,'m_shine_mark_'+$index)" ng-blur="validateField('m_shine_mark_'+$index,$index,'m_shine_mark',$event)" ng-model="rejectionEntry.m_shine_mark"  required>
            			  </td>
             <td class="body-cell col1"> <input type="text" id="m_impression_mark_{{$index}}" class="form-control" name="m_impression_mark_{{$index}}" ng-focus="validateOtherFields(46,$index,'m_impression_mark_'+$index)" ng-blur="validateField('m_impression_mark_'+$index,$index,'m_impression_mark',$event)" ng-model="rejectionEntry.m_impression_mark"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="m_joint_open_{{$index}}" class="form-control" name="m_joint_open_{{$index}}" ng-focus="validateOtherFields(47,$index,'m_joint_open_'+$index)" ng-blur="validateField('m_joint_open_'+$index,$index,'m_joint_open',$event)" ng-model="rejectionEntry.m_joint_open"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="m_others_{{$index}}" class="form-control" name="m_others_{{$index}}" ng-focus="validateOtherFields(48,$index,'m_others_'+$index)" ng-blur="validateField('m_others_'+$index,$index,'m_others',$event)" ng-model="rejectionEntry.m_others"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="fn_weld_joint_open_{{$index}}" class="form-control" name="fn_weld_joint_open_{{$index}}" ng-focus="validateOtherFields(49,$index,'fn_weld_joint_open_'+$index)" ng-blur="validateField('fn_weld_joint_open_'+$index,$index,'fn_weld_joint_open',$event)" ng-model="rejectionEntry.fn_weld_joint_open"  required>
            			  </td>
            <td class="body-cell col1"> <input type="text" id="fn_notching_ng_{{$index}}" class="form-control" name="fn_notching_ng_{{$index}}" ng-focus="validateOtherFields(50,$index,'fn_notching_ng_'+$index)" ng-blur="validateField('fn_notching_ng_'+$index,$index,'fn_notching_ng',$event)" ng-model="rejectionEntry.fn_notching_ng"  required>
            			  </td>
            
            <td class="body-cell col1"> <input type="text" id="fn_elfy_{{$index}}" class="form-control" name="fn_elfy_{{$index}}" ng-focus="validateOtherFields(51,$index,'fn_elfy_'+$index)" ng-blur="validateField('fn_elfy_'+$index,$index,'fn_elfy',$event)" ng-model="rejectionEntry.fn_elfy"  required>
            			  </td>
						   
             <td class="body-cell col1"> <input type="text" id="fn_dent_assy_{{$index}}" class="form-control" name="fn_dent_assy_{{$index}}" ng-focus="validateOtherFields(52,$index,'fn_dent_assy_'+$index)" ng-blur="validateField('fn_dent_assy_'+$index,$index,'fn_dent_assy',$event)" ng-model="rejectionEntry.fn_dent_assy"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="fn_scratch_assy_{{$index}}" class="form-control" name="fn_scratch_assy_{{$index}}" ng-focus="validateOtherFields(53,$index,'fn_scratch_assy_'+$index)" ng-blur="validateField('fn_scratch_assy_'+$index,$index,'fn_scratch_assy',$event)" ng-model="rejectionEntry.fn_scratch_assy"  required>
            			  </td>
						
            <td class="body-cell col1"> <input type="text" id="fn_lip_problem_{{$index}}" class="form-control" name="fn_lip_problem_{{$index}}" ng-focus="validateOtherFields(54,$index,'fn_lip_problem_'+$index)" ng-blur="validateField('fn_lip_problem_'+$index,$index,'fn_lip_problem',$event)" ng-model="rejectionEntry.fn_lip_problem"  required>
            			  </td>
                        		
            <td class="body-cell col1"> <input type="text" id="fn_end_cap_{{$index}}" class="form-control" name="fn_end_cap_{{$index}}" ng-focus="validateOtherFields(55,$index,'fn_end_cap_'+$index)" ng-blur="validateField('fn_end_cap_'+$index,$index,'fn_end_cap',$event)" ng-model="rejectionEntry.fn_end_cap"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="fn_shine_mark_{{$index}}" class="form-control" name="fn_shine_mark_{{$index}}" ng-focus="validateOtherFields(56,$index,'fn_shine_mark_'+$index)" ng-blur="validateField('fn_shine_mark_'+$index,$index,'fn_shine_mark',$event)" ng-model="rejectionEntry.fn_shine_mark"  required>
            			  </td>
						   
             <td class="body-cell col1"> <input type="text" id="fn_Cut_assy_{{$index}}" class="form-control" name="fn_Cut_assy_{{$index}}" ng-focus="validateOtherFields(57,$index,'fn_Cut_assy_'+$index)" ng-blur="validateField('fn_Cut_assy_'+$index,$index,'fn_Cut_assy',$event)" ng-model="rejectionEntry.fn_Cut_assy"  required>
            			  </td>
                        		
            <td class="body-cell col1"> <input type="text" id="fn_short_length_assy_{{$index}}" class="form-control" name="fn_short_length_assy_{{$index}}" ng-focus="validateOtherFields(58,$index,'fn_short_length_assy_'+$index)" ng-blur="validateField('fn_short_length_assy_'+$index,$index,'fn_short_length_assy',$event)" ng-model="rejectionEntry.fn_short_length_assy"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="fn_big_length_assy_{{$index}}" class="form-control" name="fn_big_length_assy_{{$index}}" ng-focus="validateOtherFields(59,$index,'fn_big_length_assy_'+$index)" ng-blur="validateField('fn_big_length_assy_'+$index,$index,'fn_big_length_assy',$event)" ng-model="rejectionEntry.fn_big_length_assy"  required>
            			  </td>
						   
            <td class="body-cell col1"> <input type="text" id="fn_bend_assy_{{$index}}" class="form-control" name="fn_bend_assy_{{$index}}" ng-focus="validateOtherFields(60,$index,'fn_bend_assy_'+$index)" ng-blur="validateField('fn_bend_assy_'+$index,$index,'fn_bend_assy',$event)" ng-model="rejectionEntry.fn_bend_assy"  required>
            			  </td>
						    
            <td class="body-cell col1"> <input type="text" id="fn_others_{{$index}}" class="form-control" name="fn_others_{{$index}}" ng-focus="validateOtherFields(61,$index,'fn_others_'+$index)" ng-blur="validateField('fn_others_'+$index,$index,'fn_others',$event)" ng-model="rejectionEntry.fn_others"  required>
            			  </td>
                        	
            <td class="body-cell col1"> <input type="text" id="part_weight_{{$index}}" class="form-control" name="part_weight_{{$index}}" ng-focus="validateOtherFields(62,$index,'part_weight_'+$index)" ng-blur="validateField('part_weight_'+$index,$index,'part_weight',$event)" ng-model="rejectionEntry.part_weight"  required>
            			  </td>
    
            			  			  				  			  				  			  			  
      
      </tr>
     
    </tbody>
  </table>
</div>
								</div></div></br>
					<div class="contact-form">
						<input type="submit" value="Submit" class="submitButtn"  ng-click="insertRejectionRecord($event)" >
						<span style="color:red" ng-show="errorFlag">* {{errorMessage}}</span>
					</div>
					
				</div>
			</form>
                        </div>
                        <!--  //contact form grid ends here -->
                    </div>
                    <!-- contact details -->
                    
                </div>
                <!-- //contact details container -->
            </div>
            <!-- contact map grid -->
           
            <!--//contact map grid ends here-->
        </section>
        <!-- footer -->

        <!-- //footer -->
        <!-- login and register modal -->

       
        <!-- //login and register modal -->
    </div>
    <!-- js-->
    
    <!--<script src="resources/js/jquery-2.2.3.min.js"></script>-->
    <script src="resources/js/sprConfig.js"></script>
    <script src="resources/js/rejection.js"></script>
    <script src="resources/js/sprFactory.js"></script>
    
    <!-- js-->
   
    <!-- for toggle left push menu script -->
    <script src="resources/js/classie.js "></script>
    <script>
        var menuLeft = document.getElementById('cbp-spmenu-s1'),
            showLeftPush = document.getElementById('showLeftPush'),
            body = document.body;
 classie.toggle(body, 'cbp-spmenu-push-toright');
 classie.toggle(menuLeft, 'cbp-spmenu-open');
        showLeftPush.onclick = function () {
           
            classie.toggle(body, 'cbp-spmenu-push-toright');
            classie.toggle(menuLeft, 'cbp-spmenu-open');
           
        };
        
	

        
    </script>
    <!-- //Classie -->
    <!-- //for toggle left push menu script -->


    <!-- side nav js -->
    <script src='resources/js/SidebarNav.min.js'></script>
    <script>
        $('.sidebar-menu').SidebarNav()
    </script>
    <!-- //side nav js -->
     <!-- script for password match -->
     <script>
        window.onload = function () {
            //document.getElementById("password1").onchange = validatePassword;
            //document.getElementById("password2").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }
    </script>
    <!-- script for password match -->
    <!-- start-smooth-scrolling -->
    
    <script>
        jQuery(document).ready(function ($) {
            $(".scroll ").click(function (event) {
                event.preventDefault();

                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
            });
        });
    </script>
    <!-- //end-smooth-scrolling -->
    <!-- smooth-scrolling-of-move-up -->
    <script>
        $(document).ready(function () {
            /*
             var defaults = {
            	 containerID: 'toTop', // fading element id
            	 containerHoverID: 'toTopHover', // fading element hover id
            	 scrollSpeed: 1200,
            	 easingType: 'linear' 
             };
             */

            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
   
    <!-- //smooth-scrolling-of-move-up -->
    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.js ">
    </script>
    <!-- //Bootstrap Core JavaScript 
   <script>
   $('.sprTable ').on('scroll', function () {
    $(".sprTable > *").width($(".sprTable").width() + $(".sprTable").scrollLeft());
});
   </script>
		-->
		
		<script>
		$(".table-body").scroll(function ()
				{ console.log(this.scrollTop);
				         $(".table-header")[0].style.top = (this.scrollTop -5) + 'px';       
				    });
		</script>
</body>

</html>