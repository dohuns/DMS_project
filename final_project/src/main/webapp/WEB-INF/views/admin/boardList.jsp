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
	// 리스트 출력
	function AllList() {
		$.ajax({
			url : "cateList",
			type : "GET",
			success : function(cate) {
				$(function cateList() {
					$.ajax({
						url : "artList",
						type : "GET",
						success : function(art) {
							reset(cate, art)
						},
						error : function() {
							console.log("art 에러")
						}
					})
				})
			},
			error : function() {
				console.log("cate 에러")
			}
		})
	}
	// 리스트 리셋
	function reset(cate, art) {
		let html = ""
		$("#List").html(html)
		$.each(cate,function(index, cate) {
			html += "<hr id='main'>";
			html += "<div class='"+cate.b_category+"' onclick='artcleCk(`"+ cate.b_category + "`)' style='display: flex;'>";
			html += "<div id='menu' style='width: 65%;'>" + cate.b_category + "</div>";
			html += "<div id='menu' style='width: 35%;' align='right'>";
			html += "<button onclick='categoryDel(`"+ cate.b_category + "`)'>-</button>";
			html += "<button onclick='articleIns(`"+ cate.b_category + "`)'>+</button>";
			html += "<button onclick='categoryUpd(`"+ cate.b_category + "`)'>수정</button>";
			html += "</div>";
			html += "</div>";
			html += "<hr id='sub'>";
				$.each(art,function(index, art) {
					if (cate.b_category == art.b_category) {
					html += "<div class='"+cate.b_category + art.b_article+"' onclick='artcleCk(`"+ cate.b_category + art.b_article+ "`)' style='display: flex;'>";
					html += "<div id='menu' style='width: 65%;'>" + art.b_article + "</div>";
					html += "<div id='menu' style='width: 35%;' align='right'>";
					html += "<button onclick='articleDel(`" + cate.b_category +"`,`"+ art.b_article + "`)'>-</button>";
					html += "<button onclick='articleUpd(`" + art.b_article + "`)'>수정</button>";
					html += "</div>";
					html += "</div>";
					}
				});
		})
		$("#List").html(html)
	}

	//	category 추가
	function categoryIns() {
		let b_category = prompt('추가할 category를 입력해주세요');
		var pattern = /[~!@#$%^&*()_+=:;''""<>?,./]/;
		if (b_category.trim() != "" && b_category != null) {
			if (!pattern.test(b_category)) {
			b_category = b_category.replace(/(\s)/g, "&nbsp;");
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
						} else {
							AllList()
							alert("category가 추가 되었습니다.");
						}
					},
					error : function(data) {
						alert("실패!!")
					}
				});
			} else{
				alert("특수문자를 제거해주세요.")
			}
		} else if (b_category == null) {
			return false;
		} else {
			alert("값을 입력해주세요")
		}
	}

	// category 수정
	function categoryUpd(b_category) {
		let b_title = prompt('수정할 category를 입력해주세요');
		var pattern = /[~!@#$%^&*()_+=:;''""<>?,./]/;
		if (b_title.trim() != "" && b_title != null) {
			if (!pattern.test(b_title)) {
			b_category = b_category.replace(/(\s)/g, "&nbsp;");
			b_title = b_title.replace(/(\s)/g, "&nbsp;");
			var form = {
				b_category : b_title,
				b_title : b_category
			};
			$.ajax({
				url : "updcategory",
				type : "GET",
				data : form,
				success : function(data) {
					if (data == "") {
						alert("category가 중복되었습니다.");
					} else {
						AllList()
						alert("수정되었습니다.");
					}
				},
				error : function(data) {
					alert("실패!!")
				}
			});
			} else{
				alert("특수문자를 제거해주세요.")
			}
		} else if (b_title == null) {
			return false;
		} else {
			alert("값을 입력해주세요")
		}
	}

	// category 삭제
	function categoryDel(b_category) {
		if (confirm("삭제시 모든 게시글이 지워집니다. 삭제 하시겠습니까?") == true) {
			b_category = b_category.replace(/(\s)/g, "&nbsp;");
			$.ajax({
				url : "delcategory",
				type : "GET",
				data : {
					b_category : b_category
				},
				success : function(data) {
					AllList()
					alert("category가 삭제되었습니다");
				},
				error : function(data) {
					alert("실패!!")
				}
			});
		} else {
			return false;
		}
	}

	// article 추가
	function articleIns(b_category) {
		let b_article = prompt('추가할 article을 입력해주세요');
		var pattern = /[~!@#$%^&*()_+=:;''""<>?,./]/;
		if (b_article.trim() != "" && b_article != null) {
			if (!pattern.test(b_article)) {
			b_article = b_article.replace(/(\s)/g, "&nbsp;");
			var form = {
				b_category : b_category,
				b_article : b_article
			};
			$.ajax({
				url : "insarticle",
				type : "GET",
				data : form,
				success : function(data) {
					if (data == "") {
						alert("article이 중복되었습니다.");
					} else {
						AllList()
						alert("article이 추가 되었습니다.");
					}
				},
				error : function(data) {
					alert("실패!!")
				}
			});
			} else{
				alert("특수문자를 제거해주세요.")
			}
		} else if (b_article == null) {
			return false;
		} else {
			alert("값을 입력해주세요")
		}
	}

	//	article 수정
	function articleUpd(b_article) {
		let b_title = prompt('수정할 article을 입력해주세요');
		var pattern = /[~!@#$%^&*()_+=:;''""<>?,./]/;
		if (b_title.trim() != "" && b_title != null) {
			if (!pattern.test(b_title)) {
			b_article = b_article.replace(/(\s)/g, "&nbsp;");
			b_title = b_title.replace(/(\s)/g, "&nbsp;");
			var form = {
				b_article : b_title,
				b_title : b_article
			};
			$.ajax({
				url : "updarticle",
				type : "GET",
				data : form,
				success : function(data) {
					if (data == "") {
						alert("article이 중복되었습니다.");
					} else {
						AllList()
						alert("article이 수정 되었습니다.");
					}
				},
				error : function(data) {
					alert("실패!!")
				}
			});
			} else{
				alert("특수문자를 제거해주세요.")
			}
		} else if (b_title == null) {
			return false;
		} else {
			alert("값을 입력해주세요")
		}
	}

	// article 삭제
	function articleDel(b_category, b_article) {
		if (confirm("삭제시 모든 게시글이 지워집니다. 삭제 하시겠습니까?") == true) {
			b_article = b_article.replace(/(\s)/g, "&nbsp;");
			var form = {
					b_category : b_category,
					b_article : b_article
				};
			$.ajax({
				url : "delarticle",
				type : "GET",
				data : form,
				success : function(data) {
					AllList()
					alert("article이 삭제되었습니다");
				},
				error : function(data) {
					alert("실패!!")
				}
			});
		} else {
			return false;
		}
	}
</script>
<style type="text/css">

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
<body onload="AllList()">
	<div style="width: 400px;">
		<div align="right">
			<button onclick="categoryIns()">+</button>
		</div>
		<div id="List"></div>
	</div>
</body>
</html>