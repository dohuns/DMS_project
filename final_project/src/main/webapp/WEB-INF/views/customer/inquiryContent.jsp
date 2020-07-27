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

		.mt-60 {
			margin-top: 60px;
		}

		.pt-40 {
			padding-top: 40px;
			text-align: center;
		}

		.bt-a {
			text-align: right;
		}
	</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<!--  -->
	<div class="container">
		<div class="row mt-60">
			<div class="content-body">
				<div class="main-box-container">
					<div class="box">
						<div class="col-md-8 col-md-offset-2">
							<form action="#" method="GET">
								<div class="form-group has-error">
									<input type="hidden" name="cus_categoryNum" value="${inquiryContent.cus_categoryNum}" />
									<input type="hidden" name="cus_pw" value="${inquiryContent.cus_pw}" />
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
									<textarea rows="5" class="form-control"
										name="cus_content" readonly="readonly">${inquiryContent.cus_content}</textarea>
								</div>

								<div class="form-group bt-a">
									<button type="button" class="btn btn-default">삭   제</button>
									<button type="submit" class="btn bBtn">수   정</button>
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