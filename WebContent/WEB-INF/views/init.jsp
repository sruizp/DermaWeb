<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
  <head><title><fmt:message key="title"/></title></head>
  <body> 
  
  	<br>
 	<h2>&nbsp;<fmt:message key="heading"/></h2>
 	 	
 	<c:forEach items="${model.users}" var="user">
      &nbsp;&nbsp;&nbsp;<c:out value="${user.idUser}"/> <i><c:out value="${user.name}"/> </i><br><br>
    </c:forEach>
    
    <br>
    &nbsp;<a href="<c:url value="login.htm"/>">Pantalla de Login</a>
    <br>
  </body>
</html>