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
	// 아이디 중복체크 
	function chk_id() {
		var id = $("#m_id").val();
		$.ajax({
			url:"../overlapId",
			type:"GET",
			data:"m_id="+id,
			success:function(arg) {
				if(arg == false) {
					$("#label_id").text("사용가능한 ID입니다.");
					$("#label_id").css({
						"color":"blue"
					})
					$("#m_id").attr("readonly",true);
					$("#btn_chk_id").attr("disabled","disabled");
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
	
	// input 공백 체크(id,label,column명(한글))
	function chk_blank(id,label,column) {
		if($("#"+id).val() == "") {
			if(id == "m_date") {
				$("#"+label).text(column + "을(를) 선택 해주세요.");
			} else {
				$("#"+label).text(column + "을(를) 입력 해주세요.");
			}
			$("#"+label).css({
				"color":"red"
			});
		} else {
			$("#"+label).text("");
		}
	}
	
	//비밀번호 확인 체크
	function pwSameChk() {
		if($("#m_Rpw").val() != "" && $("#m_pw").val() == $("#m_Rpw").val()) {
			$("#label_Rpw").text("일치~");
			$("#label_Rpw").css({
				"color":"blue"
			});
		} else if($("#m_Rpw").val() != "" && $("#m_pw").val() != $("#m_Rpw").val()) {
			$("#label_Rpw").text("불일치!");
			$("#label_Rpw").css({
				"color":"red"
			});
		}	
	}
	
	//회원가입 버튼 활성화 
	function buttonAble() {
		if($("#m_id").val() != "" && $("#m_pw").val() != "" && $("m_Rpw").val() != "" 
				&& $("#m_name").val() != "" && $("#m_date").val() != "" ) {

			$("#btn-regist").prop("disabled" , false);
			
		} else {
			
			$("#btn-regist").prop("disabled" , true);
		}
	}
	
	// input에 blur적용
	function chkId() {
		chk_blank("m_id" , "label_id" , "아이디");
		buttonAble();
	}
	function chkPw() {
		chk_blank("m_pw" , "label_pw" , "비밀번호");
		pwSameChk();
		buttonAble();
	}
	function chkRpw() {
		chk_blank("m_Rpw" , "label_Rpw" , "비밀번호 확인");
		pwSameChk();
		buttonAble();
	}
	function chkName() {
		chk_blank("m_name" , "label_name" , "이름");
		buttonAble();
	}
	function chkDate() {
		chk_blank("m_date" , "label_date" , "생년월일");
		buttonAble();
	}
	
	
	
</script> 
</head>
<body>
	<div class="container">
		<div>
			<h1>회원가입 페이지</h1>
		</div>
		<div style="width:500px;">
			<form action="chk_reigst1" method="POST">
				<table>
					<!-- 아이디 -->
					<tr>
						<td><strong>아이디</strong></td>
					</tr>
					<tr>
						<td>
							<input type="text" name="m_id" id="m_id" 
							placeholder="아이디를 입력해주세요" class="form-control" onblur="chkId()">
						</td>
						<td>
							<button type="button" onclick="chk_id()" id="btn_chk_id"class="btn btn-info">중복확인</button>
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
							<input type=password name="m_pw" id="m_pw" 
							placeholder="비밀번호를 입력해주세요" class="form-control" onblur="chkPw()">
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
							<input type="password" id="m_Rpw" 
							placeholder="비밀번호를 입력해주세요" class="form-control" onblur="chkRpw()">
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
							<input type="text" name="m_name" id="m_name" 
							placeholder="이름을 입력해주세요" class="form-control" onblur="chkName()">
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
							<input type="date" name="m_date" id="m_date" 
							class="form-control" onblur="chkDate()">
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
							<button type="submit" id="btn-regist"class="btn btn-info" disabled>회원가입</button>
						</td>
					</tr>					
				</table>
			</form>
		</div>
	</div>

</body>
</html>