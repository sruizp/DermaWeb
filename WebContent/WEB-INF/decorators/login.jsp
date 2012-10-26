<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
  <head>
	<head>
		<title>
			<decorator:title default="Teledermatología" />
		</title>
		<%@include file="../include/head_code.jsp" %>
		<%@include file="../include/header_without_session.jsp" %>
  </head>
  <body>
		<div class="parent">
			<div id="wrap" style="width:800px;height:800px;margin: 0 auto;">
				<%@include file="../include/header.jsp" %>	
				<div id="bodycontent" style="background-color:#fff">
					<div id="content">
						<decorator:body/>
					</div>
				</div>
				<%@include file="../include/foot.jsp" %>
				<%@include file="../include/dialog.jsp" %>
			</div>
		</div>
  </body>
</html>