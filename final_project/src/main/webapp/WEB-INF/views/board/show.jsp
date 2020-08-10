<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css?after">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.contentBox{
   border: 1px solid #eee;
   width:750px;
   border-radius : 20px;
   margin : 10px 29px 0 23px;
}
.btnBotBox {
   width:735px;
   height: 50px;
   margin: 10px 0 29px 28px;
}
.btnTopBox {
   width:735px;
   height: 34px;
   margin: 0 0 0 28px;
}
.lb_title {
   font-size: 35px;
}
.lb2 {
   font-size: 13px;
   color: #676767;
}
.lb3 {
   font-size: 12px;
   color: #979797;
}

.hr0 {
   width:700px;
   margin: 20px 0;
}
.hr1 {
   width:700px;
   margin: 0px 0;
}
.hr2 {
   width:650px;
   margin : 0 0 0 50px;
}
.hr3 {
   width:650px;
   margin : 0;
}
.hr4 {
   width: 700px;
   margin: 0 0 0 -50px;
}
.board-content {
   overflow-y : hidden;
   position: relative;
   min-height: 150px;
   font-size: 15px;
   line-height: 1.6;
}
.c-nick {
   font-size: 16px;
   font-weight: 900;
   color: black;
}
.c-content {
   font-size: 14px;
   font-weight: 400p;
}
.commentWriter {
   width : 700px;
   margin: 12px 0 ;
   padding: 8px 10px 10px 10px;
   border-radius: 6px;
   box-sizing: border-box;
   border: 2px solid rgba(0,0,0,0.1);
}
.commentReplyWriter {
   margin: 12px 0 ;
   padding: 8px 10px 10px 10px;
   border-radius: 6px;
   box-sizing: border-box;
   border: 2px solid rgba(0,0,0,0.1);
}
.hide-Comment {
   width : 700px;
   padding: 0 0 0 50px; 
}
.commentArea {
   display : flex;
   padding: 12px 23px 10px 0px;
   width: 700px;
}
.commentArea-reply {
   display : flex;
   padding: 12px 23px 10px 0px;
   padding-left: 50px;
   width: 700px;
}
.mylb{
   color:blue;
   margin-left: 10px;
}
.btn-dmsDefault {
   color:black;
   background-color: B7B7B7;
   border-color: white;
}
.dms-textarea {
   display: block;
   width: 100%;
   padding: 6px 12px;
   font-size: 14px;
   line-height: 1.42857143;
   color: black;
   background-color: white;
   background-image: none;
   border-radius: 4px;
}
textarea:focus {
   border-color: white;
   box-shadow: 0px;
   outline: 0 none;
}
.deleteBtn {
   margin-left: 10px;
   margin-bottom: 3px;
   cursor: pointer;
   width:10px;
}
.delComment{
   padding: 12px 23px 10px 0px;
   width: 700px;
}
.profilePic {
   margin: 10px 12px 10px 10px;
}
.CLArea {
margin-top: 20px; 
display: flex;
}
.commentCount {
width: 50%; 
padding-top: 11px;
}
.likeCount {
width: 50%;
}


</style>

