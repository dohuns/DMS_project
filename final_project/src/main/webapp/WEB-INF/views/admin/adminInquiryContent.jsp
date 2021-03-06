<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script>
		// <br>을 \n처리
		$(function() {
			var data = $("#cus_content").val();
			data = data.replace(/<br\/>/gi, '\n');
			$("#cus_content").val(data);
		});
		// 해당 문의글 답변 등록
		function inquiryAnswer() {
			var message = confirm("해당 문의글 답변을 등록하시겠습니까?");
			if(message) {
				contentForm.submit();
			}
		}
		// 해당 문의글 답변 보류
		function inquiryHold(cus_num) {
			var message = confirm("해당 문의글 답변을 보류하시겠습니까?");
			if(message) {
				location.href = "adminInquiryHold?cus_num=" + cus_num;
			}
		}
	</script>
	<style>
		html, body, div {
			height: 95%;
		}
		body #main {
			height: 95%;
		}
		.mainContent {
			display: flex;
			height: 100%;
		}
		.divContent {
			width: 100%;
			padding: 35px;
			min-width: 800px;
			max-height: 800px;
			margin: 20px 0 50px 250px;
		}
		tr>th, .chkTd {
			text-align: center;
		}
		.td-st {
			text-indent: 20px;
		}
		.contentPage {
			padding-top: 35px;
			text-align: center;
		}
		.contentBtn button {
			margin-left: 10px;
		}
		.pagination>.active>a.pageBtn, 
		.pagination>.active>a.pageBtn:hover, 
		.pagination>.active>a.pageBtn:focus {
			background-color: #5BC0DE;
			border-color: #5BC0DE;
		}
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
		.divContent .hr-st {
			border-top: 2px solid #DDD;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="main">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />

				<!-- CONTENT -->
				<div class="divContent">
				<h3>${inquiryContent.cus_category}</h3>
				<c:if test="${empty inquiryContent.cus_category}">
					<h3>문의 답변</h3>
				</c:if>
				<hr class="hr-st">
					<form id="contentForm" action="adminInquiryAnswer" method="POST">
						<div class="form-group has-error">
							<input type="hidden" name="cus_categoryNum" value="${inquiryContent.cus_categoryNum}" />
							<input type="hidden" name="cus_group" value="${inquiryContent.cus_group}" />
							<input type="hidden" name="cus_num" value="${inquiryContent.cus_num}" />
							<input type="hidden" name="cus_pw" value="${inquiryContent.cus_pw}" />
							<c:if test="${not empty inquiryContent.cus_category}">
								<input type="text" class="form-control" name="cus_category" readonly="readonly"
									value="${inquiryContent.cus_category}" />
							</c:if>
						</div>

						<div class="form-group">
							<label for="nick">닉네임 <span class="require"></span></label>
							<input type="text" class="form-control" name="cus_nick"
								value="${inquiryContent.cus_nick}" readonly="readonly"/>
						</div>

						<c:if test="${not empty inquiryContent.cus_email}">
							<div class="form-group">
								<label for="email">이메일 <span class="require">*</span></label>
								<input type="text" class="form-control" name="cus_email"
									value="${inquiryContent.cus_email}" readonly="readonly"/>
							</div>
						</c:if>

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
							<c:if test="${inquiryContent.cus_reNum ne 1}">
								<div class="bt-a">
									<button type="button" class="btn btn-success"
										onclick="inquiryAnswer()">답변</button>
									<c:if test="${inquiryContent.cus_reNum ne 2}">
										<button type="button" class="btn btn-default"
											onclick="inquiryHold(${inquiryContent.cus_num})">보류</button>
									</c:if>
								</div>
							</c:if>
							<div class="bt-b">
								<button type="button" class="btn btn-default"
									onclick="location.href='adminInquiryList?cus_categoryNum=${inquiryContent.cus_categoryNum}'">목록</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>