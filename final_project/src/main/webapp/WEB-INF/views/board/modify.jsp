<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.fileBox{
	border: 1px solid #eee;
	width:470px;
	border-radius : 20px;
	min-height: 50px;
	padding: 10px 0 10px 10px;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
$(function() {
	var ta = $("#b_content").val()
	ta = ta.replace(/<br\/>/gi, '\n');
	$("#b_content").val(ta);
})
function write_save() {
	if($("#b_title").val() == "") {
		alert("제목을 입력하세요!");
	} else if($("#b_content").val() == "") { 
		alert("내용을 입력하세요!");
	} else {
		// 줄 개행 인식
		var str = $("#b_content").val();
		
		str = str.replace(/(?:\r\n|\r|\n)/g , '<br/>');
		$("#b_content").val(str);
		$("#fo").submit();
	}
}

// 업로드 추가 삭제
$(function() {
	var fileIndex = 1;
	$("#fileAdd_btn").on("click" , function() {
		$(".fileBox").append("<div id='fileDiv_"+(fileIndex++)+"'><input type='file' name='file_"+(fileIndex++)+"' style='display:inline-block'>"+"<button type='button'id='fileDel_btn_"+(fileIndex++)+"' onclick='newFileDel("+fileIndex+")'>"+"삭제"+"</button></div>");
	});
});
function newFileDel(index) {
	$("#fileDiv_"+(index-3)).remove();
}
var fileNoArr = new Array();
var fileNameArr = new Array();

function exFileDel(value , name) {
	fileNoArr.push(value);
	fileNameArr.push(name);
	$("#fileNoDel").val(fileNoArr);
	$("#filenameDel").val(fileNameArr);
}
</script>
</head>
<body>

	<div class="container" style="width:500px;">
		<div align="center">
			<h1> 수정 페이지 </h1>
			<div align="left">
				<form action="modify_save" id="fo" method="post" enctype="multipart/form-data">
					<!-- 게시판 선택 -->
					<div>
						<h5>게시판</h5>
						<select name="b_article">
							<c:forEach var="dto" items="${articleAll}">
								<c:choose>
									<c:when test="${dto.b_article == boardList.b_article}">
										<option value="${dto.b_article}" selected="selected">${dto.b_article}</option>
									</c:when>
									<c:otherwise>
										<option value="${dto.b_article}">${dto.b_article}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<!-- 제목 입력 -->
					<div>
						<h5>글 제목</h5>
						<input type="text" name="b_title" id="b_title" value="${boardList.b_title}"
							class="form-control">
					</div>
					<!-- 내용 입력 -->
					<div>
						<h5>글 내용</h5>
						<textarea rows="15" cols="50" name="b_content" id="b_content" class="form-control"
						style="resize:none;">${boardList.b_content}</textarea>
					</div>
					
					<!-- 첨부파일 & 이미지 -->
					<div style="margin-top:10px;">
						<button id="fileAdd_btn" type="button">파일 추가</button>							
						<!-- 파일 목록 -->
						<div class="fileBox">
							<input type="hidden" id="fileNoDel" name="fileNoDel[]">
							<input type="hidden" id="filenameDel" name="fileNameDel[]">
							<c:forEach var="file" items="${fileList}" varStatus="var">
								<div>
									<input type="hidden" id="f_no" name="f_no_${var.index}" value="${file.F_NO}">
									<input type="hidden" id="f_name" name="f_name" value="f_no_${var.index}">
									<a href="#" id="fileName" onclick="return false;">${file.F_ORINAME}</a>(${file.F_SIZE}kb)
									<button id="fileDel" onclick="exFileDel('${file.F_NO}','f_no_${var.index}')" type="button">삭제</button><br>
								</div>
							</c:forEach>
						</div>
					</div>
					
					<!-- 버튼 -->
					<div align="right" style="padding-top: 10px;">
						<button type="button" class="btn btn-success" onclick="write_save()">수정</button>
					</div>
					<input type="hidden" name="b_num" value="${param.c_boardNum}">
				</form>
			</div>
		</div>
	</div>
<div>
	<input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>
	<button type='button' style='float:right;' id='fileDel_btn'>삭제</button>
</div>
</body>
</html>