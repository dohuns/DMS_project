<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		// <br>을 \n처리
		$(function() {
			var data = $("#cus_content").val();
			data = data.replace(/<br\/>/gi, '\n');
			$("#cus_content").val(data);
		});

		// 줄 개행
		function answerBtn() {
			var data = $("#cus_content").val();
			data = data.replace(/(?:\r\n|\r|\n)/g , '<br/>');
			$("#cus_content").val(data);
			$("#contentForm").submit();
		}
	</script>
	<meta charset="UTF-8">
	<title>회원 관리</title>
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
		.tx-a {
		    display: block;
		    width: 100%;
		    height: 500px;
		    padding: 6px 12px;
		    font-size: 14px;
		    line-height: 1.42857143;
		    color: #555;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}
	</style>
</head>
<body>
	<c:if test="${sessionScope.m_rankNum ne 1}">
		<script type="text/javascript">
			alert("잘못된 접근 방식입니다.");
			history.go(-1);
		</script>
	</c:if>

	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="main">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />

				<!-- CONTENT -->
				<div class="divContent">
				<h3>${inquiryContent.cus_category}</h3>
				<hr class="hr-st">
					<form id="contentForm" action="adminInquiryAnswerChk" method="get">
						<div class="form-group has-error">
							<input type="hidden" name="cus_num" value="${inquiryContent.cus_num}" />
							<input type="hidden" name="cus_group" value="${inquiryContent.cus_num}" />
							<input type="hidden" name="cus_categoryNum" value="${inquiryContent.cus_categoryNum}" />
							<input type="text" class="form-control" name="cus_title" readonly="readonly"
								value="└ ${inquiryContent.cus_nick}님 문의 글에 대한 답변입니다." />
						</div>

						<div class="form-group">
							<label for="content">내 용 <span class="require">*</span></label>
							<textarea rows="5" class="tx-a" name="cus_content" id="cus_content">${inquiryContent.cus_content}
===============================================================================================
</textarea>
						</div>

						<div class="form-group">
							<div class="bt-a">
								<button type="button" class="btn btn-success" onclick="answerBtn()">등록</button>
								<button type="button" class="btn btn-default"
									onclick="history.go(-1)">취소</button>
							</div>
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