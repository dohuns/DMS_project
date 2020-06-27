<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action="login_Ck">
	<input type="text" name="m_id" placeholder="아이디"><br>
	<input type="text" name="m_pw" placeholder="비밀번호"><br>
	<input type="submit" value="로그인"><br>
	<a href="findId">아이디 찾기</a> | <a href="findPw">비밀번호 찾기</a> | <a href="membership">회원가입</a>
</form>
</body>
</html>