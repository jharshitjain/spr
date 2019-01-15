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

<body class="cbp-spmenu-push" ng-app="sprApp" ng-controller="sprContrlr">
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
   <h1 style="display:inline-block;">Data Submitted Successfully for <span style="color:grey;"><u></br>Plant:-{{userplant}}/Customer</u></span></h1>
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
                   <div class="contact-form" style="float: right; padding-top: 10px; padding-right: 50px; padding-top: 10px;">
                 <input type="button" value="LOGOUT"  display:inline-block;" ng-click="logout()">
                    </div>
                        
                       
                       <center> <h1  aria-current="page">Add New Customer</h1>
                    </center>
                </nav>
            </div>
        </div>
        <!-- //breadcrumbs -->

        <!-- contact -->
        <section class="wthree-row pt-0 pb-5 w3-contact">
            <div class="container py-sm-3 pt-0 pb-5">
                
                <div class="row ">
                    <div class="col-lg-12 wthree-form-left">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            
                           <form action="#" method="post" name="customer_form">
				<div class="contact-grids1 w3agile-6">
					<div class="row">
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Company</label>
							<select type="text" class="form-control" name="company" ng-model="company"  required>
							 <option value="" hidden>Select for the company</option>
                                                          
                                                
							 <option value="Ppap">PPAP</option>
    <option value="Pti">PTI</option>
    </select>
						<span style="color:red" ng-show="customer_form.company.$touched && customer_form.company.$invalid">*Cannot Leave Empty </span>
						
						
						</div>
						
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User ID</label>
							<input type="text" class="form-control" name="user_id" ng-model="user_id" placeholder="" required="" readonly>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">User Plant No</label>
							<select type="text" class="form-control" name="user_plant_no" ng-model="user_plant_no"  required>
						<option value="" hidden>Select for the Plant No.  </option>
							 <option value="1">Plant-1</option>
    <option value="2">Plant-2</option>
     <option value="3">Plant-5</option>
    </select>
						<span style="color:red" ng-show="customer_form.user_plant_no.$touched && customer_form.user_plant_no.$invalid">*Cannot Leave Empty </span>
						
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Name</label>
							<input type="text" class="form-control" name="name_1" ng-model="name_1"  placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
							<span style="color:red" ng-show="customer_form.name_1.$touched && customer_form.name_1.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Location</label>
							<input type="text" class="form-control" name="location" ng-model="location" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
							<span style="color:red" ng-show="customer_form.location.$touched && customer_form.location.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Search Term</label>
							<input type="text" class="form-control" name="search_term" ng-model="search_term" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
						<span style="color:red" ng-show="customer_form.search_term.$touched && customer_form.search_term.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Address1</label>
							<input type="text" class="form-control" name="address1" ng-model="address1" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
						<span style="color:red" ng-show="customer_form.address1.$touched && customer_form.address1.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
                        		
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Address2</label>
							<input type="text" class="form-control" name="address2" ng-model="address2" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
						<span style="color:red" ng-show="customer_form.address2.$touched && customer_form.address2.$invalid">*Cannot Leave Empty.Invalid Data Format.</span></br>
                        		
						</div>
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Post Code</label>
							<input type="text" class="form-control" name="post_code" ng-model="post_code" placeholder="Data should only contain numeric value" ng-pattern ="/^[0-9]*$/" required>
						<span style="color:red" ng-show="customer_form.post_code.$touched && customer_form.post_code.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">City</label>
							<input type="text" class="form-control" name="city" ng-model="city" placeholder="Data should only be in characters" ng-maxlength="50" ng-pattern ="/^[a-zA-Z\s]*$/" required="">
						<span style="color:red" ng-show="customer_form.city.$touched && customer_form.city.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
							</div>
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Country</label>
							<input type="text" class="form-control" name="country" ng-model="country" placeholder="Data should only be in characters" ng-maxlength="50" ng-pattern ="/^[a-zA-Z\s]*$/" required="">
							<span style="color:red" ng-show="customer_form.country.$touched && customer_form.country.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
							</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">TEL/FAX</label>
							<input type="text" class="form-control" name="tel_fax" ng-model="tel_fax" placeholder="Data should only contain numeric value" ng-pattern ="/^[0-9]*$/" required>
								<span style="color:red" ng-show="customer_form.tel_fax.$touched && customer_form.tel_fax.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
				
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Tax Number1</label>
							<input type="text" class="form-control" name="tax_no_1" ng-model="tax_no_1" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
						
			<span style="color:red" ng-show="customer_form.tax_no_1.$touched && customer_form.tax_no_1.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
			
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Tax Number3</label>
							<input type="text" class="form-control" name="tax_no_3" ng-model="tax_no_3" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
					
			<span style="color:red" ng-show="customer_form.tax_no_3.$touched && customer_form.tax_no_3.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Classification</label>
							<input type="text" class="form-control" name="classification" ng-model="classification" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
						
			<span style="color:red" ng-show="customer_form.classification.$touched && customer_form.classification.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Industry</label>
							<input type="text" class="form-control" name="industry" ng-model="industry" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required="">
<span style="color:red" ng-show="customer_form.industry.$touched && customer_form.industry.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Contact Person</label>
							<input type="text" class="form-control" name="contact_person" ng-model="contact_person" placeholder="Data should only be in characters" ng-maxlength="50" ng-pattern ="/^[a-zA-Z\s]*$/" required="">
					<span style="color:red" ng-show="customer_form.contact_person.$touched && customer_form.contact_person.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Sales Office</label>
							<input type="text" class="form-control" name="sales_office" ng-model="sales_office" placeholder="Data should only be in characters" ng-maxlength="50" ng-pattern ="/^[a-zA-Z\s]*$/" required="">
					<span style="color:red" ng-show="customer_form.sales_office.$touched && customer_form.sales_office.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Customer Group</label>
							<input type="text" class="form-control" name="customer_group" ng-model="customer_group" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
						
						<span style="color:red" ng-show="customer_form.customer_group.$touched && customer_form.customer_group.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div> 
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Sales Group</label>
							<input type="text" class="form-control" name="sales_group" ng-model="sales_group" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
				
						<span style="color:red" ng-show="sales_group.post_code.$touched && customer_form.sales_group.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						<div class="col-md-4 col-sm-6 contact-form1 form-group">
							<label class="col-form-label">Old Customer Number</label>
							<input type="text" class="form-control" name="old_customer_group" ng-model="old_customer_group" placeholder="Data can be in character or in numeric way" ng-pattern="/^[a-zA-Z0-9]+$/" required>
							<span style="color:red" ng-show="customer_form.old_customer_no.$touched && customer_form.old_customer_no.$invalid">*Cannot Leave Empty.Invalid Data Format.</span>
						</div>
						
						
						
						
						
						
						
						</div>
					
					<div class="contact-form">
						<input type="submit" value="Submit" ng-click="insertCustomerRecord($event)">
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
   <!-- <script src="resources/js/jquery-2.2.3.min.js"></script>-->
	 <script src="resources/js/sprConfig.js"></script>
    <script src="resources/js/customer.js"></script>
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

</body>

</html>