<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<!-- 회원 정보 삭제 -->
	<script>
		function deleteAlert(m_id, m_nick) {
			var message = confirm(m_nick + " [ " + m_id + " ] " + '님의 회원정보를 삭제하시겠습니까?');
			if(message == true) {
				location.href = "delMember?m_id=" + m_id;
			}
		}
	</script>

	<!-- 계정 확인 -->
	<script>
		// 아이디 중복체크 
		function chk_id() {
			var id = $("#m_id").val();
			$.ajax({
				url : "overlapId",
				type : "GET",
				data : "m_id=" + id,
				success : function(arg) {
					if (arg == false) {
						$("#label_id").text("사용가능한 ID입니다.");
						$("#label_id").css({
							"color" : "blue"
						})
						$("#m_id").attr("readonly", true);
						$("#btn_chk_id").attr("disabled", "disabled");
					} else {
						$("#label_id").text("중복된 ID입니다.");
						$("#label_id").css({
							"color" : "red"
						})
					}
				},
				error : function() {
					alert("아이디 중복체크 오류")
				}
			});
		}

		// 닉네임 중복 체크
		function chk_nick() {
			var nick = $("#m_nick").val();
			$.ajax({
				url : "overlapNick",
				type : "GET",
				data : "m_nick=" + nick,
				success : function(arg) {
					if (arg == true) {
						$("#label_nick").text("사용가능한 닉네임 입니다.");
						$("#label_nick").css({
							"color" : "blue"
						})
						$("#m_nick").attr("readonly", true);
						$("#btn_chk_nick").attr("disabled", "disabled");
					} else {
						$("#label_nick").text("중복 된 닉네임 입니다.");
						$("#label_nick").css({
							"color" : "red"
						})
					}
				},
				error : function() {
					alert("닉네임 중복체크 오류");
				}
			});
		}

		// input 공백 체크(id, label, column명(한글))
		function chk_blank(id, label, column) {
			if ($("#" + id).val() == "") {
				if (id == "m_date") {
					$("#" + label).text(column + "을(를) 선택 해주세요.");
				} else {
					$("#" + label).text(column + "을(를) 입력 해주세요.");
				}
				$("#" + label).css({
					"color" : "red"
				});
			} else {
				$("#" + label).text("");
			}
		}

		// 추가 버튼 활성화 
		function buttonAble() {
			if ($("#label_id").text() == "사용가능한 ID입니다." && $("#m_pw").val() != ""
					&& $("#m_name").val() != ""
					&& $("#label_nick").text() == "사용가능한 닉네임 입니다."
					&& $("#label_pw").text() == "") {
	
				$("#btn-regist").prop("disabled", false);
				
			} else {
				
				$("#btn-regist").prop("disabled", true);
			}
		}

		// label_id text 값 유지
		function keepId() {
			if($("#btn_chk_id").is(":disabled")) {
				$("#label_id").text("사용가능한 ID입니다.");
				$("#label_id").css({
					"color" : "blue"
				})
				console.log("btn_chk_id는 비활성화됨")
			} else {
				console.log("keepId 실행오류")
			}
		}

		// label_nick text 값 유지
		function keepNick() {
			if($("#btn_chk_nick").is(":disabled")) {
				$("#label_nick").text("사용가능한 닉네임 입니다.");
				$("#label_nick").css({
					"color" : "blue"
				})
				console.log("btn_chk_nick는 비활성화됨")
			} else {
				console.log("keepNick 실행오류")
			}
		}

		// input에 blur 적용
		function chkId() {
			chk_blank("m_id", "label_id", "아이디");
			buttonAble();
			keepId();
		}

		function chkPw() {
			chk_blank("m_pw", "label_pw", "비밀번호");
			buttonAble();
		}

		function chkName() {
			chk_blank("m_name", "label_name", "이름");
			buttonAble();
		}

		function chkNick() {
			chk_blank("m_nick", "label_nick", "닉네임");
			buttonAble();
			keepNick();
		}

		// 글자 수 제한 
		$(function() {

			// 아이디 제한
			$("#m_id").on('keyup', function() {
				if ($(this).val().length > 16) {
					console.log("아이디")
					$("#label_id").text("아이디는 16자 이하로 작성해주세요")
					$("#label_id").css({
						"color" : "red"
					});
					$(this).val($(this).val().substring(0, 16));
				}
			});

			// 닉네임 제한
			$("#m_nick").on('keyup', function() {
				if ($(this).val().length > 8) {
					console.log("닉네임")
					$("#label_nick").text("닉네임은 8자 이하로 작성해주세요")
					$("#label_nick").css({
						"color" : "red"
					});
					$(this).val($(this).val().substring(0, 8));
				}
			});

			// 이름 제한
			$("#m_name").on('keyup', function() {
				if ($(this).val().length > 6) {
					$(this).val($(this).val().substring(0, 6));
					console.log("이름")
					$("#label_name").text("이름은 6자 이하로 작성해주세요")
					$("#label_name").css({
						"color" : "red"
					});
				}
			});
		});
	</script>

	<!-- AJAX -->
	<script>
		function updMember(m_id) {
			console.log("AJAX 접근 완료 : " + m_id);
			$.ajax({
				url: 'updateMember',
				data: {m_id : m_id},
				success: function(memberList) {
					const d = new Date(memberList.m_birth);
					const formattedDate = d.getFullYear() + '-'
						+ ("0" + (d.getMonth() + 1)).slice(-2)
						+ '-' + ("0" + d.getDate()).slice(-2);
					$('#update-member #m_id').val(memberList.m_id);
					$('#update-member #m_pw').val(memberList.m_pw);
					$('#update-member #m_nick').val(memberList.m_nick);
					$('#update-member #m_name').val(memberList.m_name);
					$('#update-member #m_email').val(memberList.m_email);
					$('#update-member #m_birth').val(formattedDate);
					$('#update-member #m_rankNum').val(memberList.m_rankNum);
					$('#update-member').modal('show');
				},
				error: function() {
					console.log("updMember 함수 실행 실패");
				}
			})
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

		tr>th {
			text-align: center;
		}

		.banana {
			text-align: center;
		}
	</style>

	<meta charset="UTF-8">
	<title>정보 검색</title>
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
								<h1 class="pull-left" style="height: 56px;"><b>검색 결과</b></h1>
								<div class="actions pull-left" style="margin-top: 10px;">
									<form action="adminSearchList">
										<select name="searchOption" style="height: 26px;">
										<option value="m_id"    <c:out value="${map.searchOption == 'm_id' ? 'selected' : ''}"   /> > 아이디</option>
										<option value="m_name"  <c:out value="${map.searchOption == 'm_name' ? 'selected' : ''}" /> > 이름</option>
										<option value="m_nick"  <c:out value="${map.searchOption == 'm_nick' ? 'selected' : ''}" /> > 닉네임</option>
										<option value="m_email" <c:out value="${map.searchOption == 'm_email' ? 'selected' : ''}"/> > 이메일</option>
										</select>
										<input type="text" name="keyword" value="${map.keyword}" style="width: 130px;">
										<button type="submit" class="searchBtn">검색</button>
									</form>
								</div>
								<div class="actions pull-right">
									<label style="padding-top: 20px; height: 40px;">회원 수 : ${getRankCount} 명</label>
								</div>
							</div>

							<!-- 회원 목록 출력 -->
							<div class="box-content">
								<div class="table-container">
									<table id="inventories" class="table is-datatable">
										<thead>
											<tr>
												<th class="select-checkbox no-filter"></th>
												<th class="no-filter" width="15%">아이디</th>
												<th width="15%">닉네임</th>
												<th width="15%">이   름</th>
												<th width="25%">이메일</th>
												<th width="15%">등   급</th>
												<th width="15%">관   리</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${searchList}">
												<tr>
													<td class="select-checkbox no-filter"></td>
													<td class="no-filter">${list.m_id}</td>
													<td>${list.m_nick}</td>
													<td>${list.m_name}</td>
													<td>${list.m_email}</td>
													<td class="banana">${list.m_rank}</td>
													<td class="banana">
														<span class="btn btn-xs btn-success" data-toggle="modal"
															id="updButton" title="회원 정보 수정"
															onclick="updMember('${list.m_id}')">수정</span>
														<span class="btn btn-xs btn-danger"
															onclick="deleteAlert('${list.m_id}', '${list.m_nick}')">삭제</span>
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
											<a href="adminSearchList?next=${next-1}&pageNum=${(next-1) * 10 + 9}">«</a>
										</c:if>
									</li>
									<!-- 번호 출력 -->
									<li>
										<c:choose>
											<c:when test="${totalNum > next * 10 + 10}">
												<c:forEach begin="${next * 10 + 1}" end="${next * 10 + 10}"
													step="1" var="cnt">
													<a href="adminSearchList?next=${next}&pageNum=${cnt-1}">${cnt}</a>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach begin="${next * 10 + 1}" end="${totalNum}"
													step="1" var="cnt">
													<a href="adminSearchList?next=${next}&pageNum=${cnt-1}">${cnt}</a>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</li>
									<!-- 다음 버튼 -->
									<li>
										<c:if test="${totalNum > next * 10 + 10 }">
											<a href="adminSearchList?next=${next + 1}&pageNum=${(next + 1) * 10}">»</a>
										</c:if>
									</li>
								</ul>
								<div class="row">
									<label>${pageNum + 1} / ${totalNum}</label><p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- MODAL -->
				<div id="add-inventory" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<form id="inven_hedge_info" action="insChkMember">
								<input type="hidden" name="csrfmiddlewaretoken"
									value="EWOIvVzzLzQnlowipCXQAQ49b9rS4aNE">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">계정 추가</h4>
								</div>
								<div class="modal-body clearfix">
									<div class="col-lg-12">
										<div class="form-group">
											<label for="">아 이 디</label>
											<input type="text" name="m_id" id="m_id"
												class="form-control" onblur="chkId()">
											<label id="label_id"></label>
											<button type="button" id="btn_chk_id" onclick="chk_id()"
												class="btn btn-sm btn-default">중복확인</button>
										</div>
										<div class="form-group">
											<label for="">비밀번호</label>
											<input type="text" name="m_pw" id="m_pw"
												class="form-control" onblur="chkPw()">
											<label id="label_pw"></label>
										</div>
										<div class="form-group">
											<label for="">닉 네 임</label>
											<input type="text" name="m_nick" id="m_nick"
												class="form-control" onblur="chkNick()">
											<label id="label_nick"></label>
											<button type="button" id="btn_chk_nick" onclick="chk_nick()"
												class="btn btn-sm btn-default">중복확인</button>
										</div>
										<div class="form-group">
											<label for="">이 름</label>
											<label id="label_name"></label>
											<input type="text" name="m_name" id="m_name" class="form-control"  onblur="chkName()">
										</div>
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
										data-dismiss="modal">Cancel</button>
									<button type="submit" id="btn-regist" class="btn btn-primary" disabled>Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /MODAL -->

				<!-- 회원 정보 수정 MODAL -->
				<div id="update-member" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<form id="inven_hedge_info" action="updChkMember">
								<input type="hidden" name="csrfmiddlewaretoken"
									value="EWOIvVzzLzQnlowipCXQAQ49b9rS4aNE">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">계정 변경</h4>
								</div>
								<div class="modal-body clearfix">
									<div class="col-lg-12">
										<div class="form-group">
											<label for="">아 이 디</label>
											<input type="text" name="m_id" id="m_id" readonly
												class="form-control">
											<label id="label_id"></label>
										</div>
										<div class="form-group">
											<label for="">비밀번호</label>
											<input type="text" name="m_pw" id="m_pw"
												class="form-control">
											<label id="label_pw"></label>
										</div>
										<div class="form-group">
											<label for="">닉 네 임</label>
											<input type="text" name="m_nick" id="m_nick"
												class="form-control">
											<label id="label_nick"></label>
											<button type="button" id="btn_chk_nick"
												class="btn btn-sm btn-default"
												onclick="chk_nick()">중복확인</button>
										</div>
										<div class="form-group">
											<label for="">이 름</label>
											<label id="label_name"></label>
											<input type="text" name="m_name" id="m_name" class="form-control">
										</div>
										<div class="form-group">
											<label for="">이 메 일</label>
											<label id="label_email"></label>
											<input type="email" name="m_email" id="m_email" class="form-control">
										</div>
										<div class="form-group">
											<label for="">생년월일</label>
											<label id="label_birth"></label>
											<input type="date" name="m_birth" id="m_birth" class="form-control">
										</div>
										<div class="form-group">
											<label for="">등 급</label>
											<select name="m_rankNum" id="m_rankNum" class="form-control">
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
										data-dismiss="modal">Cancel</button>
									<button type="submit" id="btn-regist" class="btn btn-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /MODEL -->
			</div>
		</div>
		<!-- /PAGE CONTENT -->
	</div>
</body>
</html>