<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<title>Strona logowania aplikacji Twitter</title>
</head>
<body>
	<div class="center">
		<form action="login" method="post">
			<div>
				Login: <input type="text" name="username" />
			</div>
			<div>
				Hasło: <input type="password" name="password" />
			</div>
			<div>
				<input type="submit" value="Zaloguj się" />
			</div>
			<div>
				Nie masz jeszcze konta? <a href="register">Zarejestruj się</a>
			</div>
		</form>
	</div>
</body>
</html>