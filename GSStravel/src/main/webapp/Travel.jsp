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
<style type="text/css">
.t {
	border: 3px outset black;
	text-align: center;
	padding: 5px 8px 5px 8px;
	font-size: 15px;
}

table {
	margin-top: 2%;
}
</style>
<title>Insert title here</title>
</head>

<body>
	<%@include file="SelectBar.jsp"%>
	<script>
		$('li').removeClass('now');
		$('li:eq(0)').addClass('now');
	</script>
	<div class='container-fluid'>

		<div class='row'>
			<div class='col-lg-1'></div>
			<div class='col-lg-11'>
				<h2>報名/查詢</h2>
				<br>
				<h4 style="color: red">說明:當取消報名時，將該員工的所有名額一起取消，再重新報名，以避免排名不公</h4>
			</div>
		</div>
		<div class='row'>
			<div class='col-lg-1'></div>
			<div class='col-lg-11'>
				<table class="t table-responsive">
					<thead class="t">
						<tr>
							<th class="t">活動代碼</th>
							<th class="t">活動名稱</th>
							<th class="t">活動開始</th>
							<th class="t">活動結束</th>
							<th class="t">登記開始</th>
							<th class="t">登記結束</th>
							<th class="t">登記活動人數限制</th>
							<th class="t">目前已報名人數</th>
							<th class="t">員工可報名總人數</th>
							<th class="t">報名</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${select}">
							<tr>
								<td class="t"><a
									href="<c:url value="/FeeTravel?tra_No=${row.tra_NO}" />">${row.tra_NO}</a></td>
								<td class="t">${row.tra_Name}</td>
								<td class="t">${row.tra_On}</td>
								<td class="t">${row.tra_Off}</td>
								<td class="t">${row.tra_Beg}</td>
								<td class="t">${row.tra_End}</td>
								<td class="t">${row.tra_Total}</td>
								<td class="t">${row.sign_InTotal}</td>
								<td class="t">${row.tra_Max}</td>
								<c:set var="tra_no" value="${row.tra_NO}" />
								<c:if test="${mp[tra_no]==0}">
									<td><a
										href="<c:url value="/Login_Information?tra_No=${row.tra_NO}&emp_No=${emp_No}"></c:url>"><button>我要報名</button></a></td>
								</c:if>
								<c:if test="${mp[tra_no]==1}">
									<td>登記已截止</td>
								</c:if>
								<c:if test="${mp[tra_no]==2}">
									<td>人數已額滿</td>
								</c:if>
								<c:if test="${mp[tra_no]==3}">
									<td><a
										href="<c:url value="/CancelServlet?tra_No=${row.tra_NO}&emp_No=${emp_No}"></c:url>"><button>取消報名</button></a></td>
								</c:if>
								<c:if test="${mp[tra_no]==4}">
									<td>活動已結束</td>
								</c:if>
								<c:if test="${mp[tra_no]==5}">
									<td>活動尚未開始登記</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>