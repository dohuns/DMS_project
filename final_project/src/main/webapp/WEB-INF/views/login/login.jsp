<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name = "google-signin-client_id"content = "117371344622-2cj0jdfcjbjgud7p47kucda54ucnqetu.apps.googleusercontent.com">
<title>login</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/jquery.cookie.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}
.lb1 {
	color: #FF1616;
}
</style>
<script type="text/javascript">
$(function(){
// 	체크되어있으면 아이디 기억(페이지 들어왔을 때 )

	
    $('.button-checkbox').each(function(){
		var $widget = $(this),
			$button = $widget.find('button'),
			$checkbox = $widget.find('input:checkbox'),
			color = $button.data('color'),
			settings = {
					on: {
						icon: 'glyphicon glyphicon-check'
					},
					off: {
						icon: 'glyphicon glyphicon-unchecked'
					}
			};
		// 쿠키 값이 있을 때 ID 자동으로 넣어주기
		var userId = $.cookie("cookieId");
		console.log("들어옴 : " + userId);
		if(userId != null) {
			$("#m_id").val(userId);
			$("#remember_me").prop('checked', true);
			updateDisplay();
		}

		$button.on('click', function () {
			$checkbox.prop('checked', !$checkbox.is(':checked'));
			$checkbox.triggerHandler('change');
			updateDisplay();
		});

		$checkbox.on('change', function () {
			// 아이디 기억하기 체크되어 있을 때 쿠키 만들기
			if(!$("#remember_me").is(":checked")) {
				$.cookie("cookieId" , null);
			}
			updateDisplay();
		});

		function updateDisplay() {
			var isChecked = $checkbox.is(':checked');
			// Set the button's state
			$button.data('state', (isChecked) ? "on" : "off");

			// Set the button's icon
			$button.find('.state-icon')
				.removeClass()
				.addClass('state-icon ' + settings[$button.data('state')].icon);

			// Update the button's color
			if (isChecked) {
				$button
					.removeClass('btn-default')
					.addClass('btn-' + color + ' active');
			}
			else
			{
				$button
					.removeClass('btn-' + color + ' active')
					.addClass('btn-default');
			}
		}
		function init() {
			updateDisplay();
			// Inject the icon if applicable
			if ($button.find('.state-icon').length == 0) {
				$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
			}
		}
		init();
		
	});
	
	
	
	// 로그인 시 쿠키 추가
	$("#login").on('click' , function() {
		if($("#m_id").val() == "")  {
			alert("아이디를 입력하세요!");
		} else if($("#m_pw").val() == "") {
			alert("비밀번호를 입력하세요!");
		} else {
			if($("#remember_me").is(":checked")) {
				$.cookie("cookieId" , $("#m_id").val() , {expires:7});
			}
			$("#loginForm").submit();
		}
		
	})
});
var token = "";
// 구글 로그인
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  if(token == 1 && profile.getEmail() != null && profile.getEmail() != "") {
		  location.href="login/googleCallback?email="+ profile.getEmail() ;
	  }
}
function makeToken() {
	token = 1;
}

	

</script>
</head>
<body>
<c:if test="${sessionScope.m_id != null}">
	<script type="text/javascript">
		location.href="/movie";
	</script>
</c:if>
<div class="container">

<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" action="login_Ck" id="loginForm">
			<fieldset>
				<h2>로그인 페이지</h2>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="text" name="m_id" id="m_id" class="form-control input-lg" placeholder="ID를 입력해주세요" value="${param.m_id}">
				</div>
				<div class="form-group" style="margin-bottom: 10px;">
                    <input type="password" name="m_pw" id="m_pw" class="form-control input-lg" placeholder="비밀번호를 입력해주세요">
				</div>
				<div style="margin-bottom: 5px;">
                   	<c:if test="${login == 'fail'}">
	                    <label class="lb1"> 아이디 또는 비밀번호가 일치하지 않습니다.</label>
                   	</c:if>
                </div>
				<span class="button-checkbox">
					<button type="button" class="btn" data-color="info">아이디 저장하기</button>
                    <input type="checkbox" name="remember_me" id="remember_me" class="hidden">
					<a href="pwInquiry" class="btn btn-link pull-right">비밀번호 찾기</a>
					<a href="idInquiry" class="btn btn-link pull-right">아이디 찾기</a>
				</span>
				<hr class="colorgraph">
			 	<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="button" class="btn btn-lg btn-success btn-block" value="로그인" id="login">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="regist_email" class="btn btn-lg btn-primary btn-block">회원가입</a>
					</div>
				</div>
			</fieldset>
			<div align="center">
				<div>
					<a href="${url}"><img height="40"src="/movie/resources/naverBtn.PNG"/></a>
				</div>
				 <div class="g-signin2" data-onsuccess="onSignIn" onclick="makeToken()" style="width:180px; height:40px;"></div>
			 </div>
		</form>
	</div>
</div>
</div>

</body>
</html>