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
    <link href="resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
     <link href="resources/css/loader.css" rel='stylesheet' type='text/css' />
 
    <!-- Custom CSS -->
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

<body class="cbp-spmenu-push" ng-app="sprApp" ng-controller="sprContrlr" ng-init="loadCustomerGroup()">
<div id="myModal" class="processLoader" ng-show="loaderFlag" >

  <!-- Modal content -->
  <div class="processLoader-content" style="width:30%">
    <span class="close">&times;</span>
	<center><img src="resources/images/loader.gif" alt="Italian Trulli"  >
  </center>  
  </div>

</div>
<div id="myModal" class="processLoader1" ng-show="submitFlag" style="display:none" >
<div class="processLoader-content1" style="width:60%;">
    <span class="close">&times;</span>
<img src="resources/images/logo.png" alt="Italian Trulli"  >
   <h1 style="display:inline-block;">Data Submitted Successfully for <span style="color:grey;"><u></br>Plant:-{{plant}}/Part</u></span></h1>
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
        
        <h1 style="text-align:right; padding-right: 50px;">
                       WELCOME</h1><h3 style="text-align:right; padding-right: 50px;">
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
                      
                       <center> <h1  aria-current="page">Add New Part</h1></center>
                    
                </nav>
            </div>
        </div>
        <!-- //breadcrumbs -->

        <!-- contact -->
        <section class="wthree-row pt-3 pb-5 w3-contact">
            <div class="container py-sm-5 pt-0 pb-5">
                
                <div class="row ">
                    <div class="col-lg-12 wthree-form-left">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            
                           <form action="#" method="post" name="part_form">
				<div class="contact-grids1 w3agile-6">
					<div class="row">
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Company</label>
							<select type="text" class="form-control" name="company" ng-model="company"  required>
							 <option value="" hidden>Select for the company</option>
                                                          
                                                
							 <option value="Ppap">PPAP</option>
    <option value="Pti">PTI</option>
    </select>
						<span style="color:red" ng-show="part_form.company.$touched && part_form.company.$invalid">*Cannot Leave Empty </span>
						</div>
						
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User ID</label>
							<input type="text" class="form-control" name="user_id" ng-model="user_id" placeholder="" required="" readonly>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User Plant No</label>
						<input type="text" class="form-control" name="user_plant_no" ng-model="user_plant_no"  placeholder="" required readonly>
						
						<span style="color:red" ng-show="part_form.user_plant_no.$touched && part_form.user_plant_no.$invalid">*Cannot Leave Empty </span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Customer Group</label>
						<select type="text" class="form-control" name="customer_group" ng-model="customer_group" ng-change="loadModelListByCustomerGroup()" placeholder="" required>
						<option value="" selected >Select For the Customer Name </option>
							 <option ng-repeat="customerGroup in listOfCustomerGroup | orderBy" value="{{customerGroup}}">{{customerGroup}}</option>
							 <!--<ng-options="customerGroup in listOfCustomerGroup">-->
   
    </select>
						<span style="color:red" ng-show="part_form.customer_group.$touched && part_form.customer_group.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Car Model</label>
							<select type="text" class="form-control" name="car_model" placeholder="" ng-model="car_model" ng-change="loadPartListByCustomerGroupAndModel()" required>
						
							<option value="" selected>Select for the Model </option>
							 <option ng-repeat="model in modelList | orderBy" value="{{model}}">{{model}}</option>
  
    </select>
						<span style="color:red" ng-show="part_form.car_model.$touched && part_form.car_model.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Part No</label>
							<input type="text" class="form-control" name="part_no" ng-model="part_no" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required="">
							<span style="color:red" ng-show="part_form.part_no.$touched && part_form.part_no.$invalid">*Cannot Leave Empty.Invalid data Format.</span></br>
                        					
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Part Name</label>
							<input type="text" class="form-control" name="part_name" ng-model="part_name" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required="">
							
						    <span style="color:red" ng-show="part_form.part_name.$touched && part_form.part_name.$invalid">*Cannot Leave Empty.Invalid data Format.</span>
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Extrusion Line No</label>
							<input type="text" class="form-control" name="extrusion_line_no" ng-model="extrusion_line_no" placeholder="Data should only contain numeric value" ng-pattern ="/^[0-9]*$/" required="">
						<span style="color:red" ng-show="part_form.extrusion_line_no.$touched && part_form.extrusion_line_no.$invalid">*Cannot Leave Empty.Invalid data Format.</span>
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Extrusion Length MM</label>
							<input type="text" class="form-control" name="extrusion_length_mm" ng-model="extrusion_length_mm" placeholder="Data should only contain numeric value" ng-pattern ="/^[0-9]*$/" required="">
						    <span style="color:red" ng-show="part_form.extrusion_length_mm.$touched && part_form.extrusion_length_mm.$invalid">*Cannot Leave Empty.Invalid data Format.</span>
					
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Flocking Line No</label>
							<input type="text" class="form-control" name="flocking_line_no" ng-model="flocking_line_no" placeholder="Data should only contain numeric value" ng-pattern ="/^[0-9]*$/" required="">
						    <span style="color:red" ng-show="part_form.flocking_line_no.$touched && part_form.flocking_line_no.$invalid">*Cannot Leave Empty.Invalid data Format.</span>
					
						</div>
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Plant</label>
							<select type="text" class="form-control" name="plant" ng-model="plant"  required>
						<option value="" hidden>Select for the Plant No.  </option>
							 <option value="1">Plant-1</option>
    <option value="2">Planr-2</option>
     <option value="3">Plant-5</option>
    </select>
    <span style="color:red" ng-show="part_form.part.$touched && part_form.part.$invalid">*Cannot Leave Empty </span>
						
						</div>
					</div>
					<div class="contact-form">
						<input type="submit" value="Submit"  ng-click="insertPartRecord($event)">
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
    <script src="resources/js/part.js"></script>
    <script src="resources/js/sprFactory.js"></script>
    <!-- js-->
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
     
    <!-- script for password match -->
    <!-- start-smooth-scrolling -->
    <script src="resources/js/move-top.js "></script>
    <script src="resources/js/easing.js "></script>
    
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
    <!-- for toggle left push menu script -->
    
    <!-- //end-smooth-scrolling -->
    <!-- smooth-scrolling-of-move-up -->
   
   
    <!-- //Bootstrap Core JavaScript -->

</body>

</html>