<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	function chk_id() {
		alert("할이11");
		console.log("안녕");
		var id = $("#m_id").val();
		var data = {m_id : id};
		$.ajax({
			url:"chk_id",
			type:"GET",
			data:data,
			success:function(arg) {
				if(arg) {
					$("#label_id").text("사용가능한 ID입니다.");
					$("#label_id").css({
						"color":"blue"
					})
					$("#m_id").attr("readonly",true);
					$("btn_chk_id").attr("disabled","disabled");
				} else {
					$("#label_id").text("중복 된 ID입니다.");
					$("#label_id").css({
						"color":"red"
					})
				}
			},
			error:function(){
				alert("실패!!")
			}
		});
 	}
</script> 
</head>
<body>
	<div class="container">
		<div>
			<h1>회원가입 페이지</h1>
		</div>
		<div style="width:500px;">
			<form action="chk_reigst" method="POST">
				<table>
					<!-- 아이디 -->
					<tr>
						<td><strong>아이디</strong></td>
					</tr>
					<tr>
						<td>
							<input type="text" name="m_id" id="m_id" placeholder="아이디를 입력해주세요" class="form-control">
						</td>
						<td>
							<button onclick="chk_id()" id="btn_chk_id"class="btn btn-info">중복확인</button>
						</td>
					</tr>
					<tr>
						<td><label id="label_id"></label></td>
					</tr>
					<!-- 비밀번호 -->
					<tr>
						<td><strong>비밀번호</strong></td>
					</tr>
					<tr>
						<td>
							<input type=password name="m_pw" id="m_id" placeholder="비밀번호를 입력해주세요" class="form-control">
						</td>
					</tr>
					<tr>
						<td><label id="label_pw"></label></td>
					</tr>
					<!-- 비밀번호 확인 -->
					<tr>
						<td><strong>비밀번호 확인</strong></td>
					</tr>
					<tr>
						<td>
							<input type="password" id="m_Rpw" placeholder="비밀번호를 입력해주세요" class="form-control">
						</td>
					</tr>
					<tr>
						<td><label id="label_Rpw"></label></td>
					</tr>
					<!-- 이름 -->
					<tr>
						<td><strong>이름</strong></td>
					</tr>
					<tr>
						<td>
							<input type="text" name="m_name" id="m_name" placeholder="이름을 입력해주세요" class="form-control">
						</td>
					</tr>
					<tr>
						<td><label id="label_name"></label></td>
					</tr>
					<!-- 생년월일 -->
					<tr>
						<td><strong>생년월일</strong></td>
					</tr>
					<tr>
						<td>
							<input type="date" name="m_date" id="m_date" class="form-control">
						</td>
					</tr>
					<tr>
						<td><label id="label_date"></label></td>
					</tr>
					<!-- 이메일 -->
					<tr>
						<td><strong>이메일</strong></td>
					</tr>
					<tr>
						<td>
							<input type="text" name="m_email" value="${email}" readonly class="form-control">
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" class="btn btn-info" >회원가입</button>
						</td>
					</tr>					
				</table>
			</form>
		</div>
	</div>

</body>
</html>