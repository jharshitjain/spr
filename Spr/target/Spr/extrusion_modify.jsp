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



    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    





<script data-require="angular.js@1.1.5" data-semver="1.1.5" src="http://code.angularjs.org/1.1.5/angular.min.js"></script>
    <link href="resources/css/bootstrapmodify.css" rel='stylesheet' type='text/css' />
    <script data-require="angular-ui-bootstrap@0.3.0" data-semver="0.3.0" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.3.0.min.js"></script>


<link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    
  


<style>
    
.sprTable {
    border-collapse: collapse;
    table-layout: auto;
  width: 100% ;
  overflow: auto;
    display: block;
    
}
.sprTable thead {
  
    background-color: #EFEFEF;
   
}
.sprTable tbody {
 
    display: block;
     
}
.sprTable tbody {

    height: auto;
}
.sprTable tr{
width:auto;
}
.sprTable td, .sprTable th {
    text-color:coral;
    height: 20px;
    border: solid 2px black;
     overflow:hidden;
    
      min-width:96px;
    max-width:96px;
}





</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
    
    

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
</head>

<body class="cbp-spmenu-push" ng-app="sprApp" ng-controller="validationCtrl" ng-init="loadExtrusionList()" >

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
                        Extrusion</h1>
                   </center>
                   
                </nav>
                
            </div>
        </div>  
        <!-- //breadcrumbs -->

        <!-- contact -->
        <section class="wthree-row pt-0 pb-0 w3-contact">
            <div class="container-fluid py-sm-0 pt-0 pb-5">
                
                <div class="row ">
                    <div class="col-lg-12 wthree-form-left">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            
                           <form action="#" method="post" name="extrusion_form">
				<div class="contact-grids1 w3agile-6">
					<div class="row">
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Spr No.</label>
							<input type="text" class="form-control" name="sno" ng-model="sno"   placeholder="Data should be in numeric only" required  >
							
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Entry Date</label>
							<input type="date"  id="entry_date"  class="form-control"  name="entry_date" ng-model="entry_date" placeholder="" required >
							
						</div>
						
						<div class="col-md-2 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Plant No.</label>
							<select type="text" id="plantno"  class="form-control" name="plantno" ng-model="plantno" placeholder="" required>
						<option value="" selected>Select For the Plant No. </option>
							 <option value="Plant1">Plant-1</option>
    <option value="Plant2">Plant-2</option>
     <option value="Plant5">Plant-5</option>
    </select>
						</div>
						
						
						
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
        <div class="container-fluid contact-form" style=" text-align: right;">
						<input type="button" value="Approve ALL" class="btn btn-sm btn-warning approveBtn " ng-click="approveAllEntry()" ng-show="user_role!='TEAM LEADER'" ng-click="test()" >
			<span style="color:grey;font-size:1.5em;" ng-show="errorFlag2"><b><span style="color:red;">*</span>{{errorMsg2}}</b></span>
			<span style="color:grey;font-size:1.5em;" ng-show="errorFlag1"><b><span style="color:red;">*</span>{{errorMsg1}}</b></span>			
			<span style="color:grey;font-size:1.5em;" ng-show="prodActualErrorFlag"><b><span style="color:red;">*</span>{{prodActualErrorMessage}}</b></span>
					
					
        <!-- login and register modal -->
        <table class="sprTable">
        <thead>
          <tr>
          <th>SPR No.</th>
          <th style='display:none'>Entry Date</th>
          <th style='display:none'>Extrusion Id</th>
           <th>Company</th>
          <th>H.O.D</th>
           <th>User ID</th>
            <th>User Plant No</th>
             <th>Extrusion Date</th>
              <th>Plant No.</th>
               <th>Shift</th>
                <th>Line</th>
                 
                  <th>Customer</th>
                   <th>Car Model</th>
                    <th>Part Name</th>
                     <th>FR RR</th>
                      <th>Trial or Prod</th>
             <th>Production Target</th>
            <th>Production Actual</th>
            <th>Product KG</th>
            <th>Production Plan Time</th>
            <th>Set Up Time Target</th>
            <th>Set Up Time Actual</th>
             <th>Change Over Time Target</th>
            <th>Change Over Time Actual</th>
            
            <th>Down Time</th>
            <th>Break Down Time</th>
            <th>Product Run Time</th>
             <th>Line Rej Target</th>
            <th>Line Rej Actual</th>
            <th>Change Over Scrap Target</th>
            <th>Change Over Scrap Actual</th>
            <th>No. OF Change Over</th>
                        <th>No. OF SetUp</th>
           <th>Trail Rej</th>
          <th>Options</th>
          </tr>
        </thead>

  <tbody>
      
          <tr ng-repeat="extrusionRecord in filteredItems | filter:{sno:sno,plantno:plantno,entry_date:entry_date }" >  
          <td style="text-align:center;">{{extrusionRecord.extrusion_id}} <input type="text" id="extrusion_id_{{$index}}" name="extrusion_id_{{$index}}" value="{{extrusionRecord.extrusion_id}}" style="display:none"/></td>
          <td style="text-align:center;display:none">
           <input type="text" class="form-control" id="entry_date_{{$index}}" name="entry_date_{{$index}}" value="{{extrusionRecord.entry_date  | date:'yyyy-MM-dd'}}" style="display:none" readonly /> </td>
          <td style="text-align:center;display:none">{{extrusionRecord.sno}} <input type="text" id="sno_{{$index}}" name="sno_{{$index}}" value="{{extrusionRecord.sno}}" style="display:none"/></td>
