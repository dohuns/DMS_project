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
	
	function write_save() {
		var papering = $("#papering").val();
		oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);

		var title = $("#b_title").val();
		var content = $("#b_content").val();
		title = title.trim();
		
		if(title == "") {
			alert("제목을 작성해주세요!");
		} else if(content == ""  || content == null ||
				content == '&nbsp;' || content == '<p>&nbsp;</p>') {
			alert("내용을 입력해주세요!");
			oEditors.getById["b_content"].exec("FOCUS"); //포커싱
		} else if(papering != 0) {
			alert("연속적인 게시글 등록 시도로 인해\n신규 게시글이 등록되지 않았습니다.\n잠시 후 다시 등록 해주시기 바랍니다.");
		} else {
			$("#papering").attr("value","1");
			// 줄 개행 인식
			content = content.replace(/(?:\r\n|\r|\n)/g , '<br/>');
			$("#b_title").val(title);
			$("#b_content").val(content);
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
</script>
<!-- 네이버 스마트 에디터 -->
<script type="text/javascript" src="/movie/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "b_content",
          sSkinURI: "/img/smartEditor/SmartEditor2Skin.html"
      });
});
</script>

</head>
<body>
<input type="hidden" id="papering" value="0">

	<div class="container">
	<!-- header -->
	<c:import url="../default/header.jsp" />
		<div style="display: flex;">
			<div>
				<c:import url="/sidebar" />
			</div>
			<div>
	<!-- body -->
	<c:choose>
		<c:when test="${sessionScope.m_nick != null}">	
			<div class="container" style="width: 800px;">
				<div align="center">
					<h1>글쓰기 페이지</h1>
					<div align="left">
						<form action="write_save" id="fo" method="post" enctype="multipart/form-data">
							<!-- 게시판 선택 -->
							<div>
								<h5>게시판</h5>
								<select name="b_article">
									<c:forEach var="dto" items="${cate}">
										<c:choose>
											<c:when test="${dto.b_article == param.b_article}">
												<option value="${dto.b_article}" selected="selected">${dto.b_article}</option>
											</c:when>
											<c:otherwise>
												<option value="${dto.b_article}">${dto.b_article}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<!-- 게시판 카테고리 hidden으로 보내기 -->
								<input type="hidden" name="b_category" value="${param.b_category}">
							</div>
							<!-- 제목 입력 -->
							<div>
								<h5>글 제목</h5>
								<input type="text" name="b_title" id="b_title"
									placeholder="게시글 제목을 입력하세요" class="form-control" >
							</div>
							<!-- 내용 입력 -->
							<div>
								<h5>글 내용</h5>
								<textarea rows="15" cols="50" name="b_content" id="b_content"
									class="form-control" style="resize: none; width: 765px;"></textarea>
							</div>
							<!-- 첨부파일 & 이미지 -->
							<div style="margin-top:10px;">
								<button id="fileAdd_btn" type="button" class="btn btn-info btn-sm">파일 추가</button>							
								<!-- 파일 목록 -->
								<div class="fileBox">
								</div>
							</div>
							
							<!-- 버튼 -->
							<div align="right" style="padding-top: 10px;">
								<button type="button" class="btn btn-success" onclick="write_save()">글 작성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<script>
				alert("로그인 후 이용해주세요!!!");
				location.href="../login";
			</script>
		</c:otherwise>
	</c:choose>
	</div></div></div>
</body>
</html>

