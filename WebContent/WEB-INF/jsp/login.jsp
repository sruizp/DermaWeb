<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
  <title>Teledermatología</title>
  <style>
    .error { color: red; }
  </style>  
</head>
<body>

<br>
<h2>&nbsp;Identifícate</h2>

<form:form method="post" commandName="login">
  <table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0" cellpadding="5">
    <tr>
      <td align="right" width="20%">Usuario:</td>
        <td width="20%">
          <form:input path="user"/>
        </td>
        <td width="60%">
          <form:errors path="user" cssClass="error"/>
        </td>
    </tr>
    <tr>
      <td align="right" width="20%">Contraseña:</td>
        <td width="20%">
          <form:input path="password"/>
        </td>
        <td width="60%">
          <form:errors path="password" cssClass="error"/>
        </td>
    </tr>
  </table>
  <br>
  <input type="submit" align="center" value="Execute">
</form:form>

<br>
&nbsp;<a href="<c:url value="hello.htm"/>">Volver</a>
</body>
</html>