<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function memberDel() {
		if (confirm("탈퇴시 같은 아이디로 재가입이 불가능합니다.\n정말 탈퇴하시겠습니까?") == true) {
			alert("회원이 탈퇴되었습니다.");
			location.href = "memberDel"
		}

	}

	function main() {
		location.href = "/movie"
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
							<div align="center">
								<div style="width: 500px;">
									<div align="center">
										<button onclick="memberDel()" id="btn-regist"
											class="btn btn-info"
											style="background-color: red; border: 1px solid red;">회원탈퇴</button>
										<button onclick="main()" id="btn-regist" class="btn btn-info"
											style="background-color: #5bc0de; border: 1px solid #5bc0de;">메인으로</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>