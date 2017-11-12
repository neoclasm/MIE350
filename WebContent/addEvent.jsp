<%@ include file="footbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" import="com.mie.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <title>Startup Representative - Add An Event</title>
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

    <link rel="stylesheet" type="text/css" href="../css/mystyle.css">
</head>
<body>

<%@ include file="navbar.jsp"%>

<!--  
//    Member member = (Member) session.getAttribute("currentSessionUser");
//
//    String username = (String) session.getAttribute("username");
//    String firstname = (String) session.getAttribute("firstname");
//    String lastname = (String) session.getAttribute("lastname");
-->

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-8 text-left">
            <h1>Add A Event</h1>

            <script>
                $(function() {
                    $('input[name=date]').datepicker();
                });
            </script>
            Note: the Event ID is a fixed field and cannot be changed. <br>
            <br>

            <form method="POST" action='EventController' name="frmAddEvent">

                Name: <input type="text" name="name"
                                 value="<c:out value="${event.getEventName()}" />"><br>

                Location: <input type="text" name="location"
                                   value="<c:out value="${event.getLocation()}" />"><br>
                Date
                (MM/dd/yyyy): <input type="text" name="eventDate"
                                     value="<fmt:formatDate pattern="MM/dd/yyyy" value="${event.getDate()}" />"><br>

                Time: <input type="text" name="eventTime"
                             value="<c:out value="${event.getEventTime()}" />"><br>

                Description: <input type="text" name="description"
                              value="<c:out value="${event.getDescription()}" />"><br>

                Startup: <select name="startup">

                <c:forEach items="${startups}" var="startup">
                    <option value="<c:out value="${startup.getID()}" />"><c:out value="${startup.getName()}" /></option>
                </c:forEach>

                </select>

                <br>
                <input type="submit" class="btn btn-info" value="Submit" />
            </form>

        </div>
    </div>
</div>

<% // @ include file="../footer.jsp"%>


</body>
</html>
