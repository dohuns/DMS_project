<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwInquiryChk</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function pw_ck() {	//새로운 아이디 입력시 값 비교
	var pw1 = $("#m_pw").val();
	var pw2 = $("#m_pw_ck").val();
	if (pw1 == pw2) {
		save.submit();
		alert("비밀번호가 변경되었습니다.");
	}else{
		alert("비밀번호가 일치하지 않습니다.")
	}
}


</script>
</head>
<body>
<h1>비밀번호 설정하기</h1>
<form action="findPw_end_save" id="save">
	<input type="hidden" name="m_id" value="${param.m_id }">
	<input type="hidden" name="m_name" value="${param.m_name }">
	<input type="hidden" name="m_email" value="${param.m_email }">
	새로운 비밀번호 : <input type="text" name="m_pw" id="m_pw" placeholder="새로운 비밀번호"><br>
	비밀번호 확인 : <input type="text" name="m_pw_ck" id="m_pw_ck" placeholder="비밀번호 확인"><br>
	<input type="button" onclick="pw_ck()" value="비밀번호 변경하기">
</form>
</body>
</html>