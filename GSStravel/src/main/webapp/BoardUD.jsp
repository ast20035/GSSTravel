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
<title>公告編輯</title>
<style type="text/css">
.container-fluid{
margin-top: 5%;
font-size: 20px;
}
input,textarea{
margin-top:  10px;
margin-bottom: 10px;
}
</style>
<script>
	window.onload = function() {
		setBoard();
	}
	var xh = new XMLHttpRequest();
<%String time = request.getParameter("anno_Time");
			request.setAttribute("time", time);%>
	var time = "${time}";
	function setBoard() {
		if (xh != null) {
			var pathName = document.location.pathname;
			var index = pathName.substr(1).indexOf("/");
			var result = pathName.substr(0, index + 1);
			xh.addEventListener("readystatechange", setBoardData, false);
			xh.open("GET", "AnnouncementUDServlet?anno_Time=" + time, true);
			xh.send();
		} else {
			alert("很抱歉，您的瀏覽器不支援AJAX功能！");
		}
	}

	function setBoardData() {
		if (xh.readyState == 4) {
			if (xh.status == 200) {
				var board = JSON.parse(xh.responseText);
				var body = document.querySelector("#boardDiv");

				while (body.hasChildNodes()) {
					body.removeChild(body.lastChild);
				}

				for (var i = 0; i < board.length; i++) {
					var div1 = document.createElement("div");
					var div2 = document.createElement("div");

					div2.appendChild(document.createTextNode("公告時間"));
					div1.appendChild(div2);

					var time = document.createElement("input");
					time.setAttribute("type", "text");
					time.setAttribute("id", "time");
					time.setAttribute("name", "time");
					time.setAttribute("class", "form-control");
					time.setAttribute("style", "font-size:17px");
					time.setAttribute("value", board[i].time);
					div1.appendChild(time);

					div2 = document.createElement("div");
					div2.appendChild(document.createTextNode("公告標題"));
					div1.appendChild(div2);

					var title = document.createElement("input");
					title.setAttribute("type", "text");
					title.setAttribute("id", "title");
					title.setAttribute("name", "title");
					title.setAttribute("class", "form-control");
					title.setAttribute("style", "font-size:17px");
					title.setAttribute("value", board[i].title);
					div1.appendChild(title);

					div2 = document.createElement("div");
					div2.appendChild(document.createTextNode("公告內容"));
					div1.appendChild(div2);

					var textarea = document.createElement("textarea");
					textarea.setAttribute("cols", "50");
					textarea.setAttribute("rows", "12");
					textarea.setAttribute("id", "content");
					textarea.setAttribute("name", "content");
					textarea.setAttribute("style", "resize: none");
					textarea.setAttribute("class", "form-control");
					textarea.setAttribute("style",
							"font-size:17px; resize:none;");
					textarea.appendChild(document
							.createTextNode(board[i].content));
					div1.appendChild(textarea);

					body.appendChild(div1);
				}
			} else {
				alert(xh.status + ":" + xh.statusText);
			}
		}
	}
</script>
</head>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-offset-4 col-md-4'>
				<form action="<c:url value="/AnnouncementUDServlet" />" method="GET">
					<div id="boardDiv"></div>
					<input type="submit" value="更新" name="update"
						class='btn btn-primary' /> <input type="submit" value="刪除"
						name="delete" class='btn btn-danger' />
					<input type="button" class='btn btn-primary' value='回上一頁' onclick='window.location.href="BoardMaintain.jsp"'>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>