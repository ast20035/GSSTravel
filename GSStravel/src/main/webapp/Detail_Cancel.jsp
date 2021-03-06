<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>報名取消</title>

<style>
#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.4;
		height:100%;
		width: 100%;
	}
fieldset {
	width: 250px;
	border-radius: 20px;
	margin: auto;
}
</style>

</head>
<body>
	<div class='container-fluid'>
		<br />
		<form action=<c:url value="/detail"/> method="get"
			enctype="multipart/form-data">
			<fieldset>
				請輸入取消原因： <br />
				<textarea style="width: 250px; height: 100px; resize: none" class='det_CanNote form-control'
					name="det_CanNote"></textarea>
				<br /> <input type="text" id="can_detNo" name="can_detNo" class='btn btn-primary'
					style="display: none"> <input type="text" id="can_traNo" class='btn btn-primary'
					name="can_traNo" style="display: none"> <br /> <input class='btn_Can btn btn-primary'
					name="prodaction" type="submit" value="送出">
				<button name="canClose" type="button" onclick="window.close()" class='btn btn-primary'>關閉</button>

				<p style="color: red" hidden><%=session.getAttribute("DetCanError")%></p>
			</fieldset>
		</form>
		<script type="text/javascript">
var tra_No;
$(function () {
	var temp = location.search;
	var index = temp.indexOf("can_detNo=");
	var index2 = "can_detNo".length+1;
	var det_No = temp.substring(index+index2);
	var index3 = det_No.indexOf("&can_traNo");
	
	var index4 = temp.indexOf("can_traNo=");
	var index5 = "can_traNo".length+1;
	tra_No = temp.substring(index4+index5);
	var index6 = tra_No.indexOf("&prodaction");
	
	if(index3>=0){
		$("#can_detNo").attr("value",det_No.slice(0,index3));
	}else{
		$("#can_detNo").attr("value",det_No);
	}
	
	if(index6>=0){
		$("#can_traNo").attr("value",tra_No.slice(0,index6));
	}else{
		$("#can_traNo").attr("value",tra_No);
	}

	//字數判斷，不能為空、不超過50字
	$(".det_CanNote").blur(function(){
		if($(this).val().length>0 && $(this).val().length<=50){
			$(this).css("border-color","green")
			$(".btn_Can").attr("type","submit");
		}else{
			$(this).css("border-color","red");
			$(".btn_Can").attr("type","button");
		}
	});

	 $(".btn_Can").click(function () {
		 if(this.type=='button'){
			 alert("取消失敗！");
		 }
	 });
	
});

var DetCanError="<%=session.getAttribute("DetCanError")%>";
<%session.removeAttribute("DetCanError");%>
if(DetCanError!="null"){
	$("p").show();
}
</script>
	</div>
	<img src="images/Travel.jpg" id="backPic">
</body>
</html>