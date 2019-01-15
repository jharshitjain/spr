<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!doctype html>
<html lang="en" ng-app="angularTable">
  <head>
    <meta charset="utf-8">
    <title>Search Sort and Pagination in Angular js</title>
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
  </head>
  <body>
	<div role="main" class="container theme-showcase">
      <div class="" style="margin-top:90px;">
        <div class="col-lg-8">
			<div class="page-header">
				<h2 id="tables">Search Sort and Pagination in Angular js</h2>
			</div>
			<div class="bs-component" ng-controller="listdata" ng-init="loadAssemblyList()">
				<div class="alert alert-info">
					<p>Sort key: {{sortKey}}</p>
					<p>Reverse: {{reverse}}</p>
					<p>Search String : {{search}}</p>
				</div>
				<form class="form-inline">
					<div class="form-group">
						<label >Search</label>
						<input type="text" ng-model="search" class="form-control" placeholder="Search">
					</div>
				</form>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th ng-click="sort('id')">Id
								<span class="glyphicon sort-icon" ng-show="sortKey=='id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
							</th>
							<th ng-click="sort('first_name')">First Name
								<span class="glyphicon sort-icon" ng-show="sortKey=='first_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
							</th>
							<th ng-click="sort('last_name')">Last Name
								<span class="glyphicon sort-icon" ng-show="sortKey=='last_name'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
							</th>
							<th ng-click="sort('hobby')">Hobby
								<span class="glyphicon sort-icon" ng-show="sortKey=='hobby'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr dir-paginate="user in users|orderBy:sortKey:reverse|filter:search|itemsPerPage:15">
							<td>{{user.assembly_id}}</td>
							<td>{{user.sno}}</td>
							<td>{{user.last_name}}</td>
							<td>{{user.hobby}}</td>
						</tr>
					</tbody>
				</table> 
				<dir-pagination-controls
					max-size="15"
					direction-links="true"
					boundary-links="true" >
				</dir-pagination-controls>
			</div>
		</div>
		
      </div>
    </div>
		<script src="resources/js/angular.js"></script>
		<script src="resources/js/dirPagination.js"></script>
		   <script src="resources/js/pagination.js"></script>
  </body>
 
</html>