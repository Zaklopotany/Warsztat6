<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<!-- 	<div>
		<h1>if user form for new twee</h1>
		<h1>all tweets</h1>
		<p>addcomment button and details</p>
	</div> -->
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
					<button class="btn btn-info">Wszystkie wpisy</button>
					<a class="btn btn-info" href="<c:url value="/tweet/userTweets"/>">Twoje Tweety</a>
					<button class="btn btn-primary">Pokaż więcej</button>
				</div>
				<hr>
				<h2>Posty użytkownika: ${user.getUsername()}</h2>
				<c:forEach items="${tweetList}" var="tl" varStatus="status">
					<div id="rcorners1"  class="container-fluid">
						<p> <b>Dodano:</b> ${tl.getCreated().toString().substring(0,19)}</p>
						<hr>
						<p>${tl.getText()}</p>
						<hr>
						<p><a href="">Zobacz Komentarze</a> <a href="">Dodaj komentarz</a></p>
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