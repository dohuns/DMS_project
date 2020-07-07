<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css?after">
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
.c-nick {
	font-size: 19px;
	font-weight: 900;
	color: black;
}
.c-content {
	font-size: 14px;
	font-weight: 400p;
}
.commentWriter {
	margin: 12px 0 29px;
	padding: 8px 10px 10px 10px;
	border-radius: 6px;
	box-sizing: border-box;
	border: 2px solid rgba(0,0,0,0.1);
}
.btn-dmsDefault {
	color:black;
	background-color: B7B7B7;
	border-color: white;
}
.dms-textarea {
	display: block;
	width: 100%;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: black;
	background-color: white;
	background-image: none;
	border-radius: 4px;
}
textarea:focus {
	border-color: white;
	box-shadow: 0px;
	outline: 0 none;
}

</style>

<script type="text/javascript">
	
	// 댓글 입력에 따른 작성버튼 변화
	$(function() {
		$("#comment_content").on('keyon keydown' , function() {
			if($("#comment_content").val() == "") {
				console.log("성공")
				$("#comment_btn_div").html(
					'<button type="button" onclick="commentWriter()" class="btn btn-dmsDefault btn-sm">작성</button>'		
				);
			} else {
				$("#comment_btn_div").html(
					'<button type="button" onclick="commentWriter()" class="btn btn-info btn-sm">작성</button>'
				);
			}
		});
	});
	
	function commentWriter() {
		if($("#comment_content").val() == "") {
			alert("내용을 입력해주세요!!");			
		} else {
			// 
			
			// ajax로 바꾸기
			$("#fo").submit();
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../default/header.jsp" />


	<!-- body -->
	<div class="container">
		<!-- 둥군 테두리 만들 공간 -->
		<div class="contentBox"> 
			<div align="left" style="margin: 0 30px;">
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
						<p>
							${boardInfo.b_content}
						</p>
					</div>
				</div>
				
				<!-- 좋아요 + 댓글 수  -->
				<div style="margin-top: 20px;">
					<a href="#">
						<img src="/movie/resources/commentImg.png" style="width:20px;">
						<span style="color:black;">댓글</span>
						<strong style="color:black;">2</strong>
					</a>
				</div>
				
				<hr class="hr1">
				
				<!-- 댓글 창 -->
				
				<div style="margin-bottom: 40px;">
					<h3 style="font-weight:800">댓글</h3>
				</div>
				<!-- 댓글 내용 -->
				<div>
					<div style="margin-bottom: 5px;">
						<a href="#"><span class="c-nick">닉네임</span></a>
					</div>
					<div>
						<span class="c-content">댓글 내용</span>
					</div>
					<div style="margin-top: 7px;">
						<span class="lb3">작성시간</span>
						<a href="#"><span class="lb3">답글 쓰기</span></a>
					</div>
				</div>
				
				<!-- 댓글 작성 -->
				<div class="commentWriter">
					<form action="comment_save" id="fo">
						<!-- 닉네임 댓글작성 textarea -->
						<div>
							<label class="c-nick" style="padding: 6px 12px;">닉네임</label>	
							<textarea rows="1" id="comment_content"class="dms-textarea" style="overflow:hidden; 
								overflow-wrap:break-word; height:60px; border: 0px; resize:none;"
								placeholder="댓글을 입력하세요"></textarea>
							<script>
								// 자동 줄 개행 스크립트
								$("textarea").on('keyup keydown' , function() {
									$(this).height(17).height($(this).prop('scrollHeight')+12);
								});
							</script>
						</div>
						<!-- 작성 버튼 -->
						<div id="comment_btn_div" align="right">
							<button type="button" onclick="commentWriter()" class="btn btn-dmsDefault btn-sm">작성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>