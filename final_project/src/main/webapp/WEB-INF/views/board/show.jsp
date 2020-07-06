<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.contentBox{
	border: 1px solid #eee;
	width:1000px;
	border-radius : 20px;
	margin : 29px;
}
.lb_title {
	font-size: 35px;
}
.lb2 {
	font-size: 13px;
	color: #676767;
}
.lb3 {
	font-size: 12px;
	color: #979797;
}
.hr1 {
	width:950px;
	margin: 20px 0px;
}
.board-content {
	overflow-y : hidden;
	position: relative;
	min-height: 150px;
	font-size: 15px;
	line-height: 1.6;
}



</style>
</head>
<body>
	<!-- header -->
	<c:import url="../default/header.jsp" />


	<!-- body -->
	<div class="container">
		<!-- 둥군 테두리 만들 공간 -->
		<div class="contentBox"> 
			<div align="left" style="margin-left: 20px; margin-right: 20px;">
				<!-- 게시판 이름 -->
				<div style="margin: 20px 0 5px 0px;">
					<a href="list?b_category=${boardInfo.b_category}&b_article=${boardInfo.b_article}">
						${boardInfo.b_article}
					</a>
				</div>
				<!-- 게시글 제목 -->
				<div style="margin-top:0px;">
					<label class="lb_title">${boardInfo.b_title}</label>				
				</div>
				<!-- 닉네임 + 등급  -->
				<div style="height: 40px;">
					<div style="height:15px; margin-bottom:2px;">
						<label><b>${boardInfo.b_nick}</b></label>
						<label class="lb2">${memberInfo.m_rank}</label>
					<br style="margin: 0px;">
					</div>
					<div style="height:15px;">
						<label class="lb3">${boardInfo.getDate()}</label>
						<label class="lb3">조회 ${boardInfo.b_hit}</label>
					</div>
				</div>
				
				<hr class="hr1">
				
				<!-- 글 내용 -->
				<div class="board-content">
					<div>
						${boardInfo.b_content}
					</div>
				</div>
			
				<hr class="hr1">
			</div>
		</div>
	</div>


</body>
</html>