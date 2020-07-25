<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css?after">
	<style>
		.mt-60 {
			margin-top: 60px;
		}

		.pt-40 {
			padding-top: 40px;
		}

		.section-block-grey {
			padding: 90px 0px 90px 0px;
			background-color: #f9f9f9;
		}

		.serv-section-2 {
			position: relative;
			border: 1px solid #eee;
			background: #fff;
			box-shadow: 0px 10px 30px 0px rgba(50, 50, 50, 0.16);
			border-radius: 5px;
			overflow: hidden;
			padding: 30px;
		}

		.serv-section-2:before {
			position: absolute;
			top: 0;
			right: 0px;
			z-index: 0;
			content: " ";
			width: 120px;
			height: 120px;
			background: #f5f5f5;
			border-bottom-left-radius: 136px;
			transition: all 0.4s ease-in-out;
			-webkit-transition: all 0.4s ease-in-out;
		}

		.serv-section-2-icon {
			position: absolute;
			top: 18px;
			right: 22px;
			max-width: 100px;
			z-index: 1;
			text-align: center;
		}

		.serv-section-2-icon i {
			color: #5BC0DE;
			font-size: 48px;
			line-height: 65px;
			transition: all 0.4s ease-in-out;
			-webkit-transition: all 0.4s ease-in-out;
		}

		.serv-section-desc {
			position: relative;
		}

		.serv-section-2 h4 {
			color: #333;
			font-size: 20px;
			font-weight: 500;
			line-height: 1.5;
		}

		.serv-section-2 h5 {
			color: #333;
			font-size: 17px;
			font-weight: 400;
			line-height: 1;
			margin-top: 5px;
		}

		.section-heading-line-left {
			content: '';
			display: block;
			width: 100px;
			height: 3px;
			background: #5BC0DE;
			border-radius: 25%;
			margin-top: 15px;
			margin-bottom: 5px;
		}

		.serv-section-2 p {
			margin-top: 25px;
			padding-right: 50px;
		}

		.serv-section-2:hover .serv-section-2-icon i {
			color: #FFFFFF;
		}

		.serv-section-2:hover:before {
			background: #5BC0DE;
		}

		.h5 {
			font-size: 3;
		}

		.is-color {
			background-color: #FFFFFF;
		}

		tr>th, td {
			text-align: center;
		}

		.tdClass {
			text-indent: 10px;
			text-align: left;
		}

		.pagination>.active>a.b, 
		.pagination>.active>span, 
		.pagination>.active>a.b:hover, 
		.pagination>.active>span:hover, 
		.pagination>.active>a.b:focus, 
		.pagination>.active>span:focus {
			background-color: #5BC0DE;
			border-color: #5BC0DE;
		}

		.inq-c, .inq-c>a, .inq-c>a:hover, .inq-c>a:focus {
			padding-right: 5px;
			padding-top: 20px;
			text-decoration: none;
			color: black;
		}
	</style>

	<!-- 문의 내역 STYLE -->
	<style>
		.text-primary {
    		color: #4e73df;
		}
		.font-weight-bold {
		    font-weight: 700;
		}
		.card {
		    position: relative;
		    display: flex;
		    flex-direction: column;
		    min-width: 0;
		    word-wrap: break-word;
		    background-color: #fff;
		    background-clip: border-box;
		    border: 1px solid #e3e6f0;
		    border-radius: 0.35rem;
		    margin:20px auto;
		}
		.card-header {
		    padding: 0.75rem 1.25rem;
		    margin-bottom: 0;
		    background-color: #f8f9fc;
		    border-bottom: 1px solid #e3e6f0;
		}
		.shadow {
		    box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15) !important;
		}
		.display-flex {
		    display: flex;
		}
		.align-center {
		    align-items: center;
		}
		.ml-auto {
		    margin-left: auto !important;
		}
		.form-control {
		    display: block;
		    width: 100%;
		    height: calc(1.5em + 0.75rem + 2px);
		    padding: 0.375rem 0.75rem;
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #6e707e;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid #d1d3e2;
		    border-radius: 0.35rem;
		    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}
		.card-body {
		    flex: 1 1 auto;
		    padding: 1.25rem;
		}
		.table-responsive {
		    display: block;
		    width: 100%;
		    overflow-x: auto;
		}
		.table-responsive > .table-bordered {
		    border: 0;
		}
		.table-bordered th, .table-bordered td {
		    border: 1px solid #e3e6f0;
		}
		.table thead th {
		    vertical-align: middle;
		    border-bottom: 2px solid #e3e6f0;
		}
		.table-bordered thead th, .table-bordered thead td {
		    border-bottom-width: 2px;
		}
		.table-bordered thead th {
		    background: #5BC0DE;
		    color: #fff;
		}
	</style>
