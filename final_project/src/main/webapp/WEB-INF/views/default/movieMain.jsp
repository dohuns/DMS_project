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
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.our-webcoderskull {
/* 	background: */
/* 		url("http://www.webcoderskull.com/img/right-sider-banner.png") */
/* 		no-repeat center top/cover; */
background-color: #fdfcf0;
}
.movieRankArea {
margin: 0 auto;
display: flex;
}
.movieList {
display: flex; 
padding: 30px 0 30px 50px;
}
.movieImage {
margin-right: 50px;
border : 6px solid black;
}
.movieText {
color: black;
font-size: 17px; 
}
.movieRankArea ul {
list-style-type: none;
padding: 0;
}
.direcBtn {
cursor: pointer;
margin-top: 160px;
font-size: 50px;
}
.movieRankArea a {
color: black;
}
a:link, a:visited, a:hover, a:active {
color:black;
text-decoration: none;
}


</style>
<script type="text/javascript">
	
	// 페이지 접근 시 
	$(function() {
		boxOffice();
	});
	
	// 영화 정보 가져오기(api)
	function boxOffice() {
		// 박스 오피스 가져오기
		$.ajax({
			url:"dayOffice",
			type:"POST",
			success:function(list) {
				var html = '';
				for(var i=0; i<1; i+=4) {
					// movieNm , rank , openDt
					html += '<li>' + 
							'	<div class="movieList">' + 
							'		<div style="display: block;">'	+
							'			<label class="movieText">'+ list[i].rank +'위</label>' + 		
							'			<figure class="movieImage">' +
							'				<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1099/109982_P03_133458.jpg" width=200px;>' +
							'			</figure>' + 
							'			<div style="display: grid; margin-top: 10px;">' + 
							'				<label class="movieText">제목 : '+ list[i].movieNm +'</label>' + 
							'				<label class="movieText">개봉일 : '+ list[i].openDt +'</label>' + 
							'			</div>' +
							'		</div>'	+
							'		<div style="display: block;">' + 
							'			<label class="movieText">'+ list[i+1].rank +'위</label>' + 
							'			<figure class="movieImage">' + 
							'				<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1028/102875_P42_100733.jpg" width=200px;>' + 
							'			</figure>' + 
							'			<div style="display: grid; margin-top: 10px;">'	+	
							'				<label class="movieText">제목 : '+ list[i+1].movieNm +'</label>' + 
							'				<label class="movieText">개봉일 : '+ list[i+1].openDt +'</label>' +
							'			</div>' + 
							'		</div>' + 
							'		<div style="display: block;">' + 
							'			<label class="movieText">'+ list[i+2].rank +'위</label>' + 
							'			<figure class="movieImage">' + 
							'				<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1142/114276_P04_111037.jpg" width=200px;>' +
							'			</figure>' + 
							'			<div style="display: grid; margin-top: 10px;">' +
							'				<label class="movieText">제목 : '+ list[i+2].movieNm +'</label>' + 
							'				<label class="movieText">개봉일 : '+ list[i+2].openDt +'</label>' + 
							'			</div>' + 
							'		</div>' + 
							'		<div style="display: block;">' + 
							'			<label class="movieText">'+ list[i+3].rank +'위</label>' + 
							'			<figure class="movieImage">' + 
							'				<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1300/130013_P05_132145.jpg" width=200px;>' + 
							'			</figure>' + 
							'			<div style="display: grid; margin-top: 10px;">' + 
							'				<label class="movieText">제목 : '+ list[i+3].movieNm +'</label>' + 
							'				<label class="movieText">개봉일 : '+ list[i+3].openDt +'</label>' + 
							'			</div>'	+ 
							'		</div>' + 
							'	</div>'+
							'</li>' ;
							$("#movieRank").html(html);
					// 포스터 가져오기
					searchMovieData(list[i].movieNm , i);
				}
			}, error:function() {
				alert("박스 오피스 실패!!")
			}
		});
	}
	
	function searchMovieData(movieNm , index) {
		// 영화 포스터 가져오기
		$.ajax({
			url:"searchMovie",
			type:"POST",
			data:"movieNm=" + movieNm,
			success:function(poster) {
				$("#im"+(index+1)).attr("src" , poster)
				console.log("이건 : " + poster);
			}, 
			error:function() {
				alert("포스터 실패!!")
			}
		
		});
		
	}
	// 롤링 배너
	$(function(){
		var nowNum = 0;
		var bannerObj = $('.row li');
		var maxLength = bannerObj.length;
		var timer = 2500; // 자동 롤링되는 타임 설정
		var autoRun = setInterval(function(){rollingFn('right');},timer);
		var stopBtn = $('.stopBtn');
		var playBtn = $('.playBtn');
		bannerObj.eq(nowNum).fadeIn();
		$('.nextBtn').bind('click',function(){
			rollingFn('right');
		});
		$('.prevBtn').bind('click',function(){
			rollingFn('left');
		});
		stopBtn.bind('click',function(){
			stopAndGoFn(true);
		});
		playBtn.bind('click',function(){
			stopAndGoFn(false);
		});
		function rollingFn(direction){
			if(direction=='right'){
				nowNum = nowNum+1;
				if(nowNum>maxLength-1){
					nowNum = 0;
				}
			}else{
				nowNum = nowNum-1;
				if(nowNum<0){
					nowNum = maxLength-1;
				}
			}
			bannerObj.hide().eq(nowNum).fadeIn();
		}
		function stopAndGoFn(bool){
			if(bool==true){
				clearInterval(autoRun);
			}else if(bool==false){
				clearInterval(autoRun);			
				autoRun = setInterval(function(){rollingFn('right');},timer);
			}
		}
	});
