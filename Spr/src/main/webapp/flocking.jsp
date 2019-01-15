<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
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
        
	    $('#flocking_date').datepicker({
	        minDate: '-30d',
	        maxDate: '+0d',
	        onSelect: function(dateStr) {
	            var min = $(this).datepicker('getDate') || new Date(); // Selected date or today if none
	            var max = new Date(min.getTime());
	          //  max.setMonth(max.getMonth() + 1); // Add one month
	         
	        }
	    });
	 });


	</script>
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
    <span class="close">&times;</span>
	<center><img src="resources/images/loader.gif" alt="Italian Trulli"  >
  </center>  
  </div>

</div>


<div id="myModal" class="processLoader1" ng-show="submitFlag" style="display:none">
<div class="processLoader-content1" style="width:60%;">
    <span class="close">&times;</span>
<img src="resources/images/logo.png" alt="Italian Trulli"  >
   <h1 style="display:inline-block;">Data Submitted Successfully for <span style="color:grey;"><u></br>Plant:-{{plantno}}/Flocking/Shift:-{{shift}}/Spr no till {{lastInsertedSprNo}}</u></span></h1>
	<center><button ng-click="submitok()" >OK</button></center>
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
                       
                        
                     <center><h1  aria-current="page">Flocking</h1>
                  </center>
                </nav>
            </div>
        </div>
        <!-- //breadcrumbs -->

        <!-- contact -->
        <section class="wthree-row pt-0 pb-5 w3-contact">
            <div class="container-fluid py-sm-0 pt-0 pb-5">
                
                <div class="row ">
                    <div class="col-lg-12 wthree-form-left">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            
                          <form action="#" method="post" name="flocking_form">
				<div class="contact-grids1 w3agile-6">
					<div class="row">
						<!--<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Spr No.</label>
							<input type="text" class="form-control" name="sno" ng-model="sno" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="" readonly >
							<span style="color:red" ng-show="flocking_form.sno.$touched && flocking_form.sno.$invalid">*Cannot Leave Empty.Invalid Data Format. </span>
						</div>-->
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Company</label>
							<select type="text" id="company" class="form-control" name="company" ng-blur="validateHeaderField('company')" ng-model="company"  required="">
						 <option value="" >Select for the company</option>
							 <option value="Ppap">PPAP</option>
    <option value="Pti">PTI</option>
    </select>
						<span style="color:red" ng-show="flocking_form.company.$touched && flocking_form.company.$invalid">*Cannot Leave Empty </span>
						</div>
						
					
						
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">H.O.D</label>
							<input type="text" id="hod" class="form-control" name="hod" ng-model="hod" placeholder="Data can be in characters and numeric also" ng-maxlength="50" ng-pattern="/^[a-zA-Z0-9]+$/" required="">
						    <span style="color:red" ng-show="flocking_form.hod.$touched && flocking_form.hod.$invalid">*Cannot Leave Empty.Invalid Data Format. </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User ID</label>
							<input type="text" id="user_id" class="form-control" name="user_id" ng-model="user_id" placeholder="" required="" readonly>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User Plant No</label>
							<input type="text" id="user_plant_no" class="form-control" name="user_plant_no" ng-model="user_plant_no"  placeholder="" required readonly>
						
						
					<span style="color:red" ng-show="flocking_form.user_plant_no.$touched && flocking_form.user_plant_no.$invalid">*Cannot Leave Empty </span>	
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Flocking Date</label>
							<input type="text" id="flocking_date" class="form-control"  name="flocking_date" ng-model="flocking_date" placeholder="" required>
							<span style="color:red" ng-show="flocking_form.flocking_date.$touched && flocking_form.flocking_date.$invalid">*Cannot Leave Empty </span>	
						
							
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Plant No.</label>
							<select type="text" id="plantno" class="form-control" name="plantno" ng-blur="validateHeaderField('plantno')" ng-model="plantno" placeholder="" required="">
						<option value="" hidden>Select For the Plant No. </option>
							 <option value="Plant1">Plant-1</option>
    <option value="Plant2">Plant-2</option>
     <option value="Plant5">Plant-5</option>
    </select>
						<span style="color:red" ng-show="flocking_form.plant_no.$touched && flocking_form.plant_no.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Shift</label>
							<select type="text" id="shift" class="form-control" name="shift" ng-blur="validateHeaderField('shift')" ng-model="shift" placeholder="" required="">
						 <option value="" hidden>Select from the list </option>
							 <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="G">G</option>
    </select>
						<span style="color:red" ng-show="flocking_form.shift.$touched && flocking_form.shift.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Line</label>
							<input type="text" id="line" class="form-control" name="line" ng-blur="validateHeaderField('line')" ng-model="line" placeholder="Data should only contain numeric value" ng-maxlength="2" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.line.$touched && flocking_form.line.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Customer</label>
							<select type="text" id="customer" class="form-control" name="customer" ng-blur="validateHeaderField('customer')" ng-model="customer" placeholder="Select For the Customer Name" ng-change="loadModelListByCustomerGroup()" required>
						<option value="" >Select For the Customer Name </option>
							 <option ng-repeat="customerGroup in listOfCustomerGroup | orderBy" value="{{customerGroup}}">{{customerGroup}}</option>
							 
    </select>
						<span style="color:red" ng-show="flocking_form.customer.$touched && flocking_form.customer.$invalid">*Cannot Leave Empty </span>
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Car Model</label>
							<select type="text" id="car_model" class="form-control" name="car_model" ng-blur="validateHeaderField('car_model')" placeholder="" ng-model="car_model" ng-change="loadPartListByCustomerGroupAndModel()"  required>
						<option value="" selected>Select for the Model </option>
							 <option ng-repeat="model in modelList | orderBy" value="{{model}}">{{model}}</option>
  
    </select>
						<span style="color:red" ng-show="flocking_form.car_model.$touched && flocking_form.car_model.$invalid">*Cannot Leave Empty </span>
						</div>
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Part Name</label>
							<select type="text" id="part_name" class="form-control" name="part_name" ng-blur="validateHeaderField('part_name')" placeholder="" ng-model="part_name"  required>
						<option value="" selected>Select for the Part name </option>
							 <option ng-repeat="part in partList" value={{part}}>{{part}}</option>
    </select>
						<span style="color:red" ng-show="flocking_form.part_name.$touched && flocking_form.part_name.$invalid">*Cannot Leave Empty </span>
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">FR RR</label>
							<select type="text" id="fr_rr"  class="form-control" name="fr_rr" ng-blur="validateHeaderField('fr_rr')" placeholder="" ng-model="fr_rr" required>
						    <option value="" hidden>Select from the list </option>
							 <option value="FR">FR</option>
    <option value="RR">RR</option>
    </select>
						<span style="color:red" ng-show="flocking_form.fr_rr.$touched && flocking_form.fr_rr.$invalid">*Cannot Leave Empty </span>
						
						
						
						</div>
						
						
						<!--<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Production Target</label>
							<input type="text" class="form-control" name="prod_target" ng-model="prod_target" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="flocking_form.prod_target.$touched && flocking_form.prod_target.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Production Actual</label>
							<input type="text" class="form-control" name="prod_actual" ng-model="prod_actual" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="flocking_form.prod_actual.$touched && flocking_form.prod_actual.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Used Man Power</label>
							<input type="text" class="form-control" name="used_man_power" ng-model="used_man_power" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="flocking_form.used_man_power.$touched && flocking_form.used_man_power.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Down Time </label>
							<input type="text" class="form-control" name="down_time" ng-model="down_time" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="flocking_form.down_time.$touched && flocking_form.down_time.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Break Down Time</label>
							<input type="text" class="form-control" name="bd_time" ng-model="bd_time" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						 <span style="color:red" ng-show="flocking_form.bd_time.$touched && flocking_form.bd_time.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Product Run Time</label>
							<input type="text" class="form-control" name="prodrun_time" ng-model="prodrun_time" placeholder="Data can be in numeric and decimal also" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
						<span style="color:red" ng-show="flocking_form.prodrun_time.$touched && flocking_form.prodrun_time.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
                        
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Change Over Time Target</label>
							<input type="text" class="form-control" name="co_time_target" ng-model="co_time_target" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.co_time_target.$touched && flocking_form.co_time_target.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Change Over Time Actual</label>
							<input type="text" class="form-control" name="co_time_actual" ng-model="co_time_actual" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.co_time_actual.$touched && flocking_form.co_time_actual.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">No. Of Change Over </label>
							<input type="text" class="form-control" name="no_of_co" ng-model="no_of_co" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.no_of_co.$touched && flocking_form.no_of_co.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Start Up Time Target</label>
							<input type="text" class="form-control" name="startuptime_target" ng-model="startuptime_target" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.startuptime_target.$touched && flocking_form.startuptime_target.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Start Up Time Actual</label>
							<input type="text" class="form-control" name="startuptime_actual" ng-model="startuptime_actual" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.startuptime_actual.$touched && flocking_form.startuptime_actual.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">No. Of Set Up</label>
							<input type="text" class="form-control" name="no_of_setup" ng-model="no_of_setup" placeholder="Data should be in numeric only" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="flocking_form.no_of_setup.$touched && flocking_form.no_of_setup.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Internal Rej</label>
							<input type="text" class="form-control" name="internal_rej" ng-model="internal_rej" placeholder="Data can be numeric or decimal" ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
						<span style="color:red" ng-show="flocking_form.internal_rej.$touched && flocking_form.internal_rej.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
                        </div>-->
                        
                        
                        
                        
						</div>
										</br>
					<div class="contact-form">
						<input type="button" value="Add More Rows" ng-click="insertFlockingRecord($event,'ADD_NEWROW')" >
						
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
            <th class="header-cell col1">Used Man Power</th>
            <th class="header-cell col1">Down Time</th>
            <th class="header-cell col1">Break Down Time</th>
            <th class="header-cell col1">Product Run Time</th>
             <th class="header-cell col1">Change Over Time Target</th>
            <th class="header-cell col1">Change Over Time Actual</th>
            
            
             <th class="header-cell col1">No. OF Change Over</th>
            <th class="header-cell col1">Start Up Time Target</th>
            <th class="header-cell col1">Start Up Time Actual</th>
            <th class="header-cell col1">No. Of Set Up</th>
            <th class="header-cell col1">Internal Rej</th>
      </tr>
    </thead>
  
    <tbody style="display: block;">
       <tr ng-repeat="flockingEntry in flockingRecordsList">
        <td class="header-cell col1">
        <input type="text" id="flocking_{{$index}}" class="form-control" name="flocking_{{$index}}" ng-model="flockingEntry.sno"   required readonly >
        </td>
            <td class="header-cell col1">	<input type="text" id="prod_target_{{$index}}" class="form-control" name="prod_target_{{$index}}" ng-focus="validateOtherFields(10,$index,'prod_target_'+$index)" ng-blur="validateField('prod_target_'+$index,$index,'prod_target',$event)" ng-model="flockingEntry.prod_target"  ng-pattern ="/^[0-9]*$/" required="">
							  		     </td>
						      
            <td class="header-cell col1">		<input type="text" id="prod_actual_{{$index}}" class="form-control" name="prod_actual_{{$index}}" ng-focus="validateOtherFields(11,$index,'prod_actual_'+$index)" ng-blur="validateField('prod_actual_'+$index,$index,'prod_actual',$event)" ng-model="flockingEntry.prod_actual"  ng-pattern ="/^[0-9]*$/" required="">
								  </td>
         
            <td class="header-cell col1">		<input type="text" id="used_man_power_{{$index}}" class="form-control" name="used_man_power_{{$index}}" ng-focus="validateOtherFields(12,$index,'used_man_power_'+$index)" ng-blur="validateField('used_man_power_'+$index,$index,'used_man_power',$event)" ng-model="flockingEntry.used_man_power"  ng-pattern ="/^[0-9]*$/" required="">
								   </td>
						    
            <td class="header-cell col1">	<input type="text" id="down_time_{{$index}}" class="form-control" name="down_time_{{$index}}" ng-focus="validateOtherFields(13,$index,'down_time_'+$index)" ng-blur="validateField('down_time_'+$index,$index,'down_time',$event)" ng-model="flockingEntry.down_time"  ng-pattern ="/^[0-9]*$/" required="">
						 					 
            </td>
            
            <td class="header-cell col1">	<input type="text" id="bd_time_{{$index}}" class="form-control" name="bd_time_{{$index}}" ng-focus="validateOtherFields(14,$index,'bd_time_'+$index)" ng-blur="validateField('bd_time_'+$index,$index,'bd_time',$event)" ng-model="flockingEntry.bd_time"  ng-pattern ="/^[0-9]*$/" required="">
								    </td>
						   
             <td class="header-cell col1">		<input type="text" id="prodrun_time_{{$index}}" class="form-control" name="prodrun_time_{{$index}}" ng-focus="validateOtherFields(15,$index,'prodrun_time_'+$index)" ng-blur="validateField('prodrun_time_'+$index,$index,'prodrun_time',$event)" ng-model="flockingEntry.prodrun_time"  ng-pattern="/^[0-9]*$/" required="">
								    </td>
						    
            <td class="header-cell col1">	<input type="text" id="co_time_target_{{$index}}" class="form-control" name="co_time_target_{{$index}}" ng-focus="validateOtherFields(16,$index,'co_time_target_'+$index)" ng-blur="validateField('co_time_target_'+$index,$index,'co_time_target',$event)" ng-model="flockingEntry.co_time_target"  ng-pattern ="/^[0-9]*$/" required="">
									</td>
						
            <td class="header-cell col1">	<input type="text" id="co_time_actual_{{$index}}" class="form-control" name="co_time_actual_{{$index}}" ng-focus="validateOtherFields(17,$index,'co_time_actual_'+$index)" ng-blur="validateField('co_time_actual_'+$index,$index,'co_time_actual',$event)" ng-model="flockingEntry.co_time_actual"  ng-pattern ="/^[0-9]*$/" required="">
							 		</td>
                        		
            <td class="header-cell col1">		<input type="text" id="no_of_co_{{$index}}" class="form-control" name="no_of_co_{{$index}}" ng-focus="validateOtherFields(18,$index,'no_of_co_'+$index)" ng-blur="validateField('no_of_co_'+$index,$index,'no_of_co',$event)" ng-model="flockingEntry.no_of_co"  ng-pattern ="/^[0-9]*$/" required="">
							  	</td>
                        	
            <td class="header-cell col1">		<input type="text" id="startuptime_target_{{$index}}" class="form-control" name="startuptime_target_{{$index}}" ng-focus="validateOtherFields(19,$index,'startuptime_target_')" ng-blur="validateField('startuptime_target_'+$index,$index,'startuptime_target',$event)" ng-model="flockingEntry.startuptime_target"  ng-pattern ="/^[0-9]*$/" required="">
							   </td>
						   
             <td class="header-cell col1">		<input type="text" id="startuptime_actual_{{$index}}" class="form-control" name="startuptime_actual_{{$index}}" ng-focus="validateOtherFields(20,$index,'startuptime_actual_')" ng-blur="validateField('startuptime_actual_'+$index,$index,'startuptime_actual',$event)" ng-model="flockingEntry.startuptime_actual"  ng-pattern ="/^[0-9]*$/" required="">
									</td>
                        		
            <td class="header-cell col1">	<input type="text" id="no_of_setup_{{$index}}" class="form-control" name="no_of_setup_{{$index}}" ng-focus="validateOtherFields(21,$index,'no_of_setup_'+$index)" ng-blur="validateField('no_of_setup_'+$index,$index,'no_of_setup',$event)" ng-model="flockingEntry.no_of_setup"  ng-pattern ="/^[0-9]*$/" required="">
										</td>
                        	
            <td class="header-cell col1">	<input type="text" id="internal_rej_{{$index}}" class="form-control" name="internal_rej_{{$index}}" ng-focus="validateOtherFields(22,$index,'internal_rej_'+$index)" ng-blur="validateField('internal_rej_'+$index,$index,'internal_rej',$event)" ng-model="flockingEntry.internal_rej"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
								   </td>
						   
                 		         		
        </tr>
     
    </tbody>
  </table>
