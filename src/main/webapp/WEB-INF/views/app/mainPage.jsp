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
	<c:set var="align" value="left" />
	<c:url var="linkForm" value="/tweet/addTweet" />
	
	<t:mainLayout>
		<jsp:body>
			<div class="conatiner-fluid" style="resize: none">
					<a class="btn btn-info" href="<c:url value="/tweet/showAll"/>">Wszystkie wpisy</a> 
					<a class="btn btn-info" href="<c:url value="/tweet/userTweets"/>">Twoje Tweety</a>
				</div>
				<hr>
				<div id="rcorners1" class="container-fluid">
					<p>${user.getUsername()}  dodaj nowy wpis :)</p>
					<f:form action="${linkForm}" method="POST" modelAttribute="tweet">
						<f:hidden path="user.id" value="${user.getId()}" />
						<f:textarea style="width:100%" path="text" />
						<input type="submit" value="Dodaj" />
					</f:form>
				</div>
				<c:forEach items="${tweetList}" var="tl" varStatus="status">
				<c:if test="${status.index > 0}">
						<c:if test="${tweetList.get(status.index).getUser().getId() != tweetList.get(status.index - 1).getUser().getId()}">
							<c:choose>
								<c:when test="${align eq 'right'}">
									<c:set var="align" value="left" />								
								</c:when>
								<c:otherwise>
									<c:set var="align" value="right" />
								</c:otherwise>
							</c:choose>
						</c:if>
				</c:if>
					<div id="rcorners1" style="float:${align}; width:60%" class="container-fluid">
						<a style="float: left" href="<c:url value="/tweet/oneUserTweet/${tl.getUser().getId()}"/>"><b>${tl.getUser().getUsername()}</b></a> <a style="float: right">${tl.getCreated().toString().substring(0,19)}</a>
						<br>
						<p>${tl.getText()}</p>
					</div>
				</c:forEach>
		</jsp:body>
	</t:mainLayout>

</body>
</html>