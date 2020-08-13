<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idInquiry</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var num = null; //인증번호
	var num_ck = null; //인증번호 확인 후 맞으면 success로 값저장
	function send() { //인증번호 전송
		var name = $("#m_name").val();
		var email = $("#m_email").val();
		var user = {
			m_name : name,
			m_email : email
		}
		console.log(email);

		$.ajax({
			url : "./findId_ck", //아이디가 있는지 확인
			type : "POST",
			data : user,
			success : function(data) {
				console.log(data)
				$("#m_name").attr("readonly", true) //이름 입력창 잠금
				$("#m_email").attr("readonly", true) //이메일 입력창 잠금
				$.ajax({
					url : "./send", //이메일 전송
					type : "POST",
					data : user,
					success : function(data) {
						num = data //DB에서 랜덤 숫자 발송후 리턴값을 num에 저장
						console.log(data) //인터넷창에서 f12로 인증번호 확인
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
	function user_ck() { //인증번호 확인
		if (num == $("#number").val()) {
			alert("인증되었습니다")
			$("#number").attr("readonly", true) //인증 완료 후 인증번호 입력창 잠금
			num_ck = "success"
		} else {
			alert("인증번호를 확인해주세요")
		}
	}
	function next() { //인증 후 아이디 찾기시 다음 페이지 이동
		var name = $("#m_name").val();
		var email = $("#m_email").val();
		if (num_ck == "success") {
			location.href = "idInquiryChk?m_name=" + name + "&m_email=" + email
		} else {
			alert("이메일 인증을 해주세요")
		}
	}
</script>
<style type="text/css">
a:link, a:visited, a:active, a:hover {
	text-decoration: none !important;
	color: black;
}


.idfind{
	width: 250px;
	border-bottom: solid 5px #5bc0de;
	padding-top: 20px;
	font-size: 20px;
}

.pwfind{
	width: 250px;
	padding-top: 20px;
	font-size: 20px;"
}

.divpadding{
	padding-top: 20px;
}

.mainHead{
height: 70px;
display: flex;
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
					<div class="mainHead" align="center">
						<div class="idfind">
							<b style="color: #5bc0de;">아이디 찾기</b>
						</div>
						<a href="pwInquiry"><div class="pwfind">
								<b>비밀번호 찾기</b>
							</div></a>
					</div>
					<div class="divpadding">
						<input type="text" id="m_name" class="form-control"
							placeholder="이름">
					</div>
					<div class="divpadding">
						<input type="text" id="m_email" class="form-control"
							placeholder="가입 이메일 주소">
						<button onclick="send()" style="margin-top: 5px;"
							class="btn btn-info">인증번호 전송</button>
					</div>
					<div class="divpadding">
						<input type="text" id="number" class="form-control"
							placeholder="인증번호">
						<button onclick="user_ck()" style="margin-top: 5px;"
							class="btn btn-info">인증번호 확인</button>
					</div>
					<div class="divpadding" align="center">
						<button onclick="next()" class="btn btn-info">아이디 찾기</button>
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