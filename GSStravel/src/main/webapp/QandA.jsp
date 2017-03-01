<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>編號</th>
				<th>行程編號</th>
				<th>標題</th>
				<th>詢問人員</th>
				<th>詢問時間</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td><input type="text" name="qa_No"value="${list.qa_No}"></td>
					<td><input type="text" value="${list.tra_No}"></td>
					<td><a href="/GSStravel/QandASelectServlet?qa_No=${list.qa_No}"><c:if test="${list.answer_No!=0}"><span>[已回應]</span></c:if>
							${list.question_Title}
						</a>
					</td>
					<td><input type="text" value="${list.question_No}"></td>
					<td><input type="text" value="${list.question_Time}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<% String temp = session.getAttribute("emp_Role").toString();
		boolean emp_Role = Boolean.parseBoolean(temp);
		if(!emp_Role){%>
			<button onclick="window.location = '/GSStravel/QandAServlet?prodaction=question';">我要詢問問題</button>
		<%}%>
<script>
if(${Msg!=null}){
	alert("${Msg.message}");
}
</script>

</body>
</html>
