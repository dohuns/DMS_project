<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membership</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function send() {
		var email = $("#m_email").val();
		var E_mail = {
			m_email : email
		}
		console.log(email);
		$.ajax({
			url : "./membership_ck",
			type : "POST",
			data : E_mail,
			success : function(data) {
				alert("전송")
			},
			error : function() {
				alert("실패")
			}
		});
	}
</script>
</head>
<body>
	이메일 <input type="text" name="m_email" id="m_email"> <button onclick="send()">이메일 전송</button><br>
	인증번호 <input type="text" name="m_email_ck" id="m_email_ck"> <button onclick="ck()">인증 확인</button>
</body>
</html>