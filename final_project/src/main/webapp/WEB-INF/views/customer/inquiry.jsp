<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>
		<c:out value="${param.cus_categoryNum == 0 ? '일반 문의' : (param.cus_categoryNum == 1 ? '신고 접수' : '계정 문의') }" />
	</title>
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
	<script>
		$(function() {
			$("textarea[name=cus_content]").text(" - 문제 발생 일시 : \n - 문의 내용 : \n");
		});

		function openChkFunc() {
			$("#cus_pw").attr("readonly",true);
		}

		function closeChkFunc() {
			$("#cus_pw").attr("readonly",false);
		}
	</script>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<!--  -->
	<div class="container">
		<h1 class="pt-40"><b>문의하기</b></h1>
		<div class="row mt-60">
			<div class="content-body">
				<div class="main-box-container">
					<div class="box">
						<div class="col-md-8 col-md-offset-2">
							<form action="inquiryChk" method="GET">
								<div class="form-group has-error">
									<small> * <b>계정 문의</b>의 경우, <b>문의하려는 계정의 이메일 주소</b>를 제대로 기입해주세요.</small><p>
									<small> * <b>신고 접수</b>의 경우, 신고회원의 <b>닉네임 혹은 아이디</b>를 제대로 기입해주세요.</small><p>
									<input type="hidden" name="cus_categoryNum" value="${param.cus_categoryNum}" />
									<input type="text" class="form-control" name="cus_category" readonly="readonly"
										value='<c:out value="${param.cus_categoryNum == 0 ? '일반문의' : (param.cus_categoryNum == 1 ? '신고접수' : '계정문의') }" />' />
								</div>

								<div class="form-group">
									<label for="id">닉네임 <span class="require"></span></label>
									<input type="text" class="form-control" name="cus_nick" required />

									<!-- 세션값이 존재하는 경우 아이디 값을 담아서 전송, 없으면 비회원 기입 후 전송 -->
									<c:choose>
										<c:when test="${sessionScope.m_id eq null}">
											<input type="hidden" name="cus_id" value="비회원" />
										</c:when>
										<c:otherwise>
											<input type="hidden" name="cus_id" value="${sessionScope.m_id}" />
										</c:otherwise>
									</c:choose>
								</div>

								<div class="form-group">
									<label for="email">이메일 <span class="require">*</span></label>
									<input type="text" class="form-control" name="cus_email" required />
								</div>

								<div class="form-group">
									<label for="title">제 목 <span class="require">*</span></label>
									<input type="text" class="form-control" name="cus_title" required />
								</div>

								<div class="form-group">
									<label for="content">내 용 <span class="require">*</span></label>
									<textarea rows="5" class="form-control" name="cus_content"></textarea>
								</div>

								<div class="form-group">
									<label><input type="radio" name="cus_pub" value="open"> 전체 공개</label> &nbsp;&nbsp;
									<label><input type="radio" name="cus_pub" value="close" checked="checked"> 비공개</label>
								</div>

								<div class="form-group">
									<label for="pw">비밀번호 <span class="require">*</span>
										<small>해당 게시글을 수정/삭제할 수 있는 비밀번호입니다. </small>
									</label>
									<input type="text" class="form-control" name="cus_pw" id="cus_pw" required />
								</div>

								<div class="form-group bt-a">
									<button type="submit" class="btn bBtn">문의 접수</button>
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