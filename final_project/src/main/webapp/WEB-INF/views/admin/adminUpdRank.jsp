<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script>
		// 체크박스 전체 선택 및 해제 버튼
		function rankChkAll() {
			if( $('#rankChk').is(':checked')) {
				$("input[name=m_idChk]").prop("checked", true);
			} else {
				$("input[name=m_idChk]").prop("checked", false);
			}
		}

		// 계정 선택 삭제
		function delUser() {
			var message = confirm("선택한 회원정보를 삭제하시겠습니까?");
			if(message) {
				$('#form').attr('action', 'delAllMember').submit();
			}
		}

		// 변경할 아이디 목록을 Modal로 이동
		function updRank() {
			var m_idChk = [];
			var html = "";
			$.each($("input[name=m_idChk]:checked"), function() {
				m_idChk.push($(this).val());
			});
			$("#idArr").html("<input type='hidden' name='m_idChk' value='" + m_idChk + "'>");
			console.log("UpdRank.JSP : " + m_idChk);
			$('#upd-Rank').modal('show'); 
		}
		</script>

	<style>
		.searchBtn {
			border: 1px solid;
			border-color: #55a4d3;
			border-radius: 3px;
			background-color: #55a4d3;
			color: white;
			height: 26px;
		}
	</style>
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
						<a href="login"><b>등급 변경 페이지</b></a>
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
										<input type="text" id="keyword" name="keyword" style="margin-top: 8px; width: 200px;">
										<button type="submit" class="searchBtn"><i class="glyphicon glyphicon-search"></i></button>
									</form>
								</div>
								<div class="actions pull-right">
									<a href="javascript:;" type="button" id="updRankBtn"
										class="btn btn-sm" title="Change Rank"
										onclick="updRank()">등급 변경</a>
									<a href="#" type="button" onclick="delUser()"
										class="btn btn-sm">계정 삭제</a>
								</div>
							</div>

							<div class="box-content">
								<div class="table-container">
									<form id="form">
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

							<!-- MODAL -->
							<div id="upd-Rank" class="modal fade" tabindex="-1" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<form id="inven_hedge_info" action="updChkRank">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
												<h4 class="modal-title">등급 변경</h4>
											</div>
											<div id="idArr"></div>
											<div class="modal-body clearfix">
												<div class="col-lg-12">
													<div class="form-group">
														<label for="">등 급</label>
														<select name="m_rankNum" class="form-control">
															<option value=1>관리자</option>
															<option value=2>스탭</option>
															<option value=3>일반회원</option>
															<option value=4>대기회원</option>
														</select>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소</button>
												<button type="submit" id="btn-regist"
													class="btn btn-primary">저장</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- /MODAL -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /PAGE CONTENT -->
	</div>
</body>
</html>