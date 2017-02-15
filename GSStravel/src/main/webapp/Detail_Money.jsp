<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
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
<title>旅遊報名</title>
</head>
<style>
* {
	font-size: 13px;
}

tr, input {
	text-align: center;
	width:100px;
}

textarea {
	text-align: center;
	border: 0;
	resize: none;
	font-size: 20px;
	width: 400px;
	overflow-y: visible;
	outline: none;
}

td {
	padding: 0px;
	text-align: center;
}
</style>

<body>
	<div class='container-fluid'>
		<%@include file="SelectBar.jsp"%>
		<form action="<c:url value='/TotalAmountServlet' />" method="GET">
			<div><textarea name="tra_Name" readonly>${tra_Name}</textarea></div>
			<input type="hidden" name="tra_No" value="${tra_No}">
			
			<table border="1" class="table" id="table">
				<thead>
					<tr>
						<td scope="row">部門代碼</td>
						<td scope="row">員工(/眷屬親友)編號</td>
						<td scope="row">姓名(/隸屬於哪位員工)</td>
						<td scope="row">年度可補助金額<br /> <span style="color: red; font-size: 10px">未到職一年者按比例給予計算</span></td>
						<td scope="row">個人可補助金額</td>
						<td scope="row">個人團費</td>
						<td scope="row">其他增減費用明細說明</td>
						<td scope="row">其他增減費用總額</td>
						<td scope="row">應補團費</td>
					</tr>
				</thead>
				<c:forEach var="list" items="${list}">
					<tr>
						<td><input type="text" name="dept_No" value="${list.dept_No}"
							readonly></td>
						<td><c:if test="${list.fam_No==0}">
								<input type="text" name="emp_No" class="emp"
									value="${list.emp_No}" readonly>
								<input type="hidden" name="empfam" value="${list.emp_No}">
							</c:if> <c:if test="${list.fam_No!=0}">
								<input type="text" name="empfam" class="fam"
									value="${list.emp_No}/${list.fam_No}" readonly>
							</c:if></td>
						<td><c:if test="${list.fam_Name==NULL}">
								<input type="text" value="${list.emp_Name}" readonly>
							</c:if> <c:if test="${list.fam_Name!=NULL}">
								<input type="text" value="${list.fam_Name}/${list.emp_Name}"
									readonly>
							</c:if></td>
						<c:if test="${list.fam_Name==NULL}">
							<td><input type="text" class="years_money"
								value="${list.years_money}" readonly></td>
							<td><input type="text" class="person_money" value=""
								readonly> <input type="hidden" class="person"
								value="${list.emp_No}"></td>
						</c:if>
						<c:if test="${list.fam_Name!=NULL}">
							<td><input type="text" value="0.0" readonly></td>
							<td><c:if test="${list.fam_sub}">
									<input type="text" class="personfam_money" value="0.0" readonly>
									<input type="hidden" class="person" value="${list.emp_No}">
								</c:if><c:if test="${!list.fam_sub}">
									<input type="text" class="onmoney" value="0.0" readonly>
								</c:if></td>
						</c:if>
						<td><input type="text" name="money" class="money"
							value="${list.det_money}" readonly></td>

						<td><input type="text" name="det_note" class="det_note"
							value="${list.det_note}"></td>
						<td><input type="text" name="det_noteMoney"
							class="det_noteMoney" value="${list.det_noteMoney}"
							onkeyup="changeNotemoney()"></td>
						<td><c:if test="${list.fam_No==0}">
								<input type="text" name="TA_money" class="TA_money" value="">
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
			<br />
			<div>
				<button type="submit" name="prodaction" value="save">儲存</button>
				<button type="submit" value="excel">匯出Excel</button>
			</div>
		</form>
		<c:if test="${session!=null}">
			<script>
				alert('${session}');
			</script>
		</c:if>
	</div>
</body>
<script>
	var $money = $(".money"); //個人團費
	var $emp = $(".emp"); //emp
	var $fam = $(".fam"); //fam
	var $TAmoney = $(".TA_money"); //應補團費
	var $noteMoney = $(".det_noteMoney"); //減免費用
	var $yearsmoney = $(".years_money");
	var $personemp = $(".person");
	var $personmoney = $(".person_money"); //會員個人可補助金額	
	var a = 0;
	var b = 0;
	$().ready(function() {
		$.each($personmoney, function(i, value) {
			var sum = Number(0);
			$.each($personemp, function(k, value) {
				if ($emp[i].value == $personemp[k].value) {
					sum = sum + Number($money[a].value);
					a++;
				}
			});
			if ($yearsmoney[i].value <= sum) {
				sum = $yearsmoney[i].value;
			}
			$personmoney[i].value = sum;
		});
		changeNotemoney();
	});
	function changeNotemoney() {
		a = 0;
		$.each($emp, function(keys, emp) {
			var sum = Number(0);
			sum = Number($money[keys].value) + Number($noteMoney[a].value)
					- Number($personmoney[keys].value);
			a++;
			$.each($fam, function(key, fam) {
				if ($fam[key].value.split("/")[0] == $emp[keys].value) {
					sum = sum + Number($money[a].value)
							+ Number($noteMoney[a].value);
					a++;
				}
			});
			if (sum <= 0) {
				sum = 0;
			}
			$TAmoney[keys].value = sum;
		});
	}
</script>
</html>