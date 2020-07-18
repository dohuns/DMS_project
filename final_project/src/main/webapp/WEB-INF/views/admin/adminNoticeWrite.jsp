<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<meta charset="UTF-8">
	<title>공지사항 작성</title>
</head>
<body>
	<div id="wrapper" class="">
		<c:import url="../default/adminHeader.jsp"/>
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
											style="margin-top: 7px; width: 200px;">
										<button type="button" class="searchBtn"><i class="glyphicon glyphicon-search"></i></button>
									</form>
								</div>
							</div>

							<div class="box-content">
								<div class="table-container">
									<form id="form">
										<table id="edit_account" class="table is-datatable dataTable">
											<thead>
												<tr>
													<th>테스트중입니다.</th>
												</tr>
											</thead>
												<tr>
													<td>테스트중입니다.</td>
												</tr>
											<tbody>
											</tbody>
										</table>
									</form>
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