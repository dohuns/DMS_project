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
	// 닉네임 중복 체크
	function chk_nick() {
		var nick = $("#m_nick").val();
		if (nick == "") {
			alert("닉네임를 입력해주세요")
		} else {
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
					buttonAble();
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

	// label_nick text 값 유지
	function keepNick() {
		if ($("#btn_chk_nick").is(":disabled")) {
			$("#label_nick").text("사용가능한 닉네임 입니다.");
			$("#label_nick").css({
				"color" : "blue"
			})
		}
	}

	//회원가입 버튼 활성화 
	function buttonAble() {
		if ($("#m_name").val() != ""
				&& $("#m_date").val() != ""
				&& ($("#label_nick").text() == "사용가능한 닉네임 입니다." || $("#m_nick")
						.val() == '${m_nick}')) {
			$("#btn-regist").prop("disabled", false);
		} else {
			$("#btn-regist").prop("disabled", true);
		}
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
<style type="text/css">
a:link, a:visited, a:active, a:hover {
	text-decoration: none !important;
	color: black;
}

.myPageSidebar{
	width: 150px;
	margin-right: 50px;
}

.myPageSidebarSelect{
	color: #5bc0de;
}

.sidebarMargin{
	margin-top: 20px;
}

.table-st{
	width: 550px;
	padding: 20px;
	border-width: 500px;
}

.myPageHead{
	width: 600px;
	padding-bottom: 100px;
}

</style>
</head>
<body onload="buttonAble()">
	<c:if test="${sessionScope.m_id == null}">
		<script type="text/javascript">
			alert("정상적인 경로를 이용해주세요")
			location.href = "/movie"
		</script>
	</c:if>

	<div class="container">
		<c:import url="/header" />
		<div style="width: 1080px;">
			<div align="center" style="padding-top: 50px;">
				<div style="display: flex; width: 900px;">
					<div class="myPageSidebar">
						<h3>
							<b>내정보관리</b>
						</h3>
						<hr>
						<div class="sidebarMargin myPageSidebarSelect">
							<h4>
								<b>개인정보변경</b>
							</h4>
						</div>
						<a href="myPagePwChang"><div class="sidebarMargin">
								<h4>비밀번호변경</h4>
							</div></a> <a href="myPageSecessionCk"><div class="sidebarMargin">
								<h4>회원탈퇴</h4>
							</div></a>
					</div>
					<div class="myPageHead">
						<div align="left" style="margin-bottom: 30px;">
							<h1>개인정보변경</h1>
							<hr style="border: solid 1px #ddd;">
						</div>
						<form action="myPageChangCk" method="post"
							enctype="multipart/form-data">
							<div align="center">
								<table class="table-st">
									<!-- 아이디 -->
									<tr>
										<td><strong>아이디</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_id" value="${m_id }"
											class="form-control" readonly></td>
									</tr>
									<!-- 이름 -->
									<tr>
										<td><strong>이름</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_name" id="m_name"
											placeholder="이름을 입력해주세요" class="form-control"
											onblur="chkName()" value="${m_name }"></td>
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
											onblur="chkNick()" value="${m_nick }"></td>
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
											class="form-control" onblur="chkDate()" value="${m_birth }">
										</td>
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

											<div>
												<input type="file" id="fileInput"
													data-class-button="btn btn-default"
													data-class-input="form-control"
													data-icon-name="fa fa-upload" class="form-control"
													tabindex="-1"
													style="position: absolute; clip: rect(0px, 0px, 0px, 0px); width: 500px;"
													onchange="inputName()" name="picture">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="userfile" class="form-control"
														name="userfile" disabled=""> <span
														class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="fileInput" class="btn btn-default"
														style="padding: 0; width: 50px; height: 34px;">
															<span class="glyphicon fa fa-upload"> <img
																src="/img/upload.png" width="45px" height="30px">
														</span>
													</label>
													</span>
												</div>
												<c:choose>
													<c:when test="${m_picture != null}">
														<img id="foo" width="58" height="58" class="upImg"
															src="/img/memberImage/${m_picture}" />
													</c:when>
													<c:otherwise>
														<img id="foo" width="58" height="58" class="upImg"
															src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" />
													</c:otherwise>
												</c:choose>
											</div>
										</td>
									</tr>


									<!-- 이메일 -->
									<tr>
										<td><strong>이메일</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="m_email" value="${m_email }"
											readonly class="form-control"></td>
									</tr>
									<tr>
										<td style="padding-top: 10px;">
											<button type="submit" id="btn-regist" class="btn btn-info"
												disabled>수정하기</button>
										</td>
									</tr>
								</table>
							</div>
						</form>
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