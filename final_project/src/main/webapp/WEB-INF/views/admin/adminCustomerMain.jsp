<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<title>고객센터</title>
	<style>
		tr>th {
			text-align: center;
		}

		.banana {
			text-align: center;
		}

		.mango {
			color: #727272;
			margin-left: 20px;
		}

		a:hover, a:focus, a:visited {
			text-decoration: underline;
		}

		.searchBtn {
			border: 1px solid;
			border-color: #55a4d3;
			border-radius: 3px;
			background-color: #55a4d3;
			color: white;
			height: 26px;
		}

		.searchBar {
			margin-top: 8px;
			width: 200px;
		}

		.toolbarSize {
			height: 56px;
		}
	</style>

</head>
<body>
	<div id="wrapper" class="">
		<c:import url="../default/adminHeader.jsp"/>

		<!-- PAGING -->
		<c:choose>
			<c:when test="${param.pageNum == null}">
				<c:set var="pageNum" value="0" />
				<c:set var="next" value="0" />
			</c:when>
			<c:otherwise>
				<c:set var="pageNum" value="${param.pageNum}" />
				<c:set var="next" value="${param.next}" />
			</c:otherwise>
		</c:choose>

		<!-- PAGE CONTENT -->
		<div id="page-content-wrapper">
			<div id="topbar">
				<div class="pull-left">
					<h1 class="company-name" onclick="location.href='admin'"><b>고객센터</b></h1>
				</div>
				<div class="pull-right">
					<div id="header_user" style="padding-right: 20px;">
						<a href="login"><b>회원 페이지</b></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<div id="main-content">
				<div class="content-body">
					<div class="col-lg-12 main-box-container">
						<div class="box">

							<!-- 공지사항 출력 -->
							<div class="box-content">
								<div class="table-container">
									<table id="admin_Customer" class="table is-datatable dataTable test">
										<thead>
											<tr>
												<th class="select-checkbox no-filter"></th>
												<th class="no-filter" width="5%">번   호</th>
												<th width="59%">제   목</th>
												<th width="12%">작성자</th>
												<th width="12%">작성일</th>
												<th width="12%">관   리</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${customerList}">
												<tr>
													<td class="select-checkbox no-filter"></td>
													<td class="no-filter">${list.cus_num}</td>
													<td>${list.cus_title}</td>
													<td>${list.cus_nick}</td>
													<td>${list.cus_date}</td>
													<td>
														<c:choose>
															<c:when test="${list.cus_reNum == 0}">
																<span class="btn btn-xs btn-success" onclick="#">답변 대기</span>
															</c:when>
															<c:when test="${list.cus_reNum > 0}">
																<span class="btn btn-xs btn-danger" onclick="#" disabled>답변 완료</span>
															</c:when>
															<c:otherwise>
																<span class="btn btn-xs btn-default" onclick="#">답변 보류</span>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<!-- PAGING -->
							<div class="text-center">
								<ul class="pagination">
									<!-- 이전 버튼 -->
									<li>
										<c:if test="${pageNum > 9}">
											<a href="adminCustomerMain?next=${next-1}&pageNum=${(next-1) * 10 + 9}">«</a>
										</c:if>
									</li>
									<!-- 번호 출력 -->
									<c:choose>
										<c:when test="${totalNum > next * 10 + 10}">
											<c:forEach begin="${next * 10 + 1}" end="${next * 10 + 10}" step="1" var="cnt">
												<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
													<a href="adminCustomerMain?next=${next}&pageNum=${cnt-1}">${cnt}</a>
												</li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${next * 10 + 1}" end="${totalNum}" step="1" var="cnt">
												<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
													<a href="adminCustomerMain?next=${next}&pageNum=${cnt-1}">${cnt}</a>
												</li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<!-- 다음 버튼 -->
									<li>
										<c:if test="${totalNum > next * 10 + 10 }">
											<a href="adminCustomerMain?next=${next + 1}&pageNum=${(next + 1) * 10}">»</a>
										</c:if>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /PAGE CONTENT -->
	</div>
</body>
</html>