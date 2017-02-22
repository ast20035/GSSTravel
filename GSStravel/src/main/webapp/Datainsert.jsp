<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>


<html>
<head>
<style>
tr>td {
	padding-top: 3px;
	padding-bottom: 3px;
	padding-right: 10px;
}

td>input[type=text] {
	width: 220px;
}
</style>
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

	<link rel="stylesheet"
		href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
	<link rel="stylesheet"
		href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
	<link rel="stylesheet"
		href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />
	<script
		src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>

	<%@include file="SelectBar.jsp"%>
	<script>
		$('li').removeClass('now');
		$('li:eq(1)').addClass('now');
	</script>

	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>資料輸入</h2>
			</div>
		</div>
		<br>
		<form action=<c:url value="/FamilyServlet"/> method="post">
			<div class='row'>
				<div class='col-md-1'></div>
				<div class='col-md-3'>
					<table>
						<tr>
							<td>
									<span class="input-group-addon info" >員工編號</span></td><td>
									<input type='text' class='form-control' readonly
										 value='${empno}' />
								</td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >姓名</span></td><td>
									<input type='text' class='form-control' readonly
										value='${empname}'  />
								</td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >手機</span></td><td>
									<input type="text" name="empphone" id="empphone"
										class='form-control' autofocus
										 value="${empphone}">
								
								<div id=empphoneerror>${error.empphone}</div></td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >保險受益人</span></td><td>
									<input type="text" name="empben" id="empben"
										class='form-control'
										value="${empben}">
								
								<div id=empbenerror>${error.empben}</div></td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info">與受益人關係</span></td><td>
									<input type="text" name="empbenrel" id="empbenrel"
										class='form-control' 
										value="${empbenrel}">
								
								<div id=empbenrelerror>${error.empbenrel}</div></td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >緊急聯絡人</span></td><td>
									<input type="text" name="empemg" id="empemg"
										class='form-control'
										value="${empemg}">
								
								<div id=empemgerror>${error.empemg}</div></td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >緊急聯絡人電話</span></td><td>
									<input type="text" name="empemgphone" id="empemgphone"
										class='form-control' 
										value="${empemgphone}">
								
								<div id=empemgphoneerror>${error.empemgphone}</div></td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >信箱</span></td><td>
									<input type="text" name="empemail" id="empemail"
										class='form-control' 
										value="${empemail}">
								
								<div id=empemailerror>${error.empemailerror}</div></td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >用餐</span></td><td>
									<select name="empeat" 
										class='form-control'>
										<c:if test="${empeat=='葷'}">
											<option value="葷" selected>葷</option>
											<option value="素">素</option>
										</c:if>
										<c:if test="${empeat=='素'}">
											<option value="葷">葷</option>
											<option value="素" selected>素</option>
										</c:if>
									</select> (如有特別要求請填寫於備註)
								</td>
						</tr>
						<tr>
							<td>
									<span class="input-group-addon info" >備註</span></td><td>
									<input type="text" name="empnote" id="empnote"
										 class='form-control'
										value="${empnote}">
								
								<div id=empnoteerror></div></td>
						</tr>
					</table>
					<div>
						－眷屬親友資訊－<br> *眷屬包含直系及旁系二等親，納入補助計算<br>
						*親友為旁系三等親以上及朋友，不納入補助計算<br> <br>
						<!--新增、儲存 -->
					<input type="button" value="新增欄位" id="insert" name="button" class='btn btn-primary'> <span>${error.famblock}</span> 
					<input type="button" value="儲存" class='btn btn-primary' id="save" name="button">
					<input type="hidden" value="checkbox" id="checkbox" name="checkbox">
					<input type="hidden"  id="errorcount" name="errorcount">
