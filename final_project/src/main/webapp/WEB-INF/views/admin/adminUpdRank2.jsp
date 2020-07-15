<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<script>
		// 체크박스 전체 선택 및 해제 버튼
		function rankChkAll() {
			if( $('#rankChk').is(':checked')) {
				$("input[name=m_id]").prop("checked", true);
			} else {
				$("input[name=m_id]").prop("checked", false);
			}
		}

		// 계정 선택 삭제
		function deleteAlert() {
			var message = confirm("선택한 회원정보를 삭제하시겠습니까?");
			if(message) {
				$("#form").submit();
			}
		}
	</script>
	<meta charset="UTF-8">
	<title>등급 변경</title>
</head>
<body>
	<div id="wrapper" class="">
		<c:import url="../default/adminHeader.jsp"/>
		<!-- PAGE CONTENT -->
		<div id="page-content-wrapper">
			<div id="topbar">
				<div class="pull-left">
					<h1 class="company-name" onclick="location.href='admin'"><b>관리자 페이지</b></h1>
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
								<h1 class="pull-left"><b>정보 변경</b></h1>
								<div class="actions pull-right">
									<a href="#" class="btn btn-sm">등급 변경</a>
									<a href="#" onclick="deleteAlert()" class="btn btn-sm">계정 삭제</a>
								</div>
							</div>

							<div class="box-content">
								<div class="table-container">
									<form action="delAllMember" id="form">
										<table id="edit_account" class="table is-datatable dataTable">
											<thead>
													<tr>
													<th class="select-checkbox no-filter"></th>
													<th width="5%">
														<input type="checkbox" name="rankChk" id="rankChk" onclick="rankChkAll();">
													</th>
													<th class="no-filter" width="20%">아이디</th>
													<th width="20%">닉네임</th>
													<th width="35%">이메일</th>
													<th width="20%">등   급</th>
													</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${memberList}">
													<tr>
														<td class="select-checkbox no-filter"></td>
														<td>
															<input type="checkbox" name="m_idChk" value="${list.m_id}">
														</td>
														<td class="no-filter">${list.m_id}</td>
														<td>${list.m_nick}</td>
														<td>${list.m_email}</td>
														<td>${list.m_rank}</td>
													</tr>
												</c:forEach>
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