<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回應</title>
</head>
<body>
<h3>${list.question_Title}</h3>
	<table border="1">
		<tr>
			<td>${list.question_No}</td>
			<td>${list.tra_No}</td>
		</tr>
		<tr>
			<td colspan="2">${list.question_Time}</td>
		</tr>
		<tr>
			<td colspan="2"><textarea>${list.question_Text}</textarea></td>
		</tr>
	</table>
	<button onclick="Resopse()">我要回應</button>
	<div>
		<form action='<c:url value="/QandAInsertServlet"/>'>
		<table>
			<tr>
				<td>回應內容</td>
				<td><textarea name="answer_Text"></textarea></td>
			</tr>
		</table>
		<button type="submit" name="prodaction" value="insertAnswer">回應</button>
		</form>
	</div>
</body>
</html>