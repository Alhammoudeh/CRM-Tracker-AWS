<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
	<title>Add Customer to CRM</title>
	
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
		<h3>Add Customer</h3>
		
		<br><br>
		
		<form:form action="saveCustomer" modelAttribute="customer" method="POST">
			
			<!-- need to associate this data with customer id -->
			<form:hidden path="id" />
			
			<table class="table table-striped">
				<tbody>
					<tr>
						<td><label>First name: </label></td>
						<td><form:input path="firstName" /></td>
					</tr>
					
					<tr>
						<td><label>Last name: </label></td>
						<td><form:input path="lastName" /></td>
					</tr>
					
					<tr>
						<td><label>Email: </label></td>
						<td><form:input path="email" /></td>
					</tr>
					
					<tr>
						<td><label>Phone: </label></td>
						<td><form:input path="phoneNumber" /></td>
					</tr>
					
					<tr>
						<td><label>Street: </label></td>
						<td><form:input path="street" /></td>
					</tr>
					
					<tr>
						<td><label>Street 2: </label></td>
						<td><form:input path="streetTwo" /></td>
					</tr>
					
					<tr>
						<td><label>City: </label></td>
						<td><form:input path="city" /></td>
					</tr>
					
					<tr>
						<td><label>State: </label></td>
						<td><form:input path="state" /></td>
					</tr>
					
					<tr>
						<td><label>Zip: </label></td>
						<td><form:input path="zip" /></td>
					</tr>


					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
		
				</tbody>
			</table>	
		</form:form>
		
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Back to Customer List</a>
		</p>
	</div>

</body>


</html>