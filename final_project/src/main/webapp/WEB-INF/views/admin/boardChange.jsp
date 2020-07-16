<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		$(".categorynum").each(function(i) {
			var b_cateNum = document.getElementsByClassName("categorynum")[i].value;
			var b_category = document.getElementsByClassName("categorynum")[i].name;
			categorySave(b_category, b_cateNum);
			$('#'+b_category).find('.articlenum').each(function(j){
				var b_articleNum = $('#'+b_category).find('.articlenum')[j].value;
				var b_article = $('#'+b_category).find('.articlenum')[j].name;
				articleSave(b_article, b_category, b_articleNum);
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
	width: 300px;
	text-align: center;
	align-items: center;
	background-color: #f0f0f0;
	margin: 10px;
	padding: 10px;
}

.sub {
	background-color: #f9f9f9;
	margin: 10px;
	padding: 10px;
}
</style>
</head>
<body>
		<div id="wrapper" class="">
		<c:import url="../default/adminHeader.jsp"/>
		<!-- PAGE CONTENT -->
		<div id="page-content-wrapper">
			<div id="topbar">
				<div class="pull-left">
					<h1 class="company-name" onclick="location.href='admin'"><b>관리자 페이지</b></h1>
				</div>
				<div class="pull-right">
					<div id="header_user" style="padding-right: 20px;">
						<a href="login"><b>회원 페이지</b></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<div id="main-content">
				<div class="content-body">
					<div class="col-lg-12 main-box-container">
						<div class="box">
						
						
						
	<div style="width: 330px;">
		<button onclick="listSave()">저장하기</button>
		<div id="move">
			<c:forEach items="${boardCate}" var="boardCate">
				<div onclick="article('${boardCate.b_category}')" class="main"
					id="${boardCate.b_category}" name="main">
					${boardCate.b_category}<input type="hidden" class="categorynum"
						value="${boardCate.b_cateNum}" name="${boardCate.b_category}">
					<c:forEach items="${boardArt}" var="boardArt">
						<c:if test="${boardCate.b_category == boardArt.b_category}">
							<div class="sub">
								<input type="hidden" class="articlenum"
									value="${boardArt.b_articleNum}" name="${boardArt.b_article}">${boardArt.b_article}</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
	</div></div></div></div></div></div>
</body>
</html>