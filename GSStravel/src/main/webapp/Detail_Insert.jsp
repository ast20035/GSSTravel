<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報名明細新增</title>

<style>
*,div{
	text-align: center;
	margin:0 auto;
}
input{
width:150px;
}
.center_a{
	text-align: center;
	border: 0;
	resize: none;
	font-size: 15px;
	overflow-y: visible;
	outline: none;
}
</style>
<script src="js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h2>－報名明細新增－</h2>
<form action=<c:url value="/detail_insert"/> method="post">
<p>報名活動代碼：${tra_no}</p>
<input type="hidden" name="tra_no" class="tra_no" value="${tra_no}">
<table border="1">
		<tr>
			<th>員工編號</th>
			<th>報名人姓名</th>
			<th>報名總金額</th>
		</tr>
		<tr>
			<td><input type="text" id="emp_No" name="emp_No" onblur="select_emp_No()" onfocus="clearName()"></td>
			<td><select id="select" name="select" onchange="checkbox()"></select></td>
			<td><input type="text" id="money" name="money" class="money" value="${money}" readonly></td>
		</tr>
</table>
<p class="p"></p>
<br />
<div class="div" style="display:none">
	<table border="1" style="test-font:10px" width="150%">
		<tr>
			<th><em style="color: red">*</em>眷屬/親友</th>
			<th><em style="color: red">*</em>姓名</th>
			<th><em style="color: red">*</em>性別</th>
			<th><em style="color: red">*</em>身份證字號</th>
			<th><em style="color: red">*</em>生日</th>
			<th><em style="color: red">*</em>手機</th>
			<th>用餐/車位</th>
			<th>特殊身份</th>
			<th><em style="color: red">*</em>保險受益人</th>
			<th><em style="color: red">*</em>保險受益人關係</th>
			<th><em style="color: red">*</em>緊急聯絡人</th>
			<th><em style="color: red">*</em>緊急聯絡人電話</th>
			<th><em style="color: red">*</em>緊急聯絡人關係</th>
			<th>備註</th>
		</tr>
		<tr>
			<td>
				<select name="fam_Rel" class="center_a">
					<option>眷屬</option>
					<option>親友</option>
				</select>
			</td>
			<td><input type="text" id="fam_Name" name="fam_Name" class="center_a" placeholder="請填寫">
			<td>
				<select name="fam_Sex" >
					<option>男</option>
					<option>女</option>
				</select>
			</td>
			<td><input type="text" name="fam_Id" class="center_a" placeholder="請填寫"></td>
			<td><input type="date" name="fam_Bdate" class="center_a" placeholder="請填寫"></td>
			<td><input type="text" name="fam_Phone" class="center_a" placeholder="請填寫"></td>
			<td>
				<select name="fam_Eat" class="center_a">
					<option>葷</option>
					<option>素</option>
					<option>不佔餐</option>
				</select>
				<div style="font-size: 13px;" class="center_a" placeholder="請填寫" >
					<input name="fam_Car" type="checkbox" value="不占車位" style="vertical-align:middle;">不占車位
				</div>
			</td>
			<td>
				 <select class="multiselect center_a" name ="fam_spa" id="multiselect" data-placeholder="請選擇" multiple="multiple" style="width: 200px;">
			     	<option>幼童(0~3歲)</option>
				 	 <option>兒童(4~11歲)</option>
					 <option>持身心障礙手冊</option>
				     <option>孕婦(媽媽手冊)</option>
				</select>
			</td>
			<td><input type="text" name="fam_Ben" class="center_a" placeholder="請填寫"></td>
			<td><input type="text" name="fam_BenRel" class="center_a" placeholder="請填寫"></td>
			<td><input type="text" name="fam_Emg" class="center_a" placeholder="請填寫"></td>
			<td><input type="text" name="fam_EmgPhone" class="center_a" placeholder="請填寫"></td>
			<td><input type="text" name="fam_EmgRel" class="center_a" placeholder="請填寫"></td>
			<td><input type="text" name="fam_note" class="center_a" ></td>
		</tr>
		
	</table>
</div>
<br />
<c:if test="${fn:length(room)!=0}">
	<div>
	<table border="1">
		<tr>
			<th>請選擇</th>
			<th>房型</th>
			<th>費用</th>
		</tr>
		<c:forEach var="list" items="${room}">
		<tr>
			<td><input type="checkbox" class="checkbox" value="${list.item_No}" onclick="checkedA()"></td>
			<td><input type="text" class="line" value="${list.item_Name}" readonly></td>
			<td><input type="text" class="line ${list.item_No}" value="${list.item_Money}" readonly></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</c:if>
<p style="color:red" class="Error"></p>
<p class="nofam"></p>
<br />
<input type="submit" name="prodaction" value="儲存">
<input type="submit" name="prodaction" value="回前頁">
</form>
</body>
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />

<script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
	
<script>
$(".multiselect").kendoMultiSelect({autoClose: false});
function select_emp_No(){
	$.ajax({
		type:"post",
		url:"/GSStravel/DetailInsertSelectServlet",
		data:{	emp_No:$("#emp_No").val(),
				tra_No:$(".tra_no").val()
			},
		datatype:'json',
		success:function(data){
			var Msg = jQuery.parseJSON(data);
			$(".Error").html(Msg.InError);
			if(Msg.emp_Name!=null){
				$("#select").append($("<option></option>").attr("class", 'emp_name').text(Msg.emp_Name));
			}
			if(Msg.fam_No){
				insertnewfam(Msg.fam_No);
			}
			$(".name").val(Msg.emp_Name);
			if(Msg.fam_Name!=null){
				var fam_Name=jQuery.parseJSON(Msg.fam_Name);
				$.each(fam_Name,function(key,value){
					$("#select").append($("<option></option>").attr("class",'fam_name').text(fam_Name[key]));
				});
			}
			if(Msg.emp_Max){
				alert(Msg.emp_Max);				
			}
		}
	})
}
function clearName(){
	$('.Error').text(''); 
	$('.nofam').text('');
	$("#select option").remove();
	$(".div").hide();
}
function insertnewfam(nofam){
	if(confirm(nofam)){
		$(".div").show();
		$(".multiselect").prop("id","multiselect");
	}
}
function checkedA(){
	var money=Number(${money});
	var $checkbox = $(".checkbox:checked");
	var sum=Number(0);
	$.each($checkbox, function(key,value){
		sum=sum+Number($("."+$checkbox[key].value).val());
	});
	money=money+sum;
	$(".money").val(money);
}
var Error =<%=session.getAttribute("DataError")%>;
<% session.removeAttribute("DataError");%>
if(Error!="null"){
	$(".Error").html(Msg.Error);
}
</script>
</html>