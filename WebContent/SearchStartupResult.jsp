<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<title>MIE350 Sample Web App - Search Results</title>
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



	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- You can put left sidebar links here if you want to. -->
			</div>
			<div class="col-sm-8 text-left">
				<h1>Search A Student - Results</h1>

				The following students match your search keyword "<b><font
					color=red><%=request.getAttribute("keyword")%></font></b>":<br> <br>
					<br/>
				 <% int colCount = 0;%>
				 <c:forEach items="${startup}" var="company">
					 <% if(colCount == 0){%>
					 	<div class="row">
					 <% }%>
					  <div class="col-sm-4">
					    <div class="card" height=200px>
					      <div class="card-body">
					        <h4 class="card-title"> <c:out value="${company.getName()}" /> </h4>
					        <p class="card-text"> <c:out value="${company.getDescription()}"/> </p>
					        <a class="btn btn-primary" href="CompanyController?action=viewPage&startupID=<c:out value="${company.getID()}"/>">Visit Page</a>
					        
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
				<!-- You can put right sidebar links here if you want to. -->
			</div>
		</div>
	</div>



</body>
</html>