<!-- 					<div id="errormsg" name="errormsg"></div> -->
						
					</div>
				</div>
			</div>
			<br>
			<div class='row'>
				<div class='col-md-1'></div>
				<div class='col-md-11'>
					<table id="familytable" class=' table table-bordered'>
						<tr>
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
									<td><input type="button" name="delete" id="delete"
										value="delete" class="${start.fam_Id} btn btn-success"></td>

									<td><select name="famrel" class='form-control'
										style="width: 80px;">
											<c:if test="${start.fam_Rel=='親友'}">
												<option value="眷屬">眷屬</option>
												<option value="親友" selected>親友</option>
											</c:if>
											<c:if test="${start.fam_Rel=='眷屬'}">
												<option value="眷屬" selected>眷屬</option>
												<option value="親友">親友</option>
											</c:if>
									</select></td>
									<td><input type="text" name="famname" id="famname" style='width:90px;'
										class='form-control' value="${start.fam_Name}">
										<div class="famnameerror" name="famnameerror">${error.famneme}</div></td>
									<td><select name="famsex" class='form-control' style='width:70px;'>
											<!--  servlet抓name db抓值會抓進value值進去-->
											<c:if test="${start.fam_Sex=='男'}">
												<option value="女">女</option>
												<option value="男" selected>男</option>
											</c:if>
											<c:if test="${start.fam_Sex=='女'}">
												<option value="女" selected>女</option>
												<option value="男">男</option>
											</c:if>
									</select></td>

									<td><input type="text" name="famid" style='width:110px;'
										class="famid form-control" value="${start.fam_Id}">
										<div class="famiderror" name="famiderror">${error.famid}</div></td>
									<td><input type="date" id="fambdate" name="fambdate" style='width:170px;'
										class="fambdate form-control" value="${start.fam_Bdate}" />
										<div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div></td>
									<td><input type="text" name="famphone" id="famphone" style='width:90px;'
										class='form-control' value="${start.fam_Phone}">
										<div class=famphoneerror>${error.famphone}</div></td>
									<td><select name="fameat" style='width: 100px;'
										class='form-control'>
											<!-- 今天的日期 減去 他的生日 < 三歲  (剩幾天?) (看年底還是年初)  看年?  -->
											<c:if test="${start.fam_Eat=='葷'}">
												<option value="葷" selected>葷</option>
												<option value="素">素</option>
												<option value="不佔餐">不佔餐</option>
											</c:if>
											<c:if test="${start.fam_Eat=='素'}">
												<option value="葷">葷</option>
												<option value="素" selected>素</option>
												<option value="不佔餐">不佔餐</option>
											</c:if>
											<c:if test="${start.fam_Eat=='不佔餐'}">
												<option value="葷">葷</option>
												<option value="素">素</option>
												<option value="不佔餐" selected>不佔餐</option>
											</c:if>
									</select> <c:if test="${start.fam_Car=='true'}">
											<input id="${start.fam_No}_car" name="famcar" type="checkbox"
												value="off" class="${start.fam_No}" >
											<span>不占車位</span>
										</c:if> <c:if test="${start.fam_Car=='false'}">
											<input id="${start.fam_No}_car" name="famcar" type="checkbox"
												value="off" class="${start.fam_No}" Checked>
											<span>不占車位</span>
										</c:if></td>
									<td><div class='select'>
											<select class="multiselect aaa form-control" name="famspa"
												style='width: 350px;' multiple="multiple"
												data-placeholder="請選擇">

												<c:if test="${start.fam_Bady=='false'}">
													<option value="baby">幼童(0~3歲)</option>
												</c:if>
												<c:if test="${start.fam_Bady}">
													<option id="${start.fam_No}_span_1" value="baby" Selected>幼童(0~3歲)</option>
												</c:if>
												<c:if test="${start.fam_kid=='false'}">
													<option value="kid">兒童(4~11歲)</option>
												</c:if>
												<c:if test="${start.fam_kid}">
													<option value="kid" Selected>兒童(4~11歲)</option>
												</c:if>

												<c:if test="${start.fam_Dis=='false'}">
													<option value="dis">持身心障礙手冊</option>
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
										</div></td>

									<td><input type="text" name="famben" id="famben" style='width:90px;'
										class='form-control' value="${start.fam_Ben}">
										<div class="fambenerror">${error.famben}</div></td>
									<td><input type="text" name="fambenrel" id="fambenrel" style='width:90px;'
										class='form-control' value="${start.fam_BenRel}">
										<div class="fambenrelerror">${error.fambenrel}</div></td>
									<td><input type="text" name="famemg" id="famemg" style='width:90px;'
										class='form-control' value="${start.fam_Emg}">
										<div class="famemgerror">${error.famemg}</div></td>
									<td><input type="text" name="famemgphpone" style='width:90px;'
										class='form-control' id="famemgphone"
										value="${start.fam_EmgPhone}">
										<div class="famemgphoneerror">${error.famemgphone}</div></td>
									<td><input type="text" name="famemgrel" id="famemgrel" style='width:90px;'
										class='form-control' value="${start.fam_EmgRel}">
										<div class="famemgrelerror">${error.famemgrel}</div></td>
									<td><input type="text" name="famnote" id="famnote" style='width:200px;'
										class='form-control' value="${start.fam_Note}">
										<div class="famnoteerror"></div></td>
								</tr>
							</c:forEach>

						</c:if>

					</table>
				</div>
			</div>
		</form>
	</div>

	<table class='table table-bordered'>
		<!-- 空白欄位 -->
		<tr name="repeat">
			<td><input type="button" name="delete" id="delete"
				class='btn btn-success' value="delete" class="block"></td>
			<td><select name="famrel" class='form-control'>
					<option value="眷屬">眷屬</option>
					<option value="親友">親友</option>
			</select></td>
			<td><input type="text" name="famname" id="famname"
				class='form-control'>
				<div class="famnameerror" name="famnameerror">${error.famneme}</div></td>
			<td><select name="famsex" class='form-control'>
					<!--  servlet抓name db抓值會抓進value值進去-->
					<option value="女">女</option>
					<option value="男">男</option>
			</select></td>
			<td><input type="text" name="famid" class="famid form-control">
				<div class="famiderror" name="famiderror">${error.famid}</div></td>
			<td><input type="date" id="fambdate" name="fambdate"
				class="fambdate form-control" />
				<div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div></td>
			<td><input type="text" name="famphone" id="famphone"
				class='form-control'>
				<div class=famphoneerror>${error.famphone}</div></td>
			<td><select name="fameat" style='width: 100px;'
				class='form-control'>
					<option value="葷">葷</option>
					<option value="素">素</option>
					<option value="不佔餐">不佔餐</option>
			</select> <input name="famcar" type="checkbox" value="off"
				class="${start.fam_No}"> <span>不占車位</span></td>
			<td><div class='select'>
					<select name="famspa" id="multiselect" multiple="multiple"
						class='form-control select' data-placeholder="請選擇">
						<option>幼童(0~3歲)</option>
						<option>兒童(4~11歲)</option>
						<option>持身心障礙手冊</option>
						<option>孕婦(媽媽手冊)</option>
					</select>
				</div></td>
			<!-- 		class="multiselect"   id="multiselect"-->
			<td><input type="text" name="famben" id="famben"
				class='form-control'>
				<div class="fambenerror">${error.famben}</div></td>
			<td><input type="text" name="fambenrel" id="fambenrel"
				class='form-control'>
				<div class="fambenrelerror">${error.fambenrel}</div></td>
			<td><input type="text" name="famemg" id="famemg"
				class='form-control'>
				<div class="famemgerror">${error.famemg}</div></td>
			<td><input type="text" name="famemgphpone" id="famemgphone"
				class='form-control'>
				<div class="famemgphoneerror">${error.famemgphone}</div></td>
			<td><input type="text" name="famemgrel" id="famemgrel"
				class='form-control'>
				<div class="famemgrelerror">${error.famemgrel}</div></td>
			<td><input type="text" name="famnote" id="famnote"
				class='form-control'>
				<div class="famnoteerror"></div></td>
		</tr>
	</table>