<script type="text/javascript">
   // 페이지 접근 시
   $(function() {
      getCommentList();
      addBtn();
      chkLike();
      $("#likeBox").hide();
      $("#unlikeBox").hide();
   })
   
   // 댓글 입력에 따른 작성버튼 변화
   $(function() {
      $("#comment_content").on('keydown keyon' , function() {
         if($("#comment_content").val() == "") {
            $("#comment_btn_div").html(
               '<button type="button" onclick="commentWriter()" class="btn btn-dmsDefault" style="font-weight: 900">작성</button>'      
            );
         } else {
            $("#comment_btn_div").html(
               '<button type="button" onclick="commentWriter()" class="btn btn-info" style="font-weight: 900">작성</button>'
            );
         }
      });
   });
   // 댓글 내용 작성여부 + 댓글 작성
   function commentWriter() {
      var papering = $("#papering").val();
      if($("#comment_content").val() == "") { // 댓글내용 없을 때
         alert("내용을 입력해주세요!!");
      } else if(papering != 0) {
         alert("연속적인 게시글 등록 시도로 인해\n신규 게시글이 등록되지 않았습니다.\n잠시 후 다시 등록 해주시기 바랍니다.");
      } else { // 댓글 작성
         var formData = $("#fo").serializeArray();
         $("#papering").attr("value","1");
         
         $.ajax({
            url : "comment_save",
            type : "POST",
            data : formData,
            dataType : "text",
            success : function(arg) {
               getCommentList();
               $("#comment_content").val("");
               $("#papering").attr("value","0");
            },
            error : function() {
               alert("실패!");
            }
         });
      }
   }
   
   // 로그인 안하면 댓글 못담
   $(function() {
      var session = "${sessionScope.m_nick}";
      if(session == "") {
         $("#commentWriter").css({
            "display":"none"
         });
      }
   })
   
   // 댓글 불러오기 + 댓글 수 
   function getCommentList() {
      
      // 댓글 수 
      $.ajax({
         url:"comment_count",
         type:"GET",
         data:$("#fo").serializeArray(),
         dataType : "text",
         success : function(arg) {
            $("#c_count").text(arg);
         },
         error : function() {
            alert("실패!!");
         }
      });   
      
      // 댓글 불러오기
      $.ajax({
         url:"comment_list",
         type:"GET",
         data:$("#fo").serializeArray(),
         success : function(list) {
            let html = "";
            if(list.length > 0) {
               $("#commentBox").css({
                  "display":"block"
               })
               for(var i=0; i<list.length; i++) {
                  
                  
                  // 덧글은 들여쓰기 + 자신글은 배경색 넣기
                  if(list[i].C_RENUM == 0) {
                     if("${sessionScope.m_id}" != list[i].C_ID) {
                        html += '<div class="commentArea">';
                     } else {
                        html += '<div class="commentArea" style="background:#F5F6F8;">';
                     }
                  } else {
                     if(i>0) {
                        var z = i-1;
                        if(list[i].C_RENUM == 1 && list[i].C_GROUP != list[z].C_GROUP) {
                           html += '<div class="delComment">';
                           html += '<label>삭제 된 댓글입니다.</label>';
                           html += '</div>';
                           html += '<hr class="hr2">';
                        }
                     } else {
                        if(list[i].C_RENUM == 1) {
                           html += '<div class="delComment">';
                           html += '<label>삭제 된 댓글입니다.</label>';
                           html += '</div>';
                           html += '<hr class="hr2">';
                        }
                     }
                     
                     if("${sessionScope.m_id}" != list[i].C_ID) {
                        html += '<div class="commentArea-reply">';
                     } else {
                        html += '<div class="commentArea-reply" style="background:#F5F6F8;">';
                     }
                     
                  }
                  html += '<div class="profilePic">';
                  
                  // 프로필 사진 넣기
                  html += '<a href="/movie/myList?id='+list[i].C_ID+'&page=1">';
                  if(list[i].M_PICTURE != null && list[i].M_PICTURE != "" && typeof list[i].M_PICTURE != "undefined") {
                     html += '<img src="/img/memberImage/' + list[i].M_PICTURE + '"';
                     html += 'width="40" height="40" style="border-radius: 100%">';
                  } else {
                     html += '<img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"';
                     html += 'width="40" height="40">';
                  }
                  html += '</a>'
                  
                  html += '</div>';
                  
                  html += '<div>';
                  html += '<div style="display:inline-block">';
                  // 게시자와 댓글작성자가 같으면 작성자 표시
                  if($("#b_id").val() == list[i].C_ID) {
                     html += '<a href="/movie/myList?id='+list[i].C_ID+'&page=1"><span class="c-nick">' + list[i].C_NICK + '</span></a><span class="mylb">작성자</span>';
                  } else {
                     html += '<a href="/movie/myList?id='+list[i].C_ID+'&page=1"><span class="c-nick">' + list[i].C_NICK + '</span></a>';
                  }
                  html += '<div style="float:right">'
                  // 댓글작성자와 사용자가 같으면 삭제 버튼 추가
                  if(list[i].C_ID == "${sessionScope.m_id}") {
                     html += '<img src="/img/deleteBtn.png" class="deleteBtn" onclick="commentDelete('+list[i].C_COMNUM+',${param.b_num})">'
                  }
                  html += '</div>'
                  html += '</div>';
                  html += '<div>';
                  html += '<span class="c-content">' + list[i].C_CONTENT + '</span>';
                  html += '</div>';
                  html += '<div>';
                  html += '<span class="lb3" style="margin-right:10px;">' + list[i].C_DATE + '</span>';
                  if("${sessionScope.m_nick}" == "") {
                     html += '<span class="lb3" style="cursor: pointer; display:none" onclick="comReply(' + list[i].C_COMNUM + ', \''+ list[i].C_NICK +'\')">답글 쓰기</span>';
                  } else {
//                      console.log("i : " + i);
                     if(i == 0){
                        var j = 0;
                        html += '<span class="lb3" style="cursor: pointer;" onclick="comReply(' + list[i].C_COMNUM + ', \''+ list[i].C_NICK +'\','+list[j].C_RENUM+','+list[i].C_GROUP+')">답글 쓰기</span>';
                     }else if(i != list.length-1) {
                        var j = i+1;
                        html += '<span class="lb3" style="cursor: pointer;" onclick="comReply(' + list[i].C_COMNUM + ', \''+ list[i].C_NICK +'\','+list[j].C_RENUM+','+list[i].C_GROUP+')">답글 쓰기</span>';
                     } else {
                        var j = i;
                        html += '<span class="lb3" style="cursor: pointer;" onclick="comReply(' + list[i].C_COMNUM + ', \''+ list[i].C_NICK +'\','+list[j].C_RENUM+','+list[i].C_GROUP+')">답글 쓰기</span>';
                     }
                  }
                  html += '</div>';
                  html += '</div>';
                  html += '</div>';
                  html += '</div>';
                  if(i != list.length-1) {
                     if(list[i].C_RENUM == 0) {
                        html += '<hr class="hr1">'
                     } else {
                        html += '<hr class="hr2">';
                     }
                  }
                  // 답글 창 div
                  html += '<div id="div'+list[i].C_COMNUM+'">';
                  html += '</div>';
                  
               }
               $("#commentList").html(html);
            } else {
               $("#commentBox").css({
                  "display":"none"
               })
            }
         },
         error : function() {
            alert("실패!");
         }
      });
   }
   
   // 본인 게시글이면 수정,삭제 버튼 생성
   function addBtn() {
      var sessionId = "${sessionScope.m_id}";
      if(sessionId == $("#b_id").val()) {
         $("#btnMD01").css({
            "display":"inline-block"
         });
         $("#btnMD02").css({
            "display":"inline-block"
         });
         $("#btnMD03").css({
            "display":"inline-block"
         });
         $("#btnMD04").css({
            "display":"inline-block"
         });
      } else {
         $("#btnMD01").css({
            "display":"none"
         });
         $("#btnMD02").css({
            "display":"none"
         });
         $("#btnMD03").css({
            "display":"none"
         });
         $("#btnMD04").css({
            "display":"none"
         });
      }
   }
   // 게시판 버튼들
   $(function() {
      var num = $("#c_boardNum").val();
      // 수정 버튼 클릭
      $("#btnMD01,#btnMD03").click(function() {
         location.href="modify?c_boardNum="+num;
      });
      
      // 삭제 버튼 클릭
      $("#btnMD02,#btnMD04").click(function() {
         if(confirm("정말로 삭제하시겠습니까?")) {
            location.href="delete?b_num="+num +"&b_category=${boardInfo.b_category}&b_article=${boardInfo.b_article}";
         }
      });
      
      // 목록 버튼 클릭 
      $("#btnList01,#btnList02").click(function() {
         location.href="list?b_category=${boardInfo.b_category}&b_article=${boardInfo.b_article}";
      });
      
   })
   
   // 대댓글 창 열기
   function comReply(num , nick, reNum, group) {
      
      $("#openReply").remove();
      console.log("group : " + group);
      console.log("reNum : " + reNum);
      var html =
         '<div class="hide-Comment" id="openReply">' +
         '   <div class="commentReplyWriter">' + 
         '   <form action="comment_save" id="fo">' +
         '      <input type="hidden" value="${param.b_num}" name="c_boardNum">' +
         '      <input type="hidden" value="'+group+'" name="c_group">' +
         '      <div>' +
         '         <label class="c-nick" style="padding: 6px 12px;">${sessionScope.m_nick}</label>' + 
         '         <textarea rows="1" id="Recomment_content"'+
         '         name="c_content" class="dms-textarea" style="overflow:hidden;' + 
         '         overflow-wrap:break-word; height:60px; border: 0px; resize:none;"' + 
         '         placeholder="'+nick+'님께 답글을 남겨보세요~"></textarea>' + 
         '      </div>' +
         '      <div id="comment_btn_div" align="right">' +
         '         <button type="button" onclick="commentCancel('+num+')" class="btn btn-dmsDefault" style="font-weight: 900">취소</button>' + 
         '         <button type="button" onclick="RecommentWriter()" class="btn btn-dmsDefault" style="font-weight: 900; margin-left:10px;">작성</button>' + 
         '      </div>' + 
         '   </form>' + 
         '</div>';
         if(reNum != 0 ) {
            html += '<hr class="hr3">';
         } else {
            html += '<hr class="hr4">';
         }
         
      $("#div" + num).html(html);
   }
   
   // 대댓글창 없애는 버튼
   function commentCancel(num) {
      console.log("div"+num);
      $("#div"+num).html("");
   }
   
   // 대댓글 남기기
   function RecommentWriter() {
      var papering = $("#papering").val();
      
      if($("#Recomment_content").val() == "") { // 댓글내용 없을 때
         alert("내용을 입력해주세요!!");      
      } else if(papering != 0) {
         alert("연속적인 게시글 등록 시도로 인해\n신규 게시글이 등록되지 않았습니다.\n잠시 후 다시 등록 해주시기 바랍니다.");   
      } else { // 댓글 작성
         var formData = $("#fo").serializeArray();
         console.log(formData);
         $("#papering").attr("value","1");
         
         $.ajax({
            url : "Recomment_save",
            type : "POST",
            data : formData,
            dataType : "text",
            success : function(arg) {
               getCommentList();
               $("#comment_content").val("");
               $("#openReply").remove();
               $("#papering").attr("value","0");
            },
            error : function() {
               alert("실패!");
            }
         });
      }
   }
   // 댓글 삭제 
   function commentDelete(comNum , boardNum) {
      var Data = {c_comNum : comNum , c_boardNum : boardNum};
      console.log("boardNum : " + boardNum);
      if(confirm("삭제 하시겠습니까?")) {
         $.ajax({
            url : "comment_delete",
            data : Data,
            type : "DELETE",
            success : function() {
               getCommentList();
            },
            error : function() {
               getCommentList();
            }
         });      
      }
   }
   
   // 파일 다운로드
   function fileDown(fileNo , userId) {
      console.log("들어옴")
      $("#f_no").val(fileNo);
      $("#f_id").val(userId);
      $("#fileForm").submit();

   }
   
   // 추천 버튼
   function likeBtn() {
      var userId = "${sessionScope.m_id}";
      var boardNum = "${param.b_num}";
      console.log("asd : " +  userId)
      var divLike = $("#divLike").val();

      var Data = {l_id : userId , l_boardNum : boardNum};
      if(userId != "") {
         if(divLike == "") {
            // 추천 추가
            $.ajax({
               url : "addLike",
               type : "POST",
               data : Data,
               dataType : "text",
               success : function(arg) {
                  $("#liekCount").text(arg);
                  $("#divLike").val("like");
                  $("#likeImage").attr("src" , "/img/afterLike.png")
               },
               error : function() {
                  alert("추천 실패!!!");
               }
            });
            
            
            var data = {b_num : "${param.b_num}"}
            
            $.ajax({
               url : "likeMemberList",
               type : "POST",
               data : data,
               success : function(list) {
                  var html = '';
                     for(var i=0; i<list.length; i++) {
                        if(list[i].L_DIVLIKE == 'L') {
                           html += '<div style=" display: inline-block; margin: 0 40px 20px 0;"> ' + 
                                 '   <div style="display: flex;">' + 
                                 '      <div>' + 
                                 '         <a href="/movie/myList?id='+list[i].L_ID+'&page=1">';
                                          if(list[i].M_PICTURE != null) {
                           html +=   '            <img src="/img/memberImage/'+ list[i].M_PICTURE +'" width="32" height="32" style="border-radius: 100%">';
                                          } else {
                           html +=   '            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" width="32" height="32" style="border-radius:100%">';            
                                          }
                           html +=   '         </a>' + 
                                 '      </div>' + 
                                 '      <div>' + 
                                 '         <div style="height:15px; margin-bottom:2px;">' + 
                                 '            <a href="/movie/myList?id='+list[i].L_ID+'&page=1"><b style="color: black; ">'+ list[i].M_NICK +'</b></a>' +
                                 '            <br style="margin: 0px;">' + 
                                 '         </div>' +
                                 '         <div style="height:15px;">' + 
                                 '            <label class="lb2">'+ list[i].M_RANK +'</label>' + 
                                 '         </div>' +
                                 '      </div>' + 
                                 '   </div>' +
                                 '</div>';
                        }
                     }
                  $("#likeList").html(html);
                  
               }, error : function() {
                  alert("추천 리스트 실패!")
               }
            });
            
            
         } else if (divLike == "like") {
            // 추천 취소
            $.ajax({
               url : "removeLike",
               type : "DELETE",
               data : Data,
               dataType : "text",
               success : function(arg) {
                  $("#liekCount").text(arg);
                  $("#divLike").val("");
                  $("#likeImage").attr("src" , "/img/beforeLike.png")
               },
               error : function() {
                  alert("추천 취소 실패!!!");
               }
            });
            
            
            var data = {b_num : "${param.b_num}"}
            
            $.ajax({
               url : "likeMemberList",
               type : "POST",
               data : data,
               success : function(list) {
                  var html = '';
                     for(var i=0; i<list.length; i++) {
                        if(list[i].L_DIVLIKE == 'L') {
                           html += '<div style=" display: inline-block; margin: 0 40px 20px 0;"> ' + 
                                 '   <div style="display: flex;">' + 
                                 '      <div style="margin-right:10px;>' + 
                                 '         <a href="/movie/myList?id='+list[i].L_ID+'&page=1">';
                                          if(list[i].M_PICTURE != null) {
                           html +=   '            <img src="/img/memberImage/'+ list[i].M_PICTURE +'" width="32" height="32" style="border-radius: 100%">';
                                          } else {
                           html +=   '            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" width="32" height="32" style="border-radius:100%">';            
                                          }
                           html +=   '         </a>' + 
                                 '      </div>' + 
                                 '      <div>' + 
                                 '         <div style="height:15px; margin-bottom:2px;">' + 
                                 '            <a href="/movie/myList?id='+list[i].L_ID+'&page=1"><b style="color: black; ">'+ list[i].M_NICK +'</b></a>' +
                                 '            <br style="margin: 0px;">' + 
                                 '         </div>' +
                                 '         <div style="height:15px;">' + 
                                 '            <label class="lb2">'+ list[i].M_RANK +'</label>' + 
                                 '         </div>' +
                                 '      </div>' + 
                                 '   </div>' +
                                 '</div>';
                        }
                     }
                  $("#likeList").html(html);
                  
               }, error : function() {
                  alert("추천 리스트 실패!")
               }
            });
            
            
         } else {
            alert("추천과 비추천은 하나만 선택할 수 있습니다.");
         }
      } else {
         alert("로그인 후 이용해 주세요!!!");
      }
   }
   // 비추천 버튼
   function unlikeBtn() {
      var userId = "${sessionScope.m_id}";
      var boardNum = "${param.b_num}";
      
      var divLike = $("#divLike").val();

      var Data = {l_id : userId , l_boardNum : boardNum};
      if(userId != "") {
         if(divLike == "") {
            // 비추천 추가
            $.ajax({
               url : "addUnlike",
               type : "POST",
               data : Data,
               dataType : "text",
               success : function(arg) {
                  $("#unlikeCount").text(arg);
                  $("#divLike").val("unlike");
                  $("#unlikeImage").attr("src" , "/img/afterDislike.png")
               },
               error : function() {
                  alert("비추천 실패!!!");
               }
            });
            
            
            var data = {b_num : "${param.b_num}"}
            
            $.ajax({
               url : "likeMemberList",
               type : "POST",
               data : data,
               success : function(list) {
                  var html = '';
                     for(var i=0; i<list.length; i++) {
                        if(list[i].L_DIVLIKE == 'U') {
                           html += '<div style=" display: inline-block; margin: 0 40px 20px 0;"> ' + 
                                 '   <div style="display: flex;">' + 
                                 '      <div style="margin-right:10px;>' + 
                                 '         <a href="/movie/myList?id='+list[i].L_ID+'&page=1">';
                                          if(list[i].M_PICTURE != null) {
                           html +=   '            <img src="/img/memberImage/'+ list[i].M_PICTURE +'" width="32" height="32" style="border-radius: 100%">';
                                          } else {
                           html +=   '            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" width="32" height="32" style="border-radius:100%">';            
                                          }
                           html +=   '         </a>' + 
                                 '      </div>' + 
                                 '      <div>' + 
                                 '         <div style="height:15px; margin-bottom:2px;">' + 
                                 '            <a href="/movie/myList?id='+list[i].L_ID+'&page=1"><b style="color: black; ">'+ list[i].M_NICK +'</b></a>' +
                                 '            <br style="margin: 0px;">' + 
                                 '         </div>' +
                                 '         <div style="height:15px;">' + 
                                 '            <label class="lb2">'+ list[i].M_RANK +'</label>' + 
                                 '         </div>' +
                                 '      </div>' + 
                                 '   </div>' +
                                 '</div>';
                        }
                     }
                  $("#unlikeList").html(html);
                  
               }, error : function() {
                  alert("비추천 리스트 실패!")
               }
            });
            
            
         } else if(divLike == "unlike") {
            // 비추천 취소
            $.ajax({
               url : "removeUnlike",
               type : "DELETE",
               data : Data,
               dataType : "text",
               success : function(arg) {
                  $("#unlikeCount").text(arg);
                  $("#divLike").val("");
                  $("#unlikeImage").attr("src" , "/img/beforeDislike.png")
               },
               error : function() {
                  alert("비추천 취소 실패!!!");
               }
            });
            
            
            
            var data = {b_num : "${param.b_num}"}
            
            $.ajax({
               url : "likeMemberList",
               type : "POST",
               data : data,
               success : function(list) {
                  var html = '';
                     for(var i=0; i<list.length; i++) {
                        if(list[i].L_DIVLIKE == 'U') {
                           html += '<div style=" display: inline-block; margin: 0 40px 20px 0;"> ' + 
                                 '   <div style="display: flex;">' + 
                                 '      <div style="margin-right:10px;>' + 
                                 '         <a href="/movie/myList?id='+list[i].L_ID+'&page=1">';
                                          if(list[i].M_PICTURE != null) {
                           html +=   '            <img src="/img/memberImage/'+ list[i].M_PICTURE +'" width="32" height="32" style="border-radius: 100%">';
                                          } else {
                           html +=   '            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" width="32" height="32" style="border-radius:100%">';            
                                          }
                           html +=   '         </a>' + 
                                 '      </div>' + 
                                 '      <div>' + 
                                 '         <div style="height:15px; margin-bottom:2px;">' + 
                                 '            <a href="/movie/myList?id='+list[i].L_ID+'&page=1"><b style="color: black; ">'+ list[i].M_NICK +'</b></a>' +
                                 '            <br style="margin: 0px;">' + 
                                 '         </div>' +
                                 '         <div style="height:15px;">' + 
                                 '            <label class="lb2">'+ list[i].M_RANK +'</label>' + 
                                 '         </div>' +
                                 '      </div>' + 
                                 '   </div>' +
                                 '</div>';
                        }
                     }
                  $("#unlikeList").html(html);
                  
               }, error : function() {
                  alert("비추천 리스트 실패!")
               }
            });
            
            
         } else {
            alert("추천과 비추천은 하나만 선택할 수 있습니다.");
         }
      } else {
         alert("로그인 후 이용해주세요!!!");
      }
   }
   
   // 접속 시 추천 비추천 누른지 확인
   function chkLike() {
      
      var Data = {l_id : "${sessionScope.m_id}"
               ,l_boardNum : "${param.b_num}"};
      
      
      $.ajax({
         url : "chkLike",
         type : "POST",
         data : Data,
         dataType : "text",
         success : function(chkLike) {
            console.log(chkLike)
            if(chkLike == 'L') {
               var html = '';
               $("#divLike").val("like");
               html += '<a style="cursor: pointer;" onclick="likeBtn()">' + 
                     '   <img src="/img/afterLike.png" style="width:30px;" id="likeImage">' + 
                     '</a>' + 
                     '<span style="color:black; cursor: pointer;" onclick="likeList()">추천</span>' + 
                     '<strong style="color:black;" id="liekCount">${likeCount}</strong>' +
                     '<a style="cursor: pointer;" onclick="unlikeBtn()">' + 
                     '   <img src="/img/beforeDislike.png" style="width:30px;" id="unlikeImage">' + 
                     '</a>' + 
                     '<span style="color:black; cursor: pointer;" onclick="unlikeList()">비추천</span>' + 
                     '<strong style="color:black;" id="unlikeCount">${unlikeCount}</strong>' ;
               $(".likeCount").html(html);
            } else if(chkLike == 'U') {
               $("#divLike").val("unlike");
               var html = '';
               html += '<a style="cursor: pointer;" onclick="likeBtn()">' + 
                     '   <img src="/img/beforeLike.png" style="width:30px;" id="likeImage">' + 
                     '</a>' + 
                     '<span style="color:black; cursor: pointer;" onclick="likeList()">추천</span>' + 
                     '<strong style="color:black;" id="liekCount">${likeCount}</strong>' +
                     '<a style="cursor: pointer;" onclick="unlikeBtn()">' + 
                     '   <img src="/img/afterDislike.png" style="width:30px;" id="unlikeImage">' + 
                     '</a>' + 
                     '<span style="color:black; cursor: pointer;" onclick="unlikeList()">비추천</span>' + 
                     '<strong style="color:black;" id="unlikeCount">${unlikeCount}</strong>';
               $(".likeCount").html(html);
            } else {
               var html = '';
               html += '<a style="cursor: pointer;" onclick="likeBtn()">' + 
                     '   <img src="/img/beforeLike.png" style="width:30px;" id="likeImage">' + 
                     '</a>' + 
                     '<span style="color:black; cursor: pointer;" onclick="likeList()">추천</span>' + 
                     '<strong style="color:black;" id="liekCount">${likeCount}</strong>' +
                     '<a style="cursor: pointer;" onclick="unlikeBtn()">' + 
                     '   <img src="/img/beforeDislike.png" style="width:30px;" id="unlikeImage">' + 
                     '</a>' + 
                     '<span style="color:black; cursor: pointer;" onclick="unlikeList()">비추천</span>' + 
                     '<strong style="color:black;" id="unlikeCount">${unlikeCount}</strong>' ; 
               $(".likeCount").html(html);
            }
         },
         error : function() {
            alert("추천 구분 실패!!");
         }
      });      
   }
   
   // 댓글 리스트
   function commentArea() {
      $("#commentAllArea").show();
      $("#likeBox").hide();
      $("#unlikeBox").hide();
   }
   
   // 추천 리스트
   function likeList() {
      $("#commentAllArea").hide();
      $("#unlikeBox").hide();
      $("#likeBox").show();
      
      
      var data = {b_num : "${param.b_num}"}
      
      $.ajax({
         url : "likeMemberList",
         type : "POST",
         data : data,
         success : function(list) {
            var html = '';
               for(var i=0; i<list.length; i++) {
                  if(list[i].L_DIVLIKE == 'L') {
                     html += '<div style=" display: inline-block; margin: 0 40px 20px 0;"> ' + 
                           '   <div style="display: flex;">' + 
                           '      <div style="margin-right:10px;>' + 
                           '         <a href="/movie/myList?id='+list[i].L_ID+'&page=1">';
                                    if(list[i].M_PICTURE != null) {
                     html +=   '            <img src="/img/memberImage/'+ list[i].M_PICTURE +'" width="32" height="32" style="border-radius: 100%">';
                                    } else {
                     html +=   '            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" width="32" height="32" style="border-radius:100%">';            
                                    }
                     html +=   '         </a>' + 
                           '      </div>' + 
                           '      <div>' + 
                           '         <div style="height:15px; margin-bottom:2px;">' + 
                           '            <a href="/movie/myList?id='+list[i].L_ID+'&page=1"><b style="color: black; ">'+ list[i].M_NICK +'</b></a>' +
                           '            <br style="margin: 0px;">' + 
                           '         </div>' +
                           '         <div style="height:15px;">' + 
                           '            <label class="lb2">'+ list[i].M_RANK +'</label>' + 
                           '         </div>' +
                           '      </div>' + 
                           '   </div>' +
                           '</div>';
                  }
               }
            $("#likeList").html(html);
            
         }, error : function() {
            alert("추천 리스트 실패!")
         }
      });
   }
            
   // 비추천 리스트
   function unlikeList() {
      $("#commentAllArea").hide();
      $("#likeBox").hide();
      $("#unlikeBox").show();
      
      var data = {b_num : "${param.b_num}"}
      
      $.ajax({
         url : "likeMemberList",
         type : "POST",
         data : data,
         success : function(list) {
            var html = '';
               for(var i=0; i<list.length; i++) {
                  if(list[i].L_DIVLIKE == 'U') {
                     html += '<div style=" display: inline-block; margin: 0 40px 20px 0;"> ' + 
                           '   <div style="display: flex;">' + 
                           '      <div style="margin-right:10px;">' + 
                           '         <a href="/movie/myList?id='+list[i].L_ID+'&page=1">';
                                    if(list[i].M_PICTURE != null) {
                     html +=   '            <img src="/img/memberImage/'+ list[i].M_PICTURE +'" width="32" height="32" style="border-radius: 100%">';
                                    } else {
                     html +=   '            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png" width="32" height="32" style="border-radius:100%">';            
                                    }
                     html +=   '         </a>' + 
                           '      </div>' + 
                           '      <div>' + 
                           '         <div style="height:15px; margin-bottom:2px;">' + 
                           '            <a href="/movie/myList?id='+list[i].L_ID+'&page=1"><b style="color: black; ">'+ list[i].M_NICK +'</b></a>' +
                           '            <br style="margin: 0px;">' + 
                           '         </div>' +
                           '         <div style="height:15px;">' + 
                           '            <label class="lb2">'+ list[i].M_RANK +'</label>' + 
                           '         </div>' +
                           '      </div>' + 
                           '   </div>' +
                           '</div>';
                  }
               }
            $("#unlikeList").html(html);
            
         }, error : function() {
            alert("비추천 리스트 실패!")
         }
      });
   }
            
         
   


   
