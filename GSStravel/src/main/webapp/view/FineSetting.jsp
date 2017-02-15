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
tr, td {
	border: 1px solid black;
	text-align: center;
}

.error {
	color: red;
}
</style>
<script src="/GSStravel/js/jquery-3.1.1.min.js"></script>

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

						$(document).on('click', '.remove', function() {
							// 			var num = document.getElementById("fineTable").rows.length;
							// 			if(num > 2){
							$(this).parents("tr").remove();
							// 			}
							// 			else{
							// 				alert("The last row can't be deleted !!");
							// 			}
						});
					});
</script>
</head>

<body>
	<div class='container-fluid'>
		<%@include file="../SelectBar.jsp"%>
		<h2>罰則設定</h2>
		<form action="<c:url value="/FineServlet" />" method="GET">
			<table id="fineTable">
				<tr>
					<td><input type="button" value="＋" id="add" /></td>
					<td><em style="color: red">*</em>取消日<br>(旅遊前 n 天通知)</td>
					<td><em style="color: red">*</em>罰款扣款比例 (%)</td>
				</tr>
				<c:forEach var="row" items="${select}">
					<tr>
						<td><input type="button" class="remove" value="－" /></td>
						<td><input name="day" type="text" value="${row.fine_Dates}"
							autocomplete="off" /></td>
						<td><input name="percent" type="text" value="${row.fine_Per}"
							autocomplete="off" /></td>
					</tr>
				</c:forEach>
			</table>
			<input type="submit" name="FineShow" value="罰則明細" /> <input
				type="submit" name="save" value="儲存罰則" />
			<div class="error">${error.day}</div>
			<div class="error">${error.percent}</div>
			<div class="error">${error.pk}</div>
		</form>
	</div>
</body>
</html>