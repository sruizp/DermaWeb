<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<form:form method="post" commandName="loginForm">
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
          <form:password path="password"/>
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


<!-- SUBMIT FORM --> 
<script type="text/javascript">
$('input').live('keypress', function (e) {
	if ( e.which == 13 ) {
		//$("#dlgWait").dialog('open');
		$("#loginFormSubmit").click();	
		return false;	
	}		
});
</script>


</body>
</html>