<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

	<t:mainLayout>
		<jsp:attribute name="submenu">
			<h3>Akcja</h3>
			<a href="<c:url value="/message/sendMessage/${user.getId()}"/>">Wyślij wiadomość</a>
		</jsp:attribute>
		<jsp:body>
			<div class="conatiner-fluid" style="resize: none">	
				<a class="btn btn-info" href="<c:url value="/tweet/showAll"/>">Wszystkie wpisy</a> 
				<a class="btn btn-info" href="<c:url value="/tweet/userTweets"/>">Twoje Tweety</a>
			</div>
			<hr>
			<h2>Posty użytkownika: ${user.getUsername()}</h2>
			<c:forEach items="${tweetList}" var="tl" varStatus="status">					
				<div id="rcorners1"  class="container-fluid">
					<p> <b>Dodano:</b> ${tl.getCreated().toString().substring(0,19)}</p>
					<hr>
					<p>${tl.getText()}</p>
					<hr>
					<p><a href="<c:url value="/tweet/details/${tl.getId()}"/>">Zobacz Komentarze</a></p>
				</div>
			</c:forEach>
		</jsp:body>
	</t:mainLayout>
</body>
</html>