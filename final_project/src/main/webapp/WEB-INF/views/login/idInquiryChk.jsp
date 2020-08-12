<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idInquiryChk</title>
<style type="text/css">
.find{
	width: 250px;
	padding-top: 20px;
	font-size: 20px;
}

.findId{
	border: solid 1px #eee;
	padding-top: 40px;
	padding-bottom: 40px;
}

#btnColor{
	background-color: white;
	color: #000;
	border: solid 1px #d8d8d8;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.m_id != null}">
		<script type="text/javascript">
			alert("정상적인 경로를 이용해주세요")
			location.href = "/movie"
		</script>
	</c:if>

	<div class="container">
		<c:import url="/header" />
		<div style="width: 1080px;">
			<div align="center">
				<div style="width: 500px;" align="left">
					<div style="height: 70px; display: flex;" align="center">
						<div class="find" style="border-bottom: solid 5px #5bc0de;">
							<b style="color: #5bc0de;">아이디 찾기</b>
						</div>
						<a href="pwInquiry"><div class="find">
								<b>비밀번호 찾기</b>
							</div></a>
					</div>
					<div style="margin-top: 20px; margin-bottom: 30px;">고객님의 정보와
						일치하는 아이디 입니다.</div>
					<div class="findId" align="center">
						회원님의 아이디 : <b>${m_id }</b>
					</div>
					<div style="margin-top: 20px;" align="center">
						<button onclick="location.href='login'" class="btn btn-info">로그인
							하기</button>
						<button onclick="location.href='pwInquiry'" class="btn btn-info" id="btnColor">비밀번호
							찾기</button>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 20px;">
			<c:import url="../default/footer.jsp" />
		</div>
	</div>
</body>
</html>