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
		.mainBoard {
			width: 100%;
			min-width: 800px;
			margin: 50px 0 50px 250px;
		}
		.mainBoard .table-st {
			width: 95%;
			margin: 28px 20px;
			border: 1px solid #DDD;
			border-radius: 10px;
			border-collapse: inherit;
		}
		.mainBoard .table-st tr>th,
		.mainBoard .table-st tr>td {
			padding: 8px;
			text-indent: 20px;
		}
		.mainBoard .table-st tr>th {
			font-size: 14px;
			background-color: #DDD;
 			border-radius: 10px 10px 0 0;
		}
		.mainBoard .table-st tr>th>a,
		.mainBoard .table-st tr>th>a:hover,
		.mainBoard .table-st tr>th>a:focus,
		.mainBoard .table-st tr>th>a:active {
			color: black;
			float: right;
			margin-right: 10px;
			text-decoration: none;
		}
		.mainBoard .table-st tr>td {
			border-top: 1px solid #DDD;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="mainContent">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />
				<div class="mainBoard">
					<table class="table-st">
						<thead>
							<tr>
								<th colspan="2">카테고리<a href="#">▼</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>게시글에 관련된 내용 출력 예정</td>
								<td>2020.08.08</td>
							</tr>
							<tr>
								<td>게시글에 관련된 내용 출력 예정</td>
								<td>2020.08.08</td>
							</tr>
							<tr>
								<td>게시글에 관련된 내용 출력 예정</td>
								<td>2020.08.08</td>
							</tr>
							<tr>
								<td>게시글에 관련된 내용 출력 예정</td>
								<td>2020.08.08</td>
							</tr>
							<tr>
								<td>게시글에 관련된 내용 출력 예정</td>
								<td>2020.08.08</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>