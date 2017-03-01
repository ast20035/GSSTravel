<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回應</title>
<script src='js/jquery-3.1.1.min.js'></script>
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
	<c:if test="${list.answer_No!=0}">
		<table>
			<h2>回應</h2>
			<tr>
				<td><textarea name="answer_Text">${list.answer_Text}</textarea>
				</td>
			</tr>
		</table>
	</c:if>
	<br />
	<form action='<c:url value="/QandAInsertServlet"/>'>
		<c:if test="${list.answer_No==0}">
			<div class="displayclass">
				<input type="hidden" name="qa_No" value="${list.qa_No}">
				<input type="hidden" name="answer_No" value="<%=session.getAttribute("emp_No")%>">
				<table>
					<tr>
						<td>回應內容</td>
						<td><textarea name="answer_Text"></textarea></td>
					</tr>
				</table>
			</div>
			<button type="submit" name="prodaction" value="insertAnswer" class="displayclass">回應</button>
			<button type="button" class="notdisplayclass" onclick="Resopse()">我要回應</button>
		</c:if>
		<button type="button" onclick="window.location = '/GSStravel/QandAServlet';">回上一頁</button>
	</form>
</body>
<script type="text/javascript">
	$(".displayclass").hide();
	function Resopse() {
		$(".displayclass").show();
		$(".notdisplayclass").hide();
	}
</script>
</html>