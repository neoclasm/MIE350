
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.mie.dao.CompanyDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	session = request.getSession();
	System.out.println(session);
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
	System.out.println(session.getAttribute("username"));
	System.out.println(session.getAttribute("currentSessionUser").getClass());
	
	%>

<html lang="en">
<head>
<title>StartU - Startup List</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Date Picker Javascript -->
<!-- https://jqueryui.com/datepicker/ -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">
</head>
<body>

<%@ include file="navbar.jsp"%>

<br />
<!--  Code taken from W3 schools -->
 <ul class="nav nav-pills nav-justified">
    <li><a href="studentHome.jsp">Home</a></li>
    <li  class="active"><a href="CompanyController?action=listCompany">Startup List</a></li>
    <li><a href="SearchStartup.jsp">Search a Startup</a></li>
    <li><a href="EventController?action=listEvent">Events</a></li>
  </ul>

    
  
 <div class="container-fluid text-center">
	<div class="row content">
	<div class="col-sm-2 sidenav">
				
			</div>
		<div class="col-sm-8 text-left">
			<h1>List of Startups </h1>
			 <% int colCount = 0;%>
			 <c:forEach items="${Company}" var="company">
				 <% if(colCount == 0){%>
				 	<div class="row">
				 <% }%>
				  <div class="col-sm-4">
				    <div class="card" height=200px>
				      <div class="card-body">
				        <h4 class="card-title"> <c:out value="${company.getName()}" /> </h4>
				        <p class="card-text"> <c:out value="${company.getDescription()}"/> </p>
				         <div class = "togrow"> 
				        <a class="btn btn-primary" href="CompanyController?action=viewPage&startupID=<c:out value="${company.getID()}"/>">Visit Page</a>
				        </div>
				      </div>
				    </div>
				  </div>
				  <% colCount++;%>
				 <% if(colCount == 3){%>
				 	</div>
				 	<br/>
				 	<%colCount = 0; %>
				 <% }%>
			</c:forEach>
		 </div>
		 <div class="col-sm-2 sidenav">
		</div>
	</div>
</div>


</body>
</html>
<%@ include file="footbar.jsp"%>