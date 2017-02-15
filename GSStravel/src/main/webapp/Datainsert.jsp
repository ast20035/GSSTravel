<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
	
	
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
<title>Insert title here</title>
</head>
<body>

	<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />
    <script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>
<div class='container'>

<%@include file="SelectBar.jsp" %>
<form  action=<c:url value="/FamilyServlet"/>  method="post">

<table>
	
		<tr>  <td>員工編號</td>  <td>${empno}</td></tr>
		<tr>  <td>姓名</td>  <td>${empname}</td></tr>
		<tr>  <td>手機</td>  <td><input type="text" name ="empphone" id="empphone"  value="${empphone}"> <div id=empphoneerror>${error.empphone}</div> </td></tr>
		<tr>  <td>保險受益人</td> <td><input type="text" name ="empben" id="empben" value ="${empben}"><div id=empbenerror>${error.empben}</div> </td></tr>
		<tr>  <td>與受益人關係</td> <td><input type="text" name ="empbenrel" id="empbenrel" value = "${empbenrel}"><div id=empbenrelerror>${error.empbenrel}</div> </td></tr>
		<tr>  <td>緊急聯絡人</td> <td><input type="text" name ="empemg" id="empemg" value = "${empemg}" ><div id=empemgerror>${error.empemg}</div> </td></tr>
		<tr>  <td>緊急聯絡人電話</td> <td><input type="text" name ="empemgphone" id="empemgphone" value="${empemgphone}"><div id=empemgphoneerror>${error.empemgphone}</div> </td></tr>
		<tr>  <td>信箱</td><td><input type="text" name="empemail" id="empemail" value="${empemail}"><div id=empemailerror>${error.empemailerror}</div></td></tr>
		<tr>  <td>用餐</td>
			<td><select name ="empeat">
				<c:if test="${empeat=='葷'}">
					<option  value="葷" selected>葷</option>
					<option  value="素">素</option>
				</c:if>
				<c:if test="${empeat=='素'}">
					<option  value="葷" >葷</option>
					<option  value="素" selected>素</option>
				</c:if>
				</select>
				(如有特別要求請填寫於備註)
			</td>
		</tr>
		
		<tr>  <td>備註</td>  <td><input type="text" name ="empnote" id="empnote" value="${empnote}" ><div id=empnoteerror></div></td></tr>
	
</table>

<div>
－眷屬親友資訊－<br>
*眷屬包含直系及旁系二等親，納入補助計算<br>
*親友為旁系三等親以上及朋友，不納入補助計算<br>
</div>