</head>
<body>
	<c:import url="../default/header.jsp" />

	<!-- PAGING -->
	<c:choose>
		<c:when test="${param.pageNum == null}">
			<c:set var="pageNum" value="0" />
			<c:set var="next" value="0" />
		</c:when>
		<c:otherwise>
			<c:set var="pageNum" value="${param.pageNum}" />
			<c:set var="next" value="${param.next}" />
		</c:otherwise>
	</c:choose>

		<!-- CONTENT -->
		<div class="container">
			<h1 align="center" class="pt-40"><b>고객센터</b></h1>
			<div class="row mt-60">
				<div class="col-md-4 col-sm-12 col-12">
					<div class="serv-section-2" onclick="location.href='inquiry?cus_categoryNum=0'">
						<div class="serv-section-2-icon">
							<i class="fas fa-gem"></i>
						</div>
						<div class="serv-section-desc">
							<h4><b>일반 문의</b></h4>
							<font class="h5">로그인 / 가입 / 탈퇴</font>
						</div>
						<div class="section-heading-line-left"></div>
					</div>
				</div>
				<div class="col-md-4 col-sm-12 col-12">
					<div class="serv-section-2 serv-section-2-act" onclick="location.href='inquiry?cus_categoryNum=1'">
						<div class="serv-section-2-icon serv-section-2-icon-act">
							<i class="fas fa-shield-alt"></i>
						</div>
						<div class="serv-section-desc">
							<h4><b>신고 접수</b></h4>
							<font class="h5">비매너 회원 신고</font>
						</div>
						<div class="section-heading-line-left"></div>

					</div>
				</div>
				<div class="col-md-4 col-sm-12 col-12">
					<div class="serv-section-2 serv-section-2-act" onclick="location.href='inquiry?cus_categoryNum=2'">
						<div class="serv-section-2-icon serv-section-2-icon-act">
							<i class="far fa-clock"></i>
						</div>
						<div class="serv-section-desc">
							<h4><b>계정 문의</b></h4>
							<font class="h5">이용제한 / 계정정지</font>
						</div>
						<div class="section-heading-line-left"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="section-block-grey">
			<div class="container">
				<div id="main-content">
					<div class="content-body">
						<div class="main-box-container">
							<div class="box">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<div class="pull-left">
											<h4><b>문의 내역</b></h4>
										</div>
										<div class="pull-right">
											<div id="header_user" class="inq-c">
												<a href="myInquiryList"><b>내 문의보기</b></a>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th width="7%">번   호</th>
														<th width="60%">제   목</th>
														<th width="11%">닉네임</th>
														<th width="11%">항   목</th>
														<th width="11%">날   짜</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${selectInquiry}">
														<tr>
															<td><small>${list.cus_num}</small></td>
															<td class="tdClass">${list.cus_title}</td>
															<td>${list.cus_nick}</td>
															<td><small>${list.cus_category}</small></td>
															<td><small>${list.cus_date}</small></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>

									<!-- PAGING -->
									<div class="text-center">
										<ul class="pagination">
											<!-- 이전 버튼 -->
											<li>
												<c:if test="${pageNum > 9}">
													<a class="b" href="myInquiryList?next=${next-1}&pageNum=${(next-1) * 10 + 9}">«</a>
												</c:if>
											</li>
											<!-- 번호 출력 -->
											<c:choose>
												<c:when test="${totalNum > next * 10 + 10}">
													<c:forEach begin="${next * 10 + 1}" end="${next * 10 + 10}" step="1" var="cnt">
														<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
															<a class="b" href="myInquiryList?next=${next}&pageNum=${cnt-1}">${cnt}</a>
														</li>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach begin="${next * 10 + 1}" end="${totalNum}" step="1" var="cnt">
														<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
															<a class="b" href="myInquiryList?next=${next}&pageNum=${cnt-1}">${cnt}</a>
														</li>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											<!-- 다음 버튼 -->
											<li>
												<c:if test="${totalNum > next * 10 + 10 }">
													<a class="b" href="myInquiryList?next=${next + 1}&pageNum=${(next + 1) * 10}">»</a>
												</c:if>
											</li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>