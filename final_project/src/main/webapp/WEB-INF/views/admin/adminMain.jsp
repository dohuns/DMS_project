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
		.mainBoard a,
		.mainBoard a:focus,
		.mainBoard a:visited {
			color: #333;
			text-decoration: none;
		}
		.mainBoard a:hover {
			color: #333;
			cursor: pointer;
			font-weight: 600;
			text-decoration: underline;
		}
		.mainBoard .date-st {
			text-align: right;
		}
	</style>
</head>
<body>
	<c:if test="${sessionScope.m_rankNum ne 1}">
		<script type="text/javascript">
			alert("잘못된 접근 방식입니다.");
			history.go(-1);
		</script>
	</c:if>

	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="mainContent">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />
				<div class="mainBoard">
					<table class="table-st">
						<thead>
							<tr>
								<th colspan="2">공지사항<a href="#">▼</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${listAdmin}" begin="0" end="4">
								<tr>
									<td><a href="board/list?b_category=${list.b_category}&b_article=${list.b_article}">${list.b_title}</a></td>
									<td class="date-st">${list.b_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>