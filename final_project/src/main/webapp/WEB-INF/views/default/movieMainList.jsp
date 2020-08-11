<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>MainList</title>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <style type="text/css">
      tr {
         border-bottom: #eee solid 1px;
      }
      td, th {
         padding: 5px;
         font-size: 13px;
      }
      .mainContent {
         width: 810px;
         margin-top: 30px;
      }
      .mainTitle {
         display: flex;
         border-bottom: 2px solid #FFF;
      }
      .mainTitle .title {
         width: 740px;
         padding-left: 10px;
      }
      .mainTitle .title h3 {
         font-size: 18px;
      }
      .mainTitle .subtitle {
         width: 70px;
         padding-top: 20px;
         text-align: right;
      }
      .mainTitle .subtitle a {
         font-size: 12px;
      }
      .table-tr {
         background-color: #F0F0F0;
      }
      tr>th {
         text-align: center;
      }
      .align-st {
         text-align: center;
         margin-left: 5px;
      }
      td>div>label {
         color: red;
      }
   </style>
</head>
<body>
   <div class="mainContent">
      <div class="mainTitle">
         <div class="title">
            <h3><b>전체글보기</b></h3>
         </div>
         <div class="subtitle">
            <a href="/movie/board/list?b_category=&b_article=전체"><b>더보기</b></a>
         </div>
      </div>

      <table class="table-none">
         <colgroup>
            <col width="15%">
            <col width="45%">
            <col width="15%">
            <col width="15%">
            <col width="15%">
         </colgroup>
         <tr class="table-tr">
            <th>게시판</th>
            <th>제   목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
         <c:forEach var="dto" items="${listMainAll}" end="19">
            <tr><td>
               <a href="board/list?b_category=${dto.b_category}&b_article=${dto.b_article}">${dto.b_article}</a>
               </td>
               <td>
                  <c:choose>
                     <c:when test="${dto.b_reNum == 0}">
                        <div>
                           <a href="board/show?b_num=${dto.b_num}">${dto.b_title}</a>
                           <label>[${dto.b_comCount}]</label>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <div style="margin-left:${dto.b_reNum*10}px;">
                           └ <a href="board/show?b_num=${dto.b_num}"> ${dto.b_title} </a>
                           <label>[${dto.b_comCount}]</label>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </td>
               <td><a href="/movie/myList?id=${dto.b_id}&page=1">${dto.b_nick}</a></td>
               <td class="align-st">${dto.b_date}</td>
               <td class="align-st">${dto.b_hit}</td>
            </tr>
         </c:forEach>
      </table>
   </div>
</body>
</html>