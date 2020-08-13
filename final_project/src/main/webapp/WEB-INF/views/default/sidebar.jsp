<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
<script type="text/javascript">
	function menuOpen(category) {
		$("." + category).html("&or;");
		$("." + category).attr("onclick", "menuClose('" + category + "')");
		$("." + category + "SubOpen").show();
		$("." + category + "SubOpen").attr("class", category + "SubClose");
		$("." + category + "Open").show();
		$("." + category + "Open").attr("class", category + "Close");
	}
	function menuClose(category) {
		$("." + category).html("&and;");
		$("." + category).attr("onclick", "menuOpen('" + category + "')");
		$("." + category + "SubClose").hide();
		$("." + category + "SubClose").attr("class", category + "SubOpen");
		$("." + category + "Close").hide();
		$("." + category + "Close").attr("class", category + "Open");
	}
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
	border: solid 1.5px #eee;
}

hr#sub {
	border: solid 1px #f0f0f0;
}

#myInfo {
	padding-inline-start: 30px;
	padding-bottom: 10px;
}

ul#myInfoWrite {
	padding-inline-start: 20px;
}

#sidebar {
	margin-right: 20px;
}

#sidebar-frame {
	width: 250px;
	border-top: 0px solid #000;
}

#sidebar-frame #btn-frame-login {
	text-align: center;
}

#btn-frame-login a {
	color: white;
	text-decoration: none;
}

.loginBtn {
	background-color: #7DADD5;
	margin-bottom: 10px;
	padding: 5px 0;
}

#sidebar-frame #btn-frame-write {
	text-align: center;
}

#btn-frame-write a {
	color: white;
	text-decoration: none;
}

#searchForm {
	margin-bottom: 30px;
}

.writeBtn {
	background-color: #7DCDE4;
	margin-bottom: 10px;
	padding: 5px 0;
}

.sizebar {
	height: 28px;
}

.searchBtn {
	color: #7DADD5;
}

.sidebar-top{
	border: solid 1.5px #777;
	margin: 0px;
}
</style>
</head>
<body>
	<div id="sidebar">
		<div id="sidebar-frame">
			<c:choose>
				<c:when test="${sessionScope.m_nick != null}">
					<div>
						<hr style="border: solid 2px #e2e2e2; margin: 0px;">
						<div align="center" style="padding-top: 5px;">
							<h4 class="d-none">나의 활동</h4>
							<div align="center">
								<div style="width: 220px;">
									<hr style="border: solid 1px #f7f7f7; margin: 0px;">
								</div>
							</div>
						</div>
						<div>
							<div style="display: flex;">
								<div id="myInfo" style="margin-right: 20px; margin-top: 5px;">
									<c:choose>
										<c:when test="${myInfo.m_picture != null}">
											<img src="/img/memberImage/${myInfo.m_picture}" width="58"
												height="58" style="border-radius: 100%">
										</c:when>
										<c:otherwise>
											<img
												src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
												width="58" height="58">
										</c:otherwise>
									</c:choose>
								</div>
								<div style="margin-top: 15px; margin-left: 10px;">
									<strong>${myInfo.m_nick }</strong><br> ${myInfo.m_rank}
								</div>
							</div>
							<div>
								<div align="center">
									<div style="width: 220px;">
										<hr style="border: solid 1px #f7f7f7; margin: 0px;">
									</div>
								</div>
								<ul id="myInfoWrite">
									<li style="margin-top: 10px; margin-bottom: 5px;"><b><a
											href="/movie/myList?id=${m_id }&page=1">내가 쓴 글 보기</a></b>
										${myBoardcount} 개</li>
									<li><b><a href="/movie/myList?id=${m_id }&page=2">내가
												쓴 댓글보기</a></b> ${myReplycount} 개</li>
								</ul>
							</div>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div id="btn-frame-login" class="loginBtn">
						<a href="/movie/login">로그인</a>
					</div>
				</c:otherwise>
			</c:choose>

			<div id="btn-frame-write" class="writeBtn">
				<a href="/movie/board/writeAll">글 작성</a>
			</div>

			<div id="searchForm">
				<form action="/movie/board/search_list">
					<div class="input-group">
						<input type="hidden" name="b_search" value="title" /> <input
							type="text" name="b_content" class="form-control sizebar"
							placeholder="Search" />
						<div class="input-group-btn">
							<button type="submit" class="btn btn-default sizebar">
								<i class="glyphicon glyphicon-search searchBtn"></i>
							</button>
						</div>
					</div>
				</form>
			</div>

			<hr class="sidebar-top">
			<div id="menu">
				<a href="/movie/board/list?b_category=&b_article=전체">전체글 보기</a>
			</div>

			<div class="sideMenu">
				<c:forEach var="boardCate" items="${boardCate}">
					<hr id="main" style="margin-top: 10px; margin-bottom: 10px;">
					<div id="menu" style="display: flex;">
						<div style="width: 95%;"><b>${boardCate.b_category}</b></div>
						<div align="right" style="width: 5%; cursor: pointer;"
							class="${boardCate.b_category}"
							onclick="menuClose('${boardCate.b_category}')">&or;</div>
					</div>
					<hr id="sub" class="${boardCate.b_category}SubClose"
						style="margin-top: 10px; margin-bottom: 10px;">

					<c:forEach var="boardArt" items="${boardArt}">
						<c:if test="${boardCate.b_category == boardArt.b_category}">
							<div id="menu" class="${boardCate.b_category}Close">
								<a
									href="/movie/board/list?b_category=${boardArt.b_category}&b_article=${boardArt.b_article}">${boardArt.b_article}</a><br>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
					<hr class="sidebar-top">
			</div>

		</div>
	</div>

</body>
</html>