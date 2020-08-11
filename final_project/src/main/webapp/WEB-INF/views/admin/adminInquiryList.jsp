<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의 페이지</title>
	<style>
		html, body, div {
			height: 95%;
		}
		body #main {
			height: 95%;
		}
		.mainContent {
			display: flex;
			height: 100%;
		}
		.divContent {
			width: 100%;
			padding: 35px;
			min-width: 800px;
			max-height: 800px;
			margin: 50px 0 50px 250px;
		}
		tr>th, .chkTd {
			text-align: center;
		}
		.td-st {
			text-indent: 20px;
		}
		.td-sa {
			text-align: center;
		}
		.contentPage {
			padding-top: 35px;
			text-align: center;
		}
		.contentBtn button {
			margin-left: 10px;
		}
		.pagination>.active>a.pageBtn, 
		.pagination>.active>a.pageBtn:hover, 
		.pagination>.active>a.pageBtn:focus {
			background-color: #5BC0DE;
			border-color: #5BC0DE;
		}
		.btn-st{
			float: right;
			margin-left: 10px;
		}
		.modal-sz {
			height: 240px;
		}
		.title-a,
		.title-a:focus,
		.title-a:visited {
			color: #333;
			text-decoration: none;
		}
		.title-a:hover {
			color: #333;
			cursor: pointer;
			font-weight: 600;
			text-decoration: underline;
		}
}
	</style>
</head>
<body>
	<c:if test="${sessionScope.m_rankNum ne 1}">
		<script type="text/javascript">
			alert("잘못된 접근 방식입니다.");
			history.go(-1);
		</script>
	</c:if>

	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="main">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />

				<!-- PAGING -->
				<c:choose>
					<c:when test="${param.pageNum == null}">
						<c:set var="pageNum" value="0" />
						<c:set var="next" value="0" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum}" />
						<c:set var="next" value="${param.next}" />
					</c:otherwise>
				</c:choose>

				<!-- CONTENT -->
				<div class="divContent">
					<form id="contentForm">
						<input type="hidden" name="m_categoryNum" value="${param.m_categoryNum}">
						<table class="table table-td">
							<thead>
								<tr>
									<th width="7%">번   호</th>
									<th width="50%">제   목</th>
									<th width="15%">작성자</th>
									<th width="15%">작성일</th>
									<th width="13%">상   태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty inquiryList}">
										<c:forEach var="list" items="${inquiryList}">
											<tr>
												<td class="td-sa">${list.cus_num}</td>
												<td class="td-st">
													<a class="title-a" onclick="location.href='adminInquiryContent?cus_num=${list.cus_num}'">${list.cus_title}</a>
												</td>
												<td class="td-st">${list.cus_nick}</td>
												<td class="td-sa">${list.cus_date}</td>
												<td class="td-sa">
													<button type="button"
														class='<c:out value="${list.cus_reNum == 0 ? 'btn btn-xs btn-success' : list.cus_reNum == 1 ? 'btn btn-xs btn-danger' : 'btn btn-xs btn-default'}" />'>
														<c:out value="${list.cus_reNum == 0 ? '답변 대기' : list.cus_reNum == 1 ? '답변 완료' : '답변 보류'}" />
													</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="5" class="td-sa">문의글이 존재하지 않습니다.</td></tr>
									</c:otherwise>
								</c:choose>

								<tr>
									<td colspan="5">
										<!-- PAGING -->
										<div class="contentPage">
											<ul class="pagination">
												<!-- 이전 버튼 -->
												<li><c:if test="${pageNum > 9}">
														<a class="pageBtn"
															href="adminInquiryList?next=${next-1}&pageNum=${(next-1) * 10 + 9}&cus_categoryNum=${param.cus_categoryNum}">«</a>
													</c:if>
												</li>
												<!-- 번호 출력 -->
												<c:choose>
													<c:when test="${totalNum > next * 10 + 10}">
														<c:forEach begin="${next * 10 + 1}" end="${next * 10 + 10}" step="1" var="cnt">
															<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
																<a class="pageBtn"
																	href="adminInquiryList?next=${next}&pageNum=${cnt-1}&cus_categoryNum=${param.cus_categoryNum}">${cnt}</a>
															</li>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<c:forEach begin="${next * 10 + 1}" end="${totalNum}" step="1" var="cnt">
															<li class='<c:out value="${pageNum == cnt-1 ? 'active' : ''}"></c:out>'>
																<a class="pageBtn"
																	href="adminInquiryList?next=${next}&pageNum=${cnt-1}&cus_categoryNum=${param.cus_categoryNum}">${cnt}</a>
															</li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												<!-- 다음 버튼 -->
												<li><c:if test="${totalNum > next * 10 + 10 }">
														<a class="pageBtn"
															href="adminInquiryList?next=${next + 1}&pageNum=${(next + 1) * 10}&cus_categoryNum=${param.cus_categoryNum}">»</a>
													</c:if>
												</li>
											</ul>
										</div>
	
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>