<td><span id="span_company_{{$index}}" name="span_company_{{$index}}">{{extrusionRecord.company}}</span> 

<select type="text" id="company_{{$index}}" class="form-control"
name="company_{{$index}}" value="{{extrusionRecord.company}}" style="display:none">
							 <option value="{{extrusionRecord.company}}" hidden >{{extrusionRecord.company}}</option>
                                                          
                                                
							 <option value="PPAP">PPAP</option>
    <option value="PTI">PTI</option>
     
    </select>



</td>
            <td><span id="span_hod_{{$index}}" name="span_hod_{{$index}}">{{extrusionRecord.hod}}</span>
            <input type="text" class="form-control" id="hod_{{$index}}" name="hod_{{$index}}" value="{{extrusionRecord.hod}}" style="display:none" /></td>
<td><span id="span_user_id_{{$index}}" name="span_user_id_{{$index}}">{{extrusionRecord.user_id}}</span>
  <input type="text" class="form-control" id="user_id_{{$index}}" name="user_id_{{$index}}" value="{{extrusionRecord.user_id}}" style="display:none" readonly /></td>
            <td><span id="span_user_plant_no_{{$index}}" name="span_user_plant_no_{{$index}}">{{extrusionRecord.user_plant_no}}</span>
            <input type="text" class="form-control" id="user_plant_no_{{$index}}" name="user_plant_no_{{$index}}" value="{{extrusionRecord.user_plant_no}}" style="display:none" readonly /></td>
            <td><span id="span_extrusion_date_{{$index}}" name="span_extrusion_date_{{$index}}">{{extrusionRecord.extrusion_date | date:'yyyy-MM-dd'}}</span>
            <input type="text" class="form-control" id="extrusion_date_{{$index}}" name="extrusion_date_{{$index}}" value="{{extrusionRecord.extrusion_date  | date:'yyyy-MM-dd'}}" style="display:none" readonly /></td>
            <td><span id="span_plantno_{{$index}}" name="span_plantno_{{$index}}">{{extrusionRecord.plantno}}</span>
            
            <select type="text" class="form-control" id="plantno_{{$index}}"
             name="plantno_{{$index}}" value="{{extrusionRecord.plantno}}" style="display:none">
						<option value="{{extrusionRecord.plantno}}" hidden >{{extrusionRecord.plantno}} </option>
							 <option value="Plant1">Plant-1</option>
    <option value="Plant2">Plant-2</option>
     <option value="Plant5">Plant-5</option>
    </select>
            
            </td>
<td><span id="span_shift_{{$index}}" name="span_shift_{{$index}}">{{extrusionRecord.shift}}</span>
<select type="text" class="form-control" id="shift_{{$index}}" 
name="shift_{{$index}}" value="{{extrusionRecord.shift}}" style="display:none" />


							<option value="{{extrusionRecord.shift}}" hidden>{{extrusionRecord.shift}} </option>
							 <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="G">G</option>
    </select>
