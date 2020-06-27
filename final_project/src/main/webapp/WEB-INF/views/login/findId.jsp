<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var num = null;	//인증번호
	var num_ck = null;
	function send() {
	var name = $("#m_name").val();
	var email = $("#m_email").val();
		var user = {
			m_name : name,
			m_email : email
		}
		console.log(email);

		$.ajax({
			url : "./findId_ck",
			type : "POST",
			data : user,
			success : function(data) {
				console.log(data)
				$("#m_name").attr("readonly", true)
				$("#m_email").attr("readonly", true)
				$.ajax({
					url : "./findId_send",
					type : "POST",
					data : user,
					success : function(data) {
						num = data
						console.log(data)
					},
					error : function() {
						alert("실패")
					}
				});
				alert("인증번호를 발송하였습니다")
			},
			error : function() {
				alert("회원 정보를 확인해주세요")
			}
		});
	}
	function user_ck() {
		if (num == $("#number").val()) {
			alert("인증되었습니다")
			$("#number").attr("readonly", true)
			num_ck = "success"
		} else {
			alert("인증번호를 확인해주세요")
		}
	}
	function next() {
		var name = $("#m_name").val();
		var email = $("#m_email").val();
		if (num_ck == "success") {
			location.href="findId_end?m_name="+name+"&m_email="+email
		} else {
			alert("이메일 인증을 해주세요")
		}
	}
</script>
</head>
<body>
	<input type="text" id="m_name" placeholder="이름"><br>
	<input type="text" id="m_email" placeholder="가입 이메일 주소"><button onclick="send()">인증번호 전송</button><br>
	<input type="text" id="number" placeholder="인증번호"><button onclick="user_ck()">인증번호 확인</button><br>
	<button onclick="next()">아이디 찾기</button>
</body>
</html>