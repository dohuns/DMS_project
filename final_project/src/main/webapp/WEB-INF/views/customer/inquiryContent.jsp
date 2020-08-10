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
			float: right;
		}
		.bt-b {
			float: center;
		}
		.mt-60 {
			margin-top: 60px;
		}
		.pt-40 {
			padding-top: 40px;
			text-align: center;
		}
		.bg-st {
			margin-top: 50px;
		}
	</style>

	<script>
		// <br>을 \n처리
		$(function() {
			var data = $("#cus_content").val()
			data = data.replace(/<br\/>/gi, '\n');
			$("#cus_content").val(data);
		});

		// 비밀번호 확인
		function contentPwChk(cus_num, cus_pw) {
			$("#openPwChk").remove();
			console.log("content_ cus_num : " + cus_num + ", cus_pw : " + cus_pw);
			var html =
				'<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">' +
				'<div class="container" id="openPwChk">' +
				'	<div class="col-md-4 col-md-offset-4">' +
				'		<div>' +
				'			<div class="panel-body">' +
				'				<div class="text-center">' +
				'					<h4 style="margin:20px 0px;"><i class="fa fa-lock fa-4x"></i></h4>' +
				'					<p><b>비밀번호를 입력해주세요.</b></p>' +
				'					<div class="panel-body">' +
				'						<form id="PwChk-form" role="form" autocomplete="off" class="form"' +
				'							action="deleteChk" method="GET">' +
				'							<div class="form-group">' +
				'								<div class="input-group">' +
				'									<span class="input-group-addon"><i class="glyphicon fa fa-lock color-blue"></i></span>' +
				'									<input id="inputPw" name="inputPw" class="form-control" type="password">' +
				'									<input type="hidden" name="cus_num" value="' + cus_num +'">' +
				'								</div>' +
				'							</div>' +
				'							<div class="form-group">' +
				'								<input name="recover-submit" class="btn btn-s bBtn" value="확인" type="submit">' +
				'								<input name="recover-submit" class="btn btn-s btn-default"' +
				'									value="목록" type="button" onclick="location.href=`customerMain`">' +
				'							</div>' +
				'						</form>' +
				'					</div>' +
				'				</div>' +
				'			</div>' +
				'		</div>' +
				'	</div>' +
				'</div>';
			$("#openPw").html(html);
		}
	</script>
</head>
<body>
	<c:import url="../default/customerHeader.jsp" />

	<div class="bg-st" id="openPw"></div>
	<div class="container bg-st" id="openPwChk">
		<div class="row mt-60">
			<div class="content-body">
				<div class="main-box-container">
					<div class="box">
						<div class="col-md-8 col-md-offset-2">
							<form action="inquiryUpdate" method="POST">
								<div class="form-group has-error">
									<input type="hidden" name="cus_categoryNum" value="${inquiryContent.cus_categoryNum}" />
									<input type="hidden" name="cus_pw" value="${inquiryContent.cus_pw}" />
									<input type="hidden" name="cus_num" value="${param.cus_num}" />
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
										value="${inquiryContent.cus_email}" readonly="readonly"/>
								</div>

								<div class="form-group">
									<label for="title">제 목 <span class="require">*</span></label>
									<input type="text" class="form-control" name="cus_title"
										value="${inquiryContent.cus_title}" readonly="readonly"/>
								</div>

								<div class="form-group">
									<label for="content">내 용 <span class="require">*</span></label>
									<textarea rows="5" class="form-control" id="cus_content"
										name="cus_content" readonly="readonly">${inquiryContent.cus_content}</textarea>
								</div>

								<div class="form-group">
									<div class="bt-a">
										<button type="button" class="btn btn-default"
											onclick="contentPwChk(${param.cus_num},'${inquiryContent.cus_pw}')">삭   제</button>
										<button type="submit" class="btn bBtn">수   정</button>
									</div>
									<div class="bt-b">
										<button type="button" class="btn btn-default"
											onclick="location.href='customerMain'">목록</button>
									</div>
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