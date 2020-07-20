<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#myWrite").attr("style", "color:black;");
		$("#myReply").attr("style", "color:black;");
		$("#myReplyWrite").attr("style", "color:#5bc0de;");
	});
	//	체크된 값 삭제
	function myWriteDelete() {
		var confirm_val = confirm("선택한 게시글을 삭제하시겠습니까?");
		if (confirm_val) {
			var selectcheck = new Array();

			$("input[class='chkBox']:checked").each(function() {
				$.ajax({
					url : "myWriteDelete",
					type : "get",
					data : {
						b_num : $(this).attr("value")
					},
					success : function() {
						console.log("삭제 성공")
					}
				});
			});
			location.reload();
		}
	}

	//	체크박스 전체 선택
	$(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
</script>
</head>
<body>
	<table style='width: 860px;'>
		<colgroup>
			<col>
			<col style='width: 120px'>
			<col style='width: 100px'>
			<col style='width: 80px'>
		</colgroup>
		<thead>
			<tr style='height: 40px;'>
				<th style='text-align: center;'>제목</th>
				<th style='text-align: center;'>작성자</th>
				<th style='text-align: center;'>작성일</th>
				<th style='text-align: center;'>조회</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${myList != '[]'}">
					<c:forEach var="list" items="${myList}">
						<tr>
							<td colspan="1" align="left"><div
									style="display: flex; font-size: 15px; height: 35px; align-items: center;">
									<div style="width: 30px;">
										<input type="checkbox" class="chkBox" value="${list.b_num }">
									</div>
									<div style="width: 70px;">${list.b_num }</div>
									<div>${list.b_title }</div>
								</div></td>
							<td align="center">${list.b_date }</td>
							<td align="center">${list.b_date }</td>
							<td align="center">${list.b_hit }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							<div style="display: flex; margin-top: 10px;">
								<div align="right">
									<a href="#" class="btn btn-info btn-sm" style="color: white;">글
										쓰기</a>
								</div>
							</div>

						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" height="100" align="center">댓글을 남기신 게시글이 없습니다.</td>
					</tr>
					<tr>
						<td colspan="4" align="right"
							style="border-bottom: 1px solid #fff; padding-top: 10px;"><a
							href="#" class="btn btn-info btn-sm" style="color: white;">글
								쓰기</a></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>