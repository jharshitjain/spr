<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
   <head>
      <title>SPR PROJECT DASHBOARD</title>
      <!-- Meta tags -->
     
      
      <!-- Meta tags -->
      <!--stylesheets-->
       <link href="resources/css/stylelogin.css" rel='stylesheet' type='text/css' />
    
      <!--//style sheet end here-->
      <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
       <!-- js
       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js" >
     	
     
      
    <script src="resources/js/jquery-2.2.3.min.js"></script>-->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/2.0.0/ui-bootstrap-tpls.min.js"></script>

	<script src="resources/js/sprConfig.js"></script>
    <script src="resources/js/employee.js"></script>
    <script src="resources/js/sprFactory.js"></script>
    
    
    <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- js-->
   </head>
   <body ng-app="sprApp" ng-controller="sprContrlr" >

    <img src="resources/images/logo.png" alt="Italian Trulli"  style="width:160px; height:90px;">
    <center> <h1 class="header-w3ls" style="display: inline-block">
        MR LOGIN FORM
      </h1>
	 </center>
      <div class="mid-cls" >
         <div class="swm-right-w3ls">
		 <img src="resources/images/spr.png" alt="Italian Trulli"  style="width:140px; height:60px;">
            <h2> Login Here</h2>
			
            <form action="#" method="post">
            <span style="color:aqua" ng-show="errorFlag">* {{errorMessage}}</span>
               <div class="main">
                  <div class="form-left-w3l">
                     <input type="text" name="emp_code" placeholder="User Id" ng-model="emp_code" required >
                     <div class="clear"></div>
                  </div>
                  <div class="form-right-w3ls">
                     <input type="password" name="pwd" placeholder="Password" ng-model="pwd" required>
                     <div class="clear"></div>
                  </div>
				   <div class="form-right-w3ls">
                    <input   list="browsers" name="browser" placeholder="User Type" ng-model="role" >
  <datalist id="browsers">
    <option value="TEAM LEADER">
    <option value="GROUP LEADER">
    <option value="PLANT HEAD">
    
  </datalist>
                     <div class="clear"></div>
                  </div>
                 
                  <div class="btnn">
                     <input type="submit" ng-click="authenticateUser($event)" value="Login"/>
                     
                  </div>
               </div>
            </form>
         </div>
      </div>
     
   </body>
</html>