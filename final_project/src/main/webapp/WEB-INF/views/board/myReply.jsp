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
		$("#myReply").attr("style", "color:#5bc0de;");
		$("#myReplyWrite").attr("style", "color:black;");
	});
	//	체크된 값 삭제
	function myWriteDelete() {
		var confirm_val = confirm("선택한 게시글을 삭제하시겠습니까?");
		if (confirm_val) {
			var selectcheck = new Array();

			$("input[class='chkBox']:checked").each(function() {
				$.ajax({
					url : "myComDelete",
					type : "get",
					data : {
						c_comNum : $(this).attr("value")
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
		});
		
		// 체크박스 선택 시 버튼 활성화
		$('.chkBox').click(function() {
		    var boxSize = $(".chkBox").length;						// 목록 값 수
		    var chkSize = $(".chkBox:checked").length;				// 체크된 값 수

		    // 목록 개수와 선택된 개수가 같을 경우 전체 선택 버튼 활성화
			if (boxSize == chkSize) {
				$("#allCheck").prop("checked", true);
			} else {
				$("#allCheck").prop("checked", false);
			}
		});
	})
</script>
<style type="text/css">
.tableTd{
	display: flex;
	font-size: 15px;
	height: 35px;
	align-items: center;
}

#btnDel{
	color: white;
	background-color: red;
	border-color: red;"
}

.tdWrite{
	border-bottom: 1px solid #fff;
	padding-top: 10px;
}

.allchkbox{
	width: 50%;
	height: 35px;
	align-items: center;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${param.artiNum == null}">
			<c:set var="artiNum" value="0" />
			<c:set var="next" value="0" />
		</c:when>
		<c:otherwise>
			<c:set var="artiNum" value="${param.artiNum}" />
			<c:set var="next" value="${param.next}" />
		</c:otherwise>
	</c:choose>
	<table style='width: 760px;'>
		<colgroup>
			<col>
			<col style='width: 120px'>
			<col style='width: 100px'>
		</colgroup>
		<thead>
			<tr style='height: 40px;'>
				<th style='text-align: center;'>댓글</th>
				<th style='text-align: center;'></th>
				<th style='text-align: center;'>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${myComList != '[]'}">
					<c:forEach var="list" items="${myComList}">
						<tr>
							<td colspan="1" align="left"><div class="tableTd">
									<div style="width: 30px;">
										<input type="checkbox" class="chkBox"
											value="${list.c_comNum }">
									</div>
									<div>${list.c_content }</div>
								</div></td>
							<td align="center"><a
								href="/movie/board/show?b_num=${list.c_boardNum }">원문보기</a></td>
							<td align="center">${list.getDate() }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3">
							<div style="display: flex; margin-top: 10px;">
								<div align="left" class="allchkbox">
									<input id="allCheck" type="checkbox"> &nbsp; 전체선택
								</div>
								<div align="right" style="width: 50%">
									<a onclick="myWriteDelete()" class="btn btn-info btn-sm" id="btnDel">삭제</a>
									<a href="/movie/board/writeAll" class="btn btn-info btn-sm" style="color: white;">글
										쓰기</a>
								</div>
							</div>

						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3" height="100" align="center">작성하신 댓글이 없습니다.</td>
					</tr>
					<tr>
						<td colspan="3" align="right" class="tdWrite"><a
							href="/movie/board/writeAll" class="btn btn-info btn-sm" style="color: white;">글
								쓰기</a></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<div class="text-center">
		<ul class="pagination">
			<%-- 이전 버튼 --%>
			<li><c:if test="${artiNum>9}">
					<a class="b" href="myList?id=${param.id }&page=2&next=${next-1}&artiNum=${(next-1)*10+9}">«</a>
				</c:if></li>
			<%--게시판 15개 나눈 모음(?) 번호 --%>
			<c:choose>
				<c:when test="${count > next*10+10 }">
					<c:forEach begin="${next*10+1}" end="${next*10+10}" step="1"
						var="cnt">
						<li
							class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'><a class="b"
							href="myList?id=${param.id }&page=2&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${next*10+1}" end="${count}" step="1" var="cnt">
						<li
							class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'><a class="b"
							href="myList?id=${param.id }&page=2&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<%-- 다음 버튼 --%>
			<li><c:if test="${count > next*10+10 }">
					<a class="b" href="myList?id=${param.id }&page=2&next=${next+1}&artiNum=${(next+1)*10}">»</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>