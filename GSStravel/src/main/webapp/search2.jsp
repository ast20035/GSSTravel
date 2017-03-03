<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
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
<title>行程維護</title>
<style type="text/css">
#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.2;
		height:100%;
		width: 100%;
	}
</style>
<script>
	window.onload = function() {
		var id = document.getElementById('id');
		var tra_name = document.getElementById('tra_name');
		var Sdate = document.getElementById('Sdate');
		var Edate = document.getElementById('Edate');
		$(".multiselect").kendoMultiSelect({
			autoClose : false
		});
		search();
		var $BodyWidth = $(document).width();
		var $ViewportWidth = $(window).width();
		var $ScrollLeft = $(this).scrollLeft();
		if ($BodyWidth > ($ViewportWidth + $ScrollLeft)) {
			$('#span').show();
		} else if ($BodyWidth == ($ViewportWidth + $ScrollLeft)) {
			$('#span').hide();
		}
	};
	var xh = new XMLHttpRequest();
	function search() {
		if (xh != null) {
			var selectedValues = $('select[name="loca"]').val();
			var pathName = document.location.pathname;
			var index = pathName.substr(1).indexOf("/");
			var result = pathName.substr(0, index + 1);
			var url = result + "/controller/search.do?";
			if (id.value != undefined && id.value != '') {
				url = url + "tra_No=" + id.value + "&";
			}
			if (tra_name.value != undefined && tra_name.value != '') {
				url = url + "tra_Name=" + tra_name.value + "&";
			}
			if (Sdate.value != undefined && Sdate.value != '') {
				url = url + "startDay=" + Sdate.value + "&";
			}
			if (Edate.value != undefined && Edate.value != '') {
				url = url + "endDay=" + Edate.value + "&";
			}
			if (selectedValues != undefined && selectedValues != '') {
				url = url + "loc=" + JSON.stringify(selectedValues);
			}
			xh.addEventListener("readystatechange", ajaxReturn)
			xh.open("GET", url);
			xh.send();
		} else {
			alert("Your browser doesn't support JSON!");
		}
	}
	var excelData = null;
	function ajaxReturn() {
		if (xh.readyState == 4)
			if (xh.status == 200) {
				excelData = xh.responseText;
				var travel = JSON.parse(xh.responseText);
				var myBody = document.querySelector(".table>tbody");
				while (myBody.hasChildNodes()) {
					myBody.removeChild(myBody.lastChild);
				}
				var tr, td, a;
				var pathName = document.location.pathname;
				var index = pathName.substr(1).indexOf("/");
				var result = pathName.substr(0, index + 1);
				for (var i = 0; i < travel.length; i++) {
					tr = document.createElement('tr');
					td = document.createElement('td');
					a = document.createElement('a');
					a.setAttribute("href", result + "/Travel_Edit?tra_no="
							+ travel[i].id);
					a.appendChild(document.createTextNode(travel[i].id));
					td.appendChild(a);
					tr.appendChild(td);

					td = document.createElement('td');
					td.appendChild(document.createTextNode(travel[i].name));
					tr.appendChild(td);

					td = document.createElement('td');
					td.appendChild(document.createTextNode(travel[i].onDate));
					tr.appendChild(td);

					td = document.createElement('td');
					td.appendChild(document.createTextNode(travel[i].offDate));
					tr.appendChild(td);

					td = document.createElement('td');
					td.appendChild(document.createTextNode(travel[i].bDate));
					tr.appendChild(td);

					td = document.createElement('td');
					td.appendChild(document.createTextNode(travel[i].eDate));
					tr.appendChild(td);

					td = document.createElement('td');
					td.setAttribute("align", "center");
					td.appendChild(document.createTextNode(travel[i].people));
					tr.appendChild(td);

					td = document.createElement('td');
					td.setAttribute("align", "center");
					td
							.appendChild(document
									.createTextNode(travel[i].peopleNow));
					tr.appendChild(td);

					td = document.createElement('td');
					td.appendChild(document.createTextNode(travel[i].location));
					tr.appendChild(td);

					myBody.appendChild(tr);
				}

			}
	}

	function excelFunction() {
		$('#excel').val(excelData);
		$('#printExcel').submit();
		
	}
</script>
</head>

<body>
	<%@include file="Manage.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('Mnow');
		$('.navbar-nav>li:eq(2)').addClass('Mnow');
	</script>
	<div class='container-fluid'>
		<link rel="stylesheet"
			href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
		<link rel="stylesheet"
			href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
		<link rel="stylesheet"
			href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />
		<script
			src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>行程維護</h2>
			</div>
		</div>

		<br>
		<fieldset>
			<form action=<c:url value="/Travel_Edit"/> method="get">
				<div class='row'>
					<div class='col-md-1'></div>
					<div class='col-md-2'>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon1">活動代碼</span><input
								type='text' id='id' value='' aria-describedby="sizing-addon1"
								class='form-control' />
						</div>
						<br>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon2">活動名稱</span>
							<input type='text' id='tra_name' value=''
								aria-describedby="sizing-addon2" class='form-control' />
						</div>
						<br>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon3">
								起迄日期:</span><input type='date' id='Sdate' name='startDay' value=''
								aria-describedby="sizing-addon3" class='form-control' /> <input
								type='date' id='Edate' name='endDay' value=''
								class='form-control' />
						</div>
						<br>
						<div class='input-group select'>
							<span class="input-group-addon info" id="sizing-addon3">活動地點</span>
							<select class="multiselect" name="loca" multiple="multiple"
								data-placeholder="請選擇" style="width: 300px;">
								<option>東</option>
								<option>西</option>
								<option>南</option>
								<option>北</option>
							</select>
						</div>
						<br>
					</div>
				</div>
				<div class='row'>
					<div class='col-md-offset-1 col-md-2'>
						<div class='btn-group'>
							<input type="button" value="查詢" onclick="search()" class='btn btn-primary' />
							<input class='btn btn-primary' type="reset">
							<input type="button" name="excel" onclick='excelFunction()' class='btn btn-primary' value="匯出Excel" />
						</div>
					</div>
					<div class='col-md-offset-1 col-md-1'>
						<input type="button" value="新增"
							onclick='window.location.href=resultjs+"/NewTravel";'
							class='btn btn-success' />
					</div>
				</div>
			</form>
			<form id="printExcel" action=<c:url value="/TravelExcel"/> method="GET">
				<input type="hidden" id="excel" name="excel" value="">
			</form>
		</fieldset>

		<form action=<c:url value="/Travel_Edit"/> method="GET"></form>

		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-10'>
				<table class='table' cellpadding="10">
					<thead>
						<tr>
							<th>活動代碼</th>
							<th>活動名稱</th>
							<th>活動開始</th>
							<th>活動結束</th>
							<th>登記開始</th>
							<th>登記結束</th>
							<th>人數上限</th>
							<th>已報名人數</th>
							<th>活動地點</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class='col-md-1'></div>
		</div>
	</div>
	<img src="images/Travel.jpg" id="backPic">
</body>
</html>