<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${result} <br>
	
	이름 : ${sessionScope.sessionNick} <br>
	프로필 : ${img} <br>
	닉네임 : ${nick} <br>
	<img src="${img}">
</body>
</html>