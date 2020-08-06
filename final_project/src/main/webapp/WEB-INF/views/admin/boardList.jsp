<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css?after"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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
		$
				.each(
						cate,
						function(index, cate) {
							html += "<div style='display: flex; margin-top: 20px;'>";
							html += "<div id='menu' style='width: 65%;'><b>"
									+ cate.b_category + "</b></div>";
							html += "<div id='menu' style='width: 35%; color: #5bc0de;' align='right'>";
							html += "<a onclick='insModArt(`" + cate.b_category
									+ "`)'><b>추가</b></a> &nbsp;";
							html += "<a onclick='upModCate(`" + cate.b_category
									+ "`)'><b>수정</b></a> &nbsp;";
							html += "<a onclick='delModCate(`"
									+ cate.b_category + "`)'><b>삭제</b></a>";
							html += "</div>";
							html += "</div>";
							$
									.each(
											art,
											function(index, art) {
												if (cate.b_category == art.b_category) {
													html += "<div style='display: flex; background-color: white; border: solid 1px #eee; margin: 0 20px; border-radius: 5px;'>";
													html += "<div id='menu' style='width: 65%;'>└ &nbsp;"
															+ art.b_article
															+ "</div>";
													html += "<div id='menu' style='width: 35%; color: #5bc0de;' align='right'>";
													html += "<a onclick='upModArt(`"
															+ art.b_article
															+ "`)'>수정</a> ";
													html += "<a onclick='delModArt(`"
															+ cate.b_category
															+ "`,`"
															+ art.b_article
															+ "`)'>삭제</a>";
													html += "</div>";
													html += "</div>";
												}
											});
						})
		$("#List").html(html)
	}

	//	category 추가
	function categoryIns() {
		var b_category = $("#insModCate").val();
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
							ModCateOverlap();
						} else {
							AllList()
							insModCateClose();
						}
					},
					error : function(data) {
						alert("실패!!")
					}
				});
			} else {
				ModCateSpecial();
			}
		} else if (b_category == null) {
			return false;
		} else {
			ModCateNull();
		}
	}

	// category 수정
	function categoryUpd() {
		var b_title = $("#upModCate").val();
		var b_category = $("#cate").val();
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
							ModCateOverlap();
						} else {
							AllList()
							upModCateClose();
						}
					},
					error : function(data) {
						alert("실패!!")
					}
				});
			} else {
				ModCateSpecial();
			}
		} else if (b_title == null) {
			return false;
		} else {
			ModCateNull();
		}
	}

	// category 삭제
	function categoryDel() {
		var b_category = $("#delCate").val();
		b_category = b_category.replace(/(\s)/g, "&nbsp;");
		$.ajax({
			url : "delcategory",
			type : "GET",
			data : {
				b_category : b_category
			},
			success : function(data) {
				AllList()
				delModCateClose();
			},
			error : function(data) {
				alert("실패!!")
			}
		});
	}

	// article 추가
	function articleIns(b_category) {
		var b_article = $("#insModArt").val();
		var b_category = $("#b_cate").val();
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
							ModArtOverlap();
						} else {
							AllList()
							insModArtClose();
						}
					},
					error : function(data) {
						alert("실패!!")
					}
				});
			} else {
				ModArtSpecial();
			}
		} else if (b_article == null) {
			return false;
		} else {
			ModArtNull();
		}
	}

	//	article 수정
	function articleUpd(b_article) {
		var b_title = $("#upModArt").val();
		var b_article = $("#b_art").val();
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
							ModArtOverlap();
						} else {
							AllList()
							upModArtClose();
						}
					},
					error : function(data) {
						alert("실패!!")
					}
				});
			} else {
				ModArtSpecial();
			}
		} else if (b_title == null) {
			return false;
		} else {
			ModArtNull();
		}
	}

	// article 삭제
	function articleDel(b_category, b_article) {
		var b_category = $("#b_delCate").val();
		var b_article = $("#b_delArt").val();
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
				delModArtClose();
			},
			error : function(data) {
				alert("실패!!")
			}
		});
	}
</script>
<script type="text/javascript">
	//카테고리 생성
	function insModCate() {
		$('#insert-category').modal('show');
	}
	//카테고리 생성 닫기
	function insModCateClose() {
		$('#insert-category').modal('hide');
		$('#insert-categoryClose').modal('show');
	}
	//카테고리 수정
	function upModCate(category) {
		$('#update-category').modal('show');
		$('#cate').attr('value', category);
	}
	//카테고리 수정 닫기
	function upModCateClose() {
		$('#update-category').modal('hide');
		$('#update-categoryClose').modal('show');
	}
	//카테고리 삭제
	function delModCate(category) {
		$('#delete-category').modal('show');
		$('#delCate').attr('value', category);
	}
	//카테고리 삭제 닫기
	function delModCateClose() {
		$('#delete-category').modal('hide');
		$('#delete-categoryClose').modal('show');
	}
	//카테고리 중복
	function ModCateOverlap() {
		$('#categoryOverlap').modal('show');
	}
	//카테고리 빈값
	function ModCateNull() {
		$('#categoryNull').modal('show');
	}
	//카테고리 특수문자
	function ModCateSpecial() {
		$('#categorySpecial').modal('show');
	}
	//아티클 생성
	function insModArt(category) {
		$('#insert-article').modal('show');
		$('#b_cate').attr('value', category);
	}
	//아티클 생성 닫기
	function insModArtClose() {
		$('#insert-article').modal('hide');
		$('#insert-articleClose').modal('show');
	}
	//아티클 수정
	function upModArt(article) {
		$('#update-article').modal('show');
		$('#b_art').attr('value', article);
	}
	//아티클 수정 닫기
	function upModArtClose() {
		$('#update-article').modal('hide');
		$('#update-articleClose').modal('show');
	}
	//아티클 삭제
	function delModArt(category, article) {
		$('#delete-article').modal('show');
		$('#b_delCate').attr('value', category);
		$('#b_delArt').attr('value', article);
	}
	//아티클 삭제 닫기
	function delModArtClose() {
		$('#delete-article').modal('hide');
		$('#delete-articleClose').modal('show');
	}
	//아티클 중복
	function ModArtOverlap() {
		$('#articleOverlap').modal('show');
	}
	//아티클 빈값
	function ModArtNull() {
		$('#articleNull').modal('show');
	}
	//아티클 특수문자
	function ModArtSpecial() {
		$('#articleSpecial').modal('show');
	}
</script>
<style type="text/css">
div#menu {
	margin: 10px 20px;
}

hr#main {
	border: solid 1.5px f2f2f2;
}

hr#sub {
	border: solid 1px #f0f0f0;
}

a:link, a:visited, a:active {
	text-decoration: none !important;
	color: #5bc0de;
	cursor: pointer;
}

a:hover {
	text-decoration: underline;
	color: #5bc0de;
	cursor: pointer;
}
</style>
</head>
<body onload="AllList()">
	<div style="background-color: #eee; padding-bottom: 20px;">
		<div style="display: flex; padding: 20px 20px 0 20px;">
			<div align="left" style="width: 50%">
				<b>Category</b>
			</div>
			<div align="right" style="width: 50%; color: #5bc0de;">
				<a onclick="insModCate()"><b>추가</b></a>
			</div>
		</div>
		<div>
			<div id="List"></div>
		</div>
	</div>

	<!-- Category 추가 modal -->
	<div id="insert-category" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category 추가</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="insModCate" class="form-control"
						placeholder="추가할 category를 입력해주세요">
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="btn-regist" class="btn btn-primary"
						onclick="categoryIns()">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 추가 modal -->

	<!-- Category 추가 확인창 -->
	<div id="insert-categoryClose" class="modal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category 추가</h4>
				</div>
				<div class="modal-body">
					<h5>category가 추가 되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 추가 확인창 -->

	<!-- Category 수정 -->
	<div id="update-category" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category 수정</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="upModCate" class="form-control"
						placeholder="수정할 category를 입력해주세요"> <input type="hidden"
						id="cate">
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="btn-regist" class="btn btn-primary"
						onclick="categoryUpd()">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 수정 -->

	<!-- Category 수정 확인창 -->
	<div id="update-categoryClose" class="modal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category 수정</h4>
				</div>
				<div class="modal-body">
					<h5>category가 수정 되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 수정 확인창 -->

	<!-- Category 삭제 -->
	<div id="delete-category" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category 삭제</h4>
				</div>
				<div class="modal-body">
					<h5>삭제시 모든 게시글이 지워집니다. 삭제 하시겠습니까?</h5>
					<input type="hidden" id="delCate">
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="btn-regist" class="btn btn-primary"
						onclick="categoryDel()" style="background-color: red;">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 삭제 -->

	<!-- Category 삭제 확인창 -->
	<div id="delete-categoryClose" class="modal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category 삭제</h4>
				</div>
				<div class="modal-body">
					<h5>category가 삭제 되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 삭제 확인창 -->

	<!-- Category 추가 중복 경고창 -->
	<div id="categoryOverlap" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category</h4>
				</div>
				<div class="modal-body">
					<h5>
						category가 <span style="color: red;">중복</span>되었습니다.
					</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						style="background-color: red;">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 추가 중복 경고창 -->

	<!-- Category 추가 빈값 경고창 -->
	<div id="categoryNull" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category</h4>
				</div>
				<div class="modal-body">
					<h5>내용을 입력해주세요</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						style="background-color: red;">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 추가 빈값 경고창 -->

	<!-- Category 추가 특수문자 경고창 -->
	<div id="categorySpecial" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Category</h4>
				</div>
				<div class="modal-body">
					<h5>특수문자를 제거해주세요</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						style="background-color: red;">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /Category 추가 특수문자 경고창 -->

	<!-- article 추가 modal -->
	<div id="insert-article" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article 추가</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="insModArt" class="form-control"
						placeholder="추가할 article를 입력해주세요"> <input type="hidden"
						id="b_cate">
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="btn-regist" class="btn btn-primary"
						onclick="articleIns()">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 추가 modal -->

	<!-- article 추가 확인창 -->
	<div id="insert-articleClose" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article 추가</h4>
				</div>
				<div class="modal-body">
					<h5>Article가 추가 되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 추가 확인창 -->

	<!-- article 수정 -->
	<div id="update-article" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article 수정</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="upModArt" class="form-control"
						placeholder="수정할 article를 입력해주세요"> <input type="hidden"
						id="b_art">
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="btn-regist" class="btn btn-primary"
						onclick="articleUpd()">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 수정 -->

	<!-- article 수정 확인창 -->
	<div id="update-articleClose" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article 수정</h4>
				</div>
				<div class="modal-body">
					<h5>Article가 수정 되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 수정 확인창 -->

	<!-- article 삭제 -->
	<div id="delete-article" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article 삭제</h4>
				</div>
				<div class="modal-body">
					<h5>삭제시 모든 게시글이 지워집니다. 삭제 하시겠습니까?</h5>
					<input type="hidden" id="b_delCate"> <input type="hidden"
						id="b_delArt">
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">취소</button>
					<button id="btn-regist" class="btn btn-primary"
						onclick="articleDel()" style="background-color: red;">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 삭제 -->

	<!-- article 삭제 확인창 -->
	<div id="delete-articleClose" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article 삭제</h4>
				</div>
				<div class="modal-body">
					<h5>Article가 삭제 되었습니다.</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 삭제 확인창 -->

	<!-- article 추가 중복 경고창 -->
	<div id="articleOverlap" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article</h4>
				</div>
				<div class="modal-body">
					<h5>
						Article가 <span style="color: red;">중복</span>되었습니다.
					</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						style="background-color: red;">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 추가 중복 경고창 -->

	<!-- article 추가 빈값 경고창 -->
	<div id="articleNull" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article</h4>
				</div>
				<div class="modal-body">
					<h5>내용을 입력해주세요</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						style="background-color: red;">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 추가 빈값 경고창 -->

	<!-- article 추가 특수문자 경고창 -->
	<div id="articleSpecial" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4>Article</h4>
				</div>
				<div class="modal-body">
					<h5>특수문자를 제거해주세요</h5>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						style="background-color: red;">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /article 추가 특수문자 경고창 -->
</body>
</html>