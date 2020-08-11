<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function() {
			// 체크박스 전체 선택
			$("#chkBox").click(function() {
				var chk = $("#chkBox").prop("checked");
			    var boxSize = $(".chkBoxs").length;
				if(chk) {
					$(".chkBoxs").prop("checked", true);
					if(boxSize > 0) {
						$(".contentBtn button").prop("disabled", false);
					}
				} else {
					$(".chkBoxs").prop("checked", false);
					$(".contentBtn button").prop("disabled", true);
				}
			});

			// 체크박스 선택 시 버튼 활성화
			$('.chkBoxs').click(function() {
				var chkBox = $(this).prop('checked');					// 클릭한 값이 체크되도록 지정
			    var boxSize = $(".chkBoxs").length;						// 목록 값 수
			    var chkSize = $(".chkBoxs:checked").length;				// 체크된 값 수
			    
				// 전체 선택 || 체크박스 하나 이상 선택 시 버튼 활성화
				if (chkBox == true || chkSize > 0) {
					$(".contentBtn button").prop("disabled", false);
				} else {
					$(".contentBtn button").prop("disabled", true);
				}

			    // 목록 개수와 선택된 개수가 같을 경우 전체 선택 버튼 활성화
				if (boxSize == chkSize) {
					$("#chkBox").prop("checked", true);
				} else {
					$("#chkBox").prop("checked", false);
				}
			});
		});

		// 계정 삭제(탈퇴회원으로 변경)
		function delRank() {
			var message = confirm("선택한 회원 정보를 삭제하시겠습니까?");
			if (message) {
				$('#contentForm').submit();
			}
		}

		// MODAL 출력(선택한 값 포함)
		function updRank() {
			var m_idChk = [];
			var html = "";
			$.each($("input[name=m_idChk]:checked"), function() {
				m_idChk.push($(this).val());
			});
			$("#idArr")
					.html(
							"<input type='hidden' name='m_idChk' value='" + m_idChk + "'>");
			$('#upd-Rank').modal('show');
		}
	</script>
	<style>
		html, body, div {
			height: 95%;
		}
		body #main {
			height: 95%;
		}
		.mainContent {
			display: flex;
			height: 100%;
		}
		.divContent {
			width: 100%;
			padding: 35px;
			min-width: 800px;
			max-height: 800px;
			margin: 50px 0 50px 250px;
		}
		tr>th, .chkTd {
			text-align: center;
		}
		.td-st {
			text-indent: 20px;
		}
		.contentPage {
			padding-top: 35px;
			text-align: center;
		}
		.contentBtn button {
			margin-left: 10px;
		}
		.pagination>.active>a.pageBtn, 
		.pagination>.active>a.pageBtn:hover, 
		.pagination>.active>a.pageBtn:focus {
			background-color: #5BC0DE;
			border-color: #5BC0DE;
		}
		.btn-st{
			float: right;
			margin-left: 10px;
		}
		.modal-sz {
			height: 240px;
		}
		.td-st a,
		.td-st a:focus,
		.td-st a:visited {
			color: #333;
			text-decoration: none;
		}
		.td-st a:hover {
			color: #333;
			cursor: pointer;
			font-weight: 600;
			text-decoration: underline;
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
		<div id="main">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />

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

				<!-- CONTENT -->
				<div class="divContent">
					<form id="contentForm" action="adminDelRank">
						<input type="hidden" name="m_rankNum" value="${param.m_rankNum}">
						<table class="table table-td">
							<thead>
								<tr>
									<th width="5%">
										<input type="checkbox" name="chkBox" id="chkBox">
									</th>
									<th width="20%">아이디</th>
									<th width="20%">닉네임</th>
									<th width="35%">이메일</th>
									<th width="20%">등 급</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty memberList}">
										<c:forEach var="list" items="${memberList}">
											<tr>
												<td class="chkTd">
													<input type="checkbox" name="m_idChk" id="m_idChk"
														class="chkBoxs" value="${list.m_id}">
												</td>
												<td class="td-st"><a href="adminMemberInfo?cus_id=${list.m_id}&page=1">${list.m_id}</a></td>
												<td class="td-st">${list.m_nick}</td>
												<td class="td-st">${list.m_email}</td>
												<td class="chkTd">${list.m_rank}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="5" class="chkTd">회원 내역이 없습니다.</td></tr>
									</c:otherwise>
								</c:choose>

								<tr>
									<td colspan="5">
										<!-- 등급변경/삭제버튼 -->
										<div class="contentBtn">
											<c:if test="${param.m_rankNum ne 5}">
												<button type="button" disabled="disabled"
													class="btn btn-danger btn-st" onclick="delRank()">삭제</button>
											</c:if>
											<button type="button" disabled="disabled"
												class="btn btn-default btn-st" onclick="updRank()">변경</button>
										</div>
										<!-- PAGING -->
										<div class="contentPage">
											<ul class="pagination">
												<!-- 이전 버튼 -->
												<li><c:if test="${pageNum > 9}">
														<a class="pageBtn"
															href="adminMemberList?next=${next-1}&pageNum=${(next-1) * 10 + 9}&m_rankNum=${param.m_rankNum}">«</a>
													</c:if>
												</li>
												<!-- 번호 출력 -->
												<c:choose>
													<c:when test="${totalNum > next * 10 + 10}">
														<c:forEach begin="${next * 10 + 1}" end="${next * 10 + 10}" step="1" var="cnt">
															<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
																<a class="pageBtn"
																	href="adminMemberList?next=${next}&pageNum=${cnt-1}&m_rankNum=${param.m_rankNum}">${cnt}</a>
															</li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${next * 10 + 1}" end="${totalNum}" step="1" var="cnt">
															<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
																<a class="pageBtn"
																	href="adminMemberList?next=${next}&pageNum=${cnt-1}&m_rankNum=${param.m_rankNum}">${cnt}</a>
															</li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<!-- 다음 버튼 -->
												<li><c:if test="${totalNum > next * 10 + 10 }">
														<a class="pageBtn"
															href="adminMemberList?next=${next + 1}&pageNum=${(next + 1) * 10}&m_rankNum=${param.m_rankNum}">»</a>
													</c:if>
												</li>
											</ul>
										</div>
	
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

				<!-- MODAL -->
				<div id="upd-Rank" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content modal-sz">
							<form action="adminUpdRank">
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
											<label>등 급</label> <select name="m_rankNum"
												class="form-control">
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
									<button type="submit" id="btn-regist" class="btn btn-primary">저장</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /MODAL -->

			</div>
		</div>
	</div>
</body>
</html>