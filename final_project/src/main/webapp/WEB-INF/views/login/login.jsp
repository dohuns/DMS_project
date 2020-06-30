<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.m_id != null}">
			<script type="text/javascript">
				location.href = "home"
			</script>
		</c:when>
		<c:otherwise>
			<form action="login_Ck">
				<input type="text" name="m_id" placeholder="아이디"><br>
				<input type="text" name="m_pw" placeholder="비밀번호"><br>
				<input type="submit" value="로그인"><br>
				<a href="idInquiry">아이디 찾기</a> | <a href="pwInquiry">비밀번호 찾기</a> | <a href="regist_email">회원가입</a>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>