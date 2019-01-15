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
    




 
 <script  src="http://code.angularjs.org/1.1.5/angular.min.js"></script>

<!-- <script data-require="angular.js@1.4.1" data-semver="1.4.1" src="http://code.angularjs.org/1.4.1/angular.min.js"></script> -->
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

<body class="cbp-spmenu-push" ng-app="sprApp" ng-controller="validationCtrl" ng-init="loadAssemblyList()" >

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
                        <a href="rejection.jsp">
                            <i class="fas fa-home"></i>
                            <span>Rejection</span>
                           
                        </a>
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
                        ASSEMBLY</h1>
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
                            
                           <form action="#" method="post" name="aseembly_form">
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
          <th style='display:none'>Assembly Id</th>
           <th>Company</th>
          <th>H.O.D</th>
           <th>User ID</th>
            <th>User Plant No</th>
             <th>Assembly Date</th>
              <th>Plant No.</th>
               <th>Shift</th>
                <th>Cell No.</th>
                 <th>Insert Moulding</th>
                  <th>Customer</th>
                   <th>Car Model</th>
                    <th>Part Name</th>
                     <th>FR RR</th>
                      <th>RH LH</th>
             <th>Production Target</th>
             <th>Production Actual</th>
             <th>Used Man Power</th>
             <th>Production Plan Time</th>
             <th>Down Time</th>
              <th>Break Down Time</th>
             <th>Production Run Time</th>
             <th>Change Over Time Target</th>
             <th>Change Over Time Actual</th>
             <th>No.Of Change Over</th>
             <th>Start Up Time Target</th>
              <th>Start Up time actual</th>
             <th>No. of Set Up</th>
            <th>Internal Rejection</th>
            <th>Molding Process Scrap</th>
            <th>Molding Startup Scrap</th>
                        <th>Process Scrap</th>
          <th>Options</th>
          </tr>
        </thead>

  <tbody>
          <tr ng-repeat="assemblyRecord in filteredItems | filter:{sno:sno,plantno:plantno,entry_date:entry_date }" >  
          <td style="text-align:center;">{{assemblyRecord.assembly_id}}<input type="text" id="assembly_id_{{$index}}" name="assembly_id_{{$index}}" value="{{assemblyRecord.assembly_id}}" style="display:none"/>
        </td>
          <td style="text-align:center;display:none">
           <input type="text" class="form-control" id="entry_date_{{$index}}" name="entry_date_{{$index}}" value="{{assemblyRecord.entry_date  | date:'yyyy-MM-dd'}}" style="display:none" readonly /> </td>
          <td style="text-align:center;display:none">{{assemblyRecord.sno}}<input type="text" id="sno_{{$index}}" name="sno_{{$index}}" value="{{assemblyRecord.sno}}" style="display:none"/> </td>
<td><span id="span_company_{{$index}}" name="span_company_{{$index}}">{{assemblyRecord.company}}</span> 

<select type="text" id="company_{{$index}}" class="form-control"
name="company_{{$index}}" value="{{assemblyRecord.company}}" style="display:none">
							 <option value="{{assemblyRecord.company}}" hidden >{{assemblyRecord.company}}</option>
                                                          
                                                
							 <option value="PPAP">PPAP</option>
    <option value="PTI">PTI</option>
     
    </select>



</td>
            <td><span id="span_hod_{{$index}}" name="span_hod_{{$index}}">{{assemblyRecord.hod}}</span>
            <input type="text" class="form-control" id="hod_{{$index}}" name="hod_{{$index}}" value="{{assemblyRecord.hod}}" style="display:none" /></td>
<td><span id="span_user_id_{{$index}}" name="span_user_id_{{$index}}">{{assemblyRecord.user_id}}</span>
  <input type="text" class="form-control" id="user_id_{{$index}}" name="user_id_{{$index}}" value="{{assemblyRecord.user_id}}" style="display:none" readonly /></td>
            <td><span id="span_user_plant_no_{{$index}}" name="span_user_plant_no_{{$index}}">{{assemblyRecord.user_plant_no}}</span>
            <input type="text" class="form-control" id="user_plant_no_{{$index}}" name="user_plant_no_{{$index}}" value="{{assemblyRecord.user_plant_no}}" style="display:none" readonly /></td>
            <td><span id="span_assembly_date_{{$index}}" name="span_assembly_date_{{$index}}">{{assemblyRecord.assembly_date | date:'yyyy-MM-dd'}}</span>
            <input type="text" class="form-control" id="assembly_date_{{$index}}" name="assembly_date_{{$index}}" value="{{assemblyRecord.assembly_date  | date:'yyyy-MM-dd'}}" style="display:none" readonly /></td>
            <td><span id="span_plantno_{{$index}}" name="span_plantno_{{$index}}">{{assemblyRecord.plantno}}</span>
            
            <select type="text" class="form-control" id="plantno_{{$index}}"
             name="plantno_{{$index}}" value="{{assemblyRecord.plantno}}" style="display:none">
						<option value="{{assemblyRecord.plantno}}" hidden >{{assemblyRecord.plantno}} </option>
							 <option value="Plant1">Plant-1</option>
    <option value="Plant2">Plant-2</option>
     <option value="Plant5">Plant-5</option>
    </select>
            
            </td>
