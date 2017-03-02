<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>回應</title>
<style>
textarea {
	resize: none;
}
</style>
</head>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>問題內容</h2>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-offset-3 col-md-2'>
				<h3>${list.question_Title}</h3>
				<table border="1" class='table'>
					<tr>
						<td>${list.question_No}</td>
						<td>${list.tra_No}</td>
					</tr>
					<tr>
						<td colspan="2">${list.question_Time}</td>
					</tr>
					<tr>
						<td colspan="2"><textarea readonly>${list.question_Text}</textarea></td>
					</tr>
				</table>
				<form action='<c:url value="/QandAInsertServlet"/>'>
					<input type="hidden" name="qa_No" value="${list.qa_No}"> <input
						type="hidden" name="answer_No"
						value="<%=session.getAttribute("emp_No")%>">
					<c:if test="${list.answer_No!=0}">
						<table>
							<h2>回應</h2>
							<tr>
								<td><textarea name="answer_Text" class="Ans_textarea"
										readonly="readonly">${list.answer_Text}</textarea></td>
							</tr>
						</table>
					</c:if>
					<br />
					<c:if test="${emp_Role eq true}">
						<c:if test="${list.answer_No==0}">
							<div class="displayclass">
								<table>
									<tr>
										<td>回應內容</td>
										<td><textarea name="answer_Text"></textarea></td>
									</tr>
								</table>
							</div>
							<button type="button" class="notdisplayclass" onclick="Resopse()">我要回應</button>
							<button type="submit" name="prodaction" value="insertAnswer"
								class="displayclass">回應</button>
						</c:if>
					</c:if>

					<c:if test="${(emp_Role eq true)&&(list.answer_No!=0)}">
						<button type="button" class="notdisplaybutton"
							onclick="updateData()">修改</button>
						<button type="submit" class="displaybutton" name="prodaction"
							value="updateAnswer">確認修改</button>
						<button type="button" class="displaybutton" onclick="cancel()">取消修改</button>
						<button type="button" class="notdisplaybutton"
							onclick="checkdelete()">刪除</button>
					</c:if>
				</form>
				<button type="button"
					onclick="window.location = '/GSStravel/QandAServlet';">回上一頁</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".displayclass").hide();
	$(".displaybutton").hide();
	var Ans_textarea;

	function Resopse() {
		$(".displayclass").show();
		$(".notdisplayclass").hide();
	}
	function updateData() {
		Ans_textarea = $(".Ans_textarea").val();
		$(".displaybutton").show();
		$(".notdisplaybutton").hide();
		$(".Ans_textarea").prop("readonly", false);
	}
	function cancel() {
		$(".Ans_textarea").val(Ans_textarea);
		$(".displaybutton").hide();
		$(".notdisplaybutton").show();
		$(".Ans_textarea").prop("readonly", "readonly");
	}

	function checkdelete() {
		if (confirm("確定要刪除?")) {
			window.location = '/GSStravel/QandAInsertServlet?prodaction=deleteOne&qa_No='
					+ $
			{
				list.qa_No
			}
			;
		}
	}
</script>
</html>