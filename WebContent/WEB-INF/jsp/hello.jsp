<%@ include file="/WEB-INF/jsp/include.jsp" %>

<html>
  <head><title>DERMA WEB</title></head>
  <body>
 	<h3>USERS</h3>
    <c:forEach items="${model.users}" var="user">
      <c:out value="${user.idUser}"/> <i><c:out value="${user.name}"/> </i><br><br>
    </c:forEach>
    <br>
    <a href="<c:url value=""/>">Get to Login</a>
    <br>
  </body>
</html>