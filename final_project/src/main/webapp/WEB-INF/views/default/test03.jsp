<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>유준아빠와 롤링배너만들기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style rel="stylesheet" type="text/css">
*{margin:0;padding:0;font-size:12px;}
a{font-size:14px;color:#000;text-decoration:none}6
a:visited{color:#000;text-decoration:none}
/* slideul */
.slideWrap{position:relative;z-index:1;width:100%;height:300px;overflow:hidden}
.slideUl{position:absolute;z-index:2;top:0;left:0;width:100%;height:100%}
.slideUl li{display:none}
.slideUl li.banner1{background:yellow}
.slideUl li.banner2{background:skyblue}
.slideUl li.banner3{background:pink}
.prevBtn,.nextBtn{position:absolute;z-index:3;font-size:30px;font-weight:bold;color:#880000}
.prevBtn{left:1%;bottom:42%;}
.nextBtn{right:1%;bottom:42%;}
.btns{position:absolute;z-index:3;bottom:0;left:0;width:100%;text-align:center;}
.btns>a{display:inline-block;padding:10px;font-size:12px;color:#fff;background:#f00}
</style>
</head>
<body>
<div class="slideWrap">
	<div class="btns">
		<a href="#" class="playBtn">재생</a>
		<a href="#" class="stopBtn">멈춤</a>
	</div>
	<a href="#" class="prevBtn">&lt;</a>
	<ul class="slideUl">
		<li class="banner1">1</li>
		<li class="banner2">2</li>
		<li class="banner3">3</li>
	</ul>
	<a href="#" class="nextBtn">&gt;</a>
</div>
<script type="text/javascript">
$(function(){
	var nowNum = 0;
	var bannerObj = $('.slideUl li');
	console.log("li : " + bannerObj);
	var maxLength = bannerObj.length;
	console.log("length : " + maxLength);
	var timer = 1000; // 자동 롤링되는 타임 설정
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
</body>
</html>