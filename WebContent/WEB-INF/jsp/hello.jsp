<%@ include file="/WEB-INF/jsp/include.jsp" %>

<html>
  <head><title><fmt:message key="title"/></title></head>
  <body> 
  	<br>
  	<span style="float: right">
    	<a href="?idioma=en">en</a>
    	<a href="?idioma=es">es</a>
	</span>
  
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