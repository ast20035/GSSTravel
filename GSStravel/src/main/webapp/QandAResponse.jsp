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
<style type="text/css">
.color-red{
	border-color:red
}
.color-green{
	border-color:green
}
textarea {
	resize: none;
}
td{
border : 1px solid gray;
padding: 10px;
}
</style>
<title>回應</title>
<style>
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
				<table class='table'>
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
				<form action='<c:url value="/QandAInsertServlet?role=true"/>' method="POST">
					<input type="hidden" name="qa_No" value="${list.qa_No}">
					<input type="hidden" name="answer_No" value="<%=session.getAttribute("emp_No")%>">
					<c:if test="${list.answer_No!=0}">
						<table class='table'>
							<h2>回應</h2>
							<tr>
								<td><textarea name="answer_Text" class="Ans_textarea" readonly="readonly">${list.answer_Text}</textarea></td>
							</tr>
						</table>
					</c:if>
					<br />
					<c:if test="${role}">
						<c:if test="${list.answer_No==0}">
							<div class="displayclass">
								<table>
									<tr>
										<td>回應內容</td>
										<td><textarea class="answer_Text" name="answer_Text"></textarea></td>
									</tr>
								</table>
							</div>
							<br/>
							<button type="button" class="notdisplayclass btn btn-primary" onclick="Respose()">我要回應</button>
							<button type="button" class="notdisplayclass btn btn-danger" onclick="checkdelete()">刪除</button>
							<button type="submit" name="prodaction" value="insertAnswer" class="displayclass displaybb btn btn-primary">回應</button>
							<button type="button" class="displayclass btn btn-primary" onclick="cancelrespose()">取消</button>
							<button type="button" class="notdisplayclass btn btn-primary" onclick="window.location = '/GSStravel/QandAServlet?role=true';">回上一頁</button>
						</c:if>
					</c:if>
					<br />
					<c:if test="${(emp_Role eq true)&&(list.answer_No!=0)&&role}">
						<button type="button" class="notdisplaybutton btn btn-primary" onclick="updateData()">修改</button>
						<button type="submit" class="displaybutton displayaa btn btn-primary" name="prodaction" value="updateAnswer">確認修改</button>
						<button type="button" class="displaybutton btn btn-primary" onclick="cancel()">取消修改</button>
						<button type="button" class="notdisplaybutton btn btn-danger" onclick="checkdelete()">刪除</button>
						<button type="button" class="notdisplaybutton btn btn-primary" onclick="window.location = '/GSStravel/QandAServlet?role=true';">回上一頁</button>
					</c:if>
				</form>
				<c:if test="${!role}">
					<c:if test="${list.question_No==emp_No}">
						<button type="button" class="notdisplaybutton btn btn-danger" onclick="checkdelete()">刪除</button>
					</c:if>
					<button type="button" class='btn btn-primary' onclick="window.location = '/GSStravel/QandAServlet?role=false';">回上一頁</button>
				</c:if>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	if(${Msg!=null}){
		alert("${Msg.message}");
	}
	
	$(".displayclass").hide();
	$(".displaybutton").hide();
	var Ans_textarea;
	function Respose() {
		$(".displayclass").show();
		$(".notdisplayclass").hide();
	}
	function cancelrespose() {
		$(".answer_Text").val('');
		$(".displayclass").hide();
		$(".notdisplayclass").show();
		$(".answer_Text").removeClass("color-green");
		$(".answer_Text").removeClass("color-red");
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
		$(".Ans_textarea").removeClass("color-green");
		$(".Ans_textarea").removeClass("color-red");
		
	}
	function checkdelete() {
		if (confirm("確定要刪除?")) {
			window.location = '/GSStravel/QandAInsertServlet?prodaction=deleteOne&qa_No='+ ${list.qa_No}+'&role='+${role};
		}
	}
	$(".answer_Text").blur(function(){
		$(".answer_Text").removeClass("color-green");
		$(".answer_Text").removeClass("color-red");
		if($(".answer_Text").val()==''){
			$(".answer_Text").addClass("color-red");
			$(".displaybb").prop("disabled", true);
		}
		else{
			$(".answer_Text").addClass("color-green");	
			$(".displaybb").prop("disabled", false);
		}		
	});
	$(".Ans_textarea").blur(function(){
		$(".Ans_textarea").removeClass("color-green");
		$(".Ans_textarea").removeClass("color-red");
		if($(".Ans_textarea").val()==''){
			$(".Ans_textarea").addClass("color-red");
			$(".displayaa").prop("disabled", true);
		}
		else{
			$(".Ans_textarea").addClass("color-green");	
			$(".displayaa").prop("disabled", false);
		}		
	});
</script>
</html>