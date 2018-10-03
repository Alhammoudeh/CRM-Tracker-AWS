<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
	<title>Customer View</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>

<body>

	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/customer/list">CRM</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
       </nav>
     
     <br></br>
     <br></br>
     
     <div id="container">
     
    	 <form:form action="viewCustomer" modelAttribute="customer" method="POST">
    	 
    	 	<!-- need to associate this data with customer id -->
			<form:hidden path="id" />
			
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>First name: </label>
					<form:input class="form-control" path="firstName"/>
				</div>
			</div>
			
			<div class="form-group">	
				<div class="col-xs-6">
					<label>Last name: </label>
					<form:input class="form-control" path="lastName"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>Phone: </label>
					<form:input class="form-control" path="phoneNumber"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>Email: </label>
					<form:input class="form-control" path="email"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>Street: </label>
					<form:input class="form-control" path="street"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>Street 2: </label>
					<form:input class="form-control" path="streetTwo"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>City: </label>
					<form:input class="form-control" path="city"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>State: </label>
					<form:input class="form-control" path="state"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-6">
					<label>Zip: </label>
					<form:input class="form-control" path="zip"/>
				</div>
			</div>
			
     	</form:form>
     	
     	<div style="clear; both;"></div>
			<p>
				<a href="${pageContext.request.contextPath}/customer/list">Back to Customer List</a>
			</p>
  
	</div>
     
</body>


</html>