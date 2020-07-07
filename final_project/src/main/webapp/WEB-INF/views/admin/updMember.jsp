<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 수정</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
	.main-body-content-dms {
		display: inline-block;
		padding: 15px;
		background-color: #EEF4FB;
		height: 100vh;
		padding-left: 110px;
		transition: ease 0.5s;
	}
	
	ul li {
		list-style-type: none;
		float: right;
		margin-left: 20px;
	}
	
	li a {
		font-size: 15px;
		color: #000;
		font-weight: bold;
		padding: 10px;
	}

	tr, td, th {
		width: 400px;
	}
	</style>
	<script>
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
						$("#label_nick").text("중복된 닉네임 입니다.");
						$("#label_nick").css({
							"color" : "red"
						})
					}
				},
				error : function() {
					console.log("updMember_chkNick 에러")
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

		//회원가입 버튼 활성화 
		function buttonAble() {
			if ($("#m_pw").val() != ""
				&& $("#m_name").val() != ""
				&& $("#m_date").val() != ""
				&& $("#label_pw").text() == "") {

				$("#btn-regist").prop("disabled", false);
			} else {
				$("#btn-regist").prop("disabled", true);
			}
		}

		// input에 blur적용
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
		}

		function chkDate() {
			chk_blank("m_date", "label_date", "생년월일");
			buttonAble();
		}

		// 글자 수 제한 
		$(function() {

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

			// 비밀번호 제한
			$("#m_pw").on('keyup', function() {
				if ($(this).val().length > 16) {
					$(this).val($(this).val().substring(0, 16));
				}
			});
		});
	</script>
</head>
<body>
	<c:import url="../default/adminHeader.jsp"></c:import>
	<!-- 회원 목록 페이지 -->
	<div class="main-body-content-dms w-100 ets-pt bg-light">
		<div class="table-responsive">
			<div>
				<h3><b>회원 정보 수정</b></h3>
			</div>
			<br>
			<form action="updChkMember">
				<table class="table">
					<!-- 아이디 -->
					<tr>
						<th>아이디</th>
					</tr>
					<tr>
						<td><input type="text" name="m_id" id="m_id" value="${infoList.m_id}"
							placeholder="아이디를 입력해주세요" class="form-control" onblur="chkId()"
							readonly="readonly">
						</td>
					</tr>
					<tr>
						<td><label> </label></td>
					</tr>
					<!-- 비밀번호 -->
					<tr>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input type=password name="m_pw" id="m_pw" value="${infoList.m_pw}"
							placeholder="비밀번호를 입력해주세요" class="form-control" onblur="chkPw()">
						</td>
					</tr>
					<tr>
						<td><label id="label_pw"></label></td>
					</tr>
					<!-- 닉네임 -->
					<tr>
						<th>닉네임</th>
					</tr>
					<tr>
						<td><input type="text" name="m_nick" id="m_nick" value="${infoList.m_nick}"
							placeholder="닉네임을 입력해주세요" class="form-control" onblur="chkNick()">
						</td>
						<td>
							<button type="button" onclick="chk_nick()" id="btn_chk_nick"
								class="btn btn-outline-dark">닉네임 변경</button>
						</td>
					</tr>
					<tr>
						<td><label id="label_nick"></label></td>
					</tr>
					<!-- 이름 -->
					<tr>
						<th>이름</th>
					</tr>
					<tr>
						<td><input type="text" name="m_name" id="m_name" value="${infoList.m_name}"
							placeholder="이름을 입력해주세요" class="form-control" onblur="chkName()">
						</td>
					</tr>
					<tr>
						<td><label id="label_name"></label></td>
					</tr>
					<!-- 이메일 -->
					<tr>
						<th>이메일</th>
					</tr>
					<tr>
						<td><input type="text" name="m_email" value="${infoList.m_email}"
							class="form-control"></td>
					</tr>
					<tr>
						<td><label></label></td>
					</tr>
					<!-- 생년월일 -->
					<tr>
						<th>생년월일</th>
					</tr>
					<tr>
						<td><input type="date" name="m_birth" id="m_date" value="${infoList.m_birth}"
							class="form-control" onblur="chkDate()"></td>
					</tr>
					<tr>
						<td><label id="label_date"></label></td>
					</tr>
					<!-- 회원 등급 -->
					<tr>
						<th>등급</th>
					</tr>
					<tr>
						<td>
							<select id="m_rank" class="form-control">
								<option value="1_관리자" <c:out value="${infoList.m_rank == '1_관리자' ? 'selected' : ''}"/>>1_관리자</option>
								<option value="2_스탭" <c:out value="${infoList.m_rank == '2_스탭' ? 'selected' : ''}"/>>2_스탭</option>
								<option value="3_일반회원" <c:out value="${infoList.m_rank == '3_일반회원' ? 'selected' : ''}"/>>3_일반회원</option>
								<option value="4_대기회원" <c:out value="${infoList.m_rank == '4_대기회원' ? 'selected' : ''}"/>>4_대기회원</option>
							</select>
						</td>
					</tr>
					<!-- 완료 버튼 -->
					<tr>
						<td>
							<button type="submit" id="btn-regist"
								class="btn btn-outline-dark" disabled>수정 완료</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>