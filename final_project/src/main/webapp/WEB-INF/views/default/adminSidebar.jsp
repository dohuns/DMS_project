<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
   <link
      href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css?after"
      rel="stylesheet" id="bootstrap-css">
   <script
      src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
   
   <style>
      html, body, div {
         height: 100%;
      }
      body, nav, div, ul, li {
         font-size: 13px;
         margin: 0;
         padding: 0;
      }
      a {
         color: #FFF;
         text-decoration: none;
      }
      ul {
         list-style: none;
      }
      body #sideDiv {
         height: 100%;
         position: fixed;
         margin-top: 50px;
      }
      .sidebar {
         top: 0;
         width: 250px;
         height: 100%;
         margin: 0;
         padding: 0;
         list-style: none;
         background-color: #222D30;
      }
      .sidebar>ul>li>a {
         line-height: 30px;
         box-sizing: border-box;
      }
      .sidebar>ul>li:first-child>a {
         border-top: 0;
      }
      html body #sideDiv .sidebar .sidebar-brand {
         padding: 20px;
         margin-bottom: 10px;
         background-color: #55A4D3;
         text-transform: uppercase;
         text-align: center;
      }
      html body #sideDiv .sidebar .sidebar-brand a {
         color: #FFF;
         font-weight: 700;
         font-size: 16px;
         text-decoration: none;
      }
      .sidebar>.sidebar-brand a:hover {
         background: none;
      }
      html body #sideDiv .sidebar .sidebar-menu>a {
         color: #FFF;
         border: none;
         margin-bottom: 0;
         padding: 10px 0 10px 30px;
         background-color: transparent;
      }
      .sidebar .sidebar-menu>a {
         line-height: 50px;
      }
      html body #sideDiv .sidebar .sidebar-menu>a:hover,
      html body #sideDiv .sidebar .sidebar-menu>a:focus,
      html body #sideDiv .sidebar .sidebar-menu>a:active {
         color: #FFF;
         text-decoration: none;
      }
      html body #sideDiv .sidebar .sidebar-menu .sidebar-menu-list {
         border-radius: 0;
         background-color: transparent;
         margin-bottom: 0;
         border: none;
      }
      html body #sideDiv .sidebar .sidebar-menu .sidebar-menu-list>li>a {
         color: #727272;
           display: block;
         position: relative;
         font-size: 13px;
          padding: 16px 0 16px 53px;
      }
      html body #sideDiv .sidebar .sidebar-menu .sidebar-menu-list>li>a:hover,
      html body #sideDiv .sidebar .sidebar-menu .sidebar-menu-list>li>a:focus,
      html body #sideDiv .sidebar .sidebar-menu .sidebar-menu-list>li>a:active {
         color: #FFF;
         text-decoration: none;
      }
   </style>
</head>
<body>
   <div id="sideDiv">
      <nav class="sidebar">
         <ul>
            <li class="sidebar-brand"><a href="admin">DOMISU</a></li>
            <li class="sidebar-menu"><a href="#">회원 관리</a>
               <ul class="sidebar-menu-list">
                  <li><a href="adminMemberList?m_rankNum=1">관리</a></li>
                  <li><a href="adminMemberList?m_rankNum=2">스탭</a></li>
                  <li><a href="adminMemberList?m_rankNum=3">일반 회원</a></li>
                  <li><a href="adminMemberList?m_rankNum=4">대기 회원</a></li>
                  <li><a href="adminMemberList?m_rankNum=5">탈퇴 회원</a></li>
               </ul>
            </li>
            <li class="sidebar-menu"><a href="#">서비스 관리</a>
               <ul class="sidebar-menu-list">
                  <li><a href="#">일반 문의</a></li>
                  <li><a href="#">계정 문의</a></li>
                  <li><a href="#">신고 접수</a></li>
               </ul>
            </li>
            <li class="sidebar-menu"><a href="#">사이트 설정</a>
               <ul class="sidebar-menu-list">
                  <li><a href="boardList">카테고리 항목 추가</a></li>
                  <li><a href="boardChange">카테고리 위치 변경</a></li>
               </ul>
            </li>
         </ul>
      </nav>
   </div>
</body>
</html>