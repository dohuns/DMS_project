<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
<link
   href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   <header style="margin-bottom: 20px; width: 1080px;">
      <div align="right" style="padding-top: 10px; margin: 10px 0;">
         <c:choose>
            <%-- 세션이 없는 경우 로그인, 회원가입 출력 --%>
            <c:when test="${sessionScope.m_rankNum == 1}">
               <b><a href="/movie/admin">관리자 페이지</a></b>
               <span style="color: #f0f0f0"> | </span>
               <b><a href="/movie/logout">로그아웃</a></b>
               <span style="color: #f0f0f0"> | </span>
               <b><a href="/movie/customerMain">고객센터</a></b>
            </c:when>
            <%-- 세션이 없는 경우 로그인, 회원가입 출력 --%>
            <c:when test="${sessionScope.m_nick == null}">
               <b><a href="/movie/login">로그인</a></b>
               <span style="color: #f0f0f0"> | </span>
               <b><a href="/movie/regist_email">회원가입</a></b>
               <span style="color: #f0f0f0"> | </span>
               <b><a href="/movie/customerMain">고객센터</a></b>
            </c:when>
            <%-- 세션이 있는 경우 로그아웃, 내정보 출력 --%>
            <c:otherwise>
               <b><a href="/movie/myPageCk">내정보</a></b>
               <span style="color: #f0f0f0"> | </span>
               <b><a href="/movie/logout">로그아웃</a></b>
               <span style="color: #f0f0f0"> | </span>
               <b><a href="/movie/customerMain">고객센터</a></b>
            </c:otherwise>
         </c:choose>
      </div>
      <div>
         <a href="/movie/"><img src="/img/DMS_Main.png"></a>
      </div>
   </header>
</body>
</html>