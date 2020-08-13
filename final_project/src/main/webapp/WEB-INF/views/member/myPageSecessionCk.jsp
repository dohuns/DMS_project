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
	function pwCh() {
		if ($("#m_pw").val() == "") {
			alert("비밀번호를 입력해주세요")
		} else {
			pwCk.submit();
		}
	}
</script>
<style type="text/css">
a:link, a:visited, a:active, a:hover {
	text-decoration: none !important;
	color: black;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.m_id == null}">
		<script type="text/javascript">
			alert("정상적인 경로를 이용해주세요")
			location.href = "/movie"
		</script>
	</c:if>
	
	<div class="container">
		<c:import url="/header" />
		<div style="width: 1080px;">
			<div align="center" style="padding-top: 50px;">
				<div style="display: flex; width: 900px;">
					<div style="width: 150px; margin-right: 50px;">
						<h3>
							<b>내정보관리</b>
						</h3>
						<hr>
						<a href="myPageCk"><div style="margin-top: 20px;">
								<h4>개인정보변경</h4>
							</div></a> <a href="myPagePwChang"><div div style="margin-top: 20px;">
								<h4>비밀번호변경</h4>
							</div></a>
						<div style="margin-top: 20px; color: #5bc0de">
							<h4>회원탈퇴</h4>
						</div>
					</div>
					<div style="width: 600px; padding-bottom: 100px;">
						<div align="left" style="margin-bottom: 30px;">
							<h1>회원탈퇴</h1>
							<hr style="border: solid 1px #ddd;">
						</div>
						<div align="center" style="border: 1px solid #eee; padding: 30px;">
							<form action="myPageSecessionPwCk" id="pwCk" method="get"
								style="display: flex;">
								<span style="font-size: 17px; width: 25%; margin-top: 5px;">비밀번호
									확인</span>&nbsp;&nbsp;<input type="password" name="m_pw" id="m_pw"
									class="form-control" style="width: 58%;">&nbsp;&nbsp;
								<button type="button" onclick="pwCh()" class="btn btn-info"
									style="width: 15%;">확인</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;">
			<c:import url="/footer" />
		</div>
	</div>
</body>
</html>