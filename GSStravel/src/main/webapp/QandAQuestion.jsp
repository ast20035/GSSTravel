<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<head>
<style type="text/css">
#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.2;
		height:100%;
		width: 100%;
	}
.color-red {
	border-color: red
}

.color-green {
	border-color: green
}
th{
padding: 2px;
vertical-align: top;
}
textarea{
resize: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我要提問</title>
</head>
<body>
	<form action="<c:url value='/QandAInsertServlet'/>" method="POST">
		<input type="hidden" name="Question_No" value="<%=session.getAttribute("emp_No")%>">
		<table>
			<tr>
				<th colspan="2"><select name='Select' class='form-control'
					style='width: 160px;'>
						<c:forEach var="list" items="${list}">
							<option>${list.tra_NO}</option>
						</c:forEach>
				</select></th>
			</tr>
			<tr>
				<th>標題</th>
				<th><input type="text" class="Qestion_Title form-control" style='width:200px;'
					name="Qestion_Title"></th>
			</tr>
			<tr>
				<td colspan="2">
					<input type="radio" name="radio" value="false" checked="checked">公開
					<input type="radio" name="radio" value="true">私密
				</td>
			</tr>
			<tr>
				<th>留言內容</th>
				<th><textarea class="Qestion_Text form-control" cols="12" rows="6" name="Qestion_Text"></textarea></th>
			</tr>
		</table>
		<br>
		<button class='btn btn-primary' type="submit" class="insertQuestion"
			name="prodaction" value="insertQuestion">提問</button>
		<button class='btn btn-primary' type="button"
			onclick="window.location = '/GSStravel/QandAServlet?role=false';">回上一頁</button>
	</form>
	<img src="images/Travel.jpg" id="backPic">
</body>
<script type="text/javascript">
if(${Msg!=null}){
	alert("${Msg.message}");
}
$(".Qestion_Title").blur(function(){
	$(".Qestion_Title").removeClass("color-green");
	$(".Qestion_Title").removeClass("color-red");
	if($(".Qestion_Title").val()==''){
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