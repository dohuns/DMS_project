<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터</title>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css"
		rel="stylesheet" id="bootstrap-css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="//code.jquery.com/jquery-latest.min.js"></script>
<style>
body {
	display: flex;
	min-height: 100vh;
	flex-direction: column;
}

main {
	flex: 1 0 auto;
}

.brand-logo>img {
	width: 50px;
	height: 50px;
	margin-top: 5px;
}
/* PARALLAX */
.prof-user {
	height: 270px !important;
}

.parallax>img {
	/* opacity: .5; 
	- Para hacer la imagen, como marca de agua 
	*/
	
}
/* Menu - profile */
.bg-card-user {
	background: rgba(0, 77, 64, .5);
	padding: 15px 0;
}

.truncate>img {
	width: 120px;
}
/* Promoción */
.promo i {
	margin: 10px 0;
	color: #FFF;
	font-size: 7rem;
	display: block;
}

.promo-caption {
	font-size: 1.7rem;
	font-weight: 500;
	margin-top: 5px;
	margin-bottom: 0;
}

.promo .light {
	padding: 2px 10px;
}
/* FOOTER */
footer .foot-text {
	margin-top: 10px;
}
</style>
<script>
	
</script>
</head>
<body>
	<div class="row">
		<div class="col xl12 l12 m12 s12">
			<div class="card-panel center teal">
				<span class="white-text"> 고객센터를 통해 궁금증을 해결하세요. 이외 고객센터에 관련된 사항 등 기록 예정 </span>
			</div>
		</div>

		<div class="col xl4 l4 m12 12">
			<div class="card-panel center promo blue-grey darken-3 white-text">
				<i class="material-icons">flash_on</i>
				<p class="promo-caption">불량 행위 신고</p>
				<p class="light center">부적절한 게시글 / 댓글 / 닉네임 / .. 
				게시글 수를 맞추지않으면 모양이 틀어진다/p>
			</div>
		</div>
		<div class="col xl4 l4 m12 12">
			<div class="card-panel center promo blue-grey darken-3 white-text">
				<i class="material-icons">group</i>
				<p class="promo-caption">가입 / 변경 / 탈퇴</p>
				<p class="light center">등록된 이메일 주소를 변경하거나 탈퇴하고 싶은 경우,
				가입이 제대로 진행되지 않는 경우 기입할 예정</p>
			</div>
		</div>
		<div class="col xl4 l4 m12 12">
			<div class="card-panel center promo blue-grey darken-3 white-text">
				<i class="material-icons">settings</i>
				<p class="promo-caption">계정 정지 문의</p>
				<p class="light center">카카오 문의 이용제한/보호조치 참조하여 기록
				아에이오우</p>
			</div>
		</div>
	</div>



</body>
</html>