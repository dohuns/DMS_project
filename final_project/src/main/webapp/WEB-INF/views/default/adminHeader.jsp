<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>AdminHeader</title>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css?after"
		rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

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
</head>
<body>
	<div id="wrapper" class="">
		<!-- SIDEBAR -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav" id="menu-accordion">
				<li class="sidebar-brand"><a href="admin"> DO.MI.SU </a></li>
				<li class="panel dashboard">
					<a data-toggle="collapse" class="active" data-parent="#menu-accordion"
						href="#dashboard-link">회원 관리 <span class="glyphicon arrow"></span></a>
					<ul id="dashboard-link" class="collapse">
						<li><a href="adminSelectList" class="active">전체 목록</a></li>
						<li><a href="adminRankList?m_rankNum=2">관리 스탭</a></li>
						<li><a href="adminRankList?m_rankNum=3">일반 회원</a></li>
						<li><a href="adminRankList?m_rankNum=4">대기 회원</a></li>
						<li><a href="adminUpdRank">정보 변경</a></li>
					</ul>
				</li>
				<li class="panel transactions">
					<a data-toggle="collapse" class="collapsed" data-parent="#menu-accordion"
						href="#transactions-link">게시글 관리<span class="glyphicon arrow"></span></a>
					<ul id="transactions-link" class="collapse">
						<li><a href="adminNoticeMain?b_category=공지사항&b_article=공지">공지사항</a></li>
						<li><a href="#">질문응답</a></li>
					</ul>
				</li>
				<li class="panel settings">
					<a data-toggle="collapse" class="collapsed" data-parent="#menu-accordion"
						href="#settings-link">게시판 관리<span class="glyphicon  arrow"></span></a>
					<ul id="settings-link" class="collapse active">
						<li><a href="boardList">카테고리 항목 추가</a></li>
						<li><a href="boardChange">카테고리 위치 변경</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- /SIDEBAR -->
	</div>
</body>
</html>