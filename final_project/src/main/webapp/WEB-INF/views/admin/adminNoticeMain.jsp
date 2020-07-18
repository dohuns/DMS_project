<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<title>공지사항</title>
	<style>
		tr>th {
			text-align: center;
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
					<h1 class="company-name" onclick="location.href='admin'"><b>공지사항</b></h1>
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
							<div class="box-head clearfix">
								<div class="actions pull-left">
									<form action="#">
										<input type="text" id="keyword" onkeyup="showData(this.value)"
											style="margin-top: 5px; width: 200px;">
										<button type="button" class="searchBtn"><i class="glyphicon glyphicon-search"></i></button>
									</form>
								</div>
							</div>

							<div class="box-content">
								<div class="table-container">
									<table id="admin_Notice" class="table is-datatable dataTable">
										<thead>
											<tr>
												<th class="select-checkbox no-filter"></th>
												<th class="no-filter" width="5%">000</th>
												<th width="59%">제   목</th>
												<th width="12%">작성자</th>
												<th width="12%">작성일</th>
												<th width="12%">관   리</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="select-checkbox no-filter"></td>
												<td>001</td>
												<td>[점검] 점검중입니다.</td>
												<td>관리자</td>
												<td>2020-07-18</td>
												<td>[삭제]</td>
											</tr>
										</tbody>
									</table>
								</div>
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