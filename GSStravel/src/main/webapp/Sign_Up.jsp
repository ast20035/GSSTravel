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
.a {
	text-decoration: none;
	color: white;
}

.col-lg-2 {
	text-align: center;
}

.container-fluid {
	margin-top: 2%;
}

.table1, .table2 {
	font-size: 17px;
}

.table-bordered {
	text-align: center;
}
.form-control{
font-size: 15px;
background-color: white;
}
label{
text-align: left;
}
</style>
<title>報名</title>
</head>
<body>
	<div class='container-fluid'>

		<form action="<c:url value="/Sign_in"/>" method="get">
			<div class='row'>
				<div class='col-md-1'></div>
				<div class='col-md-4'>
					<div class='panel panel-primary'>
						<div class='panel-heading'>
							<h1>-本團報名資訊-</h1>
						</div>
						<%-- <h3>活動名稱:${tra_Vo.tra_Name}</h3> --%>
						<div class='panel-body'>
							<table class='table table-condensed table1'>
								<tr>
									<td>活動名稱:</td>
									<td><label
										style="border-style: none; color: #7700BB;">${tra_Vo.tra_Name}</label><input type="hidden" value="${tra_Vo.tra_Name}"
										name="tra_Name" readonly></td>
								<tr>
									<td>活動代碼:</td>
									<td><label
										style="border-style: none; color: #7700BB;">${tra_Vo.tra_NO}</label><input type="hidden" value="${tra_Vo.tra_NO}"
										name="tra_No" readonly>
									</td>
								</tr>
								<tr>
									<td colspan="2">目前已報名人數為<strong>${tra_count}</strong>人，依報名順序為:
									</td>
								</tr>
								<c:forEach var="names" items="${name}">
									<c:set var="nameKey" value="${names}" />
									<tr>
										<td colspan="2">${names}(共${mp[nameKey]}人)</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class='col-md-1'></div>
				<div class='col-md-4'>
					<div class='panel panel-primary'>
						<div class='panel-heading'>
							<h1>-報名人員-</h1>
						</div>
						<div class='panel-body'>
							<table class='table table-condensed table2'>
								<tr>
									<td>員編:</td>
									<td><label
										style="border-style: none; color: #7700BB;">${emp_No}</label><input
										type="hidden" value="${emp_No}" name="emp_No" readonly>
									</td>
								</tr>
								<tr>
									<td>姓名:</td>
									<td><label
										style="border-style: none; color: #7700BB;">${myName}</label><input
										type="hidden" value="${myName}" name="emp_No" readonly>
									</td>
								</tr>
								<tr>
									<td colspan="2"><br> <c:if test="${familySize>0}">
											<table class='table table-bordered'>
												<tr>
													<th></th>
													<th>眷屬/親友</th>
													<th>姓名</th>
												</tr>
												<c:forEach var="row" items="${familyVO}">
													<tr class="t">
														<td class="t"><input type=checkbox
															value="${row.fam_Name}" name="fam"></td>
														<td>${row.fam_Rel}</td>
														<td>${row.fam_Name}</td>
													</tr>
												</c:forEach>
											</table>
										</c:if> <br> <c:if test="${tra_Vo.tra_On!=tra_Vo.tra_Off}">

											<table class='table table-bordered'>
												<tr>
													<th></th>
													<th>房型</th>
													<th>費用</th>
												</tr>
												<c:forEach var="room" items="${itemVo}">
													<tr>
														<td><input type=checkbox value="${room.item_Money}"
															name="room"></td>
														<td>${room.item_Name}</td>
														<td>${room.item_Money}</td>
													</tr>
												</c:forEach>
											</table>

										</c:if></td>
								</tr>

								<!-- <button class='btn btn-primary'> -->
								<%-- <a href="<c:url value="/AllTravel"></c:url>" class="a">回上一頁</a> --%>
								<!-- </button> -->
								<script>
									var GSS = '<c:url value="/AllTravel" />'
								</script>
								<tr>
									<td><input type="button" value='回上一頁'
										class='btn btn-primary' onclick="window.location.href=GSS;" /></td><td>
										<input type="submit" value="確定報名" class='btn btn-primary'
										onclick="this.form.submit(); this.disabled=true;" /></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>