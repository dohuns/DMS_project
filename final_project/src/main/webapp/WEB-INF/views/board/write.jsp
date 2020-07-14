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
<script type="text/javascript">
	
	function write_save() {
		var str = $("#b_content").val();
		
		if($("#b_title").val() == "") {
			alert("제목을 입력해주세요!");
			$("#b_title").focus();
		} else if($("#b_content").val() == "") {
			alert("내용을 작성해주세요!");
			$("#b_content").focus();
		} else {
			// 줄 개행 인식
			str = str.replace(/(?:\r\n|\r|\n)/g , '<br/>');
			$("#b_content").val(str);
			$("#fo").submit();
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../default/header.jsp" />
	
	<!-- body -->
	<c:choose>
		<c:when test="${sessionScope.m_nick != null}">	
			<div class="container" style="width:500px;">
				<div align="center">
					<h1> 글쓰기 페이지 </h1>
					<div align="left">
						<form action="write_save" id="fo">
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
								<input type="text" name="b_title" id="b_title" placeholder="게시글 제목을 입력하세요"
									class="form-control">
							</div>
							<!-- 내용 입력 -->
							<div>
								<h5>글 내용</h5>
								<textarea rows="15" cols="50" name="b_content" id="b_content" class="form-control"
									style="resize:none;"></textarea>
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
	
</body>
</html>