<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MAIN</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>

	<!-- 무비차트 STYLE -->
	<style>
		.row.heading h2 {
			color: #fff;
			font-size: 52.52px;
			line-height: 95px;
			font-weight: 400;
			text-align: center;
			margin: 0 0 40px;
			padding-bottom: 20px;
			text-transform: uppercase;
		}

		ul {
			margin: 0;
			padding: 0;
			list-style: none;
		}

		.heading.heading-icon {
			display: block;
		}

		.padding-lg {
			display: block;
			padding-top: 60px;
			padding-bottom: 60px;
		}

		.practice-area.padding-lg {
			padding-bottom: 55px;
			padding-top: 55px;
		}

		.practice-area .inner {
			border: 1px solid #999999;
			text-align: center;
			margin-bottom: 28px;
			padding: 40px 25px;
		}

		.our-webcoderskull .cnt-block:hover {
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
			border: 0;
		}

		.practice-area .inner h3 {
			color: #3c3c3c;
			font-size: 24px;
			font-weight: 500;
			font-family: 'Poppins', sans-serif;
			padding: 10px 0;
		}

		.practice-area .inner p {
			font-size: 14px;
			line-height: 22px;
			font-weight: 400;
		}

		.practice-area .inner img {
			display: inline-block;
		}

		.our-webcoderskull {
			background:
				url("http://www.webcoderskull.com/img/right-sider-banner.png")
				no-repeat center top/cover;
		}

		.our-webcoderskull .cnt-block {
			float: left;
			width: 100%;
			background: #fff;
			padding: 30px 20px;
			text-align: center;
			border: 2px solid #d5d5d5;
			margin: 0 0 28px;
		}

		.our-webcoderskull .cnt-block figure {
			width: 148px;
			height: 148px;
			border-radius: 100%;
			display: inline-block;
			margin-bottom: 15px;
		}

		.our-webcoderskull .cnt-block img {
			width: 148px;
			height: 148px;
			border-radius: 100%;
		}

		.our-webcoderskull .cnt-block h3 {
			color: #2a2a2a;
			font-size: 20px;
			font-weight: 500;
			padding: 6px 0;
			text-transform: uppercase;
		}

		.our-webcoderskull .cnt-block h3 a {
			text-decoration: none;
			color: #2a2a2a;
		}

		.our-webcoderskull .cnt-block h3 a:hover {
			color: #337ab7;
		}

		.our-webcoderskull .cnt-block p {
			color: #2a2a2a;
			font-size: 13px;
			line-height: 20px;
			font-weight: 400;
		}

		.our-webcoderskull .cnt-block .follow-us {
			margin: 20px 0 0;
		}

		.our-webcoderskull .cnt-block .follow-us li {
			display: inline-block;
			width: auto;
			margin: 0 5px;
		}

		.our-webcoderskull .cnt-block .follow-us li .fa {
			font-size: 24px;
			color: #767676;
		}

		.our-webcoderskull .cnt-block .follow-us li .fa:hover {
			color: #025a8e;
		}
	</style>

	<!-- 고객센터 STYLE -->
	<style>
		.text-primary {
/* 			color: #242156; */
			color: #fff;
		}

		.font-weight-bold {
			font-weight: 700;
		}

		.m-0 {
			margin: 0;
		}

		h6, .h6 {
			font-size: 1rem;
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
			margin: 20px auto;
		}

		.card-header {
			padding: 0.75rem 1.25rem;
			margin-bottom: 0;
			background-color: #242156;
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

		.btn {
			display: inline-block;
			font-weight: 400;
			color: #858796;
			text-align: center;
			vertical-align: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
			background-color: transparent;
			border: 1px solid transparent;
			padding: 0.375rem 0.75rem;
			font-size: 1rem;
			line-height: 1.5;
			border-radius: 0.35rem;
			transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
				border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}

		.btn-primary {
			color: #fff;
			background-color: #4e73df;
			border-color: #4e73df;
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

		.table-responsive>.table-bordered {
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
			background: #E1E0F3;
			color: #242156;
		}
	</style>
</head>
<body>
	<section class="our-webcoderskull padding-lg">
		<div class="container">
			<div class="row heading heading-icon">
				<h2>무비차트 예정</h2>
			</div>

			<!-- 영화 차트 순위권 출력 -->
			<ul class="row">
				<li class="col-12 col-md-6 col-lg-3">
					<div class="cnt-block equal-hight" style="height: 349px;">
						<figure>
							<img src="http://www.webcoderskull.com/img/team4.png"
								class="img-responsive" alt="">
						</figure>
						<h3>
							<a href="http://www.webcoderskull.com/">Web coder skull</a>
						</h3>
						<p>Freelance Web Developer</p>
					</div>
				</li>
				<li class="col-12 col-md-6 col-lg-3">
					<div class="cnt-block equal-hight" style="height: 349px;">
						<figure>
							<img src="http://www.webcoderskull.com/img/team1.png"
								class="img-responsive" alt="">
						</figure>
						<h3>
							<a href="#">Kappua </a>
						</h3>
						<p>Freelance Web Developer</p>
					</div>
				</li>
				<li class="col-12 col-md-6 col-lg-3">
					<div class="cnt-block equal-hight" style="height: 349px;">
						<figure>
							<img src="http://www.webcoderskull.com/img/team4.png"
								class="img-responsive" alt="">
						</figure>
						<h3>
							<a href="http://www.webcoderskull.com/">Manish </a>
						</h3>
						<p>Freelance Web Developer</p>
					</div>
				</li>
				<li class="col-12 col-md-6 col-lg-3">
					<div class="cnt-block equal-hight" style="height: 349px;">
						<figure>
							<img src="http://www.webcoderskull.com/img/team2.png"
								class="img-responsive" alt="">
						</figure>
						<h3>
							<a href="http://www.webcoderskull.com/">Atul </a>
						</h3>
						<p>Freelance Web Developer</p>
					</div>
				</li>
			</ul>
		</div>
	</section>

	<!-- 고객센터 / DMS 정보 출력 -->
	<section>
		<div class="container">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<div class="display-flex align-center">
						<h4 class="m-0 font-weight-bold text-primary">공지사항</h4>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th width="20%">작성자</th>
									<th width="50%">제목</th>
									<th width="20%">작성일</th>
									<th width="10%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="">
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</c:when>
									<c:otherwise>
										<td colspan="4">작성된 게시글이 없습니다.</td>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>