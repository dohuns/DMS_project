<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.lb1{
	font-weight: 400;
	color: red;
	margin-bottom: 0px;
}
.a1 {
	color: black;
}
a:hover, a:focus {
	color: black;
	text-decoration: underline;
	font-weight: 600;
}

.pagination>.active>a.b, .pagination>.active>span, .pagination>.active>a.b:hover,
	.pagination>.active>span:hover, .pagination>.active>a.b:focus,
	.pagination>.active>span:focus {
	background-color: #5BC0DE;
	border-color: #5BC0DE;
}
</style>
</head>
<body>
	
	<div class="container">
	<!-- header -->
	<c:import url="../default/header.jsp" />
		<div style="display: flex; width: 1080px;">
			<div>
				<c:import url="/sidebar" />
			</div>
			<div>

	<c:choose>
		<c:when test="${param.artiNum == null}">
			<c:set var="artiNum" value="0"/>
			<c:set var="next" value="0"/>
		</c:when>
		<c:otherwise>
			<c:set var="artiNum" value="${param.artiNum}"/>
			<c:set var="next" value="${param.next}"/>
		</c:otherwise>
	</c:choose>
	
	<!-- body -->
	<!-- 게시판 보기  -->

<c:choose>
	<c:when test="${param.b_category != null}">
	<div style="width: 810px;">
		<div align="center">
			<div align="left">
				<h3>${param.b_article} ${b_search}(으)로 검색 한 결과</h3>
			</div>
			<div>
				<table class="table table-striped">
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(searchList) == 0}">
							<tr>
								<td colspan="3" height="100" align="center">검색 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${searchList}">
								<tr>
									<td>${dto.b_num}</td>
									<td>
										<c:choose>
											<c:when test="${dto.b_reNum == 0 }">
												<div>
													<a href="show?b_num=${dto.b_num}" class="a1">
														${dto.b_title} 
													</a>
													<label class="lb1">[${dto.b_comCount}]</label>
												</div>
											</c:when>
											<c:otherwise>
												<div style="margin-left:${dto.b_reNum*10}px;">
													└<a href="show?b_num=${dto.b_num}" class="a1">
														${dto.b_title} 
													</a>
													<label class="lb1">[${dto.b_comCount}]</label>
												</div>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${dto.b_nick}</td>
									<td>${dto.b_date}</td>
									<td>${dto.b_hit}</td>
								</tr>
							</c:forEach>	
						</c:otherwise>
					</c:choose>	
				</table>		
			</div>	
		</div>
		<%-- 게시글 나누기--%>
	<div class="text-center">
		<ul class="pagination">
		<%-- 이전 버튼 --%>
		<li><c:if test="${artiNum>9}">
			<a class="b" href="search_list?b_category=${param.b_category}&b_article=${param.b_article}&
				b_search=${param.b_search}&b_content=${param.b_content}&next=${next-1}&artiNum=${(next-1)*10+9}">«</a>
		</c:if></li>
		<%--게시판 15개 나눈 모음(?) 번호 --%>
		<c:choose>
			<c:when test="${count > next*10+10 }">
				<c:forEach begin="${next*10+1}" end="${next*10+10}" step="1" var="cnt">
					<li class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'>
					<a class="b" href="search_list?b_category=${param.b_category}&b_article=${param.b_article}&
					b_search=${param.b_search}&b_content=${param.b_content}&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${next*10+1}" end="${count}" step="1" var="cnt">
					<li class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'>
					<a class="b" href="search_list?b_category=${param.b_category}&b_article=${param.b_article}&
					b_search=${param.b_search}&b_content=${param.b_content}&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<%-- 다음 버튼 --%>	
		<li><c:if test="${count > next*10+10 }">
			<a class="b" href="search_list?b_category=${param.b_category}&b_article=${param.b_article}&
			b_search=${param.b_search}&b_content=${param.b_content}&next=${next+1}&artiNum=${(next+1)*10}">»</a>
		</c:if></li>
		</ul>
	</div>
			<%-- 검색 --%>
			<form action="search_list" class="form-inline">
				<input type="hidden" name="b_article" value="${param.b_article}">
				<input type="hidden" name="b_category"
					value="${param.b_category}">

				<div class="form-group">
					<select name="b_search" class="form-control">
						<option value="titleNcontent">제목 + 내용</option>
						<option value="title">제목만</option>
						<option value="writer">작성자</option>
					</select>
				</div>

				<div class="form-group">
					<input type="text" name="b_content" placeholder="검색어를 입력해주세요"
						class="form-control">
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-success btn-sm">검색</button>
				</div>
			</form>
		</div>
	</c:when>
	
	
	<%-- 전체 게시글 검색 --%>
	
	<c:otherwise>
	<div style="width: 810px;">
		<div align="center">
			<div align="left">
				<h3>${b_search}(으)로 검색한 결과</h3>
			</div>
			<div>
				<table class="table table-striped">
					<tr>
						<th>게시판</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(searchListAll) == 0}">
							<tr>
								<td colspan="3" height="100" align="center">검색 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${searchListAll}">
								<tr>
									<td>
										<a href="list?b_category=${dto.b_category}&b_article=${dto.b_article}" class="a1">
											${dto.b_article}
										</a>
									</td>
									<td>
										<c:choose>
											<c:when test="${dto.b_reNum == 0 }">
												<div>
													<a href="show?b_num=${dto.b_num}" class="a1">
														${dto.b_title} 
													</a>
													<label class="lb1">[${dto.b_comCount}]</label>
												</div>
											</c:when>
											<c:otherwise>
												<div style="margin-left:${dto.b_reNum*10}px;">
													└<a href="show?b_num=${dto.b_num}" class="a1">
														${dto.b_title} 
													</a>
													<label class="lb1">[${dto.b_comCount}]</label>
												</div>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${dto.b_nick}</td>
									<td>${dto.b_date}</td>
									<td>${dto.b_hit}</td>
								</tr>
							</c:forEach>	
						</c:otherwise>
					</c:choose>	
				</table>		
			</div>	
		</div>
				
		<%-- 게시글 나누기--%>
	<div class="text-center">
		<ul class="pagination">
		<%-- 이전 버튼 --%>
		<li><c:if test="${artiNum>9}">
			<a class="b" href="search_list?b_search=${param.b_search}&b_content=${param.b_content}&next=${next-1}&artiNum=${(next-1)*10+9}">«</a>
		</c:if></li>
		<%--게시판 15개 나눈 모음(?) 번호 --%>
		<c:choose>
			<c:when test="${countAll > next*10+10 }">
				<c:forEach begin="${next*10+1}" end="${next*10+10}" step="1" var="cnt">
					<li class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'>
					<a class="b" href="search_list?b_search=${param.b_search}&b_content=${param.b_content}&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${next*10+1}" end="${countAll}" step="1" var="cnt">
					<li class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'>
					<a class="b" href="search_list?b_search=${param.b_search}&b_content=${param.b_content}&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<%-- 다음 버튼 --%>	
		<li><c:if test="${countAll > next*10+10 }">
			<a class="b" href="search_list?b_search=${param.b_search}&b_content=${param.b_content}&next=${next+1}&artiNum=${(next+1)*10}">»</a>
		</c:if></li>
		
		</ul>
	</div>
		<%-- 검색 --%>	
		<form action="search_list" class="form-inline">
			
			<div class="form-group">
				<select name="b_search" class="form-control">
					<option value="titleNcontent">제목 + 내용</option>
					<option value="title"> 제목만 </option>
					<option value="writer"> 작성자 </option>
				</select>
			</div>
			
			<div class="form-group">
				<input type="text" name="b_content" placeholder="검색어를 입력해주세요" class="form-control">
			</div>
				
			<div class="form-group">
				<button type="submit" class="btn btn-success btn-sm">검색</button>
			</div>
		</form>
	</div>
	</c:otherwise>
</c:choose>
</div></div>
<div style="margin-top: 20px;">
			<c:import url="/footer" />
		</div>
</div>
</body>
</html>