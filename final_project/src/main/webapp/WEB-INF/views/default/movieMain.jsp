<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	id="bootstrap-css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>
.our-webcoderskull {
	width: 810px;
	border: 6px solid #eee;
}

.movieList {
	padding: 30px 0 0 0;
}

.movieImage {
	margin: 0;
	width:189px;
	text-align:center;
}

.movieText {
	color: black;
	font-size: 13px;
}

.movieTitle {
	color: black;
	font-size: 20px;
	font-weight: bold;
}

.movieRank {
	color: black;
	font-size: 30px;
	font-weight: bold;
}

.movieRankArea ul {
	list-style-type: none;
	padding: 0;
}

.rightBtn {
	cursor: pointer;
	margin-top: 50px;
	margin-left: 30px;
	font-size: 100px;
}

.leftBtn {
	cursor: pointer;
	margin-top: 50px;
	margin-right: 30px;
	font-size: 100px;
}

.movieRankArea a {
	color: black;
}

a:link, a:visited, a:hover, a:active {
	color: black;
	text-decoration: none;
}

.movieContent-body h2 {
	margin-top: 20px;
	font-size: 50px;
}

.movieContent {
	display: grid;
	margin-top: 10px;
}

.movieArea {
	width:189px;
	text-align: left;
	display: block;
	margin: 0;
	padding: 0;
}
.movieMove{
	width:21px;
	height:270px;
	margin-top:77px;
	padding-top:130px;
	background-color: black;
	cursor:pointer;
}
.Bmove{
color: white;
}
</style>
<script type="text/javascript">
	var maxLength = '';
	// 페이지 접근 시 
	$(function() {
		boxOffice();
	});

	// 영화 정보 가져오기(api)
	function boxOffice() {
		// 박스 오피스 가져오기
		$
				.ajax({
					url : "dayOffice",
					type : "POST",
					success : function(list) {
						var base = '';
						base += '<div onclick="prevMovie()" class="movieMove"><b class="Bmove"><</b></div>'
								+'<ul id="movieRank">'
								+ '</ul>'
								+ '<div onclick="nextMovie()" class="movieMove"><b class="Bmove">></b></div>';
						$(".movieRankArea").html(base);
						var html = '';
						for (var i = 0; i < 9; i += 4) {
							// movieNm , rank , openDt
							html += '<li style="display:none;" id="li'+ i +'">'
									+ '	<div class="movieList">'
									+ '		<div style="display:flex; margin-bottom:20px;">'
									+ '		<div class="movieArea">'
									+ '			<label class="movieRank">'
									+ list[i].rank
									+ '위</label>'
									+ '			<figure class="movieImage">'
									+ '				<a id="a'+ i +'" target="_blank">'
									+ '					<img id="im'+ i +'" src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1099/109982_P03_133458.jpg" width=189px; height="270px;">'
									+ '				</a>'
									+ '			</figure>'
									+ '			<div class="movieContent">'
									+ '				<label class="movieTitle">'
									+ list[i].movieNm
									+ '</label>'
									+ '				<label class="movieText">개봉일 : '
									+ list[i].openDt
									+ '</label>'
									+ '			</div>'
									+ '		</div>'
									+ '		<div class="movieArea">'
									+ '			<label class="movieRank">'
									+ list[i + 1].rank
									+ '위</label>'
									+ '			<figure class="movieImage">'
									+ '				<a id="a'
									+ (i + 1)
									+ '" target="_blank">'
									+ '					<img id="im'
									+ (i + 1)
									+ '" src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1028/102875_P42_100733.jpg" width=189px; height="270px;">'
									+ '				</a>'
									+ '			</figure>'
									+ '			<div class="movieContent">'
									+ '				<label class="movieTitle">'
									+ list[i + 1].movieNm
									+ '</label>'
									+ '				<label class="movieText">개봉일 : '
									+ list[i + 1].openDt
									+ '</label>'
									+ '			</div>' + '		</div>';
							if (i < 8) {
								html += '		<div class="movieArea">'
										+ '			<label class="movieRank">'
										+ list[i + 2].rank
										+ '위</label>'
										+ '			<figure class="movieImage">'
										+ '				<a id="a'
										+ (i + 2)
										+ '" target="_blank">'
										+ '					<img id="im'
										+ (i + 2)
										+ '" src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1142/114276_P04_111037.jpg" width=189px; height="270px;">'
										+ '				</a>'
										+ '			</figure>'
										+ '			<div class="movieContent">'
										+ '				<label class="movieTitle">'
										+ list[i + 2].movieNm
										+ '</label>'
										+ '				<label class="movieText">개봉일 : '
										+ list[i + 2].openDt
										+ '</label>'
										+ '			</div>'
										+ '		</div>'
										+ '		<div class="movieArea">'
										+ '			<label class="movieRank">'
										+ list[i + 3].rank
										+ '위</label>'
										+ '			<figure class="movieImage">'
										+ '				<a id="a'
										+ (i + 3)
										+ '" target="_blank">'
										+ '					<img id="im'
										+ (i + 3)
										+ '" src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1300/130013_P05_132145.jpg" width=189px; height="270px;">'
										+ '				</a>'
										+ '			</figure>'
										+ '			<div class="movieContent">'
										+ '				<label class="movieTitle">'
										+ list[i + 3].movieNm
										+ '</label>'
										+ '				<label class="movieText">개봉일 : '
										+ list[i + 3].openDt
										+ '</label>'
										+ '			</div>'
										+ '		</div>'
										+ '		</div>'
										+ '		</div>' + '</li>';
							}
							$("#movieRank").html(html);
							// 포스터 가져오기
							searchMovieData(list[i].movieNm, i);
							searchMovieData(list[i + 1].movieNm, (i + 1));
							if (i < 8) {
								searchMovieData(list[i + 2].movieNm, (i + 2));
								searchMovieData(list[i + 3].movieNm, (i + 3));
							}
						}
						$("#li0").fadeIn();
					},
					error : function() {
						alert("박스 오피스 실패!!")
					}
				});
	}

	function searchMovieData(movieNm, index) {
		// 영화 포스터 가져오기
		$.ajax({
			url : "searchMovie",
			type : "POST",
			data : "movieNm=" + movieNm,

			success : function(list) {
				var html2 = '';
				for (var i = 0; i < list.length; i++) {
					$("#im" + index).attr("src", list[i].image);
					$("#a" + index).attr("href", list[i].link);
				}
			},
			error : function() {
				alert("포스터 실패!!")
			}

		});

	}

	// 롤링 배너
	var nowNum = 0;

	// 오른쪽 방향키 눌렀을 때 
	function nextMovie() {
		rollingFn('right');
	}
	// 왼쪽 방향키 눌렀을 때 
	function prevMovie() {
		rollingFn('left');
	}

	// 방향키 눌렀을 때 li 전환
	function rollingFn(direction) {
		$("#li" + nowNum).hide();
		if (direction == 'right') {
			nowNum = nowNum + 4;
			if (nowNum > 8) {
				nowNum = 0;
			}
		} else {
			nowNum = nowNum - 4;
			if (nowNum < 0) {
				nowNum = 8;
			}
		}
		$("#li" + nowNum).fadeIn();
	}
</script>

</head>
<body>
	<section class="our-webcoderskull">
		<div class="movieContent-body">
			<div align="center" style="margin-top: 20px;">
				<label style="font-size: 36px;">일일 박스 오피스</label>
			</div>
			<!-- 영화 차트 순위권 출력 -->
			<div class="movieRankArea" align="center" style="display: flex;">
				<div align="center" style="margin: 40px 0; width: 100%;">
					<label style="font-size: 24px;"> 영화 정보 불러오는중~ </label>
				</div>
			</div>
		</div>
	</section>
</body>
</html>