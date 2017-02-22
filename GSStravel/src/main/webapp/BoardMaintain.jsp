<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='js/jquery-3.1.1.min.js'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="" />
<title>Announcement Maintain</title>
</head>
<body>
	<%@include file="SelectBar.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('now');
		$('.navbar-nav>li:eq(7)').addClass('now');
	</script>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>公告維護</h2>
			</div>
		</div>
		<form action="<c:url value="/AnnouncementServlet" />" method="GET">
			<div class='input-group'>
				<span class="input-group-addon info" id="sizing-addon1">公告標題</span>
				<input type='text' id='title' value=''
					aria-describedby="sizing-addon1" class='form-control' />
			</div>
			<br>
			<div class='input-group'>
				<span class="input-group-addon info" id="sizing-addon2">公告時間</span>
				<input type='text' id='time' value=''
					aria-describedby="sizing-addon2" class='form-control' />
			</div>
			<br>
			<div class='input-group'>
				<span class="input-group-addon info" id="sizing-addon2">公告內容</span>
				<input type='text' id='time' value=''
					aria-describedby="sizing-addon2" class='form-control' />
			</div>
			<br>
			<div class='btn-group'>
				<input type="button" value="查詢" onclick="search()"
					class='btn btn-primary' /> <input class='btn btn-primary'
					type="reset"> <input type="button" name="insert" value="新增">
			</div>
		</form>
	</div>
</body>
</html>