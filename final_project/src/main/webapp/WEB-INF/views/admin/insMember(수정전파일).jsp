<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css?after" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	.main-body-content-dms {
		display: inline-block;
		padding: 15px;
		background-color: #EEF4FB;
		height: 100vh;
		padding-left: 110px;
		transition: ease 0.5s;
	}

	.fontsize-dms {
		font-size: 12pt;
	}

	.input-group-dms {
		position: static;
		display: flex;
		flex-wrap: wrap;
		align-items: stretch;
		width: 100%;
	}

	.glyphicon {
		position: static;
		top: 1px;
		display: inline-block;
		font-family: 'Glyphicons Halflings';
		font-style: normal;
		font-weight: 400;
		line-height: 1;
		-webkit-font-smoothing: antialiased;
	}

	.form-control-dms {
		display: block;
		width: 90%;
		padding: .375rem .75rem;
		font-size: 1rem;
		line-height: 1.5;
		color: #495057;
		background-color: #FFF;
		background-clip: padding-box;
		border: 1px solid #CED4DA;
		border-radius: .25rem;
		transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
</style>
</head>
<body>
	<c:import url="../default/adminHeader.jsp"></c:import>
	<!-- 회원 추가 페이지 -->
		<div class="main-body-content-dms w-100 ets-pt">
			<div class="table-responsive" style="width: 600px;">
				<h2><b>회원 추가</b></h2>
				<hr>
				<label class="fontsize-dms"> 아이디<span class="text-danger">*</span></label>
				<div>
					<div class="input-group-dms">
						<span class="input-group-addon" style="width: 40px; position: static;"><i class="glyphicon glyphicon-envelope"></i></span>
						<input type="text" class="form-control-dms" name="m_id" id="m_id">
					</div>
				</div>
			</div>
		</div>
</body>
</html>