<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<!-- 회원 정보 삭제 -->
	<script>
		function deleteAlert(m_id, m_nick) {
			var message = confirm(m_nick + " [ " + m_id + " ] " + '님의 회원정보를 삭제하시겠습니까?');
			if(message == true) {
				location.href = "delMember?m_id=" + m_id;
			}
		}
	</script>

	<!-- 계정 확인 -->
	<script>
		// 아이디 중복체크 
		function chk_id() {
			var id = $("#m_id").val();
			$.ajax({
				url : "overlapId",
				type : "GET",
				data : "m_id=" + id,
				success : function(arg) {
					if (arg == false) {
						$("#label_id").text("사용가능한 ID입니다.");
						$("#label_id").css({
							"color" : "blue"
						})
						$("#m_id").attr("readonly", true);
						$("#btn_chk_id").attr("disabled", "disabled");
					} else {
						$("#label_id").text("중복된 ID입니다.");
						$("#label_id").css({
							"color" : "red"
						})
					}
				},
				error : function() {
					alert("아이디 중복체크 오류")
				}
			});
		}

		// 닉네임 중복 체크
		function chk_nick() {
			var nick = $("#m_nick").val();
			$.ajax({
				url : "overlapNick",
				type : "GET",
				data : "m_nick=" + nick,
				success : function(arg) {
					if (arg == true) {
						$("#label_nick").text("사용가능한 닉네임 입니다.");
						$("#label_nick").css({
							"color" : "blue"
						})
						$("#m_nick").attr("readonly", true);
						$("#btn_chk_nick").attr("disabled", "disabled");
					} else {
						$("#label_nick").text("중복 된 닉네임 입니다.");
						$("#label_nick").css({
							"color" : "red"
						})
					}
				},
				error : function() {
					alert("닉네임 중복체크 오류");
				}
			});
		}

		// input 공백 체크(id, label, column명(한글))
		function chk_blank(id, label, column) {
			if ($("#" + id).val() == "") {
				if (id == "m_date") {
					$("#" + label).text(column + "을(를) 선택 해주세요.");
				} else {
					$("#" + label).text(column + "을(를) 입력 해주세요.");
				}
				$("#" + label).css({
					"color" : "red"
				});
			} else {
				$("#" + label).text("");
			}
		}

		// 추가 버튼 활성화 
		function buttonAble() {
			if ($("#label_id").text() == "사용가능한 ID입니다." && $("#m_pw").val() != ""
					&& $("#m_name").val() != ""
					&& $("#label_nick").text() == "사용가능한 닉네임 입니다."
					&& $("#label_pw").text() == "") {
	
				$("#btn-regist").prop("disabled", false);
				
			} else {
				
				$("#btn-regist").prop("disabled", true);
			}
		}

		// label_id text 값 유지
		function keepId() {
			if($("#btn_chk_id").is(":disabled")) {
				$("#label_id").text("사용가능한 ID입니다.");
				$("#label_id").css({
					"color" : "blue"
				})
				console.log("btn_chk_id는 비활성화됨")
			} else {
				console.log("keepId 실행오류")
			}
		}

		// label_nick text 값 유지
		function keepNick() {
			if($("#btn_chk_nick").is(":disabled")) {
				$("#label_nick").text("사용가능한 닉네임 입니다.");
				$("#label_nick").css({
					"color" : "blue"
				})
				console.log("btn_chk_nick는 비활성화됨")
			} else {
				console.log("keepNick 실행오류")
			}
		}

		// input에 blur 적용
		function chkId() {
			chk_blank("m_id", "label_id", "아이디");
			buttonAble();
			keepId();
		}

		function chkPw() {
			chk_blank("m_pw", "label_pw", "비밀번호");
			buttonAble();
		}

		function chkName() {
			chk_blank("m_name", "label_name", "이름");
			buttonAble();
		}

		function chkNick() {
			chk_blank("m_nick", "label_nick", "닉네임");
			buttonAble();
			keepNick();
		}

		// 글자 수 제한 
		$(function() {

			// 아이디 제한
			$("#m_id").on('keyup', function() {
				if ($(this).val().length > 16) {
					console.log("아이디")
					$("#label_id").text("아이디는 16자 이하로 작성해주세요")
					$("#label_id").css({
						"color" : "red"
					});
					$(this).val($(this).val().substring(0, 16));
				}
			});

			// 닉네임 제한
			$("#m_nick").on('keyup', function() {
				if ($(this).val().length > 8) {
					console.log("닉네임")
					$("#label_nick").text("닉네임은 8자 이하로 작성해주세요")
					$("#label_nick").css({
						"color" : "red"
					});
					$(this).val($(this).val().substring(0, 8));
				}
			});

			// 이름 제한
			$("#m_name").on('keyup', function() {
				if ($(this).val().length > 6) {
					$(this).val($(this).val().substring(0, 6));
					console.log("이름")
					$("#label_name").text("이름은 6자 이하로 작성해주세요")
					$("#label_name").css({
						"color" : "red"
					});
				}
			});
		});
	</script>

	<!-- AJAX -->
	<script>
		function updMember(m_id) {
			console.log("AJAX 접근 완료 : " + m_id);
			$.ajax({
				url: 'updateMember',
				data: {m_id : m_id},
				success: function(memberList) {
					const d = new Date(memberList.m_birth);
					const formattedDate = d.getFullYear() + '-'
						+ ("0" + (d.getMonth() + 1)).slice(-2)
						+ '-' + ("0" + d.getDate()).slice(-2);
					$('#update-member #m_id').val(memberList.m_id);
					$('#update-member #m_pw').val(memberList.m_pw);
					$('#update-member #m_nick').val(memberList.m_nick);
					$('#update-member #m_name').val(memberList.m_name);
					$('#update-member #m_email').val(memberList.m_email);
					$('#update-member #m_birth').val(formattedDate);
					$('#update-member #m_rankNum').val(memberList.m_rankNum);
					$('#update-member').modal('show');
				},
				error: function() {
					console.log("updMember 함수 실행 실패");
				}
			})
		}
	</script>

	<!-- STYLE -->
	<style>
		#wrapper {
			padding-left: 0;
			-webkit-transition: all 0.5s ease;
			-moz-transition: all 0.5s ease;
			-o-transition: all 0.5s ease;
			transition: all 0.5s ease;
		}
		#wrapper.toggled {
			padding-left: 250px;
		}
		#sidebar-wrapper {
			z-index: 1000;
			position: fixed;
			left: 250px;
			width: 0;
			height: 100%;
			margin-left: -250px;
			overflow-y: auto;
			background: #000;
			-webkit-transition: all 0.5s ease;
			-moz-transition: all 0.5s ease;
			-o-transition: all 0.5s ease;
			transition: all 0.5s ease;
		}
		#wrapper.toggled #sidebar-wrapper {
			width: 250px;
		}
		#page-content-wrapper {
			width: 100%;
			position: absolute;
			padding: 15px;
		}
		#wrapper.toggled #page-content-wrapper {
			position: absolute;
			margin-right: -250px;
		}

		.company-name {
			display: inline-block;
			padding-left: 15px;
		}
		.company-name:hover {
			cursor: pointer;
		}

		/* SIDEBAR STYLE */
		.sidebar-nav {
			position: absolute;
			top: 0;
			width: 250px;
			margin: 0;
			padding: 0;
			list-style: none;
		}
		.sidebar-nav li a {
			display: block;
			text-decoration: none;
		}
		.sidebar-nav li a:hover {
			text-decoration: none;
		}
		.sidebar-nav li a:active, .sidebar-nav li a:focus {
			text-decoration: none;
		}
		li .active {
			color: white;
			font-weight: 400;
			border-right-color: #55a4d3;
		}
		.sidebar-nav>.sidebar-brand a:hover {
			background: none;
		}

		@media ( min-width :768px) {
			#wrapper {
				padding-left: 250px;
			}
			#wrapper.toggled {
				padding-left: 0;
			}
			#sidebar-wrapper {
				width: 250px;
			}
			#wrapper.toggled #sidebar-wrapper {
				width: 0;
			}
			#page-content-wrapper {
				padding: 20px;
				position: relative;
			}
			#wrapper.toggled #page-content-wrapper {
				position: relative;
				margin-right: 0;
			}
		}

		html {
			background-color: #f2f4f7
		}
		html body {
			font-family: Montserrat, sans-serif;
			color: #727272
		}
		html body #wrapper #sidebar-wrapper {
			background-color: #222d30
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .sidebar-brand {
			padding: 20px;
			margin-bottom: 10px;
			background-color: #55a4d3;
			text-transform: uppercase;
			text-align: center
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .sidebar-brand a {
			color: #fff;
			font-weight: 700;
			font-size: 16px
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel {
			border-radius: 0;
			background-color: transparent;
			margin-bottom: 0;
			border: none
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel:last-child>a {
			border-bottom: 1px solid #283537
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a {
			color: #fff;
			position: relative;
			text-transform: uppercase;
			font-size: 13px;
			padding: 16px 0 16px 53px;
			border-top: 1px solid #283537;
			border-right: 3px solid #222d30
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.active {
			border-right-color: #55a4d3
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.collapsed {
			color: #a7abac
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.collapsed:hover {
			color: #fff
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.collapsed .arrow:before {
			content: "\e258"
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a .arrow {
			position: absolute;
			right: 0;
			margin-top: 20px;
			font-size: 11px;
			margin-right: 18px
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a .arrow:before {
			content: "\e259"
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul {
			list-style-type: none
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.dashboard>a {
			background: url(../images/ico_dashboard_on.png) 20px 18px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.dashboard>a.collapsed {
			background: url(../images/ico_dashboard.png) 20px 18px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.dashboard>a.collapsed:hover {
			background-image: url(../images/ico_dashboard_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.transactions>a {
			background: url(../images/ico_transactions_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.transactions>a.collapsed {
			background-image: url(../images/ico_transactions.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.transactions>a.collapsed:hover {
			background-image: url(../images/ico_transactions_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.inv>a {
			background: url(../images/ico_inventories_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.inv>a.collapsed {
			background-image: url(../images/ico_inventories.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.inv>a.collapsed:hover {
			background-image: url(../images/ico_inventories_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.hid>a {
			background: url(../images/ico_transactions_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.hid>a.collapsed {
			background-image: url(../images/ico_transactions.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.hid>a.collapsed:hover {
			background-image: url(../images/ico_transactions_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.settings>a {
			background: url(../images/ico_settings_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.settings>a.collapsed {
			background-image: url(../images/ico_settings.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.settings>a.collapsed:hover {
			background-image: url(../images/ico_settings_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul li a {
			color: #a7abac;
			margin: 20px 0 20px 15px
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul li a:hover,
			html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul li a.active {
			color: #fff
		}
		html body #wrapper #page-content-wrapper {
			background-color: #f2f4f7;
			padding: 0
		}
		html body #wrapper #page-content-wrapper #topbar {
			background-color: #fff;
			padding: 17px 20px;
			border-bottom: 1px solid #eaeaea
		}
		html body #wrapper #page-content-wrapper #topbar a#menu-toggle {
			color: #666;
			font-size: 25px
		}
		html body #wrapper #page-content-wrapper #topbar a#menu-toggle:hover,
			html body #wrapper #page-content-wrapper #topbar a#menu-toggle:focus,
			html body #wrapper #page-content-wrapper #topbar a#menu-toggle:active {
			text-decoration: none
		}
		html body #wrapper #page-content-wrapper #main-content {
			padding: 20px 5px
		}
		html body #wrapper #page-content-wrapper #main-content .box-row .box:first-child {
			margin-left: 0
		}
		html body #wrapper #page-content-wrapper #main-content .box-row .box:last-child {
			margin-right: 0
		}
		html body #wrapper #page-content-wrapper #main-content .box {
			background-color: #fff;
			margin-top: 20px;
			border: 1px solid #eaeaea;
			border-top: 3px solid #909090;
			min-height: 237px
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head {
			padding: 19px
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data {
			text-align: right
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data .title {
			font-size: 13px;
			text-transform: uppercase
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data .amount {
			font-size: 16px
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data .amount strong {
			font-size: 25px
		}
		html body #wrapper #page-content-wrapper #main-content .box.inv {
			border-top-color: #55a4d3
		}
		html body #wrapper #page-content-wrapper #main-content .box.price {
			border-top-color: #e0d14f
		}
		html body #wrapper #page-content-wrapper #main-content .box.margin {
			border-top-color: #30a076
		}
		html body #wrapper #page-content-wrapper #main-content .box.sales {
			border-top-color: #454545
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box {
			margin-top: 0;
			padding-top: 0
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head {
			border-bottom: 1px solid #eaeaea;
			padding: 0
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head h1 {
			font-size: 16px;
			font-weight: 400;
			padding: 17px 0 0 20px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head .actions {
			padding: 5px 15px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head .actions a {
			text-transform: uppercase;
			padding-left: 20px;
			padding-right: 20px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-content .table-container {
			margin: 0;
			padding: 20px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-content .table-container table tbody tr td {
			padding: 10px !important
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar-container {
		margin: 0
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar {
			margin: 0
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .box-head {
			padding: 0
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar h3 {
			font-size: 15px;
			padding: 20px;
			margin: 0;
			border-bottom: 1px solid #eaeaea
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .item {
			padding: 10px 20px
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .item .type {
			font-size: 12px;
			text-transform: uppercase;
			color: #909090
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .item .amount {
			font-size: 16px
		}
		html body .table-container {
			padding-left: 20px
		}
		html body .table-container .table-controls {
			margin-bottom: 10px
		}
		html body .table-container .table-controls .table-actions .separator {
			display: inline-block;
			padding: 0 7px;
			border-left: 1px solid #eaeaea
		}
		html body .table-container .table-controls .table-actions a {
			display: inline-block;
			margin: 5px 7px
		}
		html body .table-container .table-controls .table-actions a.btn-maximize {
			width: 17px;
			height: 17px;
			background: url(../images/ico3.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-minimize {
			width: 17px;
			height: 17px;
			background: url(../images/ico2.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-print {
			width: 21px;
			height: 17px;
			background: url(../images/ico_print.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-edit {
			width: 16px;
			height: 17px;
			background: url(../images/ico_edit.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-delete {
			width: 14px;
			height: 18px;
			background: url(../images/ico_delete.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-popout {
			width: 16px;
			height: 16px;
			background: url(../images/ico1.png) no-repeat
		}
		html body table :not (.table-condensed) {
			margin-bottom
			: 0! important	
		}
		html body table:not (.table-condensed ).is-datatable tfoot {
			display: table-row-group !important
		}
		html body table:not (.table-condensed ).dataTable td.select-checkbox:after {
			width: 20px !important;
			height: 20px !important;
			margin-top: -6px !important;
			margin-left: -5px !important
		}
		html body table:not (.table-condensed ).dataTable td.select-checkbox:before {
			border: 1px solid #e0e0e0;
			width: 20px !important;
			height: 20px !important
		}
		html body table:not (.table-condensed ).data-table {
			margin-top: 20px
		}
		html body table:not (.table-condensed ).data-table tbody {
			margin-bottom: 1px solid #eaeaea
		}
		html body table:not (.table-condensed ).data-table tbody tr td {
			padding: 10px 20px !important
		}
		html body table:not (.table-condensed ).data-table thead tr th, html body table:not
			 (.table-condensed ).data-table tfoot tr th, html body table:not (.table-condensed)
			 .data-table thead tr td, html body table:not (.table-condensed ).data-table tfoot tr td {
			padding: 10px 20px
		}
		html body table:not (.table-condensed ) thead tr th {
			border-bottom: none !important;
			border-top: 1px solid #eaeaea !important;
			background-color: #f9f9f9
		}
		html body table:not (.table-condensed ) thead tr th.number {
			text-align: right
		}
		html body table:not (.table-condensed ) tbody {
			border-top-color: #fff !important
		}
		html body table:not (.table-condensed ) tbody tr td {
			padding: 20px !important;
			border-top: 1px solid #eaeaea !important
		}
		html body table:not (.table-condensed ) tbody tr td:last-child, html body table:not
			 (.table-condensed ) tbody tr td.number {
			text-align: right
		}
		html body table:not (.table-condensed ) tbody tr td.row-title {
			text-transform: uppercase
		}
		html body table:not (.table-condensed ) tfoot tr td {
			font-weight: 700
		}
		html body table:not (.table-condensed ) tfoot tr td.number {
			text-align: right
		}
		html body .modal .modal-dialog .modal-content {
			background-color: #f9f9f9
		}
		html body .modal .modal-dialog .modal-content .modal-header {
			color: #454545
		}
		html body .modal .modal-dialog .modal-content .modal-header .modal-title {
			padding-left: 10px
		}
		html body .modal .modal-dialog .modal-content .modal-body .form-group label {
			text-transform: uppercase;
			font-weight: 400;
			display: block;
			font-size: 13px
		}
		html body .modal .modal-dialog .modal-content .modal-body .form-group label a {
			float: right;
			display: inline-block;
			padding-left: 20px;
			color: #55a4d3;
			font-size: 12px;
			background: url(../images/ico_plus.png) 0 0 no-repeat
		}
		html body h1 {
			font-size: 24px;
			font-weight: 400;
			padding: 0;
			margin: 0
		}
		html body a.btn {
			background-color: #fcfcfc;
			border: 1px solid #eaeaea;
			color: #666;
			padding: 10px 15px
		}
		html body a.btn:hover {
			background-color: #666;
			color: #fcfcfc
		}
		html {
			background-color: #f2f4f7
		}
		html body {
			font-family: Montserrat, sans-serif;
			color: #727272
		}
		html body #wrapper #sidebar-wrapper {
			background-color: #222d30
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .sidebar-brand {
			padding: 20px;
			margin-bottom: 10px;
			background-color: #55a4d3;
			text-transform: uppercase;
			text-align: center
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .sidebar-brand a {
			color: #fff;
			font-weight: 700;
			font-size: 16px
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel {
			border-radius: 0;
			background-color: transparent;
			margin-bottom: 0;
			border: none
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel:last-child>a {
			border-bottom: 1px solid #283537
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a {
			color: #fff;
			position: relative;
			text-transform: uppercase;
			font-size: 13px;
			padding: 16px 0 16px 53px;
			border-top: 1px solid #283537;
			border-right: 3px solid #222d30
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.active {
			border-right-color: #55a4d3
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.collapsed {
			color: #a7abac
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.collapsed:hover {
			color: #fff
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a.collapsed .arrow:before {
			content: "\e258"
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a .arrow {
			position: absolute;
			right: 0;
			margin-top: 20px;
			font-size: 11px;
			margin-right: 18px
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel>a .arrow:before {
			content: "\e259"
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul {
			list-style-type: none
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.dashboard>a {
			background: url(../images/ico_dashboard_on.png) 20px 18px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.dashboard>a.collapsed {
			background: url(../images/ico_dashboard.png) 20px 18px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.dashboard>a.collapsed:hover {
			background-image: url(../images/ico_dashboard_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.transactions>a {
			background: url(../images/ico_transactions_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.transactions>a.collapsed {
			background-image: url(../images/ico_transactions.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.transactions>a.collapsed:hover {
			background-image: url(../images/ico_transactions_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.inv>a {
			background: url(../images/ico_inventories_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.inv>a.collapsed {
			background-image: url(../images/ico_inventories.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.inv>a.collapsed:hover {
			background-image: url(../images/ico_inventories_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.hid>a {
			background: url(../images/ico_transactions_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.hid>a.collapsed {
			background-image: url(../images/ico_transactions.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.hid>a.collapsed:hover {
			background-image: url(../images/ico_transactions_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.settings>a {
			background: url(../images/ico_settings_on.png) 20px 16px no-repeat
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.settings>a.collapsed {
			background-image: url(../images/ico_settings.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel.settings>a.collapsed:hover {
			background-image: url(../images/ico_settings_on.png)
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul li a {
			color: #a7abac;
			margin: 20px 0 20px 15px
		}
		html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul li a:hover,
			html body #wrapper #sidebar-wrapper .sidebar-nav .panel ul li a.active {
			color: #fff
		}
		html body #wrapper #page-content-wrapper {
			background-color: #f2f4f7;
			padding: 0
		}
		html body #wrapper #page-content-wrapper #topbar {
			background-color: #fff;
			padding: 17px 20px;
			border-bottom: 1px solid #eaeaea
		}
		html body #wrapper #page-content-wrapper #topbar a#menu-toggle {
			color: #666;
			font-size: 25px
		}
		html body #wrapper #page-content-wrapper #topbar a#menu-toggle:hover,
			html body #wrapper #page-content-wrapper #topbar a#menu-toggle:focus,
			html body #wrapper #page-content-wrapper #topbar a#menu-toggle:active {
			text-decoration: none
		}
		html body #wrapper #page-content-wrapper #main-content {
			padding: 20px 5px
		}
		html body #wrapper #page-content-wrapper #main-content .box-row .box:first-child {
			margin-left: 0
		}
		html body #wrapper #page-content-wrapper #main-content .box-row .box:last-child {
			margin-right: 0
		}
		html body #wrapper #page-content-wrapper #main-content .box {
			background-color: #fff;
			margin-top: 20px;
			border: 1px solid #eaeaea;
			border-top: 3px solid #909090;
			min-height: 237px
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head {
			padding: 19px
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data {
			text-align: right
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data .title {
			font-size: 13px;
			text-transform: uppercase
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data .amount {
			font-size: 16px
		}
		html body #wrapper #page-content-wrapper #main-content .box .box-head .agg-data .amount strong {
			font-size: 25px
		}
		html body #wrapper #page-content-wrapper #main-content .box.inv {
			border-top-color: #55a4d3
		}
		html body #wrapper #page-content-wrapper #main-content .box.price {
			border-top-color: #e0d14f
		}
		html body #wrapper #page-content-wrapper #main-content .box.margin {
			border-top-color: #30a076
		}
		html body #wrapper #page-content-wrapper #main-content .box.sales {
			border-top-color: #454545
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box {
			margin-top: 0;
			padding-top: 0
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head {
			border-bottom: 1px solid #eaeaea;
			padding: 0
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head h1 {
			font-size: 16px;
			font-weight: 400;
			padding: 17px 0 0 20px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head .actions {
			padding: 5px 15px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-head .actions a {
			text-transform: uppercase;
			padding-left: 20px;
			padding-right: 20px
		}
		html body #wrapper #page-content-wrapper #main-content .main-box-container .box .box-content .table-container {
			margin: 0;
			padding: 20px
		}
		html body #wrapper #page-content-wrapper #main-content 
			.main-box-container .box .box-content .table-container table tbody tr td {
			padding: 10px !important
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar-container {
			margin: 0
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar {
			margin: 0
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .box-head {
			padding: 0
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar h3 {
			font-size: 15px;
			padding: 20px;
			margin: 0;
			border-bottom: 1px solid #eaeaea
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .item {
			padding: 10px 20px
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .item .type {
			font-size: 12px;
			text-transform: uppercase;
			color: #909090
		}
		html body #wrapper #page-content-wrapper #main-content .sidebar .item .amount {
			font-size: 16px
		}
		html body .table-container {
			padding-left: 20px
		}
		html body .table-container .table-controls {
			margin-bottom: 10px
		}
		html body .table-container .table-controls .table-actions .separator {
			display: inline-block;
			padding: 0 7px;
			border-left: 1px solid #eaeaea
		}
		html body .table-container .table-controls .table-actions a {
			display: inline-block;
			margin: 5px 7px
		}
		html body .table-container .table-controls .table-actions a.btn-maximize {
			width: 17px;
			height: 17px;
			background: url(../images/ico3.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-minimize {
			width: 17px;
			height: 17px;
			background: url(../images/ico2.png) no-repeat
		}
		
		html body .table-container .table-controls .table-actions a.btn-print {
			width: 21px;
			height: 17px;
			background: url(../images/ico_print.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-edit {
			width: 16px;
			height: 17px;
			background: url(../images/ico_edit.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-delete {
			width: 14px;
			height: 18px;
			background: url(../images/ico_delete.png) no-repeat
		}
		html body .table-container .table-controls .table-actions a.btn-popout {
			width: 16px;
			height: 16px;
			background: url(../images/ico1.png) no-repeat
		}
		html body table :not (.table-condensed){
			margin-bottom: 0!important
		}
		html body table:not (.table-condensed ).is-datatable tfoot {
			display: table-row-group !important
		}
		html body table:not (.table-condensed ).dataTable td.select-checkbox:after {
			width: 20px !important;
			height: 20px !important;
			margin-top: -6px !important;
			margin-left: -5px !important
		}
		html body table:not (.table-condensed ).dataTable td.select-checkbox:before {
			border: 1px solid #e0e0e0;
			width: 20px !important;
			height: 20px !important
		}
		html body table:not (.table-condensed ).data-table {
			margin-top: 20px
		}
		html body table:not (.table-condensed ).data-table tbody {
			margin-bottom: 1px solid #eaeaea
		}
		html body table:not (.table-condensed ).data-table tbody tr td {
			padding: 10px 20px !important
		}
		html body table:not (.table-condensed ).data-table thead tr th, html body table:not
		(.table-condensed ).data-table tfoot tr th, html body table:not (.table-condensed)
		.data-table thead tr td, html body table:not (.table-condensed ).data-table tfoot tr td {
			padding: 10px 20px
		}
		html body table:not (.table-condensed ) thead tr th {
			border-bottom: none !important;
			border-top: 1px solid #eaeaea !important;
			background-color: #f9f9f9
		}
		html body table:not (.table-condensed ) thead tr th.number {
			text-align: right
		}
		html body table:not (.table-condensed ) tbody {
			border-top-color: #fff !important
		}
		html body table:not (.table-condensed ) tbody tr td {
			padding: 20px !important;
			border-top: 1px solid #eaeaea !important
		}
		html body table:not (.table-condensed ) tbody tr td:last-child, html body table:not
			 (.table-condensed ) tbody tr td.number {
			text-align: right
		}
		html body table:not (.table-condensed ) tbody tr td.row-title {
			text-transform: uppercase
		}
		html body table:not (.table-condensed ) tfoot tr td {
			font-weight: 700
		}
		html body table:not (.table-condensed ) tfoot tr td.number {
			text-align: right
		}
		html body .nav-tabs {
			border-top: 1px solid #eaeaea;
			border-bottom: 1px solid #eaeaea;
			margin-top: 10px
		}
		html body .nav-tabs li.active a {
			border-bottom: 3px solid #55a4d3 !important;
			color: #55a4d3 !important
		}
		html body .nav-tabs li a {
			border: none !important;
			text-transform: uppercase;
			color: #727272;
			font-size: 13px;
			margin-left: 20px
		}
		
		html body .nav-tabs li a:hover {
			background-color: #fff
		}
		
		html body .modal .modal-dialog .modal-content {
			background-color: #f9f9f9
		}
		
		html body .modal .modal-dialog .modal-content .modal-header {
			color: #454545
		}
		
		html body .modal .modal-dialog .modal-content .modal-header .modal-title
			{
			padding-left: 10px
		}
		
		html body .modal .modal-dialog .modal-content .modal-body .form-group label
			{
			text-transform: uppercase;
			font-weight: 400;
			display: block;
			font-size: 13px
		}
		
		html body .modal .modal-dialog .modal-content .modal-body .form-group label a
			{
			float: right;
			display: inline-block;
			padding-left: 20px;
			color: #55a4d3;
			font-size: 12px;
			background: url(../images/ico_plus.png) 0 0 no-repeat
		}
		html body h1 {
			font-size: 24px;
			font-weight: 400;
			padding: 0;
			margin: 0
		}
		html body a.btn {
			background-color: #fcfcfc;
			border: 1px solid #eaeaea;
			color: #666;
			padding: 10px 15px
		}
		html body a.btn:hover {
			background-color: #666;
			color: #fcfcfc
		}
		[hidden] {
			display: none;
		}
		.btn-outline-secondary:after{
			background: #6c757d;
		}
		.btn-outline-secondary:hover{
			background: #6c757d;
		}
	</style>
	<meta charset="UTF-8">
	<title>계정 관리</title>
</head>
<body>
	<div id="wrapper" class="">
		<!-- SIDEBAR -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav" id="menu-accordion">
				<li class="sidebar-brand"><a href="admin"> DO.MI.SU </a></li>
				<li class="panel dashboard">
					<a data-toggle="collapse" class="active" data-parent="#menu-accordion"
						href="#dashboard-link">회원 관리 <span class="glyphicon  arrow"></span></a>
					<ul id="dashboard-link" class="collapse">
						<li><a href="adminSelectList" class="active">전체 목록</a></li>
						<li><a href="adminRankList?m_rankNum=2">관리 스탭</a></li>
						<li><a href="adminRankList?m_rankNum=3">일반 회원</a></li>
						<li><a href="adminRankList?m_rankNum=4">대기 회원</a></li>
					</ul>
				</li>
				<li class="panel transactions">
					<a data-toggle="collapse" class="collapsed" data-parent="#menu-accordion"
						href="#transactions-link">게시글 관리<span class="glyphicon  arrow"></span></a>
					<ul id="transactions-link" class="collapse">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">질문응답</a></li>
					</ul>
				</li>
				<li class="panel settings">
					<a data-toggle="collapse" class="collapsed" data-parent="#menu-accordion"
						href="#settings-link">게시판 관리<span class="glyphicon  arrow"></span></a>
					<ul id="settings-link" class="collapse active">
						<li><a href="#">레이아웃 변경</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- /SIDEBAR -->

		<!-- PAGE CONTENT -->
		<div id="page-content-wrapper">
			<div id="topbar">
				<div class="pull-left">
					<h1 class="company-name" onclick="location.href='admin'"><b>관리자 페이지</b></h1>
				</div>
				<div class="pull-right">
					<div id="header_user" style="padding-right: 20px;">
						<a href="#"><b>회원 페이지</b></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<div id="main-content">
				<div class="content-body">
					<div class="col-lg-12 main-box-container">
						<div class="box">
							<div class="box-head clearfix">
								<h1 class="pull-left">
									<c:choose>
										<c:when test="${m_rankNum == 3}">
											<b>일반 회원 목록</b>
										</c:when>
										<c:otherwise>
											<b>대기 회원 목록</b>
										</c:otherwise>
									</c:choose>
								</h1>
								<div class="actions pull-right">
									<label style="padding-top: 20px; height: 40px;">회원 수 : ${getRankCount} 명</label>
								</div>
							</div>

							<!-- 회원 목록 출력 -->
							<div class="box-content">
								<div class="table-container">
									<table id="inventories" class="table is-datatable">
										<thead>
											<tr>
												<th class="select-checkbox no-filter"></th>
												<th class="no-filter" width="15%">아이디</th>
												<th width="15%">닉네임</th>
												<th width="15%">이   름</th>
												<th width="25%">이메일</th>
												<th width="15%">등   급</th>
												<th width="15%">관   리</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${rankList}">
												<tr>
													<td class="select-checkbox no-filter"></td>
													<td class="no-filter">${list.m_id}</td>
													<td>${list.m_nick}</td>
													<td>${list.m_name}</td>
													<td>${list.m_email}</td>
													<td>${list.m_rank}</td>
													<td style="text-align: left">
														<span class="btn btn-xs btn-success" data-toggle="modal"
															id="updButton" title="회원 정보 수정"
															onclick="updMember('${list.m_id}')">수정</span>
														<span class="btn btn-xs btn-danger"
															onclick="deleteAlert('${list.m_id}', '${list.m_nick}')">삭제</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- MODAL -->
				<div id="add-inventory" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<form id="inven_hedge_info" action="insChkMember">
								<input type="hidden" name="csrfmiddlewaretoken"
									value="EWOIvVzzLzQnlowipCXQAQ49b9rS4aNE">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">계정 추가</h4>
								</div>
								<div class="modal-body clearfix">
									<div class="col-lg-12">
										<div class="form-group">
											<label for="">아 이 디</label>
											<input type="text" name="m_id" id="m_id"
												class="form-control" onblur="chkId()">
											<label id="label_id"></label>
											<button type="button" id="btn_chk_id" onclick="chk_id()"
												class="btn btn-sm btn-default">중복확인</button>
										</div>
										<div class="form-group">
											<label for="">비밀번호</label>
											<input type="text" name="m_pw" id="m_pw"
												class="form-control" onblur="chkPw()">
											<label id="label_pw"></label>
										</div>
										<div class="form-group">
											<label for="">닉 네 임</label>
											<input type="text" name="m_nick" id="m_nick"
												class="form-control" onblur="chkNick()">
											<label id="label_nick"></label>
											<button type="button" id="btn_chk_nick" onclick="chk_nick()"
												class="btn btn-sm btn-default">중복확인</button>
										</div>
										<div class="form-group">
											<label for="">이 름</label>
											<label id="label_name"></label>
											<input type="text" name="m_name" id="m_name" class="form-control"  onblur="chkName()">
										</div>
										<div class="form-group">
											<label for="">등 급</label>
											<select name="m_rankNum" class="form-control">
												<option value=1>관리자</option>
												<option value=2>스탭</option>
												<option value=3>일반회원</option>
												<option value=4>대기회원</option>
											</select>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="submit" id="btn-regist" class="btn btn-primary" disabled>Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /MODAL -->

				<!-- 회원 정보 수정 MODAL -->
				<div id="update-member" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<form id="inven_hedge_info" action="updChkMember">
								<input type="hidden" name="csrfmiddlewaretoken"
									value="EWOIvVzzLzQnlowipCXQAQ49b9rS4aNE">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">계정 변경</h4>
								</div>
								<div class="modal-body clearfix">
									<div class="col-lg-12">
										<div class="form-group">
											<label for="">아 이 디</label>
											<input type="text" name="m_id" id="m_id" readonly
												class="form-control">
											<label id="label_id"></label>
										</div>
										<div class="form-group">
											<label for="">비밀번호</label>
											<input type="text" name="m_pw" id="m_pw"
												class="form-control">
											<label id="label_pw"></label>
										</div>
										<div class="form-group">
											<label for="">닉 네 임</label>
											<input type="text" name="m_nick" id="m_nick"
												class="form-control">
											<label id="label_nick"></label>
											<button type="button" id="btn_chk_nick"
												class="btn btn-sm btn-default">중복확인</button>
										</div>
										<div class="form-group">
											<label for="">이 름</label>
											<label id="label_name"></label>
											<input type="text" name="m_name" id="m_name" class="form-control">
										</div>
										<div class="form-group">
											<label for="">이 메 일</label>
											<label id="label_email"></label>
											<input type="email" name="m_email" id="m_email" class="form-control">
										</div>
										<div class="form-group">
											<label for="">생년월일</label>
											<label id="label_birth"></label>
											<input type="date" name="m_birth" id="m_birth" class="form-control">
										</div>
										<div class="form-group">
											<label for="">등 급</label>
											<select name="m_rankNum" id="m_rankNum" class="form-control">
												<option value=1>관리자</option>
												<option value=2>스탭</option>
												<option value=3>일반회원</option>
												<option value=4>대기회원</option>
											</select>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<button type="submit" id="btn-regist" class="btn btn-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /MODEL -->
			</div>
		</div>
		<!-- /PAGE CONTENT -->
	</div>
</body>
</html>