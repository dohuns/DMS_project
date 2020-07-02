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
		.panel-primary>.panel-heading {
			color: #fff;
			background-color: #242156;
			border-color: #242156;
		}

		.panel-tabs {
			position: relative;
			bottom: 30px;
			clear: both;
			border-bottom: 1px solid transparent;
		}

		.panel-tabs>li {
			float: left;
			margin-bottom: -1px;
		}

		.panel-tabs>li>a {
			margin-right: 2px;
			margin-top: 4px;
			line-height: .85;
			border: 1px solid transparent;
			border-radius: 4px 4px 0 0;
			color: #ffffff;
		}

		.panel-tabs>li>a:hover {
			border-color: transparent;
			color: #ffffff;
			background-color: transparent;
		}

		.panel-tabs>li.active>a:hover,
		.panel-tabs>li.active>a:focus,
		.panel-tabs>li.active>a:visited {
			color: #fff;
			cursor: default;
			-webkit-border-radius: 2px;
			-moz-border-radius: 2px;
			border-radius: 2px;
			background-color: rgba(255, 255, 255, .23);
			border-bottom-color: transparent;
		}

		.nav>li>a:hover, .nav>li>a:focus {
			text-decoration: none;
			background-color: rgba(255, 255, 255, .23);
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
	<br>
	<!-- 고객센터 / DMS 정보 출력 -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">공지사항</h3>
							<span class="pull-right">
								<ul class="nav panel-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab">점검</a></li>
									<li><a href="#tab2" data-toggle="tab">기타</a></li>
								</ul>
							</span>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">
									<table border="1">
										<tr>
											<td> 테스트 </td>
											<td> 테스트 </td>
										</tr>
										<tr>
											<td> 테스트 </td>
											<td> 테스트 </td>
										</tr>
									</table>
								</div>
								<div class="tab-pane" id="tab2">
									<table border="1">
										<tr>
											<td> 테스트2</td>
											<td> 테스트2 </td>
										</tr>
										<tr>
											<td> 테스트2 </td>
											<td> 테스트2 </td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>