<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<jsp:attribute name="submenu">
			<h3>Akcja</h3>
			<a href="<c:url value="/message/sendMessage"/>">Nowa wiadomość</a><br>
			<a href="<c:url value="/message/showMailBox"/>">Skrzynka odbiorcza</a><br>
			<a href="<c:url value="/message/showSentMessage"/>">Skrzynka nadawcza</a>
		</jsp:attribute>
		<jsp:body>
			<div class="container-fluid">
				<form id = "formMessage" action="<c:url value="/message/modifyMessage"/>" method="post">
					<button type="submit" form="formMessage" class="btn btn-danger"  name="action" value="delete">Usun</button>
					<button type="submit" form="formMessage" class="btn btn-primary"  name="action" value="read">Oznacz jako przeczytane</button>
					<button type="submit" form="formMessage" class="btn btn-primary"  name="action" value="unread">Oznacz jako nieprzeczytane</button>
				</form>	
				<table class="table ex1">
					<thead>
						<tr>
							<th colspan="3"><a style="font-size:large; text-align:center">Nowe wiadomości</a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messageList}" var="m">
							<tr>
								<td style="width:5%">
									<input form="formMessage" type="checkbox" name="check" value="${m.getId()}"/>
								</td>
								<td>
									<a><b>Nadawca: ${m.getSender().getUsername() }</b></a><br>
									<a>Data wysłania: ${m.getCreated().toString().substring(0,19) }</a><br>
									<a>Treść: </a>
									<a>
										<c:choose>
											<c:when test="${fn:length(m.getText()) > 30}">
												${m.getText().substring(0,30)}...
											</c:when>
											<c:otherwise>
												${m.getText()}										
											</c:otherwise>
										</c:choose>
									</a> 
								</td>
								<td>
									<a style="text-align:right" href="<c:url value = "/message/messageDetails/${m.getId() }"/>">Pokaż więcej...</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				<table class="table ex1">
					<thead>
						<tr>
							<th colspan="3"><a style="font-size:large; text-align:center">Przeczytane</a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messageListRead}" var="mr">
							<tr>
								<td style="width:5%">
									<input form="formMessage" type="checkbox" name="check" value="${mr.getId()}"/>
								</td>
								<td>
									<a>Nadawca: ${mr.getSender().getUsername() }</a><br>
									<a>Data wysłania: ${mr.getCreated().toString().substring(0,19) }</a><br>
									<a>Treść: </a>
									<a>
										<c:choose>
											<c:when test="${fn:length(mr.getText()) > 30}">
												${mr.getText().substring(0,30)}...
											</c:when>
											<c:otherwise>
												${mr.getText()}										
											</c:otherwise>
										</c:choose>
									</a> 
								</td>
								<td>
									<a style="text-align:right" href="<c:url value = "/message/messageDetails/${mr.getId() }"/>">Pokaż więcej...</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</jsp:body>
	</t:mainLayout>
</body>
</html>