<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我要提問</title>
</head>
<body>
	<form action="<c:url value='/QandAInsertServlet'/>" method="POST">
		<input type="hidden" name="Question_No" value="<%=session.getAttribute("emp_No") %>">
		<table>
			<tr>
				<select name="tra_No">
					<option>201608020001</option>
				</select>
			</tr>
			<tr>
				<th>標題</th>
				<td><input type="text" name="Qestion_Title"></td>
			</tr>
			<tr>
				<th>留言內容</th>
				<td><textarea name="Qestion_Text"></textarea></td>
			</tr>
		</table>
		<button type="submit" name="prodaction" value="insertQuestion">提問</button>
	</form>
</body>
</html>