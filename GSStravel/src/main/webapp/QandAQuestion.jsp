<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src='js/jquery-3.1.1.min.js'></script>
<head>
<style type="text/css">
.color-red{
	border-color:red
}
.color-green{
	border-color:green
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我要提問</title>
</head>
<body>
	<form action="<c:url value='/QandAInsertServlet'/>" method="POST">
		<input type="hidden" name="Question_No" value="<%=session.getAttribute("emp_No") %>">
		<table>
			<tr>
				<select name="Select">
					<c:forEach var="list" items="${list}">
						<option>${list.tra_NO}</option>
					</c:forEach>
				</select>
			</tr>
			<tr>
				<th>標題</th>
				<td><input type="text" class="Qestion_Title" name="Qestion_Title"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="radio" name="radio" value="false" checked="checked">公開
					<input type="radio" name="radio" value="true">私密
				</td>
			</tr>
			<tr>
				<th>留言內容</th>
				<td><textarea class="Qestion_Text" name="Qestion_Text"></textarea></td>
			</tr>
		</table>		
			<button type="submit" class="insertQuestion" name="prodaction" value="insertQuestion">提問</button>
			<button type="button" onclick="window.location = '/GSStravel/QandAServlet?role=false';">回上一頁</button>
	</form>
</body>
<script type="text/javascript">
if(${Msg!=null}){
	alert("${Msg.message}");
}
$(".Qestion_Title").blur(function(){
	$(".Qestion_Title").removeClass("color-green");
	$(".Qestion_Title").removeClass("color-red");
	if($(".Qestion_Title").val()==''){
		console.log("aaa");
		$(".Qestion_Title").addClass("color-red");
		$(".insertQuestion").prop("disabled", true);
	}
	else{
		$(".Qestion_Title").addClass("color-green");
		$(".insertQuestion").prop("disabled", false);
	}			
});
$(".Qestion_Text").blur(function(){
	$(".Qestion_Text").removeClass("color-green");
	$(".Qestion_Text").removeClass("color-red");
	if($(".Qestion_Text").val()==''){
		$(".Qestion_Text").addClass("color-red");
		$(".insertQuestion").prop("disabled", true);
	}
	else{
		$(".Qestion_Text").addClass("color-green");	
		$(".insertQuestion").prop("disabled", false);
	}			
});
</script>
</html>