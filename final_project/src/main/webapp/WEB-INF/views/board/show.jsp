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
	margin : 10px 29px 0 33px;
}
.btnBotBox {
	width:985px;
	height: 50px;
	margin: 10px 0 29px 38px;
}
.btnTopBox {
	width:985px;
	height: 34px;
	margin: 29px 0 0 38px;
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

.hr0 {
	width:950px;
	margin: 20px 0;
}
.hr1 {
	width:950px;
	margin: 0px 0;
}
.board-content {
	overflow-y : hidden;
	position: relative;
	min-height: 150px;
	font-size: 15px;
	line-height: 1.6;
}
.c-nick {
	font-size: 16px;
	font-weight: 900;
	color: black;
}
.c-content {
	font-size: 14px;
	font-weight: 400p;
}
.commentWriter {
	margin: 30px 0 29px;
	padding: 8px 10px 10px 10px;
	border-radius: 6px;
	box-sizing: border-box;
	border: 2px solid rgba(0,0,0,0.1);
}
.commentReplyWriter {
	margin: 30px 0 29px;
	padding: 8px 10px 10px 10px;
	border-radius: 6px;
	box-sizing: border-box;
	border: 2px solid rgba(0,0,0,0.1);
}
.comment {
	padding: 12px 23px 10px 0px;
}
.hide-Comment {
	display:none;
	padding: 0 0 0 50px; 
}
.myComment {
	padding: 12px 23px 10px 0px;
	background-color: #F5F6F8;
}
.commentArea {
}
.CommentArea-reply {
	padding-left: 50px;
}
.mylb{
	color:red;
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
	// 페이지 접근 시
	$(function() {
		getCommentList();
		addBtn();
	})
	
	// 댓글 입력에 따른 작성버튼 변화
	$(function() {
		$("#comment_content").on('keydown keyon' , function() {
			if($("#comment_content").val() == "") {
				$("#comment_btn_div").html(
					'<button type="button" onclick="commentWriter()" class="btn btn-dmsDefault" style="font-weight: 900">작성</button>'		
				);
			} else {
				$("#comment_btn_div").html(
					'<button type="button" onclick="commentWriter()" class="btn btn-info" style="font-weight: 900">작성</button>'
				);
			}
		});
	});
	// 댓글 내용 작성여부 + 댓글 작성
	function commentWriter() {
		if($("#comment_content").val() == "") { // 댓글내용 없을 때
			alert("내용을 입력해주세요!!");			
		} else { // 댓글 작성
			var formData = $("#fo").serializeArray();
			
			$.ajax({
				url : "comment_save",
				type : "POST",
				data : formData,
				dataType : "text",
				success : function(arg) {
					getCommentList();
					$("#comment_content").val("");
				},
				error : function() {
					alert("실패!");
				}
			});
		}
	}
	
	// 댓글 창 클릭 시 로그인 x면 로그인창으로
	$(function() {
		$("#comment_content").click(function() {
			var session = "${sessionScope.m_nick}";
			if(session == "") {
				location.href="../login";
			}
		});
	});
	
	// 댓글 불러오기 + 댓글 수 
	function getCommentList() {
		
		// 댓글 수 
		$.ajax({
			url:"comment_count",
			type:"GET",
			data:$("#fo").serializeArray(),
			dataType : "text",
			success : function(arg) {
				$("#c_count").text(arg);
			},
			error : function() {
				alert("실패!!");
			}
		});	
		
		// 댓글 불러오기
		$.ajax({
			url:"comment_list",
			type:"GET",
			data:$("#fo").serializeArray(),
			success : function(list) {
				let html = "";
				if(list.length > 0) {
					$("#commentBox").css({
						"display":"block"
					})
					for(var i=0; i<list.length; i++) {
						// 덧글은 들여쓰기 
						if(list[i].c_reNum == 0) {
							html += '<div class="commentArea">';
						} else {
							html += '<div class="CommentArea-reply">';
						}
						// 자신 댓글이면 배경색 입히기
						if("${sessionScope.m_id}" == list[i].c_id) {
							html += '<div class="myComment">';
						} else {
							html += '<div class="comment">';
						}
						html += '<div style="margin-bottom: 5px;">';
						// 게시자와 댓글작성자가 같으면 작성자 표시
						if($("#b_id").val() == list[i].c_id) {
							html += '<a href="#"><span class="c-nick">' + list[i].c_nick + '</span></a><span class="mylb">작성자</span>';
						} else {
							html += '<a href="#"><span class="c-nick">' + list[i].c_nick + '</span></a>';
						}
						html += '</div>';
						html += '<div>';
						html += '<span class="c-content">' + list[i].c_content + '</span>';
						html += '</div>';
						html += '<div style="margin-top: 7px;">';
						html += '<span class="lb3" style="margin-right:10px;">' + list[i].c_date + '</span>';
						html += '<span class="lb3" style="cursor: pointer;" onclick="comReply(' + list[i].c_comNum + ', \''+ list[i].c_nick +'\')" >답글 쓰기</span>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						if(i != list.length-1) {
							html += '<hr class="hr1">';
						}
						html += '<div class="hide-Comment" id="div'+list[i].c_comNum+'">';
						html += '<div class="commentReplyWriter">';
						html += '<form action="comment_save" id="fo'+list[i].c_comNum+'">';
						html += '<input type="hidden" value="${param.b_num}" name="c_boardNum">';
						html += '<input type="hidden" value="'+list[i].c_group+'" name="c_group">';
						html += '<div>';
						html += '<label class="c-nick" style="padding: 6px 12px;">닉네임</label>'	
						html += '<textarea rows="1" id="Recomment_content'+list[i].c_comNum+'" name="c_content" class="dms-textarea" style="overflow:hidden;';			
						html += 'overflow-wrap:break-word; height:60px; border: 0px; resize:none;"';
						html += 'placeholder="댓글을 입력하세요"></textarea>';
						html += '</div>';
						html += '<div id="comment_btn_div" align="right">';
						html += '<button type="button" onclick="commentCancel(' + list[i].c_comNum + ')" class="btn btn-dmsDefault" style="font-weight: 900">취소</button>';
						html += '<button type="button" onclick="RecommentWriter(' + list[i].c_comNum + ')" class="btn btn-dmsDefault" style="font-weight: 900; margin-left:10px;">작성</button>';
						html += '</div>';
						html += '</form>';
						html += '</div>';
						html += '</div>';
// 						if(i != list.length-1) {
// 							html += '<hr class="hr0">';
// 						}
					}
					$("#commentList").html(html);
				}
			},
			error : function() {
				alert("실패!");
			}
		});
	}
	
	// 본인 게시글이면 수정,삭제 버튼 생성
	function addBtn() {
		var sessionId = "${sessionScope.m_id}";
		if(sessionId == $("#b_id").val()) {
			$("#btnMD01").css({
				"display":"inline-block"
			});
			$("#btnMD02").css({
				"display":"inline-block"
			});
			$("#btnMD03").css({
				"display":"inline-block"
			});
			$("#btnMD04").css({
				"display":"inline-block"
			});
		} else {
			$("#btnMD01").css({
				"display":"none"
			});
			$("#btnMD02").css({
				"display":"none"
			});
			$("#btnMD03").css({
				"display":"none"
			});
			$("#btnMD04").css({
				"display":"none"
			});
		}
	}
	
	$(function() {
		var num = $("#c_boardNum").val();
		// 수정 버튼 클릭
		$("#btnMD01,#btnMD03").click(function() {
			location.href="modify?c_boardNum="+num;
		});
		
		// 삭제 버튼 클릭
		$("#btnMD02,#btnMD04").click(function() {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.href="delete?b_num="+num +"&b_category=${boardInfo.b_category}&b_article=${boardInfo.b_article}";
			}
		});
		
		// 목록 버튼 클릭 
		$("#btnList01,#btnList02").click(function() {
			location.href="list?b_category=${boardInfo.b_category}&b_article=${boardInfo.b_article}";
		});
	})
	
	// 대댓글 창 열기
	function comReply(num , nick) {
		$("#div"+num).css({
			"display":"block"
		});
		$("#Recomment_content"+num).attr( 'placeholder', nick+'님께 답글을 남겨보세요~' );
	}
	
	// 대댓글창 없애는 버튼
	function commentCancel(num) {
		$("#div"+num).css({
			"display":"none"
		})
	}
	
	// 대댓글 남기기
	function RecommentWriter(num) {
		if($("#Recomment_content"+num).val() == "") { // 댓글내용 없을 때
			alert("내용을 입력해주세요!!");			
		} else { // 댓글 작성
			var formData = $("#fo"+num).serializeArray();
			
			$.ajax({
				url : "Recomment_save",
				type : "POST",
				data : formData,
				dataType : "text",
				success : function(arg) {
					getCommentList();
					$("#comment_content").val("");
					$("#div"+num).css({
						"display":"none"
					});
				},
				error : function() {
					alert("실패!");
				}
			});
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../default/header.jsp" />

	<!-- body -->
	<div class="container">
		<div class="btnTopBox">
			<div style="float: left;">
				<button type="button" id="btnMD01"class="btn btn-dmsDefault" style="font-weight: 900;">수정</button>
				<button type="button" id="btnMD02"class="btn btn-dmsDefault" style="font-weight: 900;">삭제</button>
			</div>
			<div style="float: right;">
				<button type="button" id="btnList01"class="btn btn-dmsDefault" style="font-weight: 900">목록</button>
			</div>
		</div>
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
				<input type="hidden" id="b_id" name="b_id" value="${boardInfo.b_id}">
				<div style="height: 40px;">
					<div style="height:15px; margin-bottom:2px;">
						<a href="#"><b style="color: black;">${boardInfo.b_nick}</b></a>
						<label class="lb2">${memberInfo.m_rank}</label>
					<br style="margin: 0px;">
					</div>
					<div style="height:15px;">
						<label class="lb3">${boardInfo.getDate()}</label>
						<label class="lb3">조회 ${boardInfo.b_hit}</label>
					</div>
				</div>
				
				<hr class="hr0">
				
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
						<strong style="color:black;" id="c_count"></strong>
					</a>
				</div>
				
				<hr class="hr0">
				
				<!-- 댓글 창 -->
				<div id="commentBox" style="display: none;">
					<div style="margin-bottom: 20px;">
						<h3 style="font-weight:800">댓글</h3>
					</div>
					<div id="commentList">
						
					</div>
				</div>
				<!-- 댓글 작성 -->
				<div class="commentWriter">
					<form action="comment_save" id="fo">
						<!-- 닉네임 댓글작성 textarea -->
						<div>
							<!-- hidden으로 보낼 값 -->
							<input type="hidden" value="${param.b_num}" name="c_boardNum" id="c_boardNum">
				
							<!-- 닉네임 -->
							<label class="c-nick" style="padding: 6px 12px;">닉네임</label>
							
							<!-- 댓글작성 -->
							<textarea rows="1" id="comment_content" name="c_content" class="dms-textarea" style="overflow:hidden; 
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
							<button type="button" onclick="commentWriter()" class="btn btn-dmsDefault" style="font-weight: 900">작성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="btnBotBox">
			<div style="float: left;">
				<button type="button" class="btn btn-success" style="font-weight: 900;">글 쓰기</button>
				<button type="button" class="btn btn-dmsDefault" style="font-weight: 900;">답글</button>
				<button type="button" id="btnMD03" class="btn btn-dmsDefault" style="font-weight: 900;">수정</button>
				<button type="button" id="btnMD04" class="btn btn-dmsDefault" style="font-weight: 900;">삭제</button>
			</div>
			<div style="float: right;">
				<button type="button" id="btnList02" class="btn btn-dmsDefault" style="font-weight: 900" onclick="gkgk()">목록</button>
			</div>
		</div>
	</div>


</body>
</html>