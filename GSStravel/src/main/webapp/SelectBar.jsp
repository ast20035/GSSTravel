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
.container-fluid {
	padding-top: 80px;;
}

li>a {
	font-size: 15px;
	color: 	#00008B;
	font-weight: normal;
}

.now {
	border-radius: 7px\7px;
	background-color: white;
}

.now>a {
	font-weight: bolder;
	color: #00BFFF;
}

.title {
	text-align: left;
	font-style: italic;
	color: #000088;
	padding-bottom: 1px;
	padding-top: 5px;
}

h1, h2 {
	color: #7744FF;
	font-weight: bolder;
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
	top: 10%;
	right: 5%;
	font-size: 10%;
	font-weight: boider;
	z-index: 5;
}

.navbar {
	background: linear-gradient(to bottom, rgba(240,249,255,1) 0%,rgba(203,235,255,1) 20%,rgba(161,219,255,1) 100%);
	z-index: 15;
	padding-top: 5px;
}

.icon-bar {
	background-color: white;
}

.in {
	color: black;
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
			<label class="navbar-brand">GSS</label>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class='now dropdown'><a class='dropdown-toggle'
					role="button" aria-haspopup="true" aria-expanded="false"
					data-toggle="dropdown" id="close1">旅遊報名<span class="caret"></span></a>
					<ul class='dropdown-menu'>
						<li><a href="<c:url value='/AllTravel'/>">報名/查詢</a></li>
						<li><a href="#">報名記錄</a></li>
					</ul></li>
				
				<li role="presentation"><a href="<c:url value='/Register'/>"
					id="close2">資料輸入</a></li>
				<li><a href="<c:url value='/search2.jsp'/>" id="close3">行程維護</a></li>
				<li><a href="<c:url value='/search.jsp'/>" id="close4">報名維護</a></li>
				<li><a href="<c:url value='/FineSetting.jsp'/>" id="close5">罰則維護</a></li>
				<li><a href="<c:url value='/search1.jsp'/>" id="close6">旅費統計</a></li>
				<li><input type="button" value='登出'
					class="btn btn-warning navbar-btn" id="close7"
					onclick="window.location.href=resultjs+'/LogOut.do';"></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<span class='alert alert-danger' id='span' style="display: none;"><strong>右方還有內容</strong></span>

