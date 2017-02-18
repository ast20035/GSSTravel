<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var pathNamejs = document.location.pathname;
	var indexjs = pathNamejs.substr(1).indexOf("/");
	var resultjs = pathNamejs.substr(0, indexjs + 1);
</script>
<style>
.topBar {
	padding-top: 1%;
	padding-bottom: 0;
	background: linear-gradient(to bottom, rgba(208, 228, 247, 1) 0%,
		rgba(115, 177, 231, 1) 2%, rgba(115, 177, 231, 1) 36%,
		rgba(115, 177, 231, 1) 36%, rgba(10, 119, 213, 1) 96%,
		rgba(83, 159, 225, 1) 100%, rgba(135, 188, 234, 1) 100%,
		rgba(83, 159, 225, 1) 101%);
}

.container-fluid {
	padding-top: 5%;	
}

li>a {
	font-size: 15px;
	color: white;
	font-weight: normal;
}

.now {
	border-radius: 5px\5px;
	background-color: white;
}

.now>a {
	font-weight: bolder;
	color: #5599FF;
}

.title {
	font-size: 20px;
	text-align: left;
	font-style: italic;
	color: #000088;
	padding-bottom: 1px;
	padding-top: 5px;
}
h1,h2{
color:#7744FF;
font-weight: bolder;
}
.input-group-addon.info {
    color: rgb(255, 255, 255);
    background-color: rgb(57, 179, 215);
    border-color: rgb(38, 154, 188);
}
</style>
<div class='row-fluid topBar navbar-fixed-top'>
	<div class='col-md-3'>
		<label class='title'>GSS Travel Sign-in System</label>
	</div>
	<div class='col-md-5'>
		<ul class="nav nav-pills">

			<li role="presentation" class='now'><a
				href="<c:url value='/AllTravel'/>">報名/查詢</a></li>
			<li role="presentation"><a href="<c:url value='/Register'/>">資料輸入</a></li>
			<c:if test='${sessionScope.emp_Role==true}'>
				<li role="presentation"><a href="<c:url value='/search2.jsp'/>">行程維護</a></li>
				<li role="presentation"><a href="<c:url value='/search.jsp'/>">報名維護</a></li>
				<li role="presentation"><a
					href="<c:url value='/FineSetting.jsp'/>">罰則維護</a></li>
				<li role="presentation"><a href="<c:url value='/search1.jsp'/>">旅費統計</a></li>
			</c:if>
		</ul>
	</div>
	<div class='col-md-1'>
		<input type="button" value='登出' class="btn btn-group-sm btn-warning"
			onclick="window.location.href=resultjs+'/LogOut.do';">

	</div>
</div>

