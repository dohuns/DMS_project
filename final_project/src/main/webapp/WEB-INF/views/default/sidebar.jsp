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
	border: solid 1.5px f2f2f2;
}

hr#sub {
	border: solid 1px #f0f0f0;
}
#myInfo{
padding-inline-start : 30px;
padding-bottom: 10px;
}
ul#myInfoWrite{
padding-inline-start : 20px;
}
</style>
</head>
<body>
	<div style="margin-right: 20px;">
		<div
			style="background-color: white; width: 250px; border-top: solid 0px #000000;">
			<c:choose>
				<c:when test="${sessionScope.m_nick != null}">
					<div>
					<hr style="border: solid 2px #e2e2e2; margin: 0px;">
						<div align="center" style="padding-top: 5px;">
							<h4 class="d-none">나의 활동</h4><div align="center">
								<div style="width: 220px;">
									<hr style="border: solid 1px #f7f7f7; margin: 0px;">
								</div>
							</div>
						</div>
						<div>
							<div style="display: flex;">
<!-- 								<ul id="myInfo"> -->
<!-- 									<li> -->
										<div id="myInfo" style="margin-right: 20px; margin-top: 5px;">
											<c:choose>
												<c:when test="${myInfo.m_picture != null}">
												<img
													src="/img/memberImage/${myInfo.m_picture}"
													width="58" height="58" style="border-radius: 100%">
												</c:when>
												<c:otherwise>
												<img
													src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
													width="58" height="58">
												</c:otherwise>
											</c:choose>
										</div>
										<div style="margin-top: 15px; margin-left: 10px;">
											<strong>${myInfo.m_nick }</strong><br>
											${myInfo.m_rank}
										</div>
<!-- 									</li> -->
<!-- 								</ul> -->
							</div>
							<div>
							<div align="center">
								<div style="width: 220px;">
									<hr style="border: solid 1px #f7f7f7; margin: 0px;">
								</div>
							</div>
								<ul id="myInfoWrite">
									<li style="margin-top: 10px; margin-bottom: 5px;"><b><a href="/movie/myList?id=${m_id }&page=1">내가 쓴 글 보기</a></b> ${myBoardcount} 개</li>
									<li><b><a href="/movie/myList?id=${m_id }page=2">내가 쓴 댓글보기</a></b> ${myReplycount} 개</li>
								</ul>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
						<a href="/movie/login">
					<div align="center" style="background-color: green; padding: 5px 0; margin: 0px 0;">
								로그인하기
					</div>
						</a>
				</c:otherwise>
			</c:choose>
				<a href="#">
			<div align="center" style="background-color: #5bc0de; padding: 5px 0; margin: 5px 0;">
					게시글글쓰기
			</div> 
				</a>
				<a href="https://service.dongledongle.com/DMS_project">
<!-- 				<iframe src="https://service.dongledongle.com/DMS_project" frameborder="0" width="100%" height="500"></iframe> -->
			<div align="center" style="background-color: #f0f0f0; padding: 5px 0; margin: 5px 0; border: solid 1px #f0f0f0;">		
					채팅하기
			</div>
				</a>
			<div>
				<form action="/movie/board/search_list">
					<div class="input-group">
					<input type="hidden" name="b_search" value="title">
						<input type="text" class="form-control" style="height: 28px;"
							placeholder="Search" name="b_content">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit" style="height: 28px;">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>

				</form>
			</div>
			<div id="menu" style="margin-top: 20px;">
				<a href="/movie/board/list?b_category=&b_article=전체">전체글 보기</a>
			</div>
			<div>
				<c:forEach items="${boardCate}" var="boardCate">
					<hr id="main" style="margin-top: 10px; margin-bottom: 10px;">
					<div id="menu" style="display: flex;">
						<div style="width: 95%;">${boardCate.b_category}</div>
						<div align="right" style="width: 5%; cursor: pointer;"
							class="${boardCate.b_category}"
							onclick="menuClose('${boardCate.b_category}')">&or;</div>
					</div>
					<hr id="sub" class="${boardCate.b_category}SubClose"
						style="margin-top: 10px; margin-bottom: 10px;">
					<c:forEach items="${boardArt}" var="boardArt">
						<c:if test="${boardCate.b_category == boardArt.b_category}">
							<div id="menu" class="${boardCate.b_category}Close">
								<a
									href="/movie/board/list?b_category=${boardArt.b_category}&b_article=${boardArt.b_article}">${boardArt.b_article}</a><br>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>