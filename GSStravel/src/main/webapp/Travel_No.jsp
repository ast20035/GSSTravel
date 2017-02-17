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
<script type="text/javascript">
	
</script>
<style type="text/css">
.t {
	border: 1px solid black;
}

.a {
	text-decoration: none;
	color: black;
}

table {
	padding-right: 20%;
	font-size: 15px;
}

.little {
	width: 1px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-5'></div>
			<div class='col-md-3'>
				<h1>行程內容</h1>
			</div>
		</div>
		<div class='row'>
			<div class='col-lg-1'></div>
			<div class='col-lg-10'>
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a
						href="<c:url value="/FeeTravel?tra_No=${traveResult.tra_NO}"/>"><strong>行程</strong></a></li>
					<li role="presentation"><a
						href="<c:url value="/FineShowOneServlet?tra_No=${traveResult.tra_NO}"/>"><strong>罰則</strong></a></li>
				</ul>
			</div>
		</div>
		<div class='row'>
			<div class='col-lg-1'></div>
			<div class='col-lg-10'>
				<table class="table table-responsive">
					<tr>
						<td class='little'>活動代碼</td>
						<td colspan="2">${traveResult.tra_NO}</td>
					</tr>
					<tr>
						<td class='little'>活動名稱</td>
						<td colspan="2">${traveResult.tra_Name}</td>
					</tr>
					<tr>
						<td class='little'>活動日期</td>
						<td colspan="2">${traveResult.tra_On}~${traveResult.tra_Off}</td>
					</tr>
					<tr>
						<td class='little'>登記時間</td>
						<td colspan="2">${traveResult.tra_Beg}~${traveResult.tra_End}</td>
					</tr>
					<tr>
						<td class='little'>每人報名上限</td>
						<td colspan="2">${traveResult.tra_Total}人</td>
					</tr>
					<tr>
						<td class='little'>本團人數上限</td>
						<td colspan="2">${traveResult.tra_Max}人</td>
					</tr>
					<tr>
						<td class='little'>是否住宿</td>
						<td colspan="2"><c:if
								test="${traveResult.tra_On==traveResult.tra_Off}">否</c:if> <c:if
								test="${traveResult.tra_On!=traveResult.tra_Off}">是</c:if></td>
					</tr>
					<tr>
						<td class='little'>活動說明</td>
						<td colspan="2">${traveResult.tra_Intr}</td>
					</tr>
					<tr>
						<td class='little'>活動內容</td>
						<td colspan="2"
							style="word-break: break-all; width: 500px; LINE-HEIGHT: 30px;">${traveResult.tra_Con}</td>
					</tr>
					<tr>
						<td class='little'>注意事項</td>
						<td colspan="2">${traveResult.tra_Atter}</td>
					</tr>
					<tr>
						<td class='little'>附件</td>
						<td colspan="2"><a
							href="<c:url value="/File?tra_Name=${traveResult.tra_Name}"></c:url>">${traveResult.tra_File}</a></td>
					</tr>
					<tr>
						<td class='little'>費用</td>
						<td class='little'>項目</td>
						<td class='little'>金額</td>
					</tr>
					<c:forEach var="row" items="${itemResult}">
						<tr>
							<td></td>
							<td>${row.item_Name}</td>
							<td>${row.item_Money}</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<script>
					var GSS = '<c:url value="/AllTravel" />'
				</script>
				<input type="button" value='回到報名/查詢' class='btn  btn-primary'
					onclick="window.location.href=GSS;" />
			</div>
			<div class='col-lg-1'></div>
		</div>
	</div>
</body>
</html>