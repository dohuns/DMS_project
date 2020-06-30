<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HEADER</title>
	<link
		href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<style>
		.navbar-brand-centered {
			position: absolute;
			left: 50%;
			display: block;
			width: 160px;
			text-align: center;
			background-color: transparent;
		}

		.navbar>.container .navbar-brand-centered,
		.navbar>.container-fluid .navbar-brand-centered {
			color: #FFFFFF;
			margin-left: -100px;
		}

		.navbar-default,
		.navbar-default .navbar-nav>li>a {
			color: #FFFFFF;
			font-weight: bold;
			text-decoration: none;
 			background-color: #242156;
			border-color: #242156;
		}

		.navbar-default,
		.navbar-default .navbar-nav>li>a:hover,
		.navbar-default .navbar-nav>li>a:active,
		.navbar-default .navbar-nav>li>a:visited {
			color: #FFFFFF; 
		}
	</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-brand-centered">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div>
						<a class="navbar-brand navbar-brand-centered" href="#">DOMISU</a>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-brand-centered">
					<ul class="nav navbar-nav">
						<li><a href="#">영화</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">예매 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">빠른 예매</a></li>
								<li><a href="#">상영 시간표</a></li>
							</ul>
						</li>
						<li><a href="#">극장</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<%-- 세션이 없는 경우 로그인, 회원가입 출력 --%>
							<c:when test="${sessionScope.m_id == null}">
								<li><a href="login">로그인</a></li>
								<li><a href="email">회원가입</a></li>
							</c:when>
							<%-- 세션이 있는 경우 로그아웃, 내정보 출력 --%>
							<c:otherwise>
								<li><a href="myPage">내정보</a></li>
								<li><a href="logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>