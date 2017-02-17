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
<title>罰則設定表</title>
<style>
tr, th, td {
	border: 1px solid black;
	text-align: center;
}

input {
	text-align: center;
}

.error {
	color: red;
}

</style>

<script>
	$(document)
			.ready(
					function() {
						$("#add")
								.click(
										function() {
											$("#fineTable")
													.append(
															"<tr><td><input type='button' class='remove' value='－' /></td><td><input name='day' type='text' value='${row.fine_Dates}' autocomplete='off' /></td><td><input name='percent' type='text' value='${row.fine_Per}' autocomplete='off' /></td></tr>");
										});

						$(document).on("click", ".remove", function() {
							$(this).parents("tr").remove();
						});
					});
</script>
<script>
	window.onload = function() {
		var save = document.getElementById("save");
		setFine();
	}

	var xh = new XMLHttpRequest();

	function setFine() {
		if (xh != null) {
			xh.addEventListener("readystatechange", setFineData, false);
			xh.open("GET", "FineServlet?FineSetting=罰則設定", true);
			xh.send();
		} else {
			alert("很抱歉，您的瀏覽器不支援AJAX功能！")
		}
	}

	function setFineData() {
		if (xh.readyState == 4) {
			if (xh.status == 200) {
				var fine = JSON.parse(xh.responseText);
				var body = document.querySelector("#fineTable>tbody");

				while (body.hasChildNodes()) {
					body.removeChild(body.lastChild);
				}

				for (var i = 0; i < fine.length; i++) {
					var tr = document.createElement("tr");
					var td = document.createElement("td");

					var buttonPlus = document.createElement("input");
					buttonPlus.setAttribute("type", "button");
					buttonPlus.setAttribute("class", "remove");
					buttonPlus.setAttribute("value", "－");
					td.appendChild(buttonPlus);
					tr.appendChild(td);

					td = document.createElement("td");
					var buttonDay = document.createElement("input");
					buttonDay.setAttribute("type", "text");
					buttonDay.setAttribute("name", "day");
					buttonDay.setAttribute("value", fine[i].day);
					buttonDay.setAttribute("autocomplete", "off");
					td.appendChild(buttonDay);
					tr.appendChild(td);

					td = document.createElement("td");
					var buttonPercent = document.createElement("input");
					buttonPercent.setAttribute("type", "text");
					buttonPercent.setAttribute("name", "percent");
					buttonPercent.setAttribute("value", fine[i].percent);
					buttonPercent.setAttribute("autocomplete", "off");
					td.appendChild(buttonPercent);
					tr.appendChild(td);

					body.appendChild(tr);
				}
			} else {
				alert(xh.status + ":" + xh.statusText);
			}
		}
	}

	function check() {
		var pk = 0;
		var step=0;
		var day = document.getElementsByName("day");
		var percent = document.getElementsByName("percent");
		var regDay = new RegExp("^[0-9]{1,2}$");
		var regPercent = new RegExp("^([0-9]{1,2})([.]{1})([0-9]{1,})$");
		for (var i = 0; i < (day.length) - 1; i++) {
			for (var j = i + 1; j < day.length; j++) {
				if (day[i].value == day[j].value) {
					pk = 1;
					step=i;
				}
			}
		}
		if (day.length == 0) {
			$("#FineSave").val("儲存罰則");
			$("#DataForm").submit();
		}
		for (var i = 0; i < day.length; i++) {
			if (day[i].value == "") {
				alert("請輸入取消日！");
				break;
			} else if (percent[i].value == "") {
				alert("請輸入扣款比例！");
				break;
			} else if (!regDay.test(day[i].value)) {
				alert("取消日必須為正整數！");
				break;
			} else if (i==step&&pk==1) {
				alert("取消日已存在！");
				break;
			} else if (!regDay.test(percent[i].value)) {
				if (!regPercent.test(percent[i].value)) {
					alert("扣款比例必須為小於100的正數！");
					break;
				} else if (regPercent.test(percent[i].value)
						&& i == day.length - 1) {
					$("#FineSave").val("儲存罰則");
					$("#DataForm").submit();
				}
			} else if (i == day.length - 1) {
				$("#FineSave").val("儲存罰則");
				$("#DataForm").submit();
			}
		}
	}
</script>
</head>
<body>
		<%@include file="SelectBar.jsp"%>
		<script>
			$('li').removeClass('now');
			$('li:eq(4)').addClass('now');
		</script>
	<div class='container-fluid'>
		<h2>罰則設定</h2>
		<form id="DataForm" action="<c:url value="/FineServlet" />"
			method="GET">
			<em style="color: red">*</em>為必填欄位
			<table id="fineTable">
				<thead>
					<tr>
						<th><input type="button" value="＋" id="add" /></th>
						<th><em style="color: red">*</em>取消日<br>(旅遊前 n 天通知)</th>
						<th><em style="color: red">*</em>罰款扣款比例 (%)</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<input type="hidden" id="FineSave" name="FineSave" value="" /> <input
				type="button" value="儲存罰則" onclick="check()" /> <input
				type="button" value="罰則明細" name="FineShow"
				onclick="window.location.href=resultjs+'/FineShowServlet'" />

			<div class="error">${error.day}</div>
			<div class="error">${error.percent}</div>
			<div class="error">${error.pk}</div>
		</form>
	</div>
</body>
</html>