<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>"
	rel="stylesheet" type="text/css">	

</head>
<body>
<c:url value="/message/sendMessageUnknown" var="linkMessage"/>
	<t:mainLayout>
		<jsp:attribute name="submenu">
			<h3>Akcja</h3>
			<a href="<c:url value="/message/sendMessage"/>">Nowa wiadomość</a><br>
			<a href="<c:url value="/message/showMailBox"/>">Skrzynka odbiorcza</a><br>
			<a href="<c:url value="/message/showSentMessage"/>">Skrzynka nadawcza</a>
		</jsp:attribute>
		<jsp:body>
			<div>
				<form action="<c:url value="/message/sendMessageUnknown/getUser"/>" method="post">
					<input type="text" name="name"/>
					<input type="submit" value="Wyszukaj użytkownika"/>
				</form>
				<c:if test="${lackOfUsername != null }">
					${lackOfUsername}
				</c:if>
				<c:if test="${user != null }">
					<h2> Wiadomość do użytkownika: ${user.getUsername()}</h2>	
				</c:if>
				<f:form action="${linkMessage}" method="post" modelAttribute="message">
					<c:if test="${user != null }">
						<f:hidden path="user.id" value="${user.getId()}"/>
					</c:if>
					<f:hidden path="sender.id" value="${message.getSender().getId() }"/>
					<f:textarea path="text"/>
					<input type="submit" value="Wyślij wiadomość"/>
					<f:errors path="*"/>
				</f:form>
				<c:if test="${userError == true}">
					<p> Nie możeszy wysłać wiadomości do samego siebie!!!</p>
				</c:if>
				<c:if test="${userCheat == true }">
					<p> Nie bądź taki chytry, za kradzież tożsamości jest od 2 do 5 lat</p>
				</c:if>
			</div>
			<div>
				<c:if test="${userList != null }">
					<table class="table ex2">
						<thead>
							<tr>
								<th>Id użytkownika</th>
								<th>Nazwa użytkownika</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${userList}" var="ul">
							<tr>
								<td>${ul.getId()}</td>
								<td>${ul.getUsername()}</td>
								<td><a href="<c:url value="/message/sendMessageUnknown/${ul.getId()}"/>" class="btn btn-success">Wybierz</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</jsp:body>
	</t:mainLayout>
</body>
</html>