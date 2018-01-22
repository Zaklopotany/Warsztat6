<%@ tag description="main layout" language="java" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<%@attribute name="menu" fragment="true"%>
<%@attribute name="submenu" fragment="true"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel="stylesheet">

</head>
<body>
	<div id="pageheader" class="jumbotron text-center">
		<jsp:invoke fragment="header" />
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<h3>Menu</h3>
				<jsp:invoke fragment="menu" />
				<jsp:invoke fragment="submenu" />
			</div>
			<div class="col-sm-8">
				<jsp:doBody />
			</div>
			<div class="col-sm-2">
			</div>
		</div>
	</div>
	<jsp:invoke fragment="footer" />
</body>
</html>