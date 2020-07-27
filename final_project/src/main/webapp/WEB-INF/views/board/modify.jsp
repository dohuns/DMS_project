<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
a-oriName {
	color:black;
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
		
		$(".fileBox").append(
				'<div class="form-group" id="fileDiv_'+(fileIndex)+'">' +
				'<input type="file" id="fileInput_'+fileIndex+'" data-class-button="btn btn-default" data-class-input="form-control" name="file_'+(fileIndex)+'"' +
				'data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position:absolute; clip:rect(0px 0px 0px 0px);" onchange="inputName('+fileIndex+')">' + 
				'<div class="bootstrap-filestyle input-group">' +
				'<input type="text" id="userfile_'+(fileIndex)+'" class="form-control" name="userfile" disabled="">' + 
				'<span class="group-span-filestyle input-group-btn" tabindex="0">' + 
				'<label for="fileInput_'+fileIndex+'" class="btn btn-default" style="padding: 0 0 0 0; width:50px; height:34px;">' + 
				'<span class="glyphicon fa fa-upload">' + 
				'<img src="/img/upload.png" width="45px" height="30px">' + 
				'</span>' + 
				'</label>' + 
				'</span>' + 
				'</div>' + 
				"<button type='button'id='fileDel_btn_"+(fileIndex)+"' onclick='newFileDel("+(fileIndex++)+")'"+
				" class='btn btn-danger btn-sm'>삭제</button></div>" + 
				'</div>'
		);
	});
});

// input text에 파일 이름 띄워주기
function inputName(index) {
	if(window.FileReader) {
		var filename = $("#fileInput_"+index)[0].files[0].name;
	} else {
		var filename = $("#fileInput_"+index).val().split('/').pop().split('\\').pop();
	}
	
	$("#userfile_"+index).val(filename);
}


// 파일 등록 추가 한 div삭제
function newFileDel(index) {
	$("#fileDiv_"+index).remove();
}
// 기존 첨부파일 삭제 & 선택해제
var fileNoArr = new Array();
var fileNameArr = new Array();

function exFileDel(value , name , index) {
	fileNoArr.push(value);
	fileNameArr.push(name);
	$("#fileNoDel").val(fileNoArr);
	$("#filenameDel").val(fileNameArr);
	$("#fileName"+index).css({
		"color":"red"
	})
}

function chkReset(index) {
	fileNoArr = new Array();
	fileNameArr = new Array();
	$("#fileNoDel").val("");
	$("#filenameDel").val("");
	$(".a-oriName").css({
		"color" : "black"
	})
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
						<button id="fileAdd_btn" type="button" class="btn btn-info btn-sm">파일 추가</button>							
						<!-- 파일 목록 -->
						<div class="fileBox">
							<input type="hidden" id="fileNoDel" name="fileNoDel[]">
							<input type="hidden" id="filenameDel" name="fileNameDel[]">
							<c:forEach var="file" items="${fileList}" varStatus="var">
								<div>
									<input type="hidden" id="f_no" name="f_no_${var.index}" value="${file.F_NO}">
									<input type="hidden" id="f_name" name="f_name" value="f_no_${var.index}">
									<label id="fileName${var.index}" class="a-oriName" >${file.F_ORINAME}</label>(${file.F_SIZE}kb)
									<button id="fileDel" onclick="exFileDel('${file.F_NO}','${file.F_MODINAME}','${var.index}')"
									 type="button" class="btn btn-danger btn-sm" style="right: 0px;">삭제 선택</button><br>
								</div>
							</c:forEach>
							<button type="button" onclick="chkReset()" class="btn btn-success btn-sm">선택 해제</button>
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
</body>
</html>
