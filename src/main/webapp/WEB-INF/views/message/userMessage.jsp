<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:body>
			<div class="container-fluid">
				<table>
					<thead>
						<tr>
							<th> Nowe wiadomości</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messageList}" var="m">
							<tr>
								<td>
									<p>Nadawca: </p>
									<p> Data wysłania: </p>
									<p>Treść: </p>
									<p>Gówno z ifem jeżeli więćej niż trzydzieśći znaków </p> 
									<p><a href="#">Pokaż więcej...</a></p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				<table>
					<thead>
						<tr>
							<th> Przeczytane</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messageListRead}" var="mr">
							<tr>
								<td>
									<p>Nadawca: </p>
									<p> Data wysłania: </p>
									<p>Treść: </p>
									<p>Gówno z ifem jeżeli więćej niż trzydzieśći znaków </p> 
									<p><a href="#">Pokaż więcej...</a></p>
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