<script>
			var xh = new XMLHttpRequest();
			
			$("#familytable").on("click", "input[name='delete']",
					function() {
						//$("#familytable input[name='delete']").submit(function(){ $(this).parents("tr").remove();});
						//on事件要綁定動態之後 還得要綁定 submit才可以抓的到值
// 							$("this").blur(searchfamid());
// 							$(this).parents("tr").remove();
							//直接改成submit 讓他重新跳轉頁面不要刪欄位
						//做成只有submit怎麼辦
						
						searchfamid();
						$(this).parents("tr").remove();
						});
			
	
				var famid=0;
			function searchfamid() {//按下delete去找他的famid
				if (xh != null) {
							$("input[name*='delete']").on("click",function(){
								famid=$(this).attr("class");
							});

// 						$("#familytable").on("click", "input[name='delete']",function(){
// 							famid=$(this).attr("class");
// 						})
// 							$("input[name*='delete']").click(function(){
// 								famid=$(this).attr("class");
// 							})
					console.log(famid);
					
					var pathName = document.location.pathname;
					var index = pathName.substr(1).indexOf("/");
					var result = pathName.substr(0, index + 1);
					var url = result + "/FamilyServlet";

// 					if (typeof famid != "undefined") {
// 						var famnojson = JSON.stringify(famid);
// 					}
					xh.addEventListener("readystatechange", famidreturn);
					xh.open("POST", url);
					xh.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					xh.send("famid=" + famid);
				} else {
					alert("Your browser doesn't support JSON!");
				}
			}
			function famidreturn() { //其實不用判斷 原工email有沒有重複  因為原工不會有新增的問題 不用怕重複
				if (xh.readyState == 4) {
					if (xh.status == 200) {
						if (xh.responseText != "") {
							console.log(xh.responseText);		
// 							console.log("親屬尚有在活動報名當中，不可以刪除此親屬資料");						
						}else{
							console.log("直接刪除");
						}
					}
				}
			}
			
			//search方法 在動態新增紐的famid 檢驗法的最下方
			function search() {
				if (xh != null) {
					var famidnew = $(".repeat .famid").map(function() {
						return $(this).val();
					}).get();
					console.log(famidnew);//輸出陣列出來
					// 					console.log(famidold);
					var pathName = document.location.pathname;
					var index = pathName.substr(1).indexOf("/");
					var result = pathName.substr(0, index + 1);
					var url = result + "/FamilyServlet";//為servlet最上面的@WebServlet 路徑

					if (typeof famidnew != "undefined") {
						var id = JSON.stringify(famidnew);
						console.log(id);//轉成json格式
					}
					//轉json 格式? 字串證列
					xh.addEventListener("readystatechange", ajaxReturn);
					xh.open("POST", url);
					xh.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					xh.send("id=" + id);

				} else {
					alert("Your browser doesn't support JSON!");
				}
			}
			function ajaxReturn() {
				if (xh.readyState == 4) {
					if (xh.status == 200) {
						if (xh.responseText != "") {
// 							var ajaxreturn = xh.responseText;
// 							console.log(ajaxreturn);
							//查一下如果傳回值變成一串 該怎麼拆開 不然就直接寫兩個
							//應該是說有回傳值 而且值等於那個字串 才執行下面的程式	
							$("#save").attr("type", "button");
							$(".repeat td div[name='famiderror']:last").css(
									"border-color", "red");
							$(".repeat td div[name='famiderror']:last").text(
									"身分證字號重複");

						} else {
							$("#save").attr("type", "submit");
							$(".repeat td div[name='famiderror']:last").css(
									"border-color", "green");
							$(".repeat td div[name='famiderror']:last")
									.text("");
						}
					}
				}
			}
			
			console.log($("#familytable select[name='famspa']").length);//抓到的select總共有幾筆
			if($("#familytable select[name='famspa']").length > 0){
				$("#familytable select[name='famspa']").each(function(){
					var famspa =$(this).val();
					
					console.log(famspa);
					console.log(JSON.stringify(famspa));// JSON.stringify 將陣列轉換為 JSON 字串
				});
			}
			
			
				$("#save").click(function(){
					$("#save").attr("type","submit");
// 					if($("input[name*='famname']").val()==""){
// 						alert("親屬姓名不能為空白");
// // 						$("#save").attr("type","button");
// 						$("#errorcount").val(1);
// 					}else if($("input[name*='famid']").val()==""){
// 						alert("親屬身分證不能為空白");
// 						$("#errorcount").val(1);
// 					}
					if($("#errorcount").val()=="1"){
// 					console.log("xxxxxx");
// 					$("#errormsg").text("親屬資料輸入錯誤");
					$("#save").attr("type","button");
					}
					
					if($("#errorcount").val()=="0"){
// 						console.log("yyyyyy")
// 						$("#errormsg").text("");
						
						var idlength= $("#familytable input[name*='famcar']").length;//3
						console.log(idlength);
						var checkbox=[];
						//checkbox.length=idlength;//0 1 2
						
						if($("#familytable input[name='famcar']").length > 0){
							$("#familytable input[name='famcar'] ").each(function(){
								if($(this).prop("checked")==false){//true
										checkbox.push(1);//有勾
								}
								if($(this).prop("checked")==true){
										checkbox.push(0);//沒有勾
								}
							})
						}else{
							console.log("沒有親屬 checkbox無值");
						}
						console.log(checkbox);
						console.log(JSON.stringify(checkbox));// JSON.stringify 將陣列轉換為 JSON 字串
						var checkboxjson=JSON.stringify(checkbox);
//			 			console.log(JSON.parse(JSON.stringify(checkbox)));//，然後使用 JSON.parse 將字串轉換回陣列。
						$("#checkbox").val(checkboxjson);//放一個隱藏的text傳值進去 按save時一次送出
						$("#save").submit();//最後在submit
					}
				})
		
			$(function() {
			var $BodyWidth = $(document).width();
			var $ViewportWidth = $(window).width();
			var $ScrollLeft = $(this).scrollLeft();
			if ($BodyWidth > ($ViewportWidth + $ScrollLeft)) {
				$('#span').show();
			} else if ($BodyWidth == ($ViewportWidth + $ScrollLeft)) {
				$('#span').hide();
			}

			
				$(".multiselect").kendoMultiSelect({autoClose : false});
				$("tr[name='repeat']").hide();
				$("#checkbox").hide();
				$("#familytable").attr("width", "1200px").attr("border", "3px")
						.attr("border-collapse", "collapse");
				$("#insert").click(function(event) {
									$("#familytable").append('<tr class=repeat>'+ $("tr[name='repeat']").html() + '</tr>');
									$(".repeat:last #multiselect").kendoMultiSelect({autoClose : false});
									//新增的欄位作正規劃
									var famname = /^.*\s*[^\s]/;
									
									$(".repeat td").on("blur","input[name='famname']",function() {
										
													if(this.value !=""){
														if (famname.test($(this).val())) {
															//直接在正規上面判斷空值? 錯誤訊息 空值+格式錯誤 +檔掉不能用變換save type
															//跟servlet一樣 有錯誤集中在一起 有錯 就做動作 沒錯就讓他過
															//怕的就是程式一行行判斷 這行如果有錯 做動作後 下一行程式沒錯 會蓋掉他
															$(this).css("border-color","green");
															$(this).next(".famnameerror").text("");
															$("#errorcount").val(0);
// 															console.log($("#errorcount").val());
															setTimeout(function() {$(".repeat td input[name='famname']")
																				.css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															$("#errorcount").val(1);
// 															console.log($("#errorcount").val());
															$(this).next(".famnameerror").text("姓名格式錯誤");
															setTimeout(function() {$(".repeat td input[name='famname']")
																				.css('border-color',"");}, 2000);};
													}else{
														$(this).css("border-color","red");
														$("#errorcount").val(1);
// 														console.log($("#errorcount").val());
														$(this).next(".famnameerror").text("姓名不可為空白");
														setTimeout(function() {$(".repeat td input[name='famname']")
																			.css('border-color',"");}, 2000);
													}
												});

									//id
									$(".repeat td").on("blur","input[name='famid']",function() {
												if(this.value !=""){
														// 依照字母的編號排列，存入陣列備用。
														var letters = new Array(
																'A', 'B', 'C',
																'D', 'E', 'F',
																'G', 'H', 'J',
																'K', 'L', 'M',
																'N', 'P', 'Q',
																'R', 'S', 'T',
																'U', 'V', 'X',
																'Y', 'W', 'Z',
																'I', 'O');
														// 儲存各個乘數
														var multiply = new Array(
																1, 9, 8, 7, 6,
																5, 4, 3, 2, 1);
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

														var regExpID = /^[a-z](1|2)\d{8}$/i;
														// 使用「正規表達式」檢驗格式
														if (regExpID.test($("input[name*='famid']").val())) {
															// 取出第一個字元和最後一個數字。
															firstChar = $(this).val().charAt(0).toUpperCase();
															lastNum = $(this).val().charAt(9);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famid']").css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".famiderror").text("身分證格式錯誤");
														}
														// 找出第一個字母對應的數字，並轉換成兩位數數字。
														for (var i = 0; i < 26; i++) {
															if (firstChar == letters[i]) {firstNum = i + 10;
																nums[0] = Math.floor(firstNum / 10);
																nums[1] = firstNum- (nums[0] * 10);
																break;
															}
														}
														// 執行加總計算
														for (var i = 0; i < multiply.length; i++) {
															if (i < 2) {
																total += nums[i]* multiply[i];
															} else {
																total += parseInt($(this).val().charAt(i - 1))* multiply[i];
															}
														}
														
														// 和最後一個數字比對
															if ((10 - (total % 10))!= lastNum && ((10 - (total % 10))-10)!= lastNum  ) {
																$(this).css("border-color","red");
																setTimeout(function() {$(".repeat td input[name='famid']")
																					.css('border-color',"");}, 2000);
																$("#errorcount").val(1);
																$(this).next(".famiderror").text("身分證格式錯誤");
														} else {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															setTimeout(function() {$(".repeat td input[name='famid']")
																				.css('border-color',"");}, 2000);
															$(this).next(".famiderror").text("");
														}
														search();
												}else{//格是錯誤會瞬間消失?
													$(this).css("border-color","red");
													setTimeout(function() {$(".repeat td input[name='famid']")
																		.css('border-color',"");}, 2000);
													$("#errorcount").val(1);
													$(this).next(".famiderror").text("身分證不可為空白");
												}
											})
									var fambdate = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
									$(".repeat td").on("blur","input[name='fambdate']",function() {
													
										if(this.value !=""){
														if (fambdate.test($(this).val())) {
																var today = new Date();
																var bdate = $(this).val();
																var mydate = new Date(bdate.replace("-", "/").replace("-", "/"));
															if(mydate<= today){
																$(this).css("border-color","green");
																$("#errorcount").val(0);
																$(this).next(".fambdateerror").text("");
																setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);	
															}else{
																$(this).css("border-color","red");
																setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);
																$("#errorcount").val(1);
																$(this).next(".fambdateerror").text("生日錯誤，日期超過今天");
															}
														
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".fambdateerror").text("生日格式錯誤");
														}
													}else{
														$(this).css("border-color","red");
														setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);
														$("#errorcount").val(1);
														$(this).next(".fambdateerror").text("生日不可為空白");
													}
												});
									var famphone = /^09\d{2}-?\d{3}-?\d{3}$/;
									$(".repeat td").on("blur","input[name='famphone']",function() {
										
										if(this.value !=""){
														if (famphone.test($(this).val())) {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															$(this).next(".famphoneerror").text("");
															setTimeout(function() {$(".repeat td input[name='famphone']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famphone']").css('border-color',"");
																	}, 2000);
															$("#errorcount").val(1);
															$(this).next(".famphoneerror").text("手機格式錯誤");
														}
													}else{
														$(this).css("border-color","red");
														setTimeout(function() {$(".repeat td input[name='famphone']").css('border-color',"");
																}, 2000);
														$("#errorcount").val(1);
														$(this).next(".famphoneerror").text("手機不可為空白");
													}
												});
									var famben = /^.*\s*[^\s]/;
									$(".repeat td").on("blur","input[name='famben']",function() {
										
										if(this.value !=""){
														if (famben.test($(this).val())) {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															$(this).next(".fambenerror").text("");
															setTimeout(function() {$(".repeat td input[name='famben']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famben']").css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".fambenerror").text("保險受益人格式錯誤");
															}
													}else{
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famben']").css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".fambenerror").text("保險受益人不可為空白");
													}
												});
									var fambenrel = /^.*\s*[^\s]/;
									$(".repeat td").on("blur","input[name='fambenrel']",function() {
										
										if(this.value !=""){
														if (fambenrel.test($(this).val())) {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															$(this).next(".fambenrelerror").text("");
															setTimeout(function() {$(".repeat td input[name='fambenrel']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='fambenrel']").css('border-color',"");}, 2000);
															$(this).next(".fambenrelerror").text("保險受益人關係格式錯誤");
															$("#errorcount").val(1);
														}
													}else{
														$(this).css("border-color","red");
														setTimeout(function() {$(".repeat td input[name='fambenrel']").css('border-color',"");}, 2000);
														$(this).next(".fambenrelerror").text("保險受益人關係不可為空白");
														$("#errorcount").val(1);
													}
												});
									var famemg = /^.*\s*[^\s]/;
									$(".repeat td").on("blur","input[name='famemg']",
													function() {
										
													if(this.value !=""){
														if (famemg.test($(this).val())) {
									
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															$(this).next(".famemgerror").text("");
															setTimeout(function() {$(".repeat td input[name='famemg']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famemg']").css('border-color',"");
																	}, 2000);
															$(this).next(".famemgerror").text("緊急聯絡人格式錯誤");
															$("#errorcount").val(1);
														}
													}else{
														$(this).css("border-color","red");
														setTimeout(function() {$(".repeat td input[name='famemg']").css('border-color',"");
																}, 2000);
														$(this).next(".famemgerror").text("緊急聯絡人不可為空白");
														$("#errorcount").val(1);
													}
												});
									var famemgphpone = /^09\d{2}-?\d{3}-?\d{3}$/;
									$(".repeat td").on("blur","input[name='famemgphpone']",function() {
											if(this.value !=""){
													if (famemgphpone.test($(this).val())) {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															$(this).next(".famemgphoneerror").text("");
															setTimeout(function() {$(".repeat td input[name='famemgphpone']")
																				.css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famemgphpone']")
																				.css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".famemgphoneerror").text("緊急聯絡人電話格式錯誤");
														}
													}else{
														$(this).css("border-color","red");
														setTimeout(function() {$(".repeat td input[name='famemgphpone']")
																			.css('border-color',"");}, 2000);
														$("#errorcount").val(1);
														$(this).next(".famemgphoneerror").text("緊急聯絡人電話不可為空白");
													}
												});
									var famemgrel = /^.*\s*[^\s]/;
									$(".repeat td").on("blur","input[name='famemgrel']",
													function() {
												if(this.value !=""){
														if (famemgrel.test($(this).val())) {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
															$(this).next(".famemgrelerror").text("");
															setTimeout(function() {
																		$(".repeat td input[name='famemgrel']")
																				.css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															setTimeout(function() {$(".repeat td input[name='famemgrel']").css(
																						'border-color',"");}, 2000);
															$(this).next(".famemgrelerror").text("緊急聯絡人關係格式錯誤");
															$("#errorcount").val(1);
														}
													}else{
														$(this).css("border-color","red");
														setTimeout(function() {$(".repeat td input[name='famemgrel']").css(
																					'border-color',"");}, 2000);
														$(this).next(".famemgrelerror").text("緊急聯絡人關係不可為空白");
														$("#errorcount").val(1);
													}
												});
									//focus在新增欄位
									$('#familytable input[name*="famname"]:last').focus();
								});
				
				var empphone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("#empphone").blur(function() {
					
				if(this.value !=""){
							if (empphone.test($(this).val())) {
									$(this).css("border-color", "green");
									$("#errorcount").val(0);
									setTimeout(function() {$("#empphone").css("border-color", "inherit");
									}, 2000);
									$("#empphoneerror").text("");
							} else {
								$("#empphoneerror").text("手機格式錯誤");
								$(this).css("border-color", "red");
								setTimeout(function() {
									$("#empphone").css("border-color", "inherit");}, 2000);
								$("#errorcount").val(1);
							}
					}else{
						$("#empphoneerror").text("手機不可為空值");
						$(this).css("border-color", "red");
						setTimeout(function() {
							$("#empphone").css("border-color", "inherit");
						}, 2000);
						$("#errorcount").val(1);
						
					}
				});

				var empben = /^.*\s*[^\s]/;
				$("#empben").blur(function() {
					
				if(this.value !=""){
						if (empben.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
							setTimeout(function() {
								$("#empben").css("border-color", "inherit");
							}, 2000);
							$("#empbenerror").text("");
							
	
						} else {
							$("#empbenerror").text("保險受益人格式錯誤");
							$(this).css("border-color", "red");
							setTimeout(function() {
								$("#empben").css("border-color", "inherit");
							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empbenerror").text("保險受益人不能為空值");
						$(this).css("border-color", "red");
						setTimeout(function() {
							$("#empben").css("border-color", "inherit");
						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empbenrel = /^.*\s*[^\s]/;
				$("#empbenrel").blur(function() {
					
				if(this.value !=""){
					if (empbenrel.test($(this).val())) {
						$(this).css("border-color", "green");
						$("#errorcount").val(0);
						setTimeout(function() {
							$("#empbenrel").css("border-color", "inherit");
						}, 2000);
						$("#empbenrelerror").text("");
					

					} else {
						$("#empbenrelerror").text("保險受益人關係格式錯誤");
						$(this).css("border-color", "red");
						setTimeout(function() {
							$("#empbenrel").css("border-color", "inherit");
						}, 2000);
						$("#errorcount").val(1);
					}
				}else{
					$("#empbenrelerror").text("保險受益人不可為空白");
					$(this).css("border-color", "red");
					setTimeout(function() {
						$("#empbenrel").css("border-color", "inherit");
					}, 2000);
					$("#errorcount").val(1);
				}
			});

				var empemg = /^.*\s*[^\s]/;
				$("#empemg").blur(function() {
					
				if(this.value !=""){
						if (empemg.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
							setTimeout(function() {
								$("#empemg").css("border-color", "inherit");
							}, 2000);
							$("#empemgerror").text("");
							
	
						} else {
							$("#empemgerror").text("緊急聯絡人格式錯誤");
							$(this).css("border-color", "red");
							setTimeout(function() {
								$("#empemg").css("border-color", "inherit");
							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empemgerror").text("緊急聯絡人不能為空值");
						$(this).css("border-color", "red");
						setTimeout(function() {
							$("#empemg").css("border-color", "inherit");
						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empemgphone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("#empemgphone").blur(function() {
					
				if(this.value !=""){
						if (empemgphone.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
							setTimeout(function() {
								$("#empemgphone").css("border-color", "inherit");
							}, 2000);
							$("#empemgphoneerror").text("");
						} else {
							$("#empemgphoneerror").text("手機格式錯誤");
							$(this).css("border-color", "red");
							setTimeout(function() {
								$("#empemgphone").css("border-color", "inherit");
							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empemgphoneerror").text("手機不可為空白");
						$(this).css("border-color", "red");
						setTimeout(function() {
							$("#empemgphone").css("border-color", "inherit");
						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empemail = /([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})/;
				$("#empemail").blur(function() {
				if(this.value !=""){
						if (empemail.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
							setTimeout(function() {
								$("#empemail").css("border-color", "inherit");
							}, 2000);
							$("#empemailerror").text("");
							
	
						} else {
							$("#empemailerror").text("信箱格式錯誤");
							$(this).css("border-color", "red");
							setTimeout(function() {
								$("#empemail").css("border-color", "inherit");
							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empemailerror").text("信箱不可為空白");
						$(this).css("border-color", "red");
						setTimeout(function() {
							$("#empemail").css("border-color", "inherit");
						}, 2000);
						$("#errorcount").val(1);
					}
				})

				var famname = /^.*\s*[^\s]/;
				$("input[name*='famname']").on("blur",
						function() {
					if(this.value !=""){
							if (famname.test($(this).val())) {
								$(this).css("border-color", "green");
								$("#errorcount").val(0);
								setTimeout(function() {
									$("input[name*='famname']").css(
											'border-color', "");
								}, 2000);
								$(this).next(".famnameerror").text("");
								

							} else {
								$(this).css("border-color", "red");
								setTimeout(function() {
									$("input[name*='famname']").css('border-color', "");
								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famnameerror").text("姓名格式錯誤");
							}
						}else{
							$(this).css("border-color", "red");
							setTimeout(function() {
								$("input[name*='famname']").css('border-color', "");
							}, 2000);
							$("#errorcount").val(1);
							$(this).next(".famnameerror").text("姓名不可為空白");
						}
					});

				$("input[name*='famid']").on("blur",
								function() {
				
					if(this.value !=""){
									// 依照字母的編號排列，存入陣列備用。
									var letters = new Array('A', 'B', 'C', 'D',
											'E', 'F', 'G', 'H', 'J', 'K', 'L',
											'M', 'N', 'P', 'Q', 'R', 'S', 'T',
											'U', 'V', 'X', 'Y', 'W', 'Z', 'I',
											'O');
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
									var regExpID = /^[a-z](1|2)\d{8}$/i;
									// 使用「正規表達式」檢驗格式
									if (regExpID.test($("input[name*='famid']")
											.val())) {

										// 取出第一個字元和最後一個數字。
										firstChar = $(this).val().charAt(0)
												.toUpperCase();
										lastNum = $(this).val().charAt(9);

									} else {

										$(this).css("border-color", "red");
										setTimeout(function() {
											$("input[name*='famid']").css('border-color', "");
										}, 2000);
										$(this).next(".famiderror").text("身分證格式錯誤");
										$("#errorcount").val(1);
									}
									// 找出第一個字母對應的數字，並轉換成兩位數數字。
									for (var i = 0; i < 26; i++) {
										if (firstChar == letters[i]) {
											firstNum = i + 10;
											nums[0] = Math.floor(firstNum / 10);
											nums[1] = firstNum - (nums[0] * 10);
											break;
										}
									}
									// 執行加總計算
									for (var i = 0; i < multiply.length; i++) {
										if (i < 2) {
											total += nums[i] * multiply[i];
										} else {
											total += parseInt($(this).val()
													.charAt(i - 1))
													* multiply[i];
										}
									}
									// 和最後一個數字比對
									if ((10 - (total % 10))!= lastNum && ((10 - (total % 10))-10)!= lastNum  ) {
// 										
										$(this).css("border-color", "red");
										setTimeout(function() {$("input[name*='famid']").css('border-color', "");
										}, 2000);
										$(this).next(".famiderror").text("身分證格式錯誤");
										$("#errorcount").val(1);
											
									} else {
										$(this).css("border-color", "green");
										$("#errorcount").val(0);
										setTimeout(function() {$("input[name*='famid']").css('border-color', "");
										}, 2000);
										$(this).next(".famiderror").text("");
									}
								}else{
									$(this).css("border-color", "red");
									setTimeout(function() {$("input[name*='famid']").css('border-color', "");
									}, 2000);
									$(this).next(".famiderror").text("身分證不可為空白");
									$("#errorcount").val(1);
								}
							});

				var fambdate = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
				$("input[name*='fambdate']").on("blur",
						function() {
					if(this.value !=""){
							if (fambdate.test($(this).val())) {
								var today = new Date();
								var bdate = $(this).val();
								var mydate = new Date(bdate.replace("-", "/")
										.replace("-", "/"));
								if (mydate <= today) {
									$(this).css("border-color", "green");
									$("#errorcount").val(0);
									setTimeout(function() {$("input[name*='fambdate']").css('border-color', "");}, 2000);
									$("#fambdateerror").text("");
									
								} else {
									$(this).css("border-color", "red");
									setTimeout(function() {
										$("input[name*='fambdate']").css('border-color', "");
									}, 2000);
									$("#errorcount").val(1);
									$(this).next(".fambdateerror").text("生日錯誤，日期超過今天");
								}
							} else {
								//$("#fambdateerror").text("需要為年-月-日的規格");
								$(this).css("border-color", "red");
								setTimeout(function() {$("input[name*='fambdate']").css('border-color',"");}, 2000);
								$("#errorcount").val(1);
								$(this).next(".fambdateerror").text("生日格式錯誤");
							}
						}else{
							$(this).css("border-color", "red");
							setTimeout(function() {$("input[name*='fambdate']").css('border-color',"");}, 2000);
							$("#errorcount").val(1);
							$(this).next(".fambdateerror").text("生日不可為空白");
						}
					});

				var famphone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("input[name*='famphone']").on("blur",
						function() {
					if(this.value !=""){
							if (famphone.test($(this).val())) {
								$(this).css("border-color", "green")
								$("#errorcount").val(0);
								setTimeout(function() {$("input[name*='famphone']").css('border-color', "");
								}, 2000);
								$(this).next(".famphoneerror").text("");
								
							} else {
								// 			$("#famnameerror").text("不符和手機規則");
								$(this).css("border-color", "red");
								setTimeout(function() {$("input[name*='famphone']").css('border-color', "");
								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famphoneerror").text("手機格式錯誤");
								
							}
						}else{
							$(this).css("border-color", "red");
							setTimeout(function() {$("input[name*='famphone']").css('border-color', "");
							}, 2000);
							$("#errorcount").val(1);
							$(this).next(".famphoneerror").text("手機不能為空白");
						}
					});

				var famben = /^.*\s*[^\s]/;
				$("input[name*='famben']").on("blur", function() {
					if(this.value !=""){
						if (famben.test($(this).val())) {
							$(this).css("border-color", "green")
							$("#errorcount").val(0);
							setTimeout(function() {$("input[name*='famben']").css('border-color', "");
							}, 2000);
							$(this).next(".fambenerror").text("");
							
						} else {
							// 			$("#fambenerror").text("需要為中文");
							$(this).css("border-color", "red");
							setTimeout(function() {$("input[name*='famben']").css('border-color', "");
							}, 2000);
							$("#errorcount").val(1);
							$(this).next(".fambenerror").text("保險受益人格式錯誤");
						}
					}else{
						$(this).css("border-color", "red");
						setTimeout(function() {$("input[name*='famben']").css('border-color', "");
						}, 2000);
						$("#errorcount").val(1);
						$(this).next(".fambenerror").text("保險受益人不能為空白");
					}
				});

				var fambenrel = /^.*\s*[^\s]/;
				$("input[name*='fambenrel']").on("blur",
						function() {
					if(this.value !=""){
								if (fambenrel.test($(this).val())) {
									$(this).css("border-color", "green")
									$("#errorcount").val(0);
									setTimeout(function() {$("input[name*='fambenrel']").css('border-color', "");
									}, 2000);
									$(this).next(".fambenrelerror").text("");
									
								} else {
									// 			$("#fambenrelerror").text("需要為中文");
									$(this).css("border-color", "red");
									setTimeout(function() {$("input[name*='fambenrel']").css('border-color', "");
									}, 2000);
									$("#errorcount").val(1);
									$(this).next(".fambenrelerror").text("保險受益關係格式錯誤");
								}
							}else{
								$(this).css("border-color", "red");
								setTimeout(function() {$("input[name*='fambenrel']").css('border-color', "");
								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".fambenrelerror").text("保險受益關係不能為空白");
							}
						});

				var famemg = /^.*\s*[^\s]/;
				$("input[name*='famemg']").on("blur", function() {
					if(this.value !=""){
						if (famemg.test($(this).val())) {
							$(this).css("border-color", "green")
							$("#errorcount").val(0);
							setTimeout(function() {$("input[name*='famemg']").css('border-color', "");
							}, 2000);
							$(this).next(".famemgerror").text("");
							
						} else {
							// 			$("#famemgerror").text("需要為中文");
							$(this).css("border-color", "red");
							setTimeout(function() {$("input[name*='famemg']").css('border-color', "");
							}, 2000);
							$(this).next(".famemgerror").text("緊急聯絡人格式錯誤");
							$("#errorcount").val(1);
						}
					}else{
						(this).css("border-color", "red");
						setTimeout(function() {$("input[name*='famemg']").css('border-color', "");
						}, 2000);
						$(this).next(".famemgerror").text("緊急聯絡人不能為空白");
						$("#errorcount").val(1);
					}
				});

				var famemgphpone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("input[name*='famemgphpone']").on(
						"blur",
						function() {
							if(this.value !=""){
								if (famemgphpone.test($(this).val())) {
									$(this).css("border-color", "green")
									$("#errorcount").val(0);
									setTimeout(function() {$("input[name*='famemgphpone']").css('border-color', "");
									}, 2000);
									$("#famemgphoneerror").text("");
									
								} else {
									// 			$("#famemgphoneerror").text("不符合手機規則");
									$(this).css("border-color", "red");
									setTimeout(function() {$("input[name*='famemgphpone']").css('border-color', "");
									}, 2000);
									$("#errorcount").val(1);
									$(this).next(".famemgerror").text("緊急聯絡人電話格式錯誤");
								}
							}else{
								$(this).css("border-color", "red");
								setTimeout(function() {$("input[name*='famemgphpone']").css('border-color', "");
								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famemgerror").text("緊急聯絡人電話不能為空白");
							}
						});

				var famemgrel = /^.*\s*[^\s]/;
				$("input[name*='famemgrel']").on("blur",
						function() {
					if(this.value !=""){
								if (famemgrel.test($(this).val())) {
									$(this).css("border-color", "green")
									$("#errorcount").val(0);
									setTimeout(function() {$("input[name*='famemgrel']").css('border-color', "");
									}, 2000);
									$(this).next(".famemgrelerror").text("");
								
								} else {
									$(this).css("border-color", "red");
									setTimeout(function() {$("input[name*='famemgrel']").css('border-color', "");
									}, 2000);
									$("#errorcount").val(1);
									$(this).next("famemgrelerror").text("緊急聯絡人關係格式錯誤");
								}
							}else{
								$(this).css("border-color", "red");
								setTimeout(function() {$("input[name*='famemgrel']").css('border-color', "");
								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famemgrelerror").text("緊急聯絡人不能為空白");
							}
						});

			});
		</script>

	</div>
</body>

</html>