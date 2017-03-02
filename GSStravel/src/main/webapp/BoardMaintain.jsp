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
<style>
table {
	border-bottom: 1px solid #DDDDDD;
}
</style>
<script>
	window.onload = function() {
		day = document.getElementById("day");
		var title = document.getElementById('title');
		var startDay = document.getElementById('startDay');
		var endDay = document.getElementById('endDay');
		setBoard();
	}

	var day = null;
	function optionTime() {
		day = document.getElementById("day");
		setBoard();
	}

	var xh = new XMLHttpRequest();

	function setBoard() {
		if (xh != null) {
			var pathName = document.location.pathname;
			var index = pathName.substr(1).indexOf("/");
			var result = pathName.substr(0, index + 1);
			var url = result + "/AnnouncementServlet?";
			if (title.value != undefined && title.value != '') {
				url = url + "title=" + title.value + "&";
			}
			if (startDay.value != undefined && startDay.value != '') {
				url = url + "startDay=" + startDay.value + "&";
			}
			if (endDay.value != undefined && endDay.value != '') {
				url = url + "endDay=" + endDay.value + "&";
			}
			if (day.value != undefined && day.value != '') {
				url = url + "day=" + day.value;
			}
			xh.addEventListener("readystatechange", setBoardData, false);
			xh.open("GET", url, true);
			xh.send();
		} else {
			alert("很抱歉，您的瀏覽器不支援AJAX功能！");
		}
	}

	function setBoardData() {
		if (xh.readyState == 4) {
			if (xh.status == 200) {
				var board = JSON.parse(xh.responseText);
				var body = document.querySelector("#boardTable>tbody");

				while (body.hasChildNodes()) {
					body.removeChild(body.lastChild);
				}

				var pathName = document.location.pathname;
				var index = pathName.substr(1).indexOf("/");
				var result = pathName.substr(0, index + 1);
				for (var i = 0; i < board.length; i++) {
					var tr = document.createElement("tr");
					var td = document.createElement("td");
					var a = document.createElement("a");

					td = document.createElement("td");
					td
							.appendChild(document.createTextNode(board[i].time
									+ " "));
					if ("${beforeDateNew}" <= board[i].time) {
						var img = document.createElement("img");
						img.setAttribute("src", "images/new.gif");
						td.appendChild(img);
					}
					tr.appendChild(td);

					td = document.createElement("td");
					a.setAttribute("href", result + "/BoardUD.jsp?anno_Time="
							+ board[i].time + "&anno_Important="
							+ board[i].important);
					a.appendChild(document.createTextNode(board[i].title));
					if (board[i].important == 1) {
						a.setAttribute("style", "color:red");
					}
					if (board[i].important == 2) {
						a.setAttribute("style", "color:black");
					}
					td.appendChild(a);
					tr.appendChild(td);

					body.appendChild(tr);
				}
				var count = board.length;
				$("#myul").find("li").remove();
				$("#myul")
						.append(
								'<li><a role="button" onclick="before()">&laquo;</a></li>');
				var sum = Math.ceil(count / 10);
				for (var a = 0; a < sum; a++) {
					if (a == 0) {
						$("#myul").append(
								'<li class="page active" onclick="page(this)" value="'
										+ a + '"><a role="button">' + (a + 1)
										+ '</a></li>');
					} else {
						$("#myul").append(
								'<li class="page" onclick="page(this)" value="'
										+ a + '"><a  role="button">' + (a + 1)
										+ '</a></li>');
					}
				}
				$("#myul")
						.append(
								'<li><a role="button" onclick="next()">&raquo;</a></li>');
				i = $(".active");
				$page = $(".page");
				light(i.val());
			} else {
				alert(xh.status + ":" + xh.statusText);
			}
		}
	}
</script>
</head>
<body>
	<%@include file="Manage.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('Mnow');
		$('.navbar-nav>li:eq(5)').addClass('Mnow');
	</script>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>公告維護</h2>
			</div>
		</div>
		<br>
		<div class='row'>
			<div class='col-md-offset-1 col-md-2'>
				<form action="<c:url value="/BoardInsert.jsp" />" method="GET">
					<div class='input-group'>
						<span class="input-group-addon info" id="sizing-addon1">公告標題</span>
						<input type="text" id="title" name="title" value=""
							aria-describedby="sizing-addon1" class='form-control'
							autocomplete="off" />
					</div>
					<br>
					<div class='input-group'>
						<span class="input-group-addon info" id="sizing-addon2">起迄日期</span>
						<input type='date' id='startDay' name='startDay' value=''
							aria-describedby="sizing-addon2" class='form-control' /> <br>
						<input type='date' id='endDay' name='endDay' value=''
							aria-describedby="sizing-addon2" class='form-control' />
					</div>
					<br>
					<div class='btn-group'>
						<input type="button" value="查詢" name="select" onclick="setBoard()"
							class='btn btn-primary' /> <input type="reset" value="重設"
							class='btn btn-primary' />
					</div>
					<input type="submit" value="新增" name="insert"
						class='btn btn-success' />
				</form>
				<br>
				<div class='row'>
					<form action="<c:url value="/AnnouncementServlet" />" method="GET">
						<div class='col-md-1'>
							<select id="day" name="day" onchange="optionTime()"
								class='form-control' style='width: 170px;'>
								<option value="365">刪除1年前的公告</option>
								<option value="183">刪除半年前的公告</option>
								<option value="91">刪除3個月前的公告</option>
								<option value="31">刪除1個月前的公告</option>
							</select>
						</div>
						<div class='col-md-offset-6 col-md-1'>	
							<input type="submit" value="刪除" name="delete"
								class='btn btn-danger ' />
						</div>
					</form>
				</div>
			</div>
		</div>
		<br>
		<div class='row'>
			<div class='col-md-offset-1 col-md-5'>
				<table id="boardTable" class='table'>
					<thead>
						<tr>
							<th><label style='width: 200px;'>公告時間</label></th>
							<th><label style='width: 500px;'>公告標題</label></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<ul id="myul" class="pagination">
				</ul>
			</div>
		</div>
	</div>
</body>
<script>
	var i;
	var $page = $(".page");
	$("tr:gt(10)").css("display", "none");
	function next() {
		i = $(".active");
		$page.removeClass("active");
		if (i.val() < $page.length - 1) {
			$page[i.val() + 1].className = "active";
			light(i.val() + 1);
		} else {
			$page[0].className = "active";
			light(0);
		}
	}
	function before() {
		i = $(".active");
		$page.removeClass("active");
		if (i.val() < $page.length && i.val() > 0) {
			$page[i.val() - 1].className = "active";
			light(i.val() - 1);
		} else {
			$page[$page.length - 1].className = "active";
			light($page.length - 1);
		}
	}
	function page(obj) {
		$page.removeClass("active");
		$(obj).prop("class", "active");
		i = $(".active");
		light(i.val());
	}
	function light(i) {
		$("tr:gt(0)").css("display", "none");
		$("tr:gt(" + i * 10 + "):lt(" + 10 + ")").css("display", "");
	}
</script>
</html>