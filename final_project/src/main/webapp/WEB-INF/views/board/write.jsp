<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 작성</title>
</head>
<body>
	<c:import url="../default/header.jsp" />

	<form class="form-horizontal">
		<fieldset>
			<!-- FORM NAME -->
				<legend style="text-align: center; font-weight: bold;">글 작성</legend>

			<!-- CATEGORY -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="category_name">게시판</label>
				<div class="col-md-4">
					<select id="b_item" name="b_item" class="form-control">
						<option value="boardChk">시스템 점검</option>
						<option value="boardEtc">기타</option>
					</select>
				</div>
			</div>

			<!-- TITLE -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="category_name_fr">글 제목</label>
				<div class="col-md-4">
					<input id="b_title" name="b_title"
						class="form-control input-md" type="text" required>
				</div>
			</div>

			<!-- DATE-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="add_date">글 내용</label>
				<div class="col-md-4">
					<!-- overflow : 자동 줄 늘림 / resize : 크기 고정 -->
					<textarea class="form-control input-md" style="overflow-y: hidden; resize: none;"
						id="b_content" name="b_content" required></textarea>

					<!-- 자동 줄 늘이기 -->
					<script>
						$("textarea").on('keydown keyup', function() {
							$(this).height(1).height( $(this).prop('scrollHeight') + 12);
						})
					</script>

					<!-- 줄 개행 인식 코드 -->
					<script>
						var str = $('#b_content').val();
						str = str.replace(/(?:\r\n\r|\n)/g, '<br/>');
						$('b_content').var(str);
					</script>
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for=""></label>
				<div class="col-md-4" align="right">
					<button id="" name="" class="btn btn-primary">작성</button>
					<button class="btn btn-primary" onclick="location.href='home'">취소</button>
				</div>
			</div>

		</fieldset>
	</form>
</body>
</html>