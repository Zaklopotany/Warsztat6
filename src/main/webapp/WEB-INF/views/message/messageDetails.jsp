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
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>"
	rel="stylesheet" type="text/css">	

<title>Insert title here</title>
</head>
<body>
	<t:mainLayout>
		
		<jsp:body>
			<div class="container-fluid">
				<h3 class="text-center">Szczegóły wiadomości o id: ${message.getId() }</h3>
				<div>
					<p>Nadawca: ${message.getSender().getUsername()}</p>
					<p>Odbiorca: ${message.getUser().getUsername()}</p>
					<p>Data wysłania: ${message.getCreated().toString().substring(0,19) }</p>
					<p>Treść: </p>
					<p>${message.getText()}</p>
				</div>
			</div>
		</jsp:body>
	</t:mainLayout>
</body>
</html>