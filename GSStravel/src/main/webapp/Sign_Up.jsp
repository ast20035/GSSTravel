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

.a {
	text-decoration: none;
	color: white;
}

.col-lg-2 {
	text-align: center;
}

.jumbotron {
	padding-bottom: 2px;
	padding-top: 2px;
}
.container-fluid{
margin-top: 2%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class='container-fluid'>

		<form action="<c:url value="/Sign_in"/>" method="get">
			<div class='row'>
				<div class='col-lg-2'></div>
				<div class='col-lg-3'>
					<h1 class='alert alert-info'>-本團報名資訊-</h1>
					<h3>活動名稱:${tra_Vo.tra_Name}</h3>
					<h3>
						活動代碼:<input style="border: none; font-size: 14pt; width: 200px"
							type="text" value="${tra_Vo.tra_NO}" name="tra_No" readonly>
					</h3>
					<h3>已報名人數 ${tra_count}人依報名順序為:</h3>
					<c:forEach var="names" items="${name}">
						<c:set var="nameKey" value="${names}" />
						<h3>${names}(共${mp[nameKey]}人)</h3>
					</c:forEach>

				</div>
				<div class='col-lg-1'></div>
				<div class='col-lg-3'>
					<h1 class='alert alert-info'>-報名人員-</h1>

					<h2>
						員編:<input style="border: none; font-size: 18pt; width: 40px"
							type="text" value="${emp_No}" name="emp_No" readonly>;姓名:${myName}
					</h2>

					<c:if test="${familySize>0}">
						<table class="t">
							<tr class="t">
								<th class="t">報名</th>
								<th class="t">眷屬/親友</th>
								<th class="t">姓名</th>
							</tr>
							<c:forEach var="row" items="${familyVO}">
								<tr class="t">
									<td class="t"><input type=checkbox value="${row.fam_Name}"
										name="fam"></td>
									<td class="t">${row.fam_Rel}</td>
									<td class="t">${row.fam_Name}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<br> <br> <br>
					<c:if test="${tra_Vo.tra_On!=tra_Vo.tra_Off}">
						<c:forEach var="room" items="${itemVo}">
							<table class="t">
								<tr class="t">
									<th class="t"></th>
									<th class="t">房型</th>
									<th class="t">費用</th>
								</tr>
								<tr>
									<td class="t"><input type=checkbox
										value="${room.item_Money}" name="room"></td>
									<td class="t" width='150px'>${room.item_Name}</td>
									<td class="t" width='70px'>${room.item_Money}</td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
					<button class='btn  btn-primary'>
						<a href="<c:url value="/AllTravel"></c:url>" class="a">回上一頁</a>
					</button>
					<input type="submit" value="確定報名" class='btn  btn-primary'>
				</div>
			</div>
		</form>
	</div>
</body>

</html>