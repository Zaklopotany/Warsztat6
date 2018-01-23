<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<html>
<head>
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url var="commentLink" value="/comment/addComment" />
	
	<t:mainLayout>
		<jsp:body>
				<div class="conatiner-fluid" style="resize: none">
					<a class="btn btn-info" href="<c:url value="/tweet/showAll"/>">Wszystkie wpisy</a> 
					<a class="btn btn-info" href="<c:url value="/tweet/userTweets"/>">Twoje Tweety</a>
				</div>
				<hr>
				<div id="addComment">
					<f:form method="post" action="${commentLink}" modelAttribute="comments">
						<f:hidden value="${mainUser.getId()}" path="user.id"/>
						<f:hidden value="${tweet.getId()}" path="post.id"/>
						<f:textarea path="text"/>
						<input type="submit" class ="btn btm-success" value="Dodaj komentarz"/>
						<f:errors path="*"/>
					</f:form>
				</div>	
				<div id="rcorners1" class="conatiner-fluid">
					<p>
						<b>Dodany przez: </b>${tweet.getUser().getUsername() }</p>
					<p>
						<b>Dodano: </b>${tweet.getCreated().toString().substring(0,19)}</p>
					<p>${tweet.getText() }</p>
				</div>
				<c:forEach items="${allComments}" var="c">
					<div id="commentsId">
						<p>Komentarz użytkownika: ${c.getUser().getUsername() }</p>
						<p>Dodano: ${c.getCreated().toString().substring(0,19)}
						<p>${c.getText()}</p>
					</div>
				</c:forEach>
			
		</jsp:body>
	</t:mainLayout>
	
</body>
</html>