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
	margin-top: 5%;
	font-size: 20px;
}

input, textarea {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-offset-4 col-md-4'>
				<form action="<c:url value="/AnnouncementUDServlet" />" method="GET">
					<div id="boardDiv">
						<div>公告標題</div>
						<input type="text" id="title" name="title" class="form-control"
							style="font-size: 17px" />
						<div>公告內容</div>
						<textarea cols="50" rows="12" id="content" name="content"
							style="font-size: 17px; resize: none" class="form-control"></textarea>
						<br> <input type="submit" value="儲存" name="save"
							class='btn btn-primary' /> <input type="button"
							class='btn btn-primary' value='回上一頁'
							onclick='window.location.href="BoardMaintain.jsp"'>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>