<td><span id="span_shift_{{$index}}" name="span_shift_{{$index}}">{{assemblyRecord.shift}}</span>
<select type="text" class="form-control" id="shift_{{$index}}" 
name="shift_{{$index}}" value="{{assemblyRecord.shift}}" style="display:none" />


							<option value="{{assemblyRecord.shift}}" hidden>{{assemblyRecord.shift}} </option>
							 <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="G">G</option>
    </select>
</td>
            <td><span id="span_cellno_{{$index}}" name="span_cellno_{{$index}}">{{assemblyRecord.cellno}}</span>
            <input type="text" class="form-control" id="cellno_{{$index}}" name="cellno_{{$index}}" value="{{assemblyRecord.cellno}}" style="display:none" /></td>
            <td><span id="span_insert_mould_{{$index}}" name="span_insert_mould_{{$index}}">{{assemblyRecord.insert_mould}}</span>
           
             <select type="text" class="form-control" id="insert_mould_{{$index}}"
             name="insert_mould_{{$index}}" value="{{assemblyRecord.insert_mould}}" style="display:none" >
							<option value="{{assemblyRecord.insert_mould}}" hidden>{{assemblyRecord.insert_mould}} </option>
							 <option value="Machine-1">Machine-1</option>
    <option value="Machine-2">Machine-2</option>
    <option value="Machine-3">Machine-3</option>
    <option value="Machine-4">Machine-4</option>
    <option value="Machine-5">Machine-5</option>
    <option value="Machine-6">Machine-6</option>
    <option value="Machine-7">Machine-7</option>
    <option value="Machine-8">Machine-8</option>
    <option value="Machine-9">Machine-9</option>
    <option value="Machine-10">Machine-10</option>
    <option value="Machine-11">Machine-11</option>
    </select>
             
             </td>
            <td><span id="span_customer_{{$index}}" name="span_customer_{{$index}}">{{assemblyRecord.customer}}</span>
            
           <select type="text" class="form-control" id="customer_{{$index}}" 
            name="customer_{{$index}}"  style="display:none" value="{{assemblyRecord.customer}}"  ng-model="customerGroupModel_$index" ng-init="customerGroupModel_$index='{{assemblyRecord.customer}}'" ng-change="loadModelListByCustomerGroup($index,'customer_')" placeholder="{{assemblyRecord.customer}}" required>
						<option value="{{assemblyRecord.customer}}"  selected>{{assemblyRecord.customer}} </option>
							 <option ng-repeat="customerGroup in listOfCustomerGroup | orderBy" value="{{customerGroup}}">{{customerGroup}}</option>
							 <!--<ng-options="customerGroup in listOfCustomerGroup">-->
   
    </select> 
            
            
            </td>
<td><span id="span_car_model_{{$index}}" name="span_car_model_{{$index}}">{{assemblyRecord.car_model}}</span>

<select type="text" class="form-control" id="car_model_{{$index}}" 
name="car_model_{{$index}}" value="{{assemblyRecord.car_model}}" style="display:none" ng-model="modelGroupModel_$index" ng-init="modelGroupModel_$index='{{assemblyRecord.car_model}}'"  ng-change="loadPartListByCustomerGroupAndModel($index,'customer_','car_model_')" required>
						<option value="{{assemblyRecord.car_model}}" selected>{{assemblyRecord.car_model}} </option>
							 <option ng-repeat="model in modelList | orderBy" value="{{model}}">{{model}}</option>
  
    </select>

