<%@ include file="/WEB-INF/jsp/include.jsp" %>

<html>
  <head><title>Teledermatología</title></head>
  <body> 
  	<br>
 	<h2>&nbsp;LISTA DE USUARIOS</h2>
    <c:forEach items="${model.users}" var="user">
      &nbsp;&nbsp;&nbsp;<c:out value="${user.idUser}"/> <i><c:out value="${user.name}"/> </i><br><br>
    </c:forEach>
    <br>
    &nbsp;<a href="<c:url value="login.htm"/>">Pantalla de Login</a>
    <br>
  </body>
</html>