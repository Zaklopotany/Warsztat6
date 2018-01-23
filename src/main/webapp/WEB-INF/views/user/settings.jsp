<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<form action ="<c:url value="/user/settings"/>" method="post" >
			<table>
				<thead>
					<tr>
						<th colspan="2">
							Aktualizuj swoje dane
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							Nazwa użytkownika 
						</td>
						<td>
							<input name="username" value="${user.getUsername()}" />
						</td>
					</tr>				
					<tr>
						<td>
							Hasło 
						</td>
						<td>
							<input name="password" />
						</td>
					</tr>				
				</tbody>
			</table>
			<input type="submit" class="btn btn-success" value="Zapisz zmiany" />
			<p><c:if test="${invalidName != null }"> ${invalidName} </c:if> </p>
			</form>
		
		</jsp:body>
	</t:mainLayout>
</body>
</html>