</script>
</head>
<body>
   <input type="hidden" id="papering" value="0">
   <input type="hidden" id="divLike">
   
   <div class="container">
   <!-- header -->
   <c:import url="../default/header.jsp" />
      <div style="display: flex;">
         <div>
            <c:import url="/sidebar" />
         </div>
         <div>
   
   <!-- body -->
   <div>
      <div class="btnTopBox">
         <div style="float: left;">
            <button type="button" id="btnMD01"class="btn btn-dmsDefault" style="font-weight: 900;">수정</button>
            <button type="button" id="btnMD02"class="btn btn-dmsDefault" style="font-weight: 900;">삭제</button>
         </div>
         <div style="float: right;">
            <button type="button" id="btnList01"class="btn btn-dmsDefault" style="font-weight: 900">목록</button>
         </div>
      </div>
      <!-- 둥군 테두리 만들 공간 -->
      <div class="contentBox"> 
         <div align="left" style="margin: 0 30px;">
            <!-- 게시판 이름 -->
            <div style="margin: 20px 0 5px 0px;">
               <a href="list?b_category=${boardInfo.b_category}&b_article=${boardInfo.b_article}">
                  ${boardInfo.b_article}
               </a>
            </div>
            <!-- 게시글 제목 -->
            <div style="margin-top:0px;">
               <label class="lb_title">${boardInfo.b_title}</label>            
            </div>
            
            <input type="hidden" id="b_id" name="b_id" value="${boardInfo.b_id}">
            <div style="height: 40px; display:flex;">
               <!-- 프로필 사진 -->
               <div style="margin-right: 10px;">
                  <a href="/movie/myList?id=${memberInfo.m_id }&page=1">
                     <c:choose>
                        <c:when test="${memberInfo.m_picture != null}">
                        <img
                           src="/img/memberImage/${memberInfo.m_picture}"
                           width="36" height="36" style="border-radius: 100%">
                        </c:when>
                        <c:otherwise>
                        <img
                           src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
                           width="36" height="36">
                        </c:otherwise>
                     </c:choose>
                  </a>      
               </div>
               <!-- 닉네임 + 등급  -->
               <div>
                  <div style="height:15px; margin-bottom:2px;">
                     <a href="/movie/myList?id=${memberInfo.m_id }&page=1"><b style="color: black; ">${boardInfo.b_nick}</b></a>
                     <label class="lb2">${memberInfo.m_rank}</label>
                  <br style="margin: 0px;">
                  </div>
                  <div style="height:15px;">
                     <label class="lb3">${boardInfo.getDate()}</label>
                     <label class="lb3">조회 ${boardInfo.b_hit}</label>
                  </div>
               </div>
            </div>
            
            <hr class="hr0">
            
            <!-- 글 내용 -->
            <div class="board-content">
               <div>
                  <p>
                     ${boardInfo.b_content}
                  </p>
               </div>
            </div>
            
            <c:if test="${fn:length(fileList) > 0 }">
               <span>파일 목록</span>
            </c:if>
            <div>
               <c:forEach var="file" items="${fileList}">
                  <a href="#" onclick="fileDown('${file.F_NO}','${boardInfo.b_id}'); return false;">${file.F_ORINAME}</a>(${file.F_SIZE}kb)<br>
               </c:forEach>
            </div>
            <!-- 파일 정보 -->
            <div>
               <form action="file_down" method="POST" id="fileForm">
                  <input type="hidden" id="f_no" name="f_no"/>
                  <input type="hidden" id="f_id" name="f_id"/>
               </form>
            </div>            
            <!-- 좋아요 + 댓글 수  -->
            <div class="CLArea">
               <div class="commentCount">
                  <a style="cursor: pointer;">
                     <img src="/img/commentImg.png" style="width:20px;">
                     <span style="color:black;" onclick="commentArea()">댓글</span>
                     <strong style="color:black;" id="c_count"></strong>
                  </a>
               </div>
               <div class="likeCount" align="right">
               </div>
            </div>
            
            <hr class="hr0">
            
            <!-- 댓글 창 -->
            <div id="bottomArea">
            <div id="commentAllArea">
            <div id="commentBox" style="display: none;">
               <div style="margin-bottom: 20px;">
                  <h3 style="font-weight:800">댓글</h3>
               </div>
               <div id="commentList">
                  
               </div>
            </div>
            <!-- 댓글 작성 -->
            <div class="commentWriter" id="commentWriter">
               <form action="comment_save" id="fo">
                  <!-- 닉네임 댓글작성 textarea -->
                  <div>
                     <!-- hidden으로 보낼 값 -->
                     <input type="hidden" value="${param.b_num}" name="c_boardNum" id="c_boardNum">
            
                     <!-- 닉네임 -->
                     <label class="c-nick" style="padding: 6px 12px;">닉네임</label>
                     
                     <!-- 댓글작성 -->
                     <textarea rows="1" id="comment_content" name="c_content" class="dms-textarea" style="overflow:hidden; 
                        overflow-wrap:break-word; height:60px; border: 0px; resize:none;"
                        placeholder="댓글을 입력하세요"></textarea>
                     <script>
                        // 자동 줄 개행 스크립트
                        $("textarea").on('keyup keydown' , function() {
                           $(this).height(17).height($(this).prop('scrollHeight')+12);
                        });
                     </script>
                     
                  </div>
                  <!-- 작성 버튼 -->
                  <div id="comment_btn_div" align="right">
                     <button type="button" onclick="commentWriter()" class="btn btn-dmsDefault" style="font-weight: 900">작성</button>
                  </div>
               </form>
            </div>
         </div>
         <div id="likeBox">
            <div style="margin-bottom: 20px;">
               <h3 style="font-weight:800">추천 목록</h3>
            </div>
            <div id="likeList">
            </div>
         </div>
         <div id="unlikeBox">
            <div style="margin-bottom: 20px;">
               <h3 style="font-weight:800">비추천 목록</h3>
            </div>
            <div id="unlikeList">
            </div>
         </div>
         
      </div>
      </div>
      </div>
      <div class="btnBotBox">
         <div style="float: left;">
            <c:if test="${sessionScope.m_id != null}">
               <button type="button" class="btn btn-success" style="font-weight: 900;">글 쓰기</button>
               <button type="button" class="btn btn-dmsDefault" style="font-weight: 900;"
                  onclick="location.href='reply?b_num=${param.b_num}'">답글</button>
            </c:if>
               
            <button type="button" id="btnMD03" class="btn btn-dmsDefault" style="font-weight: 900;">수정</button>
            <button type="button" id="btnMD04" class="btn btn-dmsDefault" style="font-weight: 900;">삭제</button>
         </div>
         <div style="float: right;">
            <button type="button" id="btnList02" class="btn btn-dmsDefault" style="font-weight: 900" onclick="gkgk()">목록</button>
         </div>
      </div>
   </div>
</div>
</div>
<div style="margin-top: 20px;">
			<c:import url="../default/footer.jsp" />
		</div>

</div>

</body>
</html>