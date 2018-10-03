<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>

<html>

<head>

	<title>Customer List:</title>
	
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
	
		<div id="content">
				
		<!-- customer search button -->
		<form:form action="search" method="POST">
			Search: <input type="text" name="theSearchName" />
			
			<input type="submit" value="Search" class="add-button"/>
		</form:form>
		
		
		<!-- add out html table here -->
		
			<table class="table table-hover">
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Phone</th>
					<th scope="col">Email</th>
					<th scope="col">Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
					<!-- construct a "View" link with customer id -->
					<c:url var="viewLink" value="/customer/viewCustomer">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>	
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
					
					<!-- construct a "Delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>					
					
					
					<tr>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.phoneNumber}</td>
						<td> ${tempCustomer.email} </td>
						<td>
							<!-- display view link -->
							<a href="${viewLink}">View | </a>
							<!-- display update link -->
							<a href="${updateLink}">Update | </a>
							<!-- display delete link -->
							<a href="${deleteLink}"
								onclick="if(!(confirm('Are you sure you want to delete this customer from the CRM?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			
			</table>
		
		</div>
		
		<!-- Add customer button -->
		<input type="button" value="Add Customer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button"
		/>
	
	</div>
</body>

</html>
