<%@ tag description="basic table display" language="java"
	pageEncoding="UTF-8"%>
<%@tag import="java.lang.String"%>
<%@tag import="java.util.List"%>

<%@attribute name="colName" required="true" type="java.lang.String[]"%>
<%@attribute name="tableContent" fragment="true"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/VIEW/css/bootstrap.css">
</head>
<body>
	<div class="container">

		<table class="table table-my-stripped">
			<thead>
				<tr>

					<c:forEach end="${fn:length(colName) - 1}" begin="0" varStatus="s">
						<th>${colName[s.index]}</th>
					</c:forEach>

				</tr>
			</thead>
			<tbody>
						<jsp:invoke fragment="tableContent"/>
			</tbody>
		</table>
	</div>
</body>
</html>