<table id="familytable">
<tr >
	<th></th>
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
		
	<c:if test="${famstartsize>0}">

	<c:forEach var="start" items="${famstart}">
	  <tr>
		<td><input type="submit" name ="delete" id="delete" value="delete"></td>
		<td>
			<select name ="famrel" >	
				<c:if test="${start.fam_Rel=='親友'}">				
					<option value="眷屬" >眷屬</option>
					<option value="親友" selected>親友<option>
				</c:if>
				<c:if test="${start.fam_Rel=='眷屬'}">				
					<option value="眷屬" selected>眷屬</option>
					<option value="親友" >親友<option>
				</c:if>
			</select>
			</td>
		<td><input type="text" name ="famname" id="famname" value="${start.fam_Name}" ><div  class="famnameerror">${error.famneme}</div></td>
		<td><select name ="famsex" >  <!--  servlet抓name db抓值會抓進value值進去-->
		<c:if test="${start.fam_Sex=='男'}">
			<option value="女" >女</option>
			<option value="男" selected>男<option>
		</c:if>
		<c:if test="${start.fam_Sex=='女'}">
			<option value="女" selected>女</option>
			<option value="男" >男<option>
		</c:if>
		</select></td>
		
		<td><input type="text" name ="famid" class="famid" value="${start.fam_Id}"><div class="famiderror">${error.famid}</div></td><!-- getfamid()會抓到value值 -->
		<td><input type="date" id="fambdate" name="fambdate" class="fambdate" value="${start.fam_Bdate}" /><div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div></td>
		<td><input type="text" name ="famphone" id="famphone"  value="${start.fam_Phone}"><div class=famphoneerror>${error.famphone}</div></td>
		<td ><select name ="fameat" >  <!-- 今天的日期 減去 他的生日 < 三歲  (剩幾天?) (看年底還是年初)  看年?  -->
			<c:if test="${start.fam_Eat=='葷'}">
				<option value="葷" selected>葷食</option>
				<option value="素">素食</option>
			</c:if>
			<c:if test="${start.fam_Eat=='素'}">
				<option value="葷" >葷</option>
				<option value="素" selected>素</option>
			</c:if>
			</select>
 			
	 			<c:if test="${start.fam_Car=='true'}">
					<input id="${start.fam_No}_car" name="famcar" type="checkbox" value="true"  checked><div>占車位</div>
				</c:if>
				<c:if test="${start.fam_Car=='false'}">
					<input id="${start.fam_No}_car" name="famcar" type="checkbox" value="true" ><div>占車位</div>
				</c:if>
				
			</td>
		
		<td><select class="multiselect aaa" name ="famspa"  multiple="multiple" data-placeholder="請選擇" style="width: 200px;">
		    
		     <c:if test="${start.fam_Bady=='false'}">
		     <option value="baby">幼童(0~3歲)</option>
			 </c:if>
			 <c:if test="${start.fam_Bady}">
			 <option id="${start.fam_No}_span_1" value="baby" Selected>幼童(0~3歲)</option>
			 </c:if>
			 <script>
			 	console.log('${start.fam_No}_span_1');
			 </script>
			 
			 <c:if test="${start.fam_kid=='false'}">
		     <option value="kid">兒童(4~11歲)</option>
			 </c:if>
			 <c:if test="${start.fam_kid}">	 
			 <option value="kid" Selected>兒童(4~11歲)</option>
			 </c:if>
			 		 
		      <c:if test="${start.fam_Dis=='false'}">
		     <option  value="dis">持身心障礙手冊</option>
		     </c:if>
		      <c:if test="${start.fam_Dis}">
		     <option value="dis" Selected>持身心障礙手冊</option>
		     </c:if>
		     <c:if test="${start.fam_Mom=='false'}">
		     <option value="mom">孕婦(媽媽手冊)</option>
		      </c:if>
		      <c:if test="${start.fam_Mom}">
		     <option value="mom" Selected>孕婦(媽媽手冊)</option>
		      </c:if>
		     </select>
		</td>
		
		<td><input type="text" name ="famben" id="famben" value="${start.fam_Ben}"><div class="fambenerror">${error.famben}</div></td>
		<td><input type="text" name ="fambenrel" id="fambenrel" value="${start.fam_BenRel}" ><div class="fambenrelerror">${error.fambenrel}</div></td>
		<td><input type="text" name ="famemg" id="famemg" value="${start.fam_Emg}"><div class="famemgerror">${error.famemg}</div></td>
		<td><input type="text" name ="famemgphpone" id="famemgphone" value="${start.fam_EmgPhone}"><div class="famemgphoneerror">${error.famemgphone}</div></td>
		<td><input type="text" name ="famemgrel" id="famemgrel" value="${start.fam_EmgRel}"><div class="famemgrelerror">${error.famemgrel}</div ></td>
		<td><input type="text" name ="famnote" id="famnote" value="${start.fam_Note}"><div class="famnoteerror"></div></td>
	</tr> 
	</c:forEach>
	
	</c:if>

</table>

<!--新增、儲存 -->
<input type="button" value="insert" id="insert" name ="button"><br>
<input type="submit" value ="save" id="save" name="button"><br>

</form>

	<table>
	<!-- 空白欄位 -->
	<tr name="repeat">
		<td><input type="submit" name ="delete" id="delete" value="delete"></td>
		<td>
			<select name ="famrel" >		
					<option value="眷屬" >眷屬</option>
					<option value="親友" >親友<option>
			</select>
			</td>
		<td><input type="text" name ="famname" id="famname"  ><div class="famnameerror">${error.famneme}</div></td>
		<td><select name ="famsex">  <!--  servlet抓name db抓值會抓進value值進去-->
			<option value="女" >女</option>
			<option value="男" >男<option>
		</select></td>
		<td><input type="text" name ="famid"  class="famid"><div class="famiderror">${error.famid}</div></td>
		<td><input type="date" id="fambdate" name="fambdate" class="fambdate" /><div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div></td>
		<td><input type="text" name ="famphone" id="famphone"  >  <div class=famphoneerror>${error.famphone}</div></td> 
		<td><select name ="fameat">
				<option value="葷" >葷</option>
				<option value="素" >素</option>
			</select>
			<input name="check1" type="checkbox" value="true" ><div>占車位</div>
 		</td>
		<td>
			<select  name ="famspa"  id="multiselect"  multiple="multiple" data-placeholder="請選擇" style="width: 200px;">
		     <option >幼童(0~3歲)</option>
		     <option>兒童(4~11歲)</option>
		     <option>持身心障礙手冊</option>
		     <option>孕婦(媽媽手冊)</option>
		     </select>
		</td>
