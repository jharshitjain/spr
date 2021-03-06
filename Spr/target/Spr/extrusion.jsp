<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>




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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 



<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/2.0.0/ui-bootstrap-tpls.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-utils/0.1.1/angular-ui-utils.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>

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
        dateFormat: 'dd/mm/yy'});
    
    $('#extrusion_date').datepicker({
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
	
	<!--  <style>
    
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
    text-overflow: ellipsis;
      min-width:96px;
    max-width:96px;
}



</style> -->
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
    border-collapse: collapse;
     min-width:96px;
     max-width:96px;
}
</style>
</head>

<body class="cbp-spmenu-push" ng-app="sprApp" ng-controller="sprContrlr" ng-init="loadCustomerGroup()">
<div id="myModal" class="processLoader" ng-show="loaderFlag" >

  <!-- Modal content -->
  <div class="processLoader-content" style="width:30%">
    
	<center><img src="resources/images/loader.gif" alt="Italian Trulli"  >
  </center>  
  </div>

</div>



<div id="myModal" class="processLoader1" ng-show="submitFlag" style="display:none" >
<div class="processLoader-content1" style="width:60%;">
   
<img src="resources/images/logo.png" alt="Italian Trulli"  >
   <h1 style="display:inline-block;">Data Submitted Successfully for <span style="color:grey;"><u></br>Plant:-{{plantno}}/Extrusion/Shift:-{{shift}}/Spr no till {{lastInsertedSprNo}}</u></span></h1>
	<center><button id="ok_button" name="ok_button" ng-click="submitok()" >OK</button></center>
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
                                <a href="#">
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
        <div class="header-right">
        </div>
    </header>
    <!-- //header-ends -->
    <!-- main content start-->
    <div id="page-wrapper">
        <!-- inner banner -->
        <div class="inner-banner">
        
       <h3 style="text-align:right; padding-right: 50px;">
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
                       
                      <center>   <h1  aria-current="page">Extrusion</h1>
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
                            
                          <form action="#" method="post" name="extrusion_form">
				<div class="contact-grids1 w3agile-6">
					<div class="row">
						<!--<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">S No.</label>
							<input type="text" class="form-control" name="sno" ng-model="sno" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="" readonly>
							<span style="color:red" ng-show="extrusion_form.sno.$touched && extrusion_form.sno.$invalid">*Cannot Leave Empty.Invalid Data format. </span>
						</div>-->
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Company</label>
							<select type="text" id="company" class="form-control" name="company" ng-blur="validateHeaderField('company')" ng-model="company"  required="">
						 <option value="" hidden>Select for the company</option>
							 <option value="Ppap">PPAP</option>
    <option value="Pti">PTI</option>
    </select>
						<span style="color:red" ng-show="extrusion_form.company.$touched && extrusion_form.company.$invalid">*Cannot Leave Empty </span>
						</div>
						
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">H.O.D</label>
							<input type="text" id="hod" class="form-control" name="hod" ng-model="hod" placeholder="Data can be in characters or in numeric" ng-maxlength="50" ng-pattern="/^[a-zA-Z0-9]+$/" required="">
						 
						    <span style="color:red" ng-show="extrusion_form.hod.$touched && extrusion_form.hod.$invalid">*Cannot Leave Empty.Invalid Data format. </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User ID</label>
							<input type="text" id="user_id" class="form-control" name="user_id" ng-model="user_id" placeholder="" required="" readonly>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User Plant No</label>
							<input type="text" id="user_plant_no" class="form-control" name="user_plant_no" ng-model="user_plant_no"  placeholder="" required readonly>
						
						
					<span style="color:red" ng-show="extrusion_form.user_plant_no.$touched && extrusion_form.user_plant_no.$invalid">*Cannot Leave Empty </span>	
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Extrusion Date</label>
							<input type="text" id="extrusion_date" class="form-control" name="extrusion_date" ng-model="extrusion_date" placeholder="" required >
							<span style="color:red" ng-show="extrusion_form.extrusion_date.$touched && extrusion_form.extrusion_date.$invalid">*Cannot Leave Empty </span>	
						
							
						</div>
						
						
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Plant No.</label>
							<select type="text" id="plantno" class="form-control" name="plantno" ng-blur="validateHeaderField('plantno')" ng-model="plantno" placeholder="" required="">
						<option value="" hidden>Select For the Plant No. </option>
							 <option value="Plant1">Plant-1</option>
    <option value="Plant2">Plant-2</option>
     <option value="Plant3">Plant-5</option>
    </select>
						<span style="color:red" ng-show="extrusion_form.plant_no.$touched && extrusion_form.plant_no.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Shift</label>
							<select type="text" id="shift" class="form-control" name="shift" ng-blur="validateHeaderField('shift')" placeholder="" ng-model="shift" required>
							<option value="" hidden>Select for the Shift </option>
							 <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
      <option value="G">G</option>
    </select>
    <span style="color:red" ng-show="extrusion_form.shift.$touched && extrusion_form.shift.$invalid">*Cannot Leave Empty </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Line</label>
							<input type="text" id="line" class="form-control" name="line" ng-blur="validateHeaderField('line')" ng-model="line" placeholder="Data should only contain numeric value" ng-maxlength="2" ng-pattern ="/^[0-9]*$/" required="">
 <span style="color:red" ng-show="extrusion_form.line.$touched && extrusion_form.line.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						   
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Customer</label>
							<select type="text" id="customer" class="form-control" name="customer" ng-blur="validateHeaderField('customer')"  ng-model="customer" ng-change="loadModelListByCustomerGroup()" placeholder="" required>
						<option value="" selected>Select For the Customer Name </option>
							 <option ng-repeat="customerGroup in listOfCustomerGroup | orderBy" value="{{customerGroup}}">{{customerGroup}}</option>
							
    </select>
														
						<span style="color:red" ng-show="extrusion_form.customer.$touched && extrusion_form.customer.$invalid">*Cannot Leave Empty </span>
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Car Model</label>
							<select type="text" id="car_model" class="form-control" name="car_model" ng-blur="validateHeaderField('car_model')" placeholder="" ng-model="car_model" ng-change="loadPartListByCustomerGroupAndModel()" required>
						<option value="" selected>Select for the Model </option>
							 <option ng-repeat="model in modelList | orderBy" value="{{model}}">{{model}}</option>
    </select>
						<span style="color:red" ng-show="extrusion_form.car_model.$touched && extrusion_form.car_model.$invalid">*Cannot Leave Empty </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Part Name</label>
							<select type="text" id="part_name" class="form-control" name="part_name" ng-blur="validateHeaderField('part_name')" placeholder="" ng-model="part_name"  required>
						<option value="" selected>Select for the Part name </option>
							 <option ng-repeat="part in partList" value="{{part}}">{{part}}</option>
    </select>
						<span style="color:red" ng-show="extrusion_form.part_name.$touched && extrusion_form.part_name.$invalid">*Cannot Leave Empty </span>
						
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Fr RR</label>
							<select type="text" id="fr_rr" class="form-control" name="fr_rr" ng-blur="validateHeaderField('fr_rr')" placeholder="" ng-model="fr_rr" required>
						    <option value="" hidden>Select from the list </option>
							 <option value="FR">FR</option>
    <option value="RR">RR</option>
    </select>
						<span style="color:red" ng-show="extrusion_form.fr_rr.$touched && extrusion_form.fr_rr.$invalid">*Cannot Leave Empty </span>
						
						
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Trial or Prod</label>
							<select type="text" id="trial_or_prod" class="form-control" name="trial_or_prod" ng-blur="validateHeaderField('trial_or_prod')" ng-model="trial_or_prod" placeholder="" required="">
						<option value="" hidden>Select from the list </option>
							 <option value="trial">TRIAL</option>
    <option value="prod">PROD</option>
    </select>
						<span style="color:red" ng-show="extrusion_form.trial_or_prod.$touched && extrusion_form.trial_or_prod.$invalid">*Cannot Leave Empty </span>
						</div>
						
						<!--<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Production  Target</label>
							<input type="text" class="form-control" name="prod_target" placeholder="Data should be in numeric only" ng-model="prod_target" ng-pattern ="/^[0-9]*$/" required>
						    <span style="color:red" ng-show="extrusion_form.prod_target.$touched && extrusion_form.prod_target.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						   </div>
						 
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Production Actual</label>
							<input type="text" class="form-control" name="prod_actual" placeholder="Data should be in numeric only" ng-model="prod_actual" ng-pattern ="/^[0-9]*$/" required>
						 <span style="color:red" ng-show="extrusion_form.prod_actual.$touched && extrusion_form.prod_actual.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    	</div>
						
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Product KG</label>
							<input type="text" class="form-control" name="prod_kg" ng-model="prod_kg" placeholder="Data can be numeric or decimal"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/"  required="">
							<span style="color:red" ng-show="extrusion_form.prod_kg.$touched && extrusion_form.prod_kg.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Production Plan Time</label></br>							
					
							<input type="text"   step="1" class="form-control" name="prodplan_time" ng-model="prodplan_time" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required=""></br>
							<span style="color:red" ng-show="extrusion_form.prodplan_time.$touched && extrusion_form.prodplan_time.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
							 
						</div>
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Set Up Time Target </label>
							<input type="text" class="form-control" name="setuptime_target" ng-model="setuptime_target" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="extrusion_form.setuptime_target.$touched && extrusion_form.petuptime_target.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    	
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Set Up Time Actual</label>
							<input type="text" class="form-control" name="setuptime_actual" ng-model="setuptime_actual" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
							 <span style="color:red" ng-show="extrusion_form.setuptime_actual.$touched && extrusion_form.setuptime_actual.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Change Over Time Target</label>
							<input type="text" class="form-control" name="co_time_target" ng-model="co_time_target" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.co_time_target.$touched && extrusion_form.co_time_target.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						   
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Change Over Time Actual</label>
							<input type="text" class="form-control" name="co_time_actual" ng-model="co_time_actual" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.co_time_actual.$touched && extrusion_form.co_time_actual.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						  	
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Down Time</label>
							<input type="text" class="form-control" name="down_time" ng-model="down_time" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.down_time.$touched && extrusion_form.down_time.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						   
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Break Down Time</label>
							<input type="text" class="form-control" name="bd_time" ng-model="bd_time" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.bd_time.$touched && extrusion_form.bd_time.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Product Run Time</label>
							<input type="text" class="form-control" name="prodrun_time" ng-model="prodrun_time" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.prodrun_time.$touched && extrusion_form.prodrun_time.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    	
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Line Rej Target</label>
							<input type="text" class="form-control" name="line_rej_target" ng-model="line_rej_target" placeholder="Data can be numeric or decimal"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
							<span style="color:red" ng-show="extrusion_form.line_rej_target.$touched && extrusion_form.line_rej_target.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Line Rej Actual</label>
							<input type="text" class="form-control" name="line_rej_actual" ng-model="line_rej_actual" placeholder="Data can be numeric or decimal"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
						<span style="color:red" ng-show="extrusion_form.line_rej_actual.$touched && extrusion_form.line_rej_actual.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Change Over Scrap Target</label>
							<input type="text" class="form-control" name="co_scrap_taget" ng-model="co_scrap_taget" placeholder="Data can be numeric or decimal"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
						<span style="color:red" ng-show="extrusion_form.co_scrap_taget.$touched && extrusion_form.co_scrap_taget.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Change Over Scrap Actual</label>
							<input type="text" class="form-control" name="co_scrap_actual" ng-model="co_scrap_actual" placeholder="Data can be numeric or decimal"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
						<span style="color:red" ng-show="extrusion_form.co_scrap_actual.$touched && extrusion_form.co_scrap_actual.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
                        		
						</div>
					
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">No. OF Change Over</label>
							<input type="text" class="form-control" name="no_of_co" ng-model="no_of_co" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.no_of_co.$touched && extrusion_form.no_of_co.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">No. OF SetUp</label>
							<input type="text" class="form-control" name="no_of_Setup" ng-model="no_of_Setup" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="extrusion_form.no_of_setup.$touched && extrusion_form.no_of_setup.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
						    
						</div>
						
					
					
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Trail Rej</label>
							<input type="text" class="form-control" name="trail_rej" ng-model="trail_rej" placeholder="Data can be numeric or decimal" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/"  required="">
						<span style="color:red" ng-show="extrusion_form.trail_rej.$touched && extrusion_form.trail_rej.$invalid">*Cannot Leave Empty.Invalid Data format.</span>
                        		
						
						</div>-->
				
				
						</div>
						
						</br>
					<div class="contact-form">
						<input type="button" value="Add More Rows" ng-click="insertExtrusionRecord($event,'ADD_NEWROW')" >
						
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
            <th class="header-cell col1">Production Target</th>
            <th class="header-cell col1">Production Actual</th>
            <th class="header-cell col1">Product KG</th>
            <th class="header-cell col1">Production Plan Time</th>
            <th class="header-cell col1">Set Up Time Target</th>
            <th class="header-cell col1">Set Up Time Actual</th>
             <th class="header-cell col1">Change Over Time Target</th>
            <th class="header-cell col1">Change Over Time Actual</th>
            
            <th class="header-cell col1">Down Time</th>
            <th class="header-cell col1">Break Down Time</th>
            <th class="header-cell col1">Product Run Time</th>
             <th class="header-cell col1">Line Rej Target</th>
            <th class="header-cell col1">Line Rej Actual</th>
            <th class="header-cell col1">Change Over Scrap Target</th>
            <th class="header-cell col1">Change Over Scrap Actual</th>
            <th class="header-cell col1">No. OF Change Over</th>
                        <th class="header-cell col1">No. OF SetUp</th>
           <th class="header-cell col1">Trail Rej</th>
      </tr>
    </thead>
  
    <tbody style="display: block;">
      <tr ng-repeat="extrusionEntry in extrusionRecordsList">
        <td class="body-cell col1">
        <input type="text" id="extrusion_{{$index}}" class="form-control" name="extrusion_{{$index}}" ng-model="extrusionEntry.sno"   required readonly >
        </td>
            <td class="body-cell col1"> <input type="text" id="prod_target_{{$index}}" class="form-control" name="prod_target_{{$index}}" ng-focus="validateOtherFields(11,$index,'prod_target_'+$index)" ng-blur="validateField('prod_target_'+$index,$index,'prod_target',$event)" ng-model="extrusionEntry.prod_target" ng-pattern ="/^[0-9]*$/" required>
						  		     </td>
						      
            <td class="body-cell col1"><input type="text" id="prod_actual_{{$index}}" class="form-control" name="prod_actual_{{$index}}" ng-focus="validateOtherFields(12,$index,'prod_actual_'+$index)" ng-blur="validateField('prod_actual_'+$index,$index,'prod_actual',$event)" placeholder="" ng-model="extrusionEntry.prod_actual" ng-pattern ="/^[0-9]*$/" required>
								  </td>
         
            <td class="body-cell col1">	<input type="text" id="prod_kg_{{$index}}" class="form-control" name="prod_kg_{{$index}}" ng-focus="validateOtherFields(13,$index,'prod_kg_'+$index)" ng-model="extrusionEntry.prod_kg" placeholder="" ng-blur="validateField('prod_kg_'+$index,$index,'prod_kg',$event)" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/"  required="">
								   </td>
						    
            <td class="body-cell col1"><input type="text"  id="prodplan_time_{{$index}}"  class="form-control" name="prodplan_time_{{$index}}" ng-focus="validateOtherFields(14,$index,'prodplan_time_'+$index)" ng-model="extrusionEntry.prodplan_time" placeholder="" ng-blur="validateField('prodplan_time_'+$index,$index,'prodplan_time',$event)" ng-pattern ="/^[0-9]*$/" required="">
										 
            </td>
            
            <td class="body-cell col1">	<input type="text" id="setuptime_taget_{{$index}}" class="form-control" name="setuptime_taget_{{$index}}" ng-focus="validateOtherFields(15,$index,'setuptime_taget_'+$index)" ng-model="extrusionEntry.setuptime_taget" placeholder="" ng-blur="validateField('setuptime_taget_'+$index,$index,'setuptime_taget',$event)" ng-pattern ="/^[0-9]*$/" required="">
							    </td>
						   
             <td class="body-cell col1">	<input type="text" id="setuptime_actual_{{$index}}" class="form-control" name="setuptime_actual_{{$index}}" ng-focus="validateOtherFields(16,$index,'setuptime_actual_'+$index)" ng-model="extrusionEntry.setuptime_actual" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('setuptime_actual_'+$index,$index,'setuptime_actual',$event)" required="">
								    </td>
						    
            <td class="body-cell col1">	<input type="text" id="co_time_target_{{$index}}" class="form-control" name="co_time_target_{{$index}}" ng-focus="validateOtherFields(17,$index,'co_time_target_'+$index)"  ng-model="extrusionEntry.co_time_target" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('co_time_target_'+$index,$index,'co_time_target',$event)" required="">
								</td>
						
            <td class="body-cell col1">	<input type="text" id="co_time_actual_{{$index}}" class="form-control" name="co_time_actual_{{$index}}" ng-focus="validateOtherFields(18,$index,'co_time_actual_'+$index)" ng-model="extrusionEntry.co_time_actual" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('co_time_actual_'+$index,$index,'co_time_actual',$event)" required="">
						 		</td>
                        		
            <td class="body-cell col1">	<input type="text" id="down_time_{{$index}}" class="form-control" name="down_time_{{$index}}" ng-focus="validateOtherFields(19,$index,'down_time_'+$index)" ng-model="extrusionEntry.down_time" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('down_time_'+$index,$index,'down_time',$event)" required="">
							  	</td>
                        	
            <td class="body-cell col1">	<input type="text" id="bd_time_{{$index}}" class="form-control" name="bd_time_{{$index}}" ng-focus="validateOtherFields(20,$index,'bd_time_'+$index)" ng-model="extrusionEntry.bd_time" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('bd_time_'+$index,$index,'bd_time',$event)" required="">
							   </td>
						   
             <td class="body-cell col1">	<input type="text" id="prodrun_time_{{$index}}" class="form-control" name="prodrun_time_{{$index}}" ng-focus="validateOtherFields(21,$index,'prodrun_time_'+$index)" ng-model="extrusionEntry.prodrun_time" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('prodrun_time_'+$index,$index,'prodrun_time',$event)" required="">
									</td>
                        		
            <td class="body-cell col1">	<input type="text" id="line_rej_target_{{$index}}" class="form-control" name="line_rej_target_{{$index}}" ng-focus="validateOtherFields(22,$index,'line_rej_target_'+$index)" ng-model="extrusionEntry.line_rej_target" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-blur="validateField('line_rej_target_'+$index,$index,'line_rej_target',$event)" required="">
									</td>
                        	
            <td class="body-cell col1">	<input type="text" id="line_rej_actual_{{$index}}" class="form-control" name="line_rej_actual_{{$index}}" ng-focus="validateOtherFields(23,$index,'line_rej_actual_'+$index)" ng-model="extrusionEntry.line_rej_actual" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-blur="validateField('line_rej_actual_'+$index,$index,'line_rej_actual',$event)" required="">
							   </td>
						   
            <td class="body-cell col1">	<input type="text" id="co_scrap_taget_{{$index}}" class="form-control" name="co_scrap_taget_{{$index}}" ng-focus="validateOtherFields(24,$index,'co_scrap_taget_'+$index)" ng-model="extrusionEntry.co_scrap_taget" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-blur="validateField('co_scrap_taget_'+$index,$index,'co_scrap_taget',$event)" required="">
							    </td>
						    
            <td class="body-cell col1">	<input type="text" id="co_scrap_actual_{{$index}}" class="form-control" name="co_scrap_actual_{{$index}}" ng-focus="validateOtherFields(25,$index,'co_scrap_actual_'+$index)" ng-model="extrusionEntry.co_scrap_actual" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-blur="validateField('co_scrap_actual_'+$index,$index,'co_scrap_actual',$event)" required="">
							 	</td>
                        	
            <td class="body-cell col1">	<input type="text" id="no_of_co_{{$index}}" class="form-control" name="no_of_co_{{$index}}" ng-focus="validateOtherFields(26,$index,'no_of_co_'+$index)" ng-model="extrusionEntry.no_of_co" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('no_of_co_'+$index,$index,'no_of_co',$event)" required="">
									</td>
             <td class="body-cell col1">	<input type="text" id="no_of_Setup_{{$index}}" class="form-control" name="no_of_Setup_{{$index}}" ng-focus="validateOtherFields(27,$index,'no_of_Setup_'+$index)" ng-model="extrusionEntry.no_of_Setup" placeholder="" ng-pattern ="/^[0-9]*$/" ng-blur="validateField('no_of_Setup_'+$index,$index,'no_of_Setup',$event)" required="">
									</td>  
                <td class="body-cell col1"><input type="text" id="trail_rej_{{$index}}" class="form-control" name="trail_rej_{{$index}}" ng-focus="validateOtherFields(28,$index,'trail_rej_'+$index)" ng-model="extrusionEntry.trail_rej" placeholder="" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-blur="validateField('trail_rej_'+$index,$index,'trail_rej',$event)" required="">
						 </td>        		         		
        </tr>
     
    </tbody>
  </table>
