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
#backPic {
	position: fixed;
	top: 0;
	z-index: -1;
	opacity: 0.4;
	height: 100%;
	width: 100%;
}

table {
	color: #000000;
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
.topBar {
	background: linear-gradient(to bottom, rgba(40, 52, 59, 1) 0%,
		rgba(40, 52, 59, 1) 6%, rgba(130, 140, 149, 1) 74%);
}

.container-fluid {
	padding-top: 80px;;
}

.nav>li>a {
	font-size: 14px;
	color: white;
	font-weight: normal;
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
	background-color: black;
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

#close7 {
	margin-left: 5px;
}

.Mnow {
	border-left: 5px solid blue;
	border-right: 5px solid blue;
}

.navbar-brand {
	color: #FFAA33;
}

.navbar-brand:HOVER {
	color: #FFAA33;
}

.nav>li>#aBar:focus {
	color: black;
}

input[readonly='readonly'] {
	background-color: transparent;
}
</style>
<nav class="navbar navbar-fixed-top topBar navbar">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/Board.jsp'/>" id="gss">GSS</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li role="presentation"><a href="<c:url value='/Board.jsp'/>"
					id="close1">前台</a></li>
				<c:if test='${emp_Role eq true}'>
					<li><a href="<c:url value='/BoardMaintain.jsp'/>"
						id="close2">公告維護</a></li>
					<li><a href="<c:url value='/QandAServlet?role=true'/>"
						id="close3">Q&A維護</a></li>
					<li><a href="<c:url value='/search2.jsp'/>" id="close4">行程維護</a></li>
					<li><a href="<c:url value='/search.jsp'/>" id="close5">報名維護</a></li>
					<li><a class='dropdown-toggle' role="button"
						href="<c:url value='/FineSetting.jsp'/>" id="close6">罰則維護</a>
					<li><a href="<c:url value='/search1.jsp'/>" id="close7">旅費統計</a></li>
				</c:if>
			</ul>
			<ul class='nav navbar-nav navbar-right'>
				<li><input type="button" value='登出'
					class="btn btn-warning navbar-btn" id="close8"
					onclick="window.location.href=resultjs+'/LogOut.do';"></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<span class='alert alert-danger' id='span' style="display: none;"><strong>右方還有內容</strong></span>