</td>
            <td><span id="span_line_{{$index}}" name="span_line_{{$index}}">{{extrusionRecord.line}}</span>
            <input type="text" class="form-control" id="line_{{$index}}" name="line_{{$index}}" value="{{extrusionRecord.line}}" style="display:none" /></td>
            
            <td><span id="span_customer_{{$index}}" name="span_customer_{{$index}}">{{extrusionRecord.customer}}</span>
            
           <select type="text" class="form-control" id="customer_{{$index}}" 
            name="customer_{{$index}}"  style="display:none" value="{{extrusionRecord.customer}}"  ng-model="customerGroupModel_$index" ng-init="customerGroupModel_$index='{{extrusionRecord.customer}}'" ng-change="loadModelListByCustomerGroup($index,'customer_')" placeholder="{{extrusionRecord.customer}}" required>
						<option value="{{extrusionRecord.customer}}"  selected>{{extrusionRecord.customer}} </option>
							 <option ng-repeat="customerGroup in listOfCustomerGroup | orderBy" value="{{customerGroup}}">{{customerGroup}}</option>
							 <!--<ng-options="customerGroup in listOfCustomerGroup">-->
   
    </select> 
            
            
            </td>
<td><span id="span_car_model_{{$index}}" name="span_car_model_{{$index}}">{{extrusionRecord.car_model}}</span>

<select type="text" class="form-control" id="car_model_{{$index}}" 
name="car_model_{{$index}}" value="{{extrusionRecord.car_model}}" style="display:none" ng-model="modelGroupModel_$index" ng-init="modelGroupModel_$index='{{extrusionRecord.car_model}}'"  ng-change="loadPartListByCustomerGroupAndModel($index,'customer_','car_model_')" required>
						<option value="{{extrusionRecord.car_model}}" selected>{{extrusionRecord.car_model}} </option>
							 <option ng-repeat="model in modelList | orderBy" value="{{model}}">{{model}}</option>
  
    </select>

</td>
            <td><span id="span_part_name_{{$index}}" name="span_part_name_{{$index}}">{{extrusionRecord.part_name}}</span>
            
            							<select type="text" class="form-control" id="part_name_{{$index}}" 
            name="part_name_{{$index}}" value="{{extrusionRecord.part_name}}" style="display:none"  required>
						<option value="{{extrusionRecord.part_name}}" selected>{{extrusionRecord.part_name}} </option>
							 <option ng-repeat="part in partList" value={{part}}>{{part}}</option>
			    </select>
            
            
            </td>
            <td><span id="span_fr_rr_{{$index}}" name="span_fr_rr_{{$index}}">{{extrusionRecord.fr_rr}}</span>
            
            <select type="text" class="form-control" id="fr_rr_{{$index}}" 
            name="fr_rr_{{$index}}" value="{{extrusionRecord.fr_rr}}" style="display:none" >
						    <option value="{{extrusionRecord.fr_rr}}" hidden>{{extrusionRecord.fr_rr}} </option>
							 <option value="FR">FR</option>
    <option value="RR">RR</option>
    </select>
            
            </td>
            <td><span id="span_trial_or_prod_{{$index}}" name="span_trial_or_prod_{{$index}}">{{extrusionRecord.trial_or_prod}}</span>
            
            <select type="text" class="form-control" id="trial_or_prod_{{$index}}" 
            name="trial_or_prod_{{$index}}" value="{{extrusionRecord.trial_or_prod}}" style="display:none">
						    <option value="{{extrusionRecord.trial_or_prod}}" hidden>{{extrusionRecord.trial_or_prod}} </option>
							 <option value="Trial">Trial</option>
    <option value="Prod">Prod</option>
	<option value="Null">Null</option>
    </select> 
            
            </td>           
 <td><span id="span_prod_target_{{$index}}" name="span_prod_target_{{$index}}">{{extrusionRecord.prod_target}}</span>
 <input type="text" class="form-control" id="prod_target_{{$index}}" name="prod_target_{{$index}}" value="{{extrusionRecord.prod_target}}" style="display:none" /></td>
            <td><span id="span_prod_actual_{{$index}}" name="span_prod_actual_{{$index}}">{{extrusionRecord.prod_actual}}</span>
            <input type="text"  class="form-control" id="prod_actual_{{$index}}" name="prod_actual_{{$index}}" value="{{extrusionRecord.prod_actual}}" style="display:none" /></td>
            <td><span id="span_prod_kg_{{$index}}" name="span_prod_kg_{{$index}}">{{extrusionRecord.prod_kg}}</span>
            <input type="text" class="form-control" id="prod_kg_{{$index}}" name="prod_kg_{{$index}}" value="{{extrusionRecord.prod_kg}}" style="display:none" /></td>
            <td><span id="span_prodplan_time_{{$index}}" name="span_prodplan_time_{{$index}}">{{extrusionRecord.prodplan_time}}</span>
            <input type="text" class="form-control" id="prodplan_time_{{$index}}" name="prodplan_time_{{$index}}" value="{{extrusionRecord.prodplan_time}}" style="display:none" /></td>
            <td><span id="span_setuptime_taget_{{$index}}" name="span_setuptime_taget_{{$index}}">{{extrusionRecord.setuptime_taget}}</span>
            <input type="text" class="form-control" id="setuptime_taget_{{$index}}" name="setuptime_taget_{{$index}}" value="{{extrusionRecord.setuptime_taget}}" style="display:none" /></td>
            <td><span id="span_setuptime_actual_{{$index}}" name="span_setuptime_actual_{{$index}}">{{extrusionRecord.setuptime_actual}}</span>
            <input type="text" class="form-control" id="setuptime_actual_{{$index}}" name="setuptime_actual_{{$index}}" value="{{extrusionRecord.setuptime_actual}}" style="display:none" /></td>
			<td><span id="span_co_time_target_{{$index}}" name="span_co_time_target_{{$index}}">{{extrusionRecord.co_time_target}}</span>
			<input type="text" class="form-control" id="co_time_target_{{$index}}" name="co_time_target_{{$index}}" value="{{extrusionRecord.co_time_target}}" style="display:none" /></td>
