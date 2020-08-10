<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function chkEmail() {
		var email = $("#m_email").val();
		if (email == "") {
			alert("이메일을 입력해주세요")
		} else {
		$.ajax({
			url : "chkEmail?m_email=" + $("#m_email").val(),
			type : "GET",
			success : function(arg) {
				if (arg == true) {
					$("#fo").submit();
				} else {
					showEmail();
				}
			},
			error : function() {
				alert("실패!!");
			}
		});
		}
	}
	function showEmail() {
		let html = "<b> 이미 가입하신 이메일 입니다 </b> <br><br>";
		html += "<button type='button' class='btn btn-info' onclick='location.href=";
		html += '"login"';
		html += "'>로그인 페이지로 이동</button>";
		$("#div1").html(html)
		// 좀 더 퀄리티 있게 하고싶으면 
		// 이 html코드의 div를 css로 숨겨두고 여기서 다시 보이게만들면 될듯
	}
	
	$(function() {
		// 닉네임 제한
		$("#m_email").on('keyup', function() {
			var m_email = $('#m_email').val().replace(/ /gi, '');
			$('#m_email').val(m_email);
			}
		)
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
			<div align="center" style="margin-top: 80px;">
				<div id="div1" style="width: 500px;">
					<div style="margin-bottom: 50px;">
						<h1>이메일 인증 페이지</h1>
					</div>
					<div align="left">
						<form action="email_certify" id="fo" method="POST">
							<input type="text" id="m_email" name="m_email"
								placeholder="가입하실 이메일을 입력하세요" class="form-control" onblur=""> <br>
							<button type="button" onclick="chkEmail()" class="btn btn-info">이메일
								인증받기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>