<!-- 		class="multiselect"   id="multiselect"-->
		<td><input type="text" name ="famben" id="famben" ><div class="fambenerror">${error.famben}</div></td>
		<td><input type="text" name ="fambenrel" id="fambenrel"><div class="fambenrelerror">${error.fambenrel}</div></td>
		<td><input type="text" name ="famemg" id="famemg"><div class="famemgerror">${error.famemg}</div ></td>
		<td><input type="text" name ="famemgphpone" id="famemgphone"><div class="famemgphoneerror">${error.famemgphone}</div></td>
		<td><input type="text" name ="famemgrel" id="famemgrel"><div class="famemgrelerror">${error.famemgrel}</div ></td>
		<td><input type="text" name ="famnote" id="famnote"><div class="famnoteerror"></div></td>
	</tr>
	</table>

<script>

$(function(){
	$(".multiselect").kendoMultiSelect({autoClose: false});
	$("tr[name='repeat']").hide();
	$("#familytable").attr("width","1200px").attr("border","3px").attr("border-collapse","collapse");
	
	$("#insert").click(
		function(event){
			$("#familytable").append('<tr class=repeat>'+ $("tr[name='repeat']").html()+'</tr>');
			$(".repeat:last #multiselect").kendoMultiSelect({autoClose: false});
// 			新增的欄位作正規劃
			var famname=/^.*\s*[^\s]/;
			$(".repeat td").on("blur","input[name='famname']",function(){if(famname.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			//id
			$(".repeat td").on("blur","input[name='famid']",function (){
			  // 依照字母的編號排列，存入陣列備用。
			  var letters = new Array('A', 'B', 'C', 'D', 
			      'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 
			      'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 
			      'X', 'Y', 'W', 'Z', 'I', 'O');
			  // 儲存各個乘數
			  var multiply = new Array(1, 9, 8, 7, 6, 5, 
			                           4, 3, 2, 1);
			  var nums = new Array(2);
			  var firstChar;
			  var firstNum;
			  var lastNum;
			  var total = 0;
			  // 撰寫「正規表達式」。第一個字為英文字母，
			  // 第二個字為1或2，後面跟著8個數字，不分大小寫。
// 			  var sex = thisTr.find(".sex").val();
// 			  if(sex == "男"){
// 			  var regExpID=/^[a-z](1)\d{8}$/i;
// 			  }else{
// 				  var regExpID=/^[a-z](2)\d{8}$/i;
// 			  }
			 
// 			  var sex=$(".repeat select[name='famsex']").val();
// 			  console.log(sex);
// 			  if(sex =="男"){
// 				  var regExpID=/^[a-z](1)\d{8}$/i;
// 			  }else{
// 				  var regExpID=/^[a-z](2)\d{8}$/i;
// 			  }

			  var regExpID=/^[a-z](1|2)\d{8}$/i;
			  // 使用「正規表達式」檢驗格式
			  if (regExpID.test($("input[name*='famid']").val())){
			    
				// 取出第一個字元和最後一個數字。
					firstChar = $(this).val().charAt(0).toUpperCase();
					lastNum = $(this).val().charAt(9);
			   
			  } else {
				
				$(this).css("border-color","red");
				$("#famiderror").text("身分證格式錯誤");
				$("#save").attr("type","button");
	// 			return false;
			  }
			  // 找出第一個字母對應的數字，並轉換成兩位數數字。
			  for (var i=0; i<26; i++) {
				if (firstChar == letters[i]) {
				  firstNum = i + 10;
				  nums[0] = Math.floor(firstNum / 10);
				  nums[1] = firstNum - (nums[0] * 10);
				  break;
				} 
			  }
			  // 執行加總計算
			  for(var i=0; i<multiply.length; i++){
			    if (i<2) {
			      total += nums[i] * multiply[i];
			    } else {
			      total += parseInt( $(this).val().charAt(i-1)) * 
			               multiply[i];
			    }
			  }
			  // 和最後一個數字比對
			  if ((10 - (total % 10))!= lastNum) {
				  $(this).css("border-color","red");
				  $("#famiderror").text("身分證格式錯誤");
				  $("#save").attr("type","button");
	// 			return false;
			  }else{
					 $(this).css("border-color","green");
					  $("#save").attr("type","submit");
			// 		  return true;
			}})
			var fambdate=/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
			$(".repeat td").on("blur","input[name='fambdate']",function(){if(fambdate.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			var famphone=/^09\d{2}-?\d{3}-?\d{3}$/;
			$(".repeat td").on("blur","input[name='famphone']",function(){if(famphone.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			var famben=/^.*\s*[^\s]/;
			$(".repeat td").on("blur","input[name='famben']",function(){if(famben.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			var fambenrel=/^.*\s*[^\s]/;
			$(".repeat td").on("blur","input[name='fambenrel']",function(){if(fambenrel.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			var famemg=/^.*\s*[^\s]/;
			$(".repeat td").on("blur","input[name='famemg']",function(){if(famemg.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			var famemgphpone=/^09\d{2}-?\d{3}-?\d{3}$/;
			$(".repeat td").on("blur","input[name='famemgphpone']",function(){if(famemgphpone.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			var famemgrel=/^.*\s*[^\s]/;
			$(".repeat td").on("blur","input[name='famemgrel']",function(){if(famemgrel.test($(this).val())){$(this).css("border-color","green");$("#save").attr("type","submit");}else{$(this).css("border-color","red");$("#save").attr("type","button");} });	
			
			//在commit按下後內 判斷把全部欄未能不能不要是空白  
			$("#save").click(function(){
				if($(".repeat td input[name='famname']").val()==""){
					alert("請輸入親屬名稱");
					return false;}
				if($(".repeat td input[name='famid']").val()==""){
					alert("請輸入親屬身份證");
					return false;}
				if($(".repeat td input[name='fambdate']").val()==""){
					alert("請輸入親屬生日");
					return false;}
				if($(".repeat td input[name='famphone']").val()==""){
					alert("請輸入親屬手機");
					return false;}
				if($(".repeat td input[name='famben']").val()==""){
					alert("請輸入親屬保險受益人");
					return false;}
				if($(".repeat td input[name='fambenrel']").val()==""){
					alert("請輸入親屬保險受益人關係");
					return false;}
				if($(".repeat td input[name='famemg']").val()==""){
					alert("請輸入親屬緊急聯絡人");
					return false;}
				if($(".repeat td input[name='famemgphone']").val()==""){
					alert("請輸入親屬緊急聯絡人電話");
					return false;}
				if($(".repeat td input[name='famemgrel']").val()==""){
					alert("請輸入親屬緊急聯絡人關係");
					return false;}
			});
			
		}
	);	
	//刪除鍵按下後
	$("#familytable").on("click","input[name='delete']",function(){
// 		var keyCode = e.keyCode || e.which;
// 		 if (keyCode == 13) {
// 		        return false;
// 		    }//看能不能用
		 $("#familytable input[name='delete']").submit(function(){ $(this).parents("tr").remove();});
		//on事件要綁定動態之後 還得要綁定 submit才可以抓的到值
	});	

	//想改把enter後submit的功能去消            施工中
	$("#save").keypress(function(e){
		var keyCode = e.keyCode || e.which;
		 if (keyCode == 13) {
		        return false;
		    }
	});
	
// }o
			
			
// 	看一下 假如要找到這幾個 的值  根據他的不同的famno的值來判斷是不是true 或是  false (抓checkbox的值)
// 		$("#save").click(
// 				alert( $("input[name='famcar']:checked").length)
//			while(i<10){
//	 				if($("#"+i+"_car").attr("checked")=="true"){
//	 					console.log("xxxx")
//	 				}else{
//	 					console.log("yyyyy");
//					}
//	 				i++
//			};
// 		);
		 
	//抓前端的欄位來送去資料庫比對 看看有沒有重複 或是用新增跟原本的設兩個name來比對看看
// 		  for(i=0;i<=;i++){
// 		  var fambdate =$(".repeat input[name*='fambdate']").
// 		  }
// 		  console.log(fambdate);
// 		  $.post("Register",{})
	  
// 	var xh = new XMLHttpRequest();
// 	search();
	
// 	function search() {
// 		if (xh != null) {
		
// // 		var famidvaule = $(".famid").val();
// 		 var famidvaule= $(".famid").map(function() { 
// 			return $(this).val(); 
// 			}).get();
		
// 		console.log(famidvaule);//["Q250939543","F199131438","F218757856",""]
		
// 		var pathName = document.location.pathname;
// 		var index = pathName.substr(1).indexOf("/");
// 		var result = pathName.substr(0, index + 1);
// 		var url = result + "/controller/FamilyServlet.do?";
// // 		var url = "FamilyServlet.do?"
// 		if(typeof famidvaule != "undefined"){
// 		var famid =JSON.stringify(famidvaule);
// 		console.log(famid);//["Q250939543","F199131438","F218757856",""]
// 		}
		
// 		//轉json 格式? 字串證列  console.log() 輸出   h
				
// 		xh.addEventListener("readystatechange", ajaxReturn);
// 		xh.open("POST",url);
// 		xh.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// 		xh.send("id="+famid);
		
// 		}else {
// 			alert("Your browser doesn't support JSON!");
// 		}
// 	}
// 	function ajaxReturn() {
// 		if (xh.readyState == 4){
// 			if (xh.status == 200) {
// 			 	alert(famid);
			 	
// 			}
// 		}
// 	}
	
	var empphone=/^09\d{2}-?\d{3}-?\d{3}$/;
	$("#empphone").blur(function(){
		if(empphone.test($(this).val())){
			$(this).css("border-color","green")
			$("#empphoneerror").text("");
			$("#save").attr("type","submit");
		}else{
			$("#empphoneerror").text("手機輸入錯誤");
// 			setTimeout(function(){$(this).css("border-color","red");},2000);	
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var empben=/^.*\s*[^\s]/;
	$("#empben").blur(function(){
		if(empben.test($(this).val())){
			$(this).css("border-color","green")
			$("#empbenerror").text("");
			$("#save").attr("type","submit");
			
		}else{
			$("#empbenerror").text("不能為空值");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var empbenrel=/^.*\s*[^\s]/;
	$("#empbenrel").blur(function(){
		if(empbenrel.test($(this).val())){
			$(this).css("border-color","green")
			$("#empbenrelerror").text("");
			$("#save").attr("type","submit");
			
		}else{
			$("#empbenrelerror").text("不能為空值");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var empemg=/^.*\s*[^\s]/;
	$("#empemg").blur(function(){
		if(empemg.test($(this).val())){
			$(this).css("border-color","green")
			$("#empemgerror").text("");
			$("#save").attr("type","submit");
			
		}else{
			$("#empemgerror").text("不能為空值");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var empemgphone=/^09\d{2}-?\d{3}-?\d{3}$/;
	$("#empemgphone").blur(function(){
		if(empemgphone.test($(this).val())){
			$(this).css("border-color","green")
			$("#empemgphoneerror").text("");
			$("#save").attr("type","submit");
			
		}else{
			$("#empemgphoneerror").text("不符合手機規則");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var empemail=/([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})/;
	$("#empemail").blur(function(){
		if(empemail.test($(this).val())){
			$(this).css("border-color","green")
			$("#empemailerror").text("");
			$("#save").attr("type","submit");
			
		}else{
			$("#empemailerror").text("不符合手機規則");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	})
	
	var famname=/^.*\s*[^\s]/;
	$("input[name*='famname']").on("blur",function(){
		if(famname.test($(this).val())){
			$(this).css("border-color","green")
			$(".famnameerror").text("");
			$("#save").attr("type","submit");
			
		}else{
			//後面用append加一個h4 或什麼 來顯示錯誤訊息  新增的抓不到正規劃  正規劃錯誤後要不能新增進去
			$(this).css("border-color","red");
			$("#save").attr("type","button");
// 			$(".famnameerror").text("錯誤");
// 			$(this).after("<div>錯誤</div>"); //多按一次新增一次
			
		}
	});

	
	$("input[name*='famid']").on("blur",
			function (){
		  // 依照字母的編號排列，存入陣列備用。
		  var letters = new Array('A', 'B', 'C', 'D', 
		      'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 
		      'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 
		      'X', 'Y', 'W', 'Z', 'I', 'O');
		  // 儲存各個乘數
		  var multiply = new Array(1, 9, 8, 7, 6, 5, 
		                           4, 3, 2, 1);
		  var nums = new Array(2);
		  var firstChar;
		  var firstNum;
		  var lastNum;
		  var total = 0;
		  // 撰寫「正規表達式」。第一個字為英文字母，
		  // 第二個字為1或2，後面跟著8個數字，不分大小寫。
		  var regExpID=/^[a-z](1|2)\d{8}$/i; 
		  // 使用「正規表達式」檢驗格式
		  if (regExpID.test($("input[name*='famid']").val())){
		    
			// 取出第一個字元和最後一個數字。
				firstChar = $(this).val().charAt(0).toUpperCase();
				lastNum = $(this).val().charAt(9);
		   
		  } else {
			
			$(this).css("border-color","red");
			$("#famiderror").text("身分證格式錯誤");
			$("#save").attr("type","button");
// 			return false;
		  }
		  // 找出第一個字母對應的數字，並轉換成兩位數數字。
		  for (var i=0; i<26; i++) {
			if (firstChar == letters[i]) {
			  firstNum = i + 10;
			  nums[0] = Math.floor(firstNum / 10);
			  nums[1] = firstNum - (nums[0] * 10);
			  break;
			} 
		  }
		  // 執行加總計算
		  for(var i=0; i<multiply.length; i++){
		    if (i<2) {
		      total += nums[i] * multiply[i];
		    } else {
		      total += parseInt( $(this).val().charAt(i-1)) * 
		               multiply[i];
		    }
		  }
		  // 和最後一個數字比對
		  if ((10 - (total % 10))!= lastNum) {
			  $(this).css("border-color","red");
			  $("#famiderror").text("身分證格式錯誤");
			  $("#save").attr("type","button");
// 			return false;
		  }else{
		  $(this).css("border-color","green");
		  $("#save").attr("type","submit");
// 		  return true;
		}})
	
	
	var fambdate=/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
	$("input[name*='fambdate']").on("blur",function(){
		if(fambdate.test($(this).val())){
			$(this).css("border-color","green")
			$("#fambdateerror").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#fambdateerror").text("需要為年-月-日的規格");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var famphone=/^09\d{2}-?\d{3}-?\d{3}$/;
	$("input[name*='famphone']").on("blur",function(){
		if(famphone.test($(this).val())){
			$(this).css("border-color","green")
			$("#famnameerrror").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#famnameerror").text("不符和手機規則");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var famben=/^.*\s*[^\s]/;
	$("input[name*='famben']").on("blur",function(){
		if(famben.test($(this).val())){
			$(this).css("border-color","green")
			$("#fambenerror").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#fambenerror").text("需要為中文");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var fambenrel=/^.*\s*[^\s]/;
	$("input[name*='fambenrel']").on("blur",function(){
		if(fambenrel.test($(this).val())){
			$(this).css("border-color","green")
			$("#fambenrelerror").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#fambenrelerror").text("需要為中文");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var famemg=/^.*\s*[^\s]/;
	$("input[name*='famemg']").on("blur",function(){
		if(famemg.test($(this).val())){
			$(this).css("border-color","green")
			$("#famemgerror").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#famemgerror").text("需要為中文");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var famemgphpone=/^09\d{2}-?\d{3}-?\d{3}$/;
	$("input[name*='famemgphpone']").on("blur",function(){
		if(famemgphpone.test($(this).val())){
			$(this).css("border-color","green")
			$("#famemgphoneerror").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#famemgphoneerror").text("不符合手機規則");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	var famemgrel=/^.*\s*[^\s]/;
	$("input[name*='famemgrel']").on("blur",function(){
		if(famemgrel.test($(this).val())){
			$(this).css("border-color","green")
			$("#famemgrel").text("");
			$("#save").attr("type","submit");
		}else{
// 			$("#famemgrel").text("不符合手機規則");
			$(this).css("border-color","red");
			$("#save").attr("type","button");
		}
	});
	
	
	
});

	
</script>

</div>
</body>
</html>