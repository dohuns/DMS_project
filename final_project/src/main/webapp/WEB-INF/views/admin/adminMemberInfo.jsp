<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function() {
			// 체크박스 전체 선택
			$("#chkBox").click(function() {
				var chk = $("#chkBox").prop("checked");
			    var boxSize = $(".chkBoxs").length;
				if(chk) {
					$(".chkBoxs").prop("checked", true);
					if(boxSize > 0) {
						$(".contentBtn button").prop("disabled", false);
					}
				} else {
					$(".chkBoxs").prop("checked", false);
					$(".contentBtn button").prop("disabled", true);
				}
			});

			// 체크박스 선택 시 버튼 활성화
			$('.chkBoxs').click(function() {
				var chkBox = $(this).prop('checked');					// 클릭한 값이 체크되도록 지정
			    var boxSize = $(".chkBoxs").length;						// 목록 값 수
			    var chkSize = $(".chkBoxs:checked").length;				// 체크된 값 수
			    
				// 전체 선택 || 체크박스 하나 이상 선택 시 버튼 활성화
				if (chkBox == true || chkSize > 0) {
					$(".contentBtn button").prop("disabled", false);
				} else {
					$(".contentBtn button").prop("disabled", true);
				}

			    // 목록 개수와 선택된 개수가 같을 경우 전체 선택 버튼 활성화
				if (boxSize == chkSize) {
					$("#chkBox").prop("checked", true);
				} else {
					$("#chkBox").prop("checked", false);
				}
			});
		});

		// 계정 삭제(탈퇴회원으로 변경)
		function delRank() {
			var message = confirm("선택한 회원 정보를 삭제하시겠습니까?");
			if (message) {
				$('#contentForm').submit();
			}
		}

		// MODAL 출력(선택한 값 포함)
		function updRank() {
			var m_idChk = [];
			var html = "";
			$.each($("input[name=m_idChk]:checked"), function() {
				m_idChk.push($(this).val());
			});
			$("#idArr")
					.html(
							"<input type='hidden' name='m_idChk' value='" + m_idChk + "'>");
			$('#upd-Rank').modal('show');
		}
	</script>
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
			margin: 50px 0 50px 250px;
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
		.btn-st{
			float: right;
			margin-left: 10px;
		}
		.modal-sz {
			height: 240px;
		}
		.td-st a,
		.td-st a:focus,
		.td-st a:visited {
			color: #333;
			text-decoration: none;
		}
		.td-st a:hover {
			color: #333;
			cursor: pointer;
			font-weight: 600;
			text-decoration: underline;
		}
		.img-st {
			width: 80px;
			height: 80px;
			border-radius: 100%;
		}
		.dis-st {
			display: flex;
		}
		.img-st {
			width: 80px;
			height: 80px;
			border-radius: 100%;
		}
		.infoContent span {
			margin-left: 20px;
			line-height: 25px;
		}
		.infoContent .big {
			font-size: 30px;
		}
		.infoContent .small {
			font-size: 15px;
		}
		.font-im {
			color: red;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="main">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />

				<!-- CONTENT -->
				<div class="divContent">
					<div>
						<form id="contentForm">

							<!-- 이미지 출력 -->
							<div class="dis-st">
								<div class="imgContent">
									<c:choose>
										<c:when test="${userInfo.m_picture != null}">
											<img src="/img/memberImage/${userInfo.m_picture}"
												alt="프로필사진" class="img-st">
										</c:when>
										<c:otherwise>
											<img
												src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
												alt="프로필사진" class="img-st">
										</c:otherwise>
									</c:choose>
								</div>

								<!-- 회원정보 출력  -->
								<div class="infoContent">
									<span class="big"><b>${userInfo.m_nick}</b></span>
									<div>
										<span class="small">${userInfo.m_rank}</span>
										<div class="infoDiv">
											<span>총 게시글 <em class="font-im"> ${boardcount}</em>개</span>
											<span>총 댓글 <em class="font-im"> ${replycount}</em>개</span>
										</div>
									</div>
								</div>
							</div>
			<hr>
			<c:choose>
				<c:when test="${sessionScope.m_id eq param.id }">
					<div style="font-size: 15px; color: black;">
						<a href="myList?id=${param.id }&page=1" id="myWrite"
							style="color: black;">작성글</a><span style="color: #eee;"> |
						</span><a href="myList?id=${param.id }&page=2" id="myReply"
							style="color: black;">작성 댓글</a><span style="color: #eee;">
							| </span><a href="myList?id=${param.id }&page=3" id="myReplyWrite"
							style="color: black;">댓글단 글</a>
					</div>
				</c:when>
				<c:otherwise>
					<div style="font-size: 15px; color: black;">
						<a href="myList?id=${param.id }&page=1" id="myWrite"
							style="color: black;">작성글</a><span style="color: #eee;"> |
						</span><a href="myList?id=${param.id }&page=3" id="myReplyWrite"
							style="color: black;">댓글단 글</a>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="list" style="padding-top: 10px;">
				<c:choose>
					<c:when test="${param.page == 1 }">
						<c:import url="/myWrite" />
					</c:when>
					<c:when test="${param.page == 2 }">
						<c:import url="/myReply" />
					</c:when>
					<c:otherwise>
						<c:import url="/myReplyWrite" />
					</c:otherwise>
				</c:choose>
			</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>