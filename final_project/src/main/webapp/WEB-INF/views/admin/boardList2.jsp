<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function categoryUp() {
		console.log("위치 업");
	}
	function categoryDo() {
		console.log("위치 다운");
	}
	//	category 추가
	function categoryIns() {
		let b_category = prompt('추가할 category를 입력해주세요');
		if ((trim(b_category) != "") && b_category != null) {
			var form = {
				b_category : b_category
			};
			$.ajax({
				url : "inscategory",
				type : "GET",
				data : form,
				success : function(data) {
					if (data == "") {
					alert("category가 중복되었습니다.");
					} else{
					alert("category가 추가 되었습니다.");
					}
				},
				error : function(data) {
					alert("실패!!")
				}
			});
		} else if (b_category == null) {
			alert("취소되었습니다.")
		} else {
			alert("값을 입력해주세요")
		}
	}
	// category 수정
	function categoryUpd(b_category) {
		let b_title = prompt('수정할 category를 입력해주세요');
		if ((trim(b_title) != "") && b_title != null) {
			var form = {
				b_category : b_category,
				b_title : b_title
			};
			$.ajax({
				url : "updcategory",
				type : "GET",
				data : form,
				success : function(data) {
					alert("수정되었습니다.");
					console.log("성공 :" + data)
					$("#" + b_category + "1").html(data);
					$("#" + b_category + "1").attr("id", data + "1");
					$("#" + b_category + "1_1").attr({
						"onclick" : "categoryUpd('" + data + "')",
						"id" : data + "1_1"
					});
					$("#" + b_category + "1_2").attr({
						"onclick" : "categoryIns('" + data + "')",
						"id" : data + "1_2"
					});
				},
				error : function(data) {
					alert("실패!!")
				}
			});
		} else if (b_title == null) {
			alert("취소되었습니다.")
		} else {
			alert("값을 입력해주세요")
		}
	}
	// category 삭제
	function categoryDel(category) {
		if (confirm("삭제시 모든 게시글이 지워집니다. 삭제 하시겠습니까?") == true) {
			location.href = "delcategory?b_category="+category;
			alert("category가 삭제되었습니다");
		} else {
			return false;
		}
	}
	// article 추가
	function articleIns(b_category) {
		let b_article = prompt('추가할 article을 입력해주세요');
		if ((trim(b_article) != "") && b_article != null) {
			var form = {
				b_category : b_category,
				b_article : b_article
			};
			$.ajax({
				url : "insarticle",
				type : "GET",
				data : form,
				success : function(data) {
					alert("추가 되었습니다.");
				},
				error : function(data) {
					alert("실패!!")
				}
			});
		} else if (b_article == null) {
			alert("취소되었습니다.")
		} else {
			alert("값을 입력해주세요")
		}
	}
	// article 삭제
	function articleDel(article) {
		if (confirm("삭제시 모든 게시글이 지워집니다. 삭제 하시겠습니까?") == true) {
			location.href = "delarticle?b_article="+article;
			alert("article이 삭제되었습니다");
		} else {
			return false;
		}
	}
	function artcleCk(article) {
		console.log(article)
		$("#fl-on").attr('id', 'fl-off');
		$("." + article).attr('id', 'fl-on');
	}
	//	article 수정
	function articleUpd(b_article) {
		let b_title = prompt('수정할 article을 입력해주세요');
		if ((trim(b_title) != "") && b_title != null) {
			var form = {
				b_article : b_article,
				b_title : b_title
			};
			$.ajax({
				url : "updarticle",
				type : "GET",
				data : form,
				success : function(data) {
					alert("수정되었습니다.");
					console.log("성공 :" + data)
					$("#" + b_article + "2").html(data);
					$("#" + b_article + "2").attr("id", data + "2");
					$("#" + b_article + "2_1").attr({
						"onclick" : "articleUpd('" + data + "')",
						"id" : data + "2_1"
					});
					$("." + b_article).attr({
						"class" : data,
						"onclick" : "artcleCk('" + data + "')"
					});
				},
				error : function(data) {
					alert("실패!!")
				}
			});
		} else if (b_title == null) {
			alert("취소되었습니다.")
		} else {
			alert("값을 입력해주세요")
		}
	}
</script>
<style type="text/css">
div#fl {
	display: flex;
}

div#fl-on {
	background-color: #f0f0f0;
}

div#fl-off {
	background-color: white;
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
</style>
</head>
<body>
	<div style="width: 400px;">
		<div align="right">
			<button onclick="categoryUp()">&#9650;</button>
			<button onclick="categoryDo()">&#9660;</button>
			<button onclick="categoryIns()">+</button>
		</div>
		<c:forEach items="${boardCate}" var="Cate">
			<hr id="main">
			<div id="fl">
				<div id="menu" style="width: 65%;">
					<label id="${Cate.b_category}1">${Cate.b_category}</label>
				</div>
				<div id="menu" style="width: 35%;" align="right">
					<button onclick="categoryDel('${Cate.b_category}')">-</button>
					<button id="${Cate.b_category}1_2"
						onclick="articleIns('${Cate.b_category}')">+</button>
					<button id="${Cate.b_category}1_1"
						onclick="categoryUpd('${Cate.b_category}')">수정</button>
				</div>
			</div>
			<hr id="sub">
			<c:forEach items="${boardArt}" var="Art">
				<c:if test="${Cate.b_category == Art.b_category}">
					<div id="fl-off" class="${Art.b_article}"
						onclick="artcleCk('${Art.b_article}')" style="display: flex;">
						<div id="menu" style="width: 65%;">
							<label id="${Art.b_article}2">${Art.b_article}</label>
						</div>
						<div id="menu" style="width: 35%;" align="right">
							<button onclick="articleDel('${Art.b_article}')">-</button>
							<button id="${Art.b_article}2_1"
								onclick="articleUpd('${Art.b_article}')">수정</button>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</c:forEach>
	</div>
</body>
</html>