</td>
            <td><span id="span_part_name_{{$index}}" name="span_part_name_{{$index}}">{{assemblyRecord.part_name}}</span>
            
            							<select type="text" class="form-control" id="part_name_{{$index}}" 
            name="part_name_{{$index}}" value="{{assemblyRecord.part_name}}" style="display:none"  required>
						<option value="{{assemblyRecord.part_name}}" selected>{{assemblyRecord.part_name}} </option>
							 <option ng-repeat="part in partList" value={{part}}>{{part}}</option>
			    </select>
            
            
            </td>
            <td><span id="span_fr_rr_{{$index}}" name="span_fr_rr_{{$index}}">{{assemblyRecord.fr_rr}}</span>
            
            <select type="text" class="form-control" id="fr_rr_{{$index}}" 
            name="fr_rr_{{$index}}" value="{{assemblyRecord.fr_rr}}" style="display:none" >
						    <option value="{{assemblyRecord.fr_rr}}" hidden>{{assemblyRecord.fr_rr}} </option>
							 <option value="FR">FR</option>
    <option value="RR">RR</option>
    </select>
            
            </td>
            <td><span id="span_rh_lh_{{$index}}" name="span_rh_lh_{{$index}}">{{assemblyRecord.rh_lh}}</span>
            
            <select type="text" class="form-control" id="rh_lh_{{$index}}" 
            name="rh_lh_{{$index}}" value="{{assemblyRecord.rh_lh}}" style="display:none">
						    <option value="{{assemblyRecord.rh_lh}}" hidden>{{assemblyRecord.rh_lh}} </option>
							 <option value="RH">RH</option>
    <option value="LH">LH</option>
	<option value="Null">Null</option>
    </select> 
            <!-- ng-blur="validateElement(prod_target_'+$index)" -->
            </td>           
 <td><span id="span_prod_target_{{$index}}" name="span_prod_target_{{$index}}">{{assemblyRecord.prod_target}}</span>
 <input type="text" class="form-control" id="prod_target_{{$index}}" name="prod_target_{{$index}}"  ng-blur="validateField('prod_target_'+$index,'prod_target',$event)" value="{{assemblyRecord.prod_target}}" style="display:none" /></td>
            <td><span id="span_prod_actual_{{$index}}" name="span_prod_actual_{{$index}}">{{assemblyRecord.prod_actual}}</span>
            <input type="text"  class="form-control" id="prod_actual_{{$index}}" name="prod_actual_{{$index}}" value="{{assemblyRecord.prod_actual}}" style="display:none" /></td>
            <td><span id="span_used_man_power_{{$index}}" name="span_used_man_power_{{$index}}">{{assemblyRecord.used_man_power}}</span>
            <input type="text" class="form-control" id="used_man_power_{{$index}}" name="used_man_power_{{$index}}" value="{{assemblyRecord.used_man_power}}" style="display:none" /></td>
            <td><span id="span_prodplan_time_{{$index}}" name="span_prodplan_time_{{$index}}">{{assemblyRecord.prodplan_time}}</span>
            <input type="text" class="form-control" id="prodplan_time_{{$index}}" name="prodplan_time_{{$index}}" value="{{assemblyRecord.prodplan_time}}" style="display:none" /></td>
            <td><span id="span_down_time_{{$index}}" name="span_down_time_{{$index}}">{{assemblyRecord.down_time}}</span>
            <input type="text" class="form-control" id="down_time_{{$index}}" name="down_time_{{$index}}" value="{{assemblyRecord.down_time}}" style="display:none" /></td>
            <td><span id="span_bd_time_{{$index}}" name="span_bd_time_{{$index}}">{{assemblyRecord.bd_time}}</span>
            <input type="text" class="form-control" id="bd_time_{{$index}}" name="bd_time_{{$index}}" value="{{assemblyRecord.bd_time}}" style="display:none" /></td>
			<td><span id="span_prodrun_time_{{$index}}" name="span_prodrun_time_{{$index}}">{{assemblyRecord.prodrun_time}}</span>
			<input type="text" class="form-control" id="prodrun_time_{{$index}}" name="prodrun_time_{{$index}}" value="{{assemblyRecord.prodrun_time}}" style="display:none" /></td>
<td><span id="span_co_time_target_{{$index}}" name="span_co_time_target_{{$index}}">{{assemblyRecord.co_time_target}}</span>
<input type="text" class="form-control" id="co_time_target_{{$index}}" name="co_time_target_{{$index}}" value="{{assemblyRecord.co_time_target}}" style="display:none" /></td>
            <td><span id="span_co_time_actual_{{$index}}" name="span_co_time_actual_{{$index}}">{{assemblyRecord.co_time_actual}}</span>
            <input type="text" class="form-control" id="co_time_actual_{{$index}}" name="co_time_actual_{{$index}}" value="{{assemblyRecord.co_time_actual}}" style="display:none" /></td>
            <td><span id="span_no_of_co_{{$index}}" name="span_no_of_co_{{$index}}">{{assemblyRecord.no_of_co}}</span>
            <input type="text" class="form-control" id="no_of_co_{{$index}}" name="no_of_co_{{$index}}" value="{{assemblyRecord.no_of_co}}" style="display:none" /></td>
            <td><span id="span_startuptime_target_{{$index}}" name="span_startuptime_target_{{$index}}">{{assemblyRecord.startuptime_target}}</span>
            <input type="text" class="form-control" id="startuptime_target_{{$index}}" name="startuptime_target_{{$index}}" value="{{assemblyRecord.startuptime_target}}" style="display:none" /></td>