</div>
								 <!--  <table class="sprTable">
								 
    <thead>
   
        <tr>
        <td><label class="col-form-label">SPR No.</label></td>
            <td><label class="col-form-label">Production Target</label></td>
            <td><label class="col-form-label">Production Actual</label></td>
            <td><label class="col-form-label">Used Man Power</label></td>
            <td><label class="col-form-label">Down Time</label></td>
            <td><label class="col-form-label">Break Down Time</label></td>
            <td><label class="col-form-label">Product Run Time</label></td>
             <td><label class="col-form-label">Change Over Time Target</label></td>
            <td><label class="col-form-label">Change Over Time Actual</label></td>
            
            
             <td><label class="col-form-label">No. OF Change Over</label></td>
            <td><label class="col-form-label">Start Up Time Target</label></td>
            <td><label class="col-form-label">Start Up Time Actual</label></td>
            <td><label class="col-form-label">No. Of Set Up</label></td>
            <td><label class="col-form-label">Internal Rej</label></td>
                        
        </tr>
    </thead>
    <tbody>
    
        <tr ng-repeat="flockingEntry in flockingRecordsList">
        <td>
        <input type="text" id="flocking_$index" class="form-control" name="sno" ng-model="flockingEntry.sno"   required readonly >
        </td>
            <td>	<input type="text" id="prod_target_{{$index}}" class="form-control" name="prod_target_{{$index}}" ng-focus="validateOtherFields(10,$index,'prod_target_'+$index)" ng-keyup="validateField('prod_target_'+$index,$index,'prod_target')" ng-model="flockingEntry.prod_target"  ng-pattern ="/^[0-9]*$/" required="">
							  		     </td>
						      
            <td>		<input type="text" id="prod_actual_{{$index}}" class="form-control" name="prod_actual_{{$index}}" ng-focus="validateOtherFields(11,$index,'prod_actual_'+$index)" ng-keyup="validateField('prod_actual_'+$index,$index,'prod_actual')" ng-model="flockingEntry.prod_actual"  ng-pattern ="/^[0-9]*$/" required="">
								  </td>
         
            <td>		<input type="text" id="used_man_power_{{$index}}" class="form-control" name="used_man_power_{{$index}}" ng-focus="validateOtherFields(12,$index,'used_man_power_'+$index)" ng-keyup="validateField('used_man_power_'+$index,$index,'used_man_power')" ng-model="flockingEntry.used_man_power"  ng-pattern ="/^[0-9]*$/" required="">
								   </td>
						    
            <td>	<input type="text" id="down_time_{{$index}}" class="form-control" name="down_time_{{$index}}" ng-focus="validateOtherFields(13,$index,'down_time_'+$index)" ng-keyup="validateField('down_time_'+$index,$index,'down_time')" ng-model="flockingEntry.down_time"  ng-pattern ="/^[0-9]*$/" required="">
						 					 
            </td>
            
            <td>	<input type="text" id="bd_time_{{$index}}" class="form-control" name="bd_time_{{$index}}" ng-focus="validateOtherFields(14,$index,'bd_time_'+$index)" ng-keyup="validateField('bd_time_'+$index,$index,'bd_time')" ng-model="flockingEntry.bd_time"  ng-pattern ="/^[0-9]*$/" required="">
								    </td>
						   
             <td>		<input type="text" id="prodrun_time_{{$index}}" class="form-control" name="prodrun_time_{{$index}}" ng-focus="validateOtherFields(15,$index,'prodrun_time_'+$index)" ng-keyup="validateField('prodrun_time_'+$index,$index,'prodrun_time')" ng-model="flockingEntry.prodrun_time"  ng-pattern="/^[0-9]*$/" required="">
								    </td>
						    
            <td>	<input type="text" id="co_time_target_{{$index}}" class="form-control" name="co_time_target_{{$index}}" ng-focus="validateOtherFields(16,$index,'co_time_target_'+$index)" ng-keyup="validateField('co_time_target_'+$index,$index,'co_time_target')" ng-model="flockingEntry.co_time_target"  ng-pattern ="/^[0-9]*$/" required="">
									</td>
						
            <td>	<input type="text" id="co_time_actual_{{$index}}" class="form-control" name="co_time_actual_{{$index}}" ng-focus="validateOtherFields(17,$index,'co_time_actual_'+$index)" ng-keyup="validateField('co_time_actual_'+$index,$index,'co_time_actual')" ng-model="flockingEntry.co_time_actual"  ng-pattern ="/^[0-9]*$/" required="">
							 		</td>
                        		
            <td>		<input type="text" id="no_of_co_{{$index}}" class="form-control" name="no_of_co_{{$index}}" ng-focus="validateOtherFields(18,$index,'no_of_co_'+$index)" ng-keyup="validateField('no_of_co_'+$index,$index,'no_of_co')" ng-model="flockingEntry.no_of_co"  ng-pattern ="/^[0-9]*$/" required="">
							  	</td>
                        	
            <td>		<input type="text" id="startuptime_target_{{$index}}" class="form-control" name="startuptime_target_{{$index}}" ng-focus="validateOtherFields(19,$index,'startuptime_target_')" ng-keyup="validateField('startuptime_target_'+$index,$index,'startuptime_target')" ng-model="flockingEntry.startuptime_target"  ng-pattern ="/^[0-9]*$/" required="">
							   </td>
						   
             <td>		<input type="text" id="startuptime_actual_{{$index}}" class="form-control" name="startuptime_actual_{{$index}}" ng-focus="validateOtherFields(20,$index,'startuptime_actual_')" ng-keyup="validateField('startuptime_actual_'+$index,$index,'startuptime_actual')" ng-model="flockingEntry.startuptime_actual"  ng-pattern ="/^[0-9]*$/" required="">
									</td>
                        		
            <td>	<input type="text" id="no_of_setup_{{$index}}" class="form-control" name="no_of_setup_{{$index}}" ng-focus="validateOtherFields(21,$index,'no_of_setup_'+$index)" ng-keyup="validateField('no_of_setup_'+$index,$index,'no_of_setup')" ng-model="flockingEntry.no_of_setup"  ng-pattern ="/^[0-9]*$/" required="">
										</td>
                        	
            <td>	<input type="text" id="internal_rej_{{$index}}" class="form-control" name="internal_rej_{{$index}}" ng-focus="validateOtherFields(22,$index,'internal_rej_'+$index)" ng-keyup="validateField('internal_rej_'+$index,$index,'internal_rej')" ng-model="flockingEntry.internal_rej"  ng-pattern="/^\-{0,1}\d+(.\d+){0,1}$/" required="">
								   </td>
						   
                 		         		
        </tr>

    </tbody>
</table>--></div></div></br>
					
					<div class="contact-form">
						<input type="submit" value="Submit" class="submitButtn" ng-click="insertFlockingRecord($event)">
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
    <script src="resources/js/flocking.js"></script>
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
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
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