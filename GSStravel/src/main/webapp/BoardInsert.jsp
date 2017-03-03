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
<title>公告維護</title>
<style type="text/css">
.container-fluid {
	font-size: 20px;
}

input, textarea {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<script>
	function optionTime() {
		var day = document.getElementById("day");
		var normal = document.getElementById("normal");
		var important = document.getElementById("important");
		if (day.value == 1) {
			day.style.color = "red";
			normal.style.color = "black";
			important.style.color = "red";
		} else if (day.value == 2) {
			day.style.color = "black";
			normal.style.color = "black";
			important.style.color = "red";
		}
	}

	function check() {
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		if (title.value == "") {
			alert("請輸入公告標題！");
		} else if (content.value == "") {
			alert("請輸入公告內容！");
		} else {
			$("#save").val("儲存");
			$("#insertData").submit();
		}
	}
</script>
</head>
<body>
	<%@include file="Manage.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('Mnow');
		$('.navbar-nav>li:eq(1)').addClass('Mnow');
	</script>
	<div class='container-fluid'>
		<div class="row">
			<div class='col-md-offset-1'>
				<h2>新增公告</h2>
			</div>
		</div>
		<br>
		<div class='row'>
			<div class='col-md-offset-3 col-md-4'>
				<form id="insertData"
					action="<c:url value="/AnnouncementUDServlet" />" method="GET">
					<div id="boardDiv">
						<select id="day" name="day" onchange="optionTime()"
							class='form-control' style='width: 150px;'>
							<option id="normal" value="2">一般公告</option>
							<option id="important" value="1" style="color: red">重要公告</option>
						</select> <br>
						<div>公告標題</div>
						<input type="text" id="title" name="title" class="form-control"
							style="font-size: 17px" autocomplete="off" ); />
						<div>公告內容</div>
						<textarea cols="50" rows="12" id="content" name="content"
							style="font-size: 17px; resize: none" class="form-control"
							autocomplete="off"></textarea>
						<br> <input type="button" value="儲存" class='btn btn-success'
							onclick="check()" /> <input type="hidden" value="" id="save"
							name="save" /> <input type="button" class='btn btn-primary'
							value='回上一頁' onclick='window.location.href="BoardMaintain.jsp"'>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>