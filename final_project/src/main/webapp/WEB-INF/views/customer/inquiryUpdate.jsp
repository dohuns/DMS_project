<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>문의 내역</title>
	<style>
		.bBtn {
			border: 1px solid;
			border-color: #55a4d3;
			border-radius: 3px;
			background-color: #5BC0DE;
			color: white;
		}
		.bt-a {
			text-align: right;
		}
		.mt-60 {
			margin-top: 60px;
		}
		.pt-40 {
			padding-top: 40px;
			text-align: center;
		}
		.lb-st {
			color: red;
		}
		.bg-st {
			margin-top: 50px;
		}
	</style>
	<script>
		function updateChk() {
			var num = $("#cus_num").val();
			var pw = $("#inputPw").val();
			var data = {inputPw : pw , cus_num : num};

			$.ajax({
				url : "CusUpdPwChk",
				type : "GET",
				data : data,
				dataType : "text",
				success : function(result) {
					if(result == 1) {
						console.log("성공성공 대성공");
						$("#updForm").submit();
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						$("#updPw").text("이전과 동일한 비밀번호를 입력해주세요.");
					}
				},
				error : function() {
					console.log("inquiryUpdate = updateChk 오류");
				}
			});
		}
	</script>
</head>
<body>
	<c:import url="../default/customerHeader.jsp" />

	<div class="container bg-st">
		<div class="row mt-60">
			<div class="content-body">
				<div class="main-box-container">
					<div class="box">
						<div class="col-md-8 col-md-offset-2">
							<form action="updateChk" method="POST" id="updForm">
								<div class="form-group has-error">
									<input type="hidden" name="cus_categoryNum" value="${inquiryContent.cus_categoryNum}" />
									<input type="hidden" name="cus_pw" value="${inquiryContent.cus_pw}" />
									<input type="hidden" name="cus_num" id="cus_num" value="${param.cus_num}" />
									<input type="text" class="form-control" name="cus_category" readonly="readonly"
										value="${inquiryContent.cus_category}" />
								</div>

								<div class="form-group">
									<label for="nick">닉네임 <span class="require"></span></label>
									<input type="text" class="form-control" name="cus_nick"
										value="${inquiryContent.cus_nick}" readonly="readonly"/>
								</div>

								<div class="form-group">
									<label for="email">이메일 <span class="require">*</span></label>
									<input type="text" class="form-control" name="cus_email"
										value="${inquiryContent.cus_email}"/>
								</div>

								<div class="form-group">
									<label for="title">제 목 <span class="require">*</span></label>
									<input type="text" class="form-control" name="cus_title" id="test1"
										value="${inquiryContent.cus_title}"/>
								</div>

								<div class="form-group">
									<label for="content">내 용 <span class="require">*</span></label>
									<textarea rows="5" class="form-control"
										name="cus_content">${inquiryContent.cus_content}</textarea>
								</div>

								<div class="form-group">
									<label for="pw">비밀번호 <span class="require">*</span></label>
									<input type="password" class="form-control" name="inputPw" id="inputPw" required />
									<small><label class="lb-st" id="updPw"></label></small>
								</div>

								<div class="form-group bt-a">
									<button type="button" class="btn btn-default"
										onclick="history.go(-1)">목   록</button>
									<button type="button" class="btn bBtn" id="updBtn"
										onclick="updateChk()">수   정</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>