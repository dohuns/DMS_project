<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function chkEmail() {
		$.ajax({
			url : "chkEmail?m_email="+$("#m_email").val(),
			type : "GET",
			success: function(arg) {
				if(arg == true) {
					$("#fo").submit();
				} else {
					showEmail();
				}
			},
			error: function() {
				alert("실패!!");
			}
		});		
	}
	function showEmail() {
		let html = "<b> 이미 가입하신 이메일 입니다 </b> <br>";
		html += "<button type='button' onclick='location.href=";
		html += '"login"';
		html += "'>로그인 페이지로 이동</button>";
		console.log(html)
		$("#div1").html(html)
		// 좀 더 퀄리티 있게 하고싶으면 
		// 이 html코드의 div를 css로 숨겨두고 여기서 다시 보이게만들면 될듯
	}
</script>
</head>
<body>
	<div id="div1">
		<div>
			<h1>이메일 인증 페이지</h1>
		</div>
		<div>
			<form action="email_certify" id="fo" method="POST">
				이메일 : <input type="text" id="m_email" name="m_email" placeholder="이메일을 입력하세요"> <br>
				<button type="button" onclick="chkEmail()">이메일 인증받기</button>
			</form>
		</div>
	</div>
	

</body>
</html>