</div>
								 <!--  <table class="sprTable">
								 
    <thead>
   
        <tr >
        <td><label class="col-form-label">SPR No.</label></td>
            <td><label class="col-form-label">Production Target</label></td>
            <td><label class="col-form-label">Production Actual</label></td>
            <td><label class="col-form-label">Product KG</label></td>
            <td><label class="col-form-label">Production Plan Time</label></td>
            <td><label class="col-form-label">Set Up Time Target</label></td>
            <td><label class="col-form-label">Set Up Time Actual</label></td>
             <td><label class="col-form-label">Change Over Time Target</label></td>
            <td><label class="col-form-label">Change Over Time Actual</label></td>
            
            <td><label class="col-form-label">Down Time</label></td>
            <td><label class="col-form-label">Break Down Time</label></td>
            <td><label class="col-form-label">Product Run Time</label></td>
             <td><label class="col-form-label">Line Rej Target</label></td>
            <td><label class="col-form-label">Line Rej Actual</label></td>
            <td><label class="col-form-label">Change Over Scrap Target</label></td>
            <td><label class="col-form-label">Change Over Scrap Actual</label></td>
            <td><label class="col-form-label">No. OF Change Over</label></td>
                        <td><label class="col-form-label">No. OF SetUp</label></td>
           <td><label class="col-form-label">Trail Rej</label></td>
        </tr>
    </thead>
    <tbody>
    
        <tr ng-repeat="extrusionEntry in extrusionRecordsList">
        <td>
        <input type="text" id="extrusion_$index" class="form-control" name="sno" ng-model="extrusionEntry.sno"   required readonly >
        </td>
            <td> <input type="text" id="prod_target_{{$index}}" class="form-control" name="prod_target_{{$index}}" ng-focus="validateOtherFields(11,$index,'prod_target_'+$index)" ng-keyup="validateField('prod_target_'+$index,$index,'prod_target')" ng-model="extrusionEntry.prod_target" ng-pattern ="/^[0-9]*$/" required>
						  		     </td>
						      
            <td><input type="text" id="prod_actual_{{$index}}" class="form-control" name="prod_actual_{{$index}}" ng-focus="validateOtherFields(12,$index,'prod_actual_'+$index)" ng-keyup="validateField('prod_actual_'+$index,$index,'prod_actual')" placeholder="" ng-model="extrusionEntry.prod_actual" ng-pattern ="/^[0-9]*$/" required>
								  </td>
         
            <td>	<input type="text" id="prod_kg_{{$index}}" class="form-control" name="prod_kg_{{$index}}" ng-focus="validateOtherFields(13,$index,'prod_kg_'+$index)" ng-model="extrusionEntry.prod_kg" placeholder="" ng-keyup="validateField('prod_kg_'+$index,$index,'prod_kg')" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/"  required="">
								   </td>
						    
            <td><input type="text"  id="prodplan_time_{{$index}}"  class="form-control" name="prodplan_time_{{$index}}" ng-focus="validateOtherFields(14,$index,'prodplan_time_'+$index)" ng-model="extrusionEntry.prodplan_time" placeholder="" ng-keyup="validateField('prodplan_time_'+$index,$index,'prodplan_time')" ng-pattern ="/^[0-9]*$/" required="">
										 
            </td>
            
            <td>	<input type="text" id="setuptime_target_{{$index}}" class="form-control" name="setuptime_target_{{$index}}" ng-focus="validateOtherFields(15,$index,'setuptime_target_'+$index)" ng-model="extrusionEntry.setuptime_target" placeholder="" ng-keyup="validateField('setuptime_target_'+$index,$index,'setuptime_target')" ng-pattern ="/^[0-9]*$/" required="">
							    </td>
						   
             <td>	<input type="text" id="setuptime_actual_{{$index}}" class="form-control" name="setuptime_actual_{{$index}}" ng-focus="validateOtherFields(16,$index,'setuptime_actual_'+$index)" ng-model="extrusionEntry.setuptime_actual" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('setuptime_actual_'+$index,$index,'setuptime_actual')" required="">
								    </td>
						    
            <td>	<input type="text" id="co_time_target_{{$index}}" class="form-control" name="co_time_target_{{$index}}" ng-focus="validateOtherFields(17,$index,'co_time_target_'+$index)"  ng-model="extrusionEntry.co_time_target" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('co_time_target_'+$index,$index,'co_time_target')" required="">
								</td>
						
            <td>	<input type="text" id="co_time_actual_{{$index}}" class="form-control" name="co_time_actual_{{$index}}" ng-focus="validateOtherFields(18,$index,'co_time_actual_'+$index)" ng-model="extrusionEntry.co_time_actual" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('co_time_actual_'+$index,$index,'co_time_actual')" required="">
						 		</td>
                        		
            <td>	<input type="text" id="down_time_{{$index}}" class="form-control" name="down_time_{{$index}}" ng-focus="validateOtherFields(19,$index,'down_time_'+$index)" ng-model="extrusionEntry.down_time" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('down_time_'+$index,$index,'down_time')" required="">
							  	</td>
                        	
            <td>	<input type="text" id="bd_time_{{$index}}" class="form-control" name="bd_time_{{$index}}" ng-focus="validateOtherFields(20,$index,'bd_time_'+$index)" ng-model="extrusionEntry.bd_time" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('bd_time_'+$index,$index,'bd_time')" required="">
							   </td>
						   
             <td>	<input type="text" id="prodrun_time_{{$index}}" class="form-control" name="prodrun_time_{{$index}}" ng-focus="validateOtherFields(21,$index,'prodrun_time_'+$index)" ng-model="extrusionEntry.prodrun_time" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('prodrun_time_'+$index,$index,'prodrun_time')" required="">
									</td>
                        		
            <td>	<input type="text" id="line_rej_target_{{$index}}" class="form-control" name="line_rej_target_{{$index}}" ng-focus="validateOtherFields(22,$index,'line_rej_target_'+$index)" ng-model="extrusionEntry.line_rej_target" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-keyup="validateField('line_rej_target_'+$index,$index,'line_rej_target')" required="">
									</td>
                        	
            <td>	<input type="text" id="line_rej_actual_{{$index}}" class="form-control" name="line_rej_actual_{{$index}}" ng-focus="validateOtherFields(23,$index,'line_rej_actual_'+$index)" ng-model="extrusionEntry.line_rej_actual" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-keyup="validateField('line_rej_actual_'+$index,$index,'line_rej_actual')" required="">
							   </td>
						   
            <td>	<input type="text" id="co_scrap_taget_{{$index}}" class="form-control" name="co_scrap_taget_{{$index}}" ng-focus="validateOtherFields(24,$index,'co_scrap_taget_'+$index)" ng-model="extrusionEntry.co_scrap_taget" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-keyup="validateField('co_scrap_taget_'+$index,$index,'co_scrap_taget')" required="">
							    </td>
						    
            <td>	<input type="text" id="co_scrap_actual_{{$index}}" class="form-control" name="co_scrap_actual_{{$index}}" ng-focus="validateOtherFields(25,$index,'co_scrap_actual_'+$index)" ng-model="extrusionEntry.co_scrap_actual" placeholder=""  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-keyup="validateField('co_scrap_actual_'+$index,$index,'co_scrap_actual')" required="">
							 	</td>
                        	
            <td>	<input type="text" id="no_of_co_{{$index}}" class="form-control" name="no_of_co_{{$index}}" ng-focus="validateOtherFields(26,$index,'no_of_co_'+$index)" ng-model="extrusionEntry.no_of_co" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('no_of_co_'+$index,$index,'no_of_co')" required="">
									</td>
             <td>	<input type="text" id="no_of_Setup_{{$index}}" class="form-control" name="no_of_Setup_{{$index}}" ng-focus="validateOtherFields(27,$index,'no_of_Setup_'+$index)" ng-model="extrusionEntry.no_of_Setup" placeholder="" ng-pattern ="/^[0-9]*$/" ng-keyup="validateField('no_of_Setup_'+$index,$index,'no_of_Setup')" required="">
									</td>  
                <td><input type="text" id="trail_rej_{{$index}}" class="form-control" name="trail_rej_{{$index}}" ng-focus="validateOtherFields(28,$index,'trail_rej_'+$index)" ng-model="extrusionEntry.trail_rej" placeholder="" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" ng-keyup="validateField('trail_rej_'+$index,$index,'trail_rej')" required="">
						 </td>        		         		
        </tr>

    </tbody>
</table>--></div></div></br>
					<div class="contact-form">
						<input type="submit" value="Submit" class="submitButtn" ng-click="insertExtrusionRecord($event)">
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
    <!-- js
    <script src="resources/js/jquery-2.2.3.min.js"></script>-->
    <script src="resources/js/sprConfig.js"></script>
    <script src="resources/js/extrusion.js"></script>
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
           // document.getElementById("password1").onchange = validatePassword;
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
    <script src="resources/js/move-top.js "></script>
    <script src="resources/js/easing.js "></script>
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
    <script src="resources/js/SmoothScroll.min.js "></script>
    <!-- //smooth-scrolling-of-move-up -->
    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.js ">
    </script>
    <!-- //Bootstrap Core JavaScript -->
 <script>
 $(".table-body").scroll(function ()
			{ console.log(this.scrollTop);
			         $(".table-header")[0].style.top = (this.scrollTop -5) + 'px';       
			    });
   </script>
		
</body>

</html>