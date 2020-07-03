<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$.ajax({
		url : "sidebar",
		type : "POST",
		success : function(list) {
			console.log("성공")
		},
		error : function() {
			console.log("실패")
		}
	})
</script>
<style type="text/css">
a:link, a:visited, a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: black;
}

ul {
	list-style: none;
}

div.ini {
	display: inline;
}

div#menu {
	margin: 10px 20px;
}

hr#main {
	border: solid 1.5px red;
}

hr#sub {
	border: solid 1px #f0f0f0;
}
</style>
</head>
<body>
	<div style="display: inline;">
		<div
			style="background-color: yellow; width: 300px; border-top: solid 2px #000000;">
			<div>
				<div align="center" style="padding-top: 5px;">
					<h4 class="d-none">나의 활동</h4>
				</div>
				<div>
					<div>
						<ul>
							<li>
								<div>
									<img
										src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
										width="58" height="58" alt="프로필사진">
								</div>
								<div>
									<strong>고냥이파</strong>
								</div>
							</li>
							<li>사서지망생</li>
						</ul>
					</div>
					<div>
						<ul>
							<li><b><a href="#">내가 쓴 글 보기</a></b> 1개</li>
							<li><b><a href="#">내가 쓴 댓글보기</a></b> 4개</li>
						</ul>
					</div>
				</div>
			</div>
			<a href="#"><div align="center"
					style="background-color: skyblue; padding: 5px 0; margin: 5px 0;">
					게시글 글쓰기</div></a> <a href="#"><div align="center"
					style="background-color: red; padding: 5px 0; margin: 5px 0;">
					채팅 하기</div></a>
			<div>
				<form action="#">
					<input type="text" name="search" style="width: 81%">
					<button
						style="background-color: #8df38b; border-color: #8df38b; color: white;">검색</button>
				</form>
			</div>
			<div id="menu">
				<a href="#">전체글 보기</a>
			</div>
			<div>
				<c:forEach items="${boardCate}" var="boardCate">
					<hr id="main">
					<div id="menu">
						${boardCate.b_category}<br>
					</div>
					<hr id="sub">
					<c:forEach items="${boardArt}" var="boardArt">
						<c:if test="${boardCate.b_category == boardArt.b_category}">
							<div id="menu">
								${boardArt.b_article}<br>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>