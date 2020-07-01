<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h1>이메일 인증 페이지</h1>
		</div>
		<div>
			<form action="email_certify" method="POST">
				이메일 : <input type="text" name="e_mail" placeholder="이메일을 입력하세요"> <br>
				<button type="submit">이메일 인증받기</button>
			</form>
		</div>
	</div>

</body>
</html>