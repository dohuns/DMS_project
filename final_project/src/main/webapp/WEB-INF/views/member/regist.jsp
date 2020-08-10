<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
.upImg {
	margin-top: 10px;
	border-radius: 100%;
}
</style>
<script>
	// 아이디 중복체크 
	function chk_id() {
		var id = $("#m_id").val();
		if (id == "") {
			alert("아이디를 입력해주세요")
		} else {
			$.ajax({
				url : "../overlapId",
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
						$("#label_id").text("중복 된 ID입니다.");
						$("#label_id").css({
							"color" : "red"
						})
					}
				},
				error : function() {
					alert("실패!!")
				}
			});
		}
	}
	// 닉네임 중복 체크
	function chk_nick() {
		var nick = $("#m_nick").val();
		if (nick == "") {
			alert("닉네임를 입력해주세요")
		} else {
			$.ajax({
				url : "../overlapNick",
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
					alert("실패!!");
				}
			});
		}
	}

	// input 공백 체크(id,label,column명(한글))
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

	// label_id text 값 유지
	function keepId() {
		if ($("#btn_chk_id").is(":disabled")) {
			$("#label_id").text("사용가능한 ID입니다.");
			$("#label_id").css({
				"color" : "blue"
			})
		}
	}

	// label_nick text 값 유지
	function keepNick() {
		if ($("#btn_chk_nick").is(":disabled")) {
			$("#label_nick").text("사용가능한 닉네임 입니다.");
			$("#label_nick").css({
				"color" : "blue"
			})
		}
	}

	//비밀번호 확인 체크
	function pwSameChk() {
		var pw = $('#m_pw').val().replace(/ /gi, '');
		$('#m_pw').val(pw);
		var Rpw = $('#m_Rpw').val().replace(/ /gi, '');
		$('#m_Rpw').val(Rpw);
		if ($("#m_Rpw").val() != "" && $("#m_pw").val() == $("#m_Rpw").val()
				&& $("#label_pw").text() == "") {
			$("#label_Rpw").text("일치~");
			$("#label_Rpw").css({
				"color" : "blue"
			});
		} else if ($("#m_Rpw").val() != ""
				&& $("#m_pw").val() != $("#m_Rpw").val()) {
			$("#label_Rpw").text("불일치!");
			$("#label_Rpw").css({
				"color" : "red"
			});
		}
	}

	//회원가입 버튼 활성화 
	function buttonAble() {
		if ($("#label_id").text() == "사용가능한 ID입니다." && $("#m_pw").val() != ""
				&& $("m_Rpw").val() != "" && $("#m_name").val() != ""
				&& $("#m_date").val() != ""
				&& $("#label_nick").text() == "사용가능한 닉네임 입니다."
				&& $("#label_pw").text() == ""
				&& $("#label_Rpw").text() == "일치~") {

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

	// input에 blur적용
	function chkId() {
		chk_blank("m_id", "label_id", "아이디");
		buttonAble();
		keepId();
	}
	function chkPw() {
		chk_blank("m_pw", "label_pw", "비밀번호");
		pwSameChk();
		buttonAble();
		pwPattern();
	}
	function chkRpw() {
		chk_blank("m_Rpw", "label_Rpw", "비밀번호 확인");
		pwSameChk();
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
	function chkDate() {
		chk_blank("m_date", "label_date", "생년월일");
		buttonAble();
	}

	// 글자 수 제한 
	$(function() {
		// 아이디 제한
		$("#m_id").on('keyup', function() {
			var id = $('#m_id').val().replace(/ /gi, '');
			$('#m_id').val(id);
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
			var nick = $('#m_nick').val().replace(/ /gi, '');
			$('#m_nick').val(nick);
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
			var name = $('#m_name').val().replace(/ /gi, '');
			$('#m_name').val(name);
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
	// 이미지 미리 띄워주기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#foo').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(function() {
		$("#fileInput").change(function() {
			readURL(this);
		});
	})

	// input text에 파일 이름 띄워주기(프로필 사진)
	function inputName() {
		if (window.FileReader) {
			var filename = $("#fileInput")[0].files[0].name;
		} else {
			var filename = $("#fileInput").val().split('/').pop().split('\\')
					.pop();
		}

		$("#userfile").val(filename);

	}
</script>
</head>
<body>
	<c:if test="${sessionScope.m_id != null}">
		<script type="text/javascript">
			alert("정상적인 경로를 이용해주세요")
			location.href = "/movie"
		</script>
	</c:if>

	<div class="container">
		<c:import url="/header" />
		<div style="width: 1080px;">
			<div align="center" style="margin-top: 80px;">
				<div class="container">
					<div style="width: 1000px; padding-bottom: 100px;">
						<div align="center">
							<h1>회원가입 페이지</h1>
						</div>
						<form action="../chk_reigst" method="POST"
							enctype="multipart/form-data">
							<div align="center">
								<table style="width: 550px; padding: 20px; border-width: 500px;">
									<!-- 아이디 -->
									<tr>
										<td><strong>아이디</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_id" id="m_id"
											placeholder="아이디를 입력해주세요" class="form-control"
											onblur="chkId()"></td>
										<td style="padding-left: 10px;">
											<button type="button" onclick="chk_id()" id="btn_chk_id"
												class="btn btn-info">중복확인</button>
										</td>
									</tr>
									<tr>
										<td><label id="label_id"></label></td>
									</tr>
									<!-- 비밀번호 -->
									<tr>
										<td><strong>비밀번호</strong></td>
									</tr>
									<tr>
										<td><input type=password name="m_pw" id="m_pw"
											placeholder="비밀번호를 입력해주세요" class="form-control"
											onblur="chkPw()"></td>
									</tr>
									<tr>
										<td><label id="label_pw"></label></td>
									</tr>
									<!-- 비밀번호 확인 -->
									<tr>
										<td><strong>비밀번호 확인</strong></td>
									</tr>
									<tr>
										<td><input type="password" id="m_Rpw"
											placeholder="비밀번호를 입력해주세요" class="form-control"
											onblur="chkRpw()"></td>
									</tr>
									<tr>
										<td><label id="label_Rpw"></label></td>
									</tr>
									<!-- 이름 -->
									<tr>
										<td><strong>이름</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_name" id="m_name"
											placeholder="이름을 입력해주세요" class="form-control"
											onblur="chkName()"></td>
									</tr>
									<tr>
										<td><label id="label_name"></label></td>
									</tr>
									<!-- 닉네임 -->
									<tr>
										<td><strong>닉네임</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_nick" id="m_nick"
											placeholder="닉네임을 입력해주세요" class="form-control"
											onblur="chkNick()"></td>
										<td style="padding-left: 10px;">
											<button type="button" onclick="chk_nick()" id="btn_chk_nick"
												class="btn btn-info">중복확인</button>
										</td>
									</tr>
									<tr>
										<td><label id="label_nick"></label></td>
									</tr>
									<!-- 생년월일 -->
									<tr>
										<td><strong>생년월일</strong></td>
									</tr>
									<tr>
										<td><input type="date" name="m_birth" id="m_date"
											class="form-control" onblur="chkDate()"></td>
									</tr>
									<tr>
										<td><label id="label_date"></label></td>
									</tr>
									<!-- 프사 -->
									<tr>
										<td><strong>프로필 사진</strong></td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<input type="file" id="fileInput"
													data-class-button="btn btn-default"
													data-class-input="form-control"
													data-icon-name="fa fa-upload" class="form-control"
													tabindex="-1"
													style="position: absolute; clip: rect(0px, 0px, 0px, 0px);"
													onchange="inputName()" name="picture">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="userfile" class="form-control"
														name="userfile" disabled=""> <span
														class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="fileInput" class="btn btn-default"
														style="padding: 0 0 0 0; width: 50px; height: 34px;">
															<span class="glyphicon fa fa-upload"> <img
																src="/img/upload.png" width="45px" height="30px">
														</span>
													</label>
													</span>
												</div>
												<img id="foo" width="58" height="58" class="upImg"
													src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" />
											</div>
										</td>
									</tr>
									<!-- 이메일 -->
									<tr>
										<td><strong>이메일</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_email" value="${email}"
											readonly class="form-control"></td>
									</tr>
									<tr>
										<td style="padding-top: 10px;">
											<button type="submit" id="btn-regist" class="btn btn-info"
												disabled>회원가입</button>
										</td>
									</tr>
								</table>
							</div>
						</form>
						<script>
							
						</script>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>