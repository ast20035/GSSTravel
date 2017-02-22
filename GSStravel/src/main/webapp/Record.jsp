<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>行程編號</th>
			<th>行程名稱</th>
			<th>行程開始日</th>
			<th>行程結束日</th>
			<th>登記日</th>
			<th>取消日</th>
			<th>狀態</th>
			<th>費用</th>
		</tr>
		<c:forEach var="row" items="${record}">
			<tr>
				<td>${row[0]}</td>
				<td>${row[1]}</td>
				<td>${row[2]}</td>
				<td>${row[3]}</td>
				<td>${row[4]}</td>
				<td>${row[5]}</td>
				<td>${row[6]}</td>
				<td>${row[7]}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>