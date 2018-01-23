<%@ tag description="main layout" language="java" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<%@attribute name="menu" fragment="true"%>
<%@attribute name="submenu" fragment="true"%>
<%@attribute name="option" fragment="true"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>"
	rel="stylesheet" type="text/css">	
</head>
<body>
	<div id="pageheader" class="jumbotron text-center">
		<h1>Bom bom - super szybka aplikacja</h1>
		<jsp:invoke fragment="header" />
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 text-center">
				<h3>Menu</h3>
					<a href="<c:url value="/tweet/showAll"/>">Wszystkie wpisy</a><br>
					<a href="<c:url value="/tweet/userTweets"/>">Twoje posty</a><br>
					<a href="<c:url value="/message/showMailBox"/>">Wiadomości</a><br>
					<a href="<c:url value="/user/settings"/>">Ustawienia</a><br>
					<a href="<c:url value="/user/logout"/>">Wyloguj</a><br>
				<jsp:invoke fragment="menu" />
				<jsp:invoke fragment="submenu" />
			</div>
			<div class="col-sm-8">
				<jsp:doBody />
			</div>
			<div class="col-sm-2">
				<h3>Opcje</h3>
				<jsp:invoke fragment="option"/>
			</div>
		</div>
	</div>
	<jsp:invoke fragment="footer" />
</body>
</html>