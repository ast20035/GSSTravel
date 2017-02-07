<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�ȹC���W</title>
</head>
<style>
tr, input {
	text-align: center;
}

textarea {
	text-align: center;
	BORDER-BOTTOM: 0px solid;
	BORDER-LEFT: 0px solid;
	BORDER-RIGHT: 0px solid;
	BORDER-TOP: 0px solid;
	resize: none;
	font-size: 20px;
	height: 50px;
	line-height: 50px;
	outline: none;
}

td {
	padding: 0px;
	text-align: center;
}
</style>

<body>

	<form action="<c:url value='/product.controller' />" method="GET">
		<%-- 		<h3 id="tra_No">${tra_No}</h3> --%>
		<textarea name="tra_No" readonly>${tra_No}</textarea>
		<br />
		<table border="1" id="table">
			<thead>
				<tr>
					<td>�����N�X</td>
					<td>���u(/���ݿˤ�)�s��</td>
					<td>�m�W(/���ݩ������u)</td>
					<td>�i�ɧU���B</td>
					<td>�ӤH�ζO</td>
					<td>��L�W��O�Ω��ӻ���</td>
					<td>��L�W��O���`�B</td>
					<td>���ɹζO</td>
				</tr>
			</thead>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><input type="text" id="dept_No" value="${list.dept_No}"
						readonly></td>
					<td><c:if test="${list.fam_No==0}">
							<input type="text" id="emp_No" name="emp_No"
								value="${list.emp_No }" readonly>
						</c:if> <c:if test="${list.fam_No!=0}">
							<input type="text" id="fam_No" name="fam_No"
								value="${list.emp_No }/${list.fam_No}" readonly>
						</c:if>
					<td><c:if test="${list.fam_Name==NULL}">
							<input type="text" id="emp_Name" value="${list.emp_Name}"
								readonly>
						</c:if> <c:if test="${list.fam_Name!=NULL}">
							<input type="text" id="fam_Name"
								value="${list.fam_Name} / ${list.emp_Name}" readonly>
						</c:if></td>
					<td><c:if test="${list.fam_Name==NULL}">
							<input type="text" id="years_money" value="${years_money}">
						</c:if> <c:if test="${list.fam_Name!=NULL}">
							<input type="text" id="years_money" value="0">
						</c:if></td>
					<td><input type="text" id="person_money" name="person_money"
						class="person_money" value="${list.det_money}"></td>
					<td><input type="text" id="remark" value=""></td>
					<td><input type="text" id="remark_money" value=""></td>
					<td><input type="text" id="TA_money" name="TA_money" value=""></td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<div>
			<input type="submit" id="submit" value="�x�s" /> <input type="submit"
				id="excel" value="�ץXExcel" />
		</div>
	</form>
</body>
<script src="js/jquery-1.12.3.min.js"></script>
<script>
	var money = $(".person_money");
	var emp = $("input[name='emp_No']");
	var fam = $("input[name='fam_No']");
	for ( var k in emp) {
		if (emp[k].value != null) {
			for ( var key in fam) {
				if (fam[key].value != null) {
					console.log("emp " + emp[k].value);
					if (fam[key].value.substr(0, 3) == emp[k].value) {

						console.log("fam " + fam[key].value);
					}
				}
			}
		}
	}
</script>
</html>