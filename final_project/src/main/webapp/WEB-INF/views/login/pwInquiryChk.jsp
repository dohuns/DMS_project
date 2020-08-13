<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwInquiryChk</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// 비밀번호 조합
	function pwPattern() {
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@/#$%<>^&*]/;

		var pw = $("#m_pw").val();
		if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)) {
			$("#label_pw").text("영문+숫자+특수문자 8자리 이상으로 입력해주세요!!");
			$("#label_pw").css({
				"color" : "red"
			})
		} else {
			$("#label_pw").text("");

		}
	}
	// 비밀번호 일치 확인
	function ckhPw() {
		var m_pw = $("#m_pw").val();
		var m_pw_ck = $("#m_pw_ck").val();

		if (m_pw == m_pw_ck && $("#label_pw").text() == "") {
			$("#label_pw_ck").text("비밀번호 일치~");
			$("#label_pw_ck").css({
				"color" : "blue"
			});
		} else {
			$("#label_pw_ck").text("비밀번호 불일치!!!");
			$("#label_pw_ck").css({
				"color" : "red"
			});
		}
	}

	// 비밀번호 변경 버튼 활성화
	function btnAble() {
		if ($("#m_pw").val() != "" && $("#m_pw_ck").val() != ""
				&& $("#label_pw_ck").text() == "비밀번호 일치~") {

			$("#btn-changePw").prop("disabled", false);
		} else {
			$("#btn-changePw").prop("disabled", true);
		}

	}

	function chkPw() {
		pwPattern();
		ckhPw();
		btnAble();
	}

	function chkRpw() {
		pwPattern();
		ckhPw();
		btnAble();
	}

	$(function() {
		// 비밀번호 최대 자리수 제한
		$("#m_pw").on('keyup', function() {
			if ($(this).val().length > 16) {
				$("#label_pw").text("비밀번호는 16자 이하로 작성해주세요")
				$("#label_pw").css({
					"color" : "red"
				});
				$(this).val($(this).val().substring(0, 16));
			}
		});
		$("#m_pw_ck").on('keyup', function() {
			if ($(this).val().length > 16) {
				$(this).val($(this).val().substring(0, 16));
			}
		});
	});
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
			<div align="center">
				<h1>비밀번호 설정하기</h1>
				<div style="width: 500px;">
					<form action="findPw_end_save" id="save">
						<input type="hidden" name="m_id" value="${param.m_id }"> <input
							type="hidden" name="m_name" value="${param.m_name }"> <input
							type="hidden" name="m_email" value="${param.m_email }">
						<div align="left">
							<b>새로운 비밀번호 :</b> <input type="password" name="m_pw" id="m_pw"
								placeholder="새로운 비밀번호" class="form-control" onblur="chkPw()"><br>
						</div>
						<div>
							<label id="label_pw"></label>
						</div>
						<div align="left">
							<b>비밀번호 확인 :</b> <input type="password" name="m_pw_ck"
								id="m_pw_ck" placeholder="비밀번호 확인" class="form-control"
								onblur="chkRpw()"><br>
						</div>
						<div>
							<label id="label_pw_ck"></label>
						</div>
						<div align="left">
							<input type="button" onclick="submit()" value="비밀번호 변경하기"
								id="btn-changePw" class="btn btn-info">
						</div>
					</form>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;">
			<c:import url="/footer" />
		</div>
	</div>
</body>
</html>