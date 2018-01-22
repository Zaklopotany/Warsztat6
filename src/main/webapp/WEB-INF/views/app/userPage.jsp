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
	<c:url var="linkForm" value="/tweet/addTweetUser" />
	<div id="pageheader" class="jumbotron text-center">
		<h1>Aplikacja Twitterowa</h1>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
				<h3>Menu</h3>
			</div>
			<div class="col-sm-8">
				<div class="conatiner-fluid" style="resize: none">
					<a class="btn btn-info" href="<c:url value="/tweet/userTweets"/>">Wszystkie wpisy</a>
					<button class="btn btn-info">Wszystkie wpisy</button>
					<a class="btn btn-info" href="<c:url value="/tweet/userTweets"/>">Twoje
						Tweety</a>
					<button class="btn btn-primary">Pokaż więcej</button>
				</div>
				<hr>
				<div id="rcorners1" class="container-fluid">
					<p>${user.getUsername()} dodaj nowy wpis :)</p>
					<f:form action="${linkForm}" method="POST" modelAttribute="tweet">
						<f:hidden path="user.id" value="${user1.getId()}" />
						<f:textarea style="width:100%" path="text" />
						<input type="submit" value="Dodaj" />
					</f:form>
				</div>
				<c:forEach items="${userTweets}" var="tl">
					<br>
					<div id="rcorners1" class="container-fluid">
						<a style="float: left"><b>${tl.getUser().getUsername()}</b></a> <a
							style="float: right">${created}</a> <br>
						<p>${tl.getText()}</p>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-2">
				<p>Opcje</p>
			</div>
		</div>
	</div>
</body>
</html>