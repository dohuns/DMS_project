<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- sortabl 설정 -->
<script type="text/javascript">
	//	category 위치 변동
	$(function() {
		$("#move").sortable({
			stop : function(event, ui) {
				reorder();
			}
		});
	});

	//	article 위치 변동
	function article(article) {
		var cate = document.getElementsByName('main');
		var list = "";
		for (var i = 0; i < cate.length; i++) {
			list += "#" + cate.item(i).id;
			if (i != cate.length - 1) {
				list += ",";
			}
		}
		$("#" + article).sortable({
			connectWith : list,
			stop : function(event, ui) {
				reorder();
			}
		});
	}

	//	순서 변동시 값 조정
	function reorder() {
		$(".categorynum").each(function(i) {
			$(this).val(i + 1);
		});
		$(".articlenum").each(function(i) {
			$(this).val(i + 1);
		});
	}
</script>
<script type="text/javascript">
	//	리스트 저장
	function listSave() {
		$(".categorynum").each(
				function(i) {
					var b_cateNum = document
							.getElementsByClassName("categorynum")[i].value;
					var b_category = document
							.getElementsByClassName("categorynum")[i].name;
					categorySave(b_category, b_cateNum);
					$('#' + b_category).find('.articlenum')
							.each(
									function(j) {
										var b_articleNum = $('#' + b_category)
												.find('.articlenum')[j].value;
										var b_article = $('#' + b_category)
												.find('.articlenum')[j].name;
										articleSave(b_article, b_category,
												b_articleNum);
									});
				});
		alert("저장되었습니다.")
	}

	//	카테고리 저장
	function categorySave(b_category, b_cateNum) {
		var form = {
			b_category : b_category,
			b_cateNum : b_cateNum
		};
		$.ajax({
			url : "ordercategory",
			type : "GET",
			data : form,
			success : function() {
			},
			error : function(data) {
				alert("실패!!")
			}
		});
	}

	//	아티클 저장
	function articleSave(b_article, b_category, b_articleNum) {
		b_article = b_article.replace(/(\s)/g, "&nbsp;");
		var form = {
			b_article : b_article,
			b_category : b_category,
			b_articleNum : b_articleNum
		};
		$.ajax({
			url : "orderarticle",
			type : "GET",
			data : form,
			success : function() {
			},
			error : function(data) {
				alert("실패!!")
			}
		});
	}
</script>
<style type="text/css">
/* 마우스 포인터 손가락 모양으로 변경 */
.cursor_test {
	cursor: pointer;
}

.main {
	width: 80%;
	text-align: center;
	align-items: center;
	background-color: #f0f0f0;
	margin: 10px;
	padding: 5px;
	font-size: 12px;
	height: auto;
}

.sub {
	background-color: #f9f9f9;
	margin: 7px;
	padding: 5px;
	height: 27px;
}

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
}
</style>
</head>
<body>
	<c:if test="${sessionScope.m_rankNum ne 1}">
		<script type="text/javascript">
			alert("잘못된 접근 방식입니다.");
			history.go(-1);
		</script>
	</c:if>

	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="main">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />

				<div class="divContent">
					<div align="center"
						style="width: 80%; margin: 50px 0 0 300px; min-width: 600px;">
						<div
							style="display: flex; width: 80%; min-width: 550px; height: 57px;">
							<div align="left" style="width: 65%; height: 57px;">
								<h3>게시글 순서 변경하기</h3>
							</div>
							<div align="right"
								style="width: 35%; height: 57px; margin-top: 15px;">
								<button class="btn btn-success" onclick="location.reload()"
									style="background-color: #eee; color: black; border-color: #eee;">되돌리기</button>
								<button class="btn btn-success" onclick="listSave()"
									style="background-color: #5bc0de; border-color: #5bc0de;">저장하기</button>
							</div>
						</div>
						<div
							style="border-top: 3px solid #000; width: 80%; min-width: 550px;">
							<div id="move">
								<c:forEach items="${boardCate}" var="boardCate">
									<div onclick="article('${boardCate.b_category}')" class="main"
										id="${boardCate.b_category}" name="main">
										${boardCate.b_category}<input type="hidden"
											class="categorynum" value="${boardCate.b_cateNum}"
											name="${boardCate.b_category}">
										<c:forEach items="${boardArt}" var="boardArt">
											<c:if test="${boardCate.b_category == boardArt.b_category}">
												<div class="sub">
													<input type="hidden" class="articlenum"
														value="${boardArt.b_articleNum}"
														name="${boardArt.b_article}">${boardArt.b_article}</div>
											</c:if>
										</c:forEach>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>