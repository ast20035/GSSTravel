<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var pathNamejs = document.location.pathname;
	var indexjs = pathNamejs.substr(1).indexOf("/");
	var resultjs = pathNamejs.substr(0, indexjs + 1);
	$(window).scroll(function() {
		var $BodyWidth = $(document).width();
		var $ViewportWidth = $(window).width();
		var $ScrollLeft = $(this).scrollLeft();
		if ($BodyWidth > ($ViewportWidth + $ScrollLeft)) {
			$('#span').show();
		} else if ($BodyWidth == ($ViewportWidth + $ScrollLeft)) {
			$('#span').hide();
		}
	});
</script>
<style>
table {
	color: #7F7F7F;
	font: 0.8em/1.6em "Trebuchet MS", Verdana, sans-serif;
	border-collapse: collapse;
	font-size: 15px;
}
caption, thead th, tfoot th, tfoot td {
	background-color: #1E90FF;
	font-weight: bold;
	text-transform: uppercase
}
thead th {
	background-color: #1E90FF;
	color: white;
	text-align: center
}
tbody tr.odd {
	background-color: #F7F7F7;
	color: #666
}
tbody a {
	padding: 1px 2px;
	color: #333;
	text-decoration: none;
	border-bottom: 1px dotted #E63C1E
}
tbody a:active, tbody a:hover, tbody a:focus, tbody a:visited {
	color: #666
}
tbody tr:hover {
	background-color: #EEE;
	color: #333
}
tbody tr:hover a {
	background-color: #FFF
}
tbody td+td+td+td a {
	color: #C30;
	font-weight: bold;
	border-bottom: 0
}
tbody td+td+td+td a:active, tbody td+td+td+td a:hover, tbody td+td+td+td a:focus,
	tbody td+td+td+td a:visited {
	color: #E63C1E
}
tbody a:visited:after {
	font-family: Verdana, sans-serif;
	content: "\00A0\221A"
}
</style>
<style>
.container-fluid {
	padding-top: 80px;;
}
.nav>li>a {
	font-size: 14px;
	color: #220088;
	font-weight: bold;
}
.now {
	border-radius: 7px\7px;
	background-color: white;
}
.nav>.now>a {
	font-weight: bolder;
	color: #003377;
}
h1, h2 {
	color: #7744FF;
	font-weight: bolder;
	border-left: 6px solid gray;
	padding-left: 10px;
}
.input-group-addon.info {
	color: rgb(255, 255, 255);
	background-color: rgb(57, 179, 215);
	border-color: rgb(38, 154, 188);
}
.select {
	border: 1px solid #DDDDDD;
}
#span {
	position: fixed;
	top: 80px;
	right: 5%;
	font-size: 10%;
	font-weight: boider;
	z-index: 5;
}
.navbar {
	/* 	background: linear-gradient(to bottom, rgba(30, 87, 153, 1) 0%, */
	/* 		rgba(82, 141, 196, 1) 55%, rgba(107, 166, 217, 0.7) 81%, */
	/* 		rgba(125, 185, 232, 0) 100%); */
	background: linear-gradient(to bottom, #539fe1 0%, #0a77d5 3%, #87bcea 75%);
	z-index: 15;
	padding-top: 5px;
	border: 0;
}
.icon-bar {
	background-color: white;
}
.in {
	color: black;
}
.nav>li>a:HOVER {
	background-color: #DCDCDC;
	color: #990099;
}
.nav>li>a:focus {
	background-color: #DCDCDC;
	color: #990099;
}
.thWH {
	background-color: white;
	color: black;
	border: 2px solid black;
}
.tdbtn {
	padding: 5px;
	border: 0;
}
#close5 {
	margin-left: 5px;
}
.navbar-brand {
	color: #FFAA33;
}
.navbar-brand:HOVER {
	color: #FFAA33;
}
input{
	background-color: transparent;
}
</style>
<nav class="navbar navbar-fixed-top topBar">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/Board.jsp'/>"><img src="images/gss_logo.png"></a>
		</div>
		<div id="navbar"
			class="collapse navbar-collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value='/Board.jsp'/>" id="close7">公告</a></li>
				<li><a href="<c:url value='/QandAServlet?role=false'/>" id="close8">Q&A</a></li>
				<li class='dropdown'><a class='dropdown-toggle' href='#'
					role="button" data-toggle="dropdown">旅遊報名<span class="caret"></span></a>
					<ul class='dropdown-menu' id="down1">
						<li><a href="<c:url value='/AllTravel'/>">報名/查詢</a></li>
						<li><a href="<c:url value='/Record'/>">個人歷史記錄</a></li>
					</ul></li>

				<li role="presentation"><a href="<c:url value='/Register'/>"
					id="close1">資料輸入</a></li>
				<c:if test='${emp_Role eq true}'>
					<li><a href="<c:url value='/BoardMaintain.jsp'/>" id="close2">管理介面</a></li>
				</c:if>
			</ul>
			<ul class='nav navbar-nav navbar-right'>
				<li><input type="button" value='登出'
					class="btn btn-warning navbar-btn" id="close5"
					onclick="window.location.href=resultjs+'/LogOut.do';"></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<span class='alert alert-danger' id='span' style="display: none;"><strong>右方還有內容</strong></span>