<td><span id="span_co_time_actual_{{$index}}" name="span_co_time_actual_{{$index}}">{{extrusionRecord.co_time_actual}}</span>
<input type="text" class="form-control" id="co_time_actual_{{$index}}" name="co_time_actual_{{$index}}" value="{{extrusionRecord.co_time_actual}}" style="display:none" /></td>
            <td><span id="span_down_time_{{$index}}" name="span_down_time_{{$index}}">{{extrusionRecord.down_time}}</span>
            <input type="text" class="form-control" id="down_time_{{$index}}" name="down_time_{{$index}}" value="{{extrusionRecord.down_time}}" style="display:none" /></td>
            <td><span id="span_bd_time_{{$index}}" name="span_bd_time_{{$index}}">{{extrusionRecord.bd_time}}</span>
            <input type="text" class="form-control" id="bd_time_{{$index}}" name="bd_time_{{$index}}" value="{{extrusionRecord.bd_time}}" style="display:none" /></td>
            <td><span id="span_prodrun_time_{{$index}}" name="span_prodrun_time_{{$index}}">{{extrusionRecord.prodrun_time}}</span>
            <input type="text" class="form-control" id="prodrun_time_{{$index}}" name="prodrun_time_{{$index}}" value="{{extrusionRecord.prodrun_time}}" style="display:none" /></td>
<td><span id="span_line_rej_target_{{$index}}" name="span_line_rej_target_{{$index}}">{{extrusionRecord.line_rej_target}}</span>
<input type="text" class="form-control" id="line_rej_target_{{$index}}" name="line_rej_target_{{$index}}" value="{{extrusionRecord.line_rej_target}}" style="display:none" /></td>
            <td><span id="span_line_rej_actual_{{$index}}" name="span_line_rej_actual_{{$index}}">{{extrusionRecord.line_rej_actual}}</span>
            <input type="text" class="form-control" id="line_rej_actual_{{$index}}" name="line_rej_actual_{{$index}}" value="{{extrusionRecord.line_rej_actual}}" style="display:none" /></td>
            <td><span id="span_co_scrap_taget_{{$index}}" name="span_co_scrap_taget_{{$index}}">{{extrusionRecord.co_scrap_taget}}</span>
            <input type="text" class="form-control" id="co_scrap_taget_{{$index}}" name="co_scrap_taget_{{$index}}" value="{{extrusionRecord.co_scrap_taget}}" style="display:none" /></td>
            <td><span id="span_co_scrap_actual_{{$index}}" name="span_co_scrap_actual_{{$index}}">{{extrusionRecord.co_scrap_actual}}</span>
            <input type="text" class="form-control" id="co_scrap_actual_{{$index}}" name="co_scrap_actual_{{$index}}" value="{{extrusionRecord.co_scrap_actual}}" style="display:none" /></td>
  <td><span id="span_no_of_co_{{$index}}" name="span_no_of_co_{{$index}}">{{extrusionRecord.no_of_co}}</span>
  <input type="text" class="form-control" id="no_of_co_{{$index}}" name="no_of_co_{{$index}}" value="{{extrusionRecord.no_of_co}}" style="display:none" /></td>
            <td><span id="span_no_of_Setup_{{$index}}" name="span_no_of_Setup_{{$index}}">{{extrusionRecord.no_of_Setup}}</span>
            <input type="text" class="form-control" id="no_of_Setup_{{$index}}" name="no_of_Setup_{{$index}}" value="{{extrusionRecord.no_of_Setup}}" style="display:none" /></td>
            <td><span id="span_trail_rej_{{$index}}" name="span_trail_rej_{{$index}}">{{extrusionRecord.trail_rej}}</span>
            <input type="text" class="form-control" id="trail_rej_{{$index}}" name="trail_rej_{{$index}}" value="{{extrusionRecord.trail_rej}}" style="display:none" /></td>
          <td ><span class="btn btn-sm btn-success edit" id="editElement_{{$index}}" name="editElement_{{$index}}"
            ng-click="edit($index,extrusionRecord)" ng-show="((user_role=='TEAM LEADER' && extrusionRecord.isApproved=='0') 
            || (user_role=='GROUP LEADER' && (extrusionRecord.isApproved=='0' || extrusionRecord.isApproved=='1') 
            && (extrusionRecord.approvedBy=='1' || extrusionRecord.approvedBy=='0')) ||
           (user_role=='PLANT HEAD' && (extrusionRecord.isApproved=='0' || extrusionRecord.isApproved=='1') && (extrusionRecord.approvedBy=='1' || extrusionRecord.approvedBy=='0' || extrusionRecord.approvedBy=='2' ) ))"><i class="fa fa-edit"></i></span>
            <span class="btn btn-sm btn-warning" id="approveElement_{{$index}}" name="approveElement_{{$index}}" ng-click="approveEntry($index,'0','APPROVE_ENTRY')" ng-show="(user_role=='GROUP LEADER' && extrusionRecord.isApproved=='0') || (user_role=='PLANT HEAD' && extrusionRecord.approvedBy=='1') " ><i class="fa fa-check"></i></span>
            <span class="btn btn-sm btn-primary "  id="saveElement_{{$index}}" name="saveElement_{{$index}}"  ng-click="updateExtrusionRecord($index)" style="display:none"><i class="fa fa-save" ></i></span>
  <span class="btn btn-sm btn-info" ng-click="cancel($index)" id="cancelElement_{{$index}}" name="cancelElement_{{$index}}" ng-click="cancel($index)" style="display:none"><i class="fa fa-window-close" ></i>
      </td>           
          </tr>
        </tbody>
    </table>
   
 <div data-pagination="" data-num-pages="numOfPages()" 
      data-current-page="curPage" data-max-size="maxSize"  
      data-boundary-links="true"></div>

       
        <!-- //login and register modal -->
    </div></div>
    <!-- js-->
    
    <!--<script src="resources/js/jquery-2.2.3.min.js"></script>-->
    <script src="resources/js/sprConfig.js"></script>
    <script src="resources/js/extrusion_modify.js"></script>
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
    <!-- //Classie -->
    <!-- //for toggle left push menu script -->


    <!-- side nav js -->
    
    <!-- script for password match -->
    <!-- start-smooth-scrolling -->
    
    
   
    <!-- //smooth-scrolling-of-move-up -->
    <!-- Bootstrap Core JavaScript -->
    
    <!-- //Bootstrap Core JavaScript -->
   
	 <script>
   $('.sprTable').on('scroll', function () {
    $(".sprTable > *").width($(".sprTable").width() + $(".sprTable").scrollLeft());
});
   </script>	
</body>

</html>