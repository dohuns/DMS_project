<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 추가</title>
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
	</style>
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

		// 비밀번호 입력 조합 설정
		function pwPattern() {
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[~!@\#$%<>^&*]/
	
			var pw = $("#m_pw").val();
			if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)) {
				$("#label_pw").text("영문+숫자+특수문자 8자리 이상으로 입력해주세요!!")
				$("#label_pw").css({
					"color" : "red"
				});
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
			pwPattern();
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
</head>
<body>
	<c:import url="../default/adminHeader.jsp"></c:import>
	<!-- 회원 목록 페이지 -->
	<div class="main-body-content-dms w-100 ets-pt bg-light">
		<div class="table-responsive">
			<div>
				<h3><b>회원 추가</b></h3>
			</div>
			<form action="insChkMember">
				<table class="table">
					<!-- 아이디 -->
					<tr>
						<th>아이디</th>
					</tr>
					<tr>
						<td><input type="text" name="m_id" id="m_id"
							placeholder="아이디를 입력해주세요" class="form-control" onblur="chkId()">
						</td>
						<td>
							<button type="button" onclick="chk_id()" id="btn_chk_id"
								class="btn btn-info">중복확인</button>
						</td>
					</tr>
					<tr>
						<td><label id="label_id"></label></td>
					</tr>
					<!-- 비밀번호 -->
					<tr>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input type=password name="m_pw" id="m_pw"
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
						<td><input type="text" name="m_nick" id="m_nick"
							placeholder="닉네임을 입력해주세요" class="form-control" onblur="chkNick()"></td>
						<td style="padding-left: 10px;">
							<button type="button" onclick="chk_nick()" id="btn_chk_nick"
								class="btn btn-info">중복확인</button>
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
						<td><input type="text" name="m_name" id="m_name"
							placeholder="이름을 입력해주세요" class="form-control" onblur="chkName()">
						</td>
					</tr>
					<tr>
						<td><label id="label_name"></label></td>
					</tr>
					<tr>
						<td>
							<button type="submit" id="btn-regist" class="btn btn-info" disabled>회원 추가</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>