</script>

</head>
<body>
	<section class="our-webcoderskull padding-lg" >
		<div class="container">
			<div align="center">
				<h2 style="color: white;">일일 박스 오피스</h2>
			</div>

		<!-- 영화 차트 순위권 출력 -->
		
		<div class="movieRankArea">
			<a class="direcBtn">&lt;</a>
			<ul id="movieRank">
<!-- 				<li> -->
<!-- 					<div class="movieList"> -->
<!-- 						<div style="display: block;"> -->
<!-- 							<label class="movieText">1위</label> -->
<!-- 							<figure class="movieImage"> -->
<!-- 								<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1099/109982_P03_133458.jpg" width=200px;> -->
<!-- 							</figure> -->
<!-- 							<div style="display: grid; margin-top: 10px;"> -->
<!-- 								<label class="movieText">제목 : 테이큰3</label> -->
<!-- 								<label class="movieText">개봉일 : 2014-11-27</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<label class="movieText">2위</label> -->
<!-- 							<figure class="movieImage"> -->
<!-- 								<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1028/102875_P42_100733.jpg" width=200px;> -->
<!-- 							</figure> -->
<!-- 							<label class="movieText">제목 : 국제시장</label> -->
<!-- 							<label class="movieText">개봉일 : 2014-11-27</label> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<label class="movieText">3위</label> -->
<!-- 							<figure class="movieImage"> -->
<!-- 								<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1142/114276_P04_111037.jpg" width=200px;> -->
<!-- 							</figure> -->
<!-- 							<label class="movieText">제목 : 마다가스카3</label> -->
<!-- 							<label class="movieText">개봉일 : 2014-11-27</label> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<label class="movieText">4위</label> -->
<!-- 							<figure class="movieImage"> -->
<!-- 								<img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1300/130013_P05_132145.jpg" width=200px;> -->
<!-- 							</figure> -->
<!-- 							<label class="movieText">제목 : 님아 그강</label> -->
<!-- 							<label class="movieText">개봉일 : 2014-11-27</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</li> -->
			</ul>
			<a class="direcBtn">&gt;</a>
		</div>
	</div>
	</section>
</body>
</html>