<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<div class = "container-fluid">
				<form id = "formMessage" action="<c:url value="/message/modifySentMessage"/>" method="post">
					<button type="submit" form="formMessage" class="btn btn-danger"  name="action" value="delete">Usuń</button>
				</form>	

				<table class="table ex1">
					<thead>
						<tr>
							<th colspan="3"><a style="font-size:large; text-align:center">Wiadomości wysłane</a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sentMessageList}" var="m">
							<tr>
								<td style="width:5%">
									<input form="formMessage" type="checkbox" name="check" value="${m.getId()}"/>
								</td>
								<td>
									<a><b>Odbiorca: ${m.getUser().getUsername() }</b></a><br>
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
			</div>
		</jsp:body>
	</t:mainLayout>
</body>
</html>