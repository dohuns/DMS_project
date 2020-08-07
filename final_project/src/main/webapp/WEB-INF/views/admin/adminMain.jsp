<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DOMISU 관리자 페이지</title>
	<style>
		html, body, div {
			height: 95%;
		}
		body #mainContent {
			height: 95%;
		}
		.mainContent {
			display: flex;
			height: 100%;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="mainContent">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />
				관리자 메인 페이지!
			</div>
		</div>
	</div>
</body>
</html>