<td><span id="span_startuptime_actual_{{$index}}" name="span_startuptime_actual_{{$index}}">{{assemblyRecord.startuptime_actual}}</span>
<input type="text" class="form-control" id="startuptime_actual_{{$index}}" name="startuptime_actual_{{$index}}" value="{{assemblyRecord.startuptime_actual}}" style="display:none" /></td>
            <td><span id="span_no_of_setup_{{$index}}" name="span_no_of_setup_{{$index}}">{{assemblyRecord.no_of_setup}}</span>
            <input type="text" class="form-control" id="no_of_setup_{{$index}}" name="no_of_setup_{{$index}}" value="{{assemblyRecord.no_of_setup}}" style="display:none" /></td>
            <td><span id="span_internal_rej_{{$index}}" name="span_internal_rej_{{$index}}">{{assemblyRecord.internal_rej}}</span>
            <input type="text" class="form-control" id="internal_rej_{{$index}}" name="internal_rej_{{$index}}" value="{{assemblyRecord.internal_rej}}" style="display:none" /></td>
            <td><span id="span_mldgprocess_scrap_{{$index}}" name="span_mldgprocess_scrap_{{$index}}">{{assemblyRecord.mldgprocess_scrap}}</span>
            <input type="text" class="form-control" id="mldgprocess_scrap_{{$index}}" name="mldgprocess_scrap_{{$index}}" value="{{assemblyRecord.mldgprocess_scrap}}" style="display:none" /></td>
  <td><span id="span_mldgstartup_scrap_{{$index}}" name="span_mldgstartup_scrap_{{$index}}">{{assemblyRecord.mldgstartup_scrap}}</span>
  <input type="text" class="form-control" id="mldgstartup_scrap_{{$index}}" name="mldgstartup_scrap_{{$index}}" value="{{assemblyRecord.mldgstartup_scrap}}" style="display:none" /></td>
            <td><span id="span_process_scrap_{{$index}}" name="span_process_scrap_{{$index}}">{{assemblyRecord.process_scrap}}</span>
            <input type="text" class="form-control" id="process_scrap_{{$index}}" name="process_scrap_{{$index}}" value="{{assemblyRecord.process_scrap}}" style="display:none" /></td>
            <input type="text" name="currIndex" id="currIndex" value="{{$index}}" style="display:none"/>
          <td ><span class="btn btn-sm btn-success edit" id="editElement_{{$index}}" name="editElement_{{$index}}"
            ng-click="edit($index,assemblyRecord)" ng-show="((user_role=='TEAM LEADER' && assemblyRecord.isApproved=='0') 
            || (user_role=='GROUP LEADER' && (assemblyRecord.isApproved=='0' || assemblyRecord.isApproved=='1') 
            && (assemblyRecord.approvedBy=='1' || assemblyRecord.approvedBy=='0')) ||
           (user_role=='PLANT HEAD' && (assemblyRecord.isApproved=='0' || assemblyRecord.isApproved=='1') && (assemblyRecord.approvedBy=='1' || assemblyRecord.approvedBy=='0' || assemblyRecord.approvedBy=='2' ) ))"><i class="fa fa-edit"></i></span>
            <span class="btn btn-sm btn-warning" id="approveElement_{{$index}}" name="approveElement_{{$index}}" ng-click="approveEntry($index,'0','APPROVE_ENTRY')" ng-show="(user_role=='GROUP LEADER' && assemblyRecord.isApproved=='0') || (user_role=='PLANT HEAD' && assemblyRecord.approvedBy=='1') " ><i class="fa fa-check"></i></span>
            <span class="btn btn-sm btn-primary "  id="saveElement_{{$index}}" name="saveElement_{{$index}}"  ng-click="updateAssemblyRecord($index)" style="display:none"><i class="fa fa-save" ></i></span>
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
    <script src="resources/js/assembly_modify.js"></script>
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
        jQuery(document).ready(function () {
        	/* alert("Jquery Called");
        	
			$(".edit").click(function(){
				//event.preventDefault();
				var currIndex=$("#currIndex").val();
				alert("Current Inde"+currIndex);
        	}); */
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

           /*  $().UItoTop({
                easingType: 'easeOutQuart'
            }); */

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