<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<title>main Page</title>
</head>
<body>
	<div class="center">
		<f:form action="register" method="post" modelAttribute="user">
			<div>
				Nazwa użytkownika:
				<f:input path="username" />	<c:if test="${invalidName != null }">
					<a class="error"> ${invalidName}</a>
					</c:if>
				<f:errors path="username" cssClass="error" />
			</div>
			<div>
				Hasło:
				<f:password path="password" />
				<f:errors path="password" cssClass="error" />
			</div>
			<div>
				E-mail:
				<f:input type="email" path="email" />
				<f:errors path="email" cssClass="error" />
				<c:if test="${invalidEmail != null }">
					<a class="error"> ${invalidEmail}</a>
				</c:if>
			</div>
			<div>
				<input type="submit" value="Zarejestruj się" />
			</div>
		</f:form>
	</div>
</body>
</html>