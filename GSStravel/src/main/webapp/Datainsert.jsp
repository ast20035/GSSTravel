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
label{
text-align: center;
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
<title>資料輸入</title>

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
		$('.navbar-nav>li').removeClass('now');
		$('.navbar-nav>li:eq(2)').addClass('now');
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
							<td><span class="input-group-addon info">員工編號</span></td>
							<td><input type='text' class='form-control' readonly
								value='${empno}' /></td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">姓名</span></td>
							<td><input type='text' class='form-control' readonly
								value='${empname}' /></td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">手機</span></td>
							<td><input type="text" name="empphone" id="empphone"
								class='form-control' autofocus value="${empphone}">
<%-- 								<div id=empphoneerror>${error.empphone}</div> --%>
								</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">保險受益人</span></td>
							<td><input type="text" name="empben" id="empben"
								class='form-control' value="${empben}">

<%-- 								<div id=empbenerror>${error.empben}</div> --%>
								</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">與受益人關係</span></td>
							<td><input type="text" name="empbenrel" id="empbenrel"
								class='form-control' value="${empbenrel}">

<%-- 								<div id=empbenrelerror>${error.empbenrel}</div> --%>
								</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">緊急聯絡人</span></td>
							<td><input type="text" name="empemg" id="empemg"
								class='form-control' value="${empemg}">

<%-- 								<div id=empemgerror>${error.empemg}</div> --%>
								</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">緊急聯絡人電話</span></td>
							<td><input type="text" name="empemgphone" id="empemgphone"
								class='form-control' value="${empemgphone}">

<%-- 								<div id=empemgphoneerror>${error.empemgphone}</div> --%>
								</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">信箱</span></td>
							<td><input type="text" name="empemail" id="empemail"
								class='form-control' value="${empemail}">

<%-- 								<div id=empemailerror>${error.empemailerror}</div> --%>
								</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">用餐</span></td>
							<td><select name="empeat" class='form-control'>
									<c:if test="${empeat=='葷'}">
										<option value="葷" selected>葷</option>
										<option value="素">素</option>
									</c:if>
									<c:if test="${empeat=='素'}">
										<option value="葷">葷</option>
										<option value="素" selected>素</option>
									</c:if>
							</select> (如有特別要求請填寫於備註)</td>
						</tr>
						<tr>
							<td><span class="input-group-addon info">備註</span></td>
							<td><input type="text" name="empnote" id="empnote"
								class='form-control' value="${empnote}">

								<div id=empnoteerror></div></td>
						</tr>
					</table>
					<div>
						－眷屬親友資訊－<br> *眷屬包含直系及旁系二等親，納入補助計算<br>
						*親友為旁系三等親以上及朋友，不納入補助計算<br> <br>
						<!--新增、儲存 -->

					<input type="button" value="新增親友/眷屬" id="insert" name="button" class='btn btn-primary'> <span>${error.famblock}</span> 
					<input type="button" value="儲存" class='btn btn-primary' id="save" name="button">
					<input type="hidden"  id="checkbox" name="checkbox">
					<input type="hidden"  id="multiselect" name="multiselect">
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
						<thead>
							<tr id='sss'>
								<th></th>
								<th><label style="width:90px;"><em style="color: red">*</em>眷屬/親友</label></th>
								<th><label><em style="color: red">*</em>姓名</label></th>
								<th><label style="width:60px;"><em style="color: red">*</em>性別</label></th>
								<th><label><em style="color: red">*</em>身份證字號</label></th>
								<th><label><em style="color: red">*</em>生日</label></th>
								<th><label><em style="color: red">*</em>手機</label></th>
								<th><label>用餐/車位</label></th>
								<th><label style="width:350px;">特殊身份</label></th>
								<th><label><em style="color: red">*</em>保險受益人</label></th>
								<th><label style="width:120px;"><em style="color: red">*</em>保險受益人關係</label></th>
								<th><label><em style="color: red">*</em>緊急聯絡人</label></th>
								<th><label style="width:120px;"><em style="color: red">*</em>緊急聯絡人電話</label></th>
								<th><label style="width:120px;"><em style="color: red">*</em>緊急聯絡人關係</label></th>
								<th><label>備註</label></th>
							</tr>
						</thead>
						<c:if test="${famstartsize>0}">
							<c:forEach var="start" items="${famstart}">
								<tr>
									<td><input type="button" name="delete" id="delete"
										value="delete" class="${start.fam_Id} btn btn-danger"></td>

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
									<td><input type="text" name="famname" id="famname"
										style='width: 90px;' class='form-control'
										value="${start.fam_Name}">
<%-- 										<div class="famnameerror" name="famnameerror">${error.famneme}</div> --%>
										</td>
									<td><select name="famsex" class='form-control'
										style='width: 70px;'>
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

									<td><input type="text" name="famid" style='width: 110px;'
										class="famid form-control" value="${start.fam_Id}">
<%-- 										<div class="famiderror" name="famiderror">${error.famid}</div> --%>
										</td>
									<td><input type="date" id="fambdate" name="fambdate"
										style='width: 170px;' class="fambdate form-control"
										value="${start.fam_Bdate}" />
<%-- 										<div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div> --%>
										</td>
									<td><input type="text" name="famphone" id="famphone"
										style='width: 90px;' class='form-control'
										value="${start.fam_Phone}">
<%-- 										<div class=famphoneerror>${error.famphone}</div> --%>
										</td>
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
												value="off" class="${start.fam_No}">
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
													<option value="bab">幼童(0~3歲)</option>
												</c:if>
												<c:if test="${start.fam_Bady}">
													<option id="${start.fam_No}_span_1" value="bab" Selected>幼童(0~3歲)</option>
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
											<input type ="hidden" name="selectvalue" class="selectvalue">
										</div></td>

									<td><input type="text" name="famben" id="famben" style='width:90px;'
										class='form-control' value="${start.fam_Ben}">
<%-- 										<div class="fambenerror">${error.famben}</div> --%>
										</td>
									<td><input type="text" name="fambenrel" id="fambenrel"
										style='width: 90px;' class='form-control'
										value="${start.fam_BenRel}">
<%-- 										<div class="fambenrelerror">${error.fambenrel}</div> --%>
										</td>
									<td><input type="text" name="famemg" id="famemg"
										style='width: 90px;' class='form-control'
										value="${start.fam_Emg}">
<%-- 										<div class="famemgerror">${error.famemg}</div> --%>
										</td>
									<td><input type="text" name="famemgphpone"
										style='width: 90px;' class='form-control' id="famemgphone"
										value="${start.fam_EmgPhone}">
<%-- 										<div class="famemgphoneerror">${error.famemgphone}</div> --%>
										</td>
									<td><input type="text" name="famemgrel" id="famemgrel"
										style='width: 90px;' class='form-control'
										value="${start.fam_EmgRel}">
<%-- 										<div class="famemgrelerror">${error.famemgrel}</div> --%>
										</td>
									<td><input type="text" name="famnote" id="famnote"
										style='width: 200px;' class='form-control'
										value="${start.fam_Note}">
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
		<!-- 空白欄位  平常隱藏 按下新增時帶出空白欄位 -->
		<tr name="repeat">
			<td><input type="button" name="delete" id="delete"
				class='btn btn-danger' value="delete" class="block"></td>
			<td><select name="famrel" class='form-control'>
					<option value="眷屬">眷屬</option>
					<option value="親友">親友</option>
			</select></td>
			<td><input type="text" name="famname" id="famname"
				class='form-control'>
<%-- 				<div class="famnameerror" name="famnameerror">${error.famneme}</div> --%>
				</td>
			<td><select name="famsex" class='form-control'>
					<!--  servlet抓name db抓值會抓進value值進去-->
					<option value="女">女</option>
					<option value="男">男</option>
			</select></td>
			<td><input type="text" name="famid" class="famid form-control">
<%-- 				<div class="famiderror" name="famiderror">${error.famid}</div> --%>
				</td>
			<td><input type="date" id="fambdate" name="fambdate"
				class="fambdate form-control" />
<%-- 				<div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div> --%>
				</td>
			<td><input type="text" name="famphone" id="famphone"
				class='form-control'>
<%-- 				<div class=famphoneerror>${error.famphone}</div> --%>
				</td>
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
						<option value="bab">幼童(0~3歲)</option>
						<option value="kid">兒童(4~11歲)</option>
						<option value="dis">持身心障礙手冊</option>
						<option value="mom">孕婦(媽媽手冊)</option>
					</select>
					<input type ="hidden" name="selectvalue" class="selectvalue">
				</div></td>
			<td><input type="text" name="famben" id="famben" 
				class='form-control'>
<%-- 				<div class="fambenerror">${error.famben}</div> --%>
				</td>
			<td><input type="text" name="fambenrel" id="fambenrel"
				class='form-control'>
<%-- 				<div class="fambenrelerror">${error.fambenrel}</div> --%>
				</td>
			<td><input type="text" name="famemg" id="famemg"
				class='form-control'>
<%-- 				<div class="famemgerror">${error.famemg}</div> --%>
				</td>
			<td><input type="text" name="famemgphpone" id="famemgphone"
				class='form-control'>
<%-- 				<div class="famemgphoneerror">${error.famemgphone}</div> --%>
				</td>
			<td><input type="text" name="famemgrel" id="famemgrel"
				class='form-control'>
<%-- 				<div class="famemgrelerror">${error.famemgrel}</div> --%>
				</td>
			<td><input type="text" name="famnote" id="famnote"
				class='form-control'>
<!-- 				<div class="famnoteerror"></div> -->
				</td>
		</tr>
	</table>
	<script>
			var xh = new XMLHttpRequest();
// 			用ajax抓親屬身分證 給後台判斷要不要刪
			$("#familytable").on("mousedown", "input[name='delete']",function xx(){
				var pathName = document.location.pathname;
				var index = pathName.substr(1).indexOf("/");
				var result = pathName.substr(0, index + 1);
				var url = result + "/FamilyServlet";
				var ajaxfamid ={"ajaxfamid":$(this).closest("tr").find("input[name='famid']").val()};
				console.log(ajaxfamid);
				var xxxxx = $(this)
					$.ajax({
						type:"POST",url:url,data:ajaxfamid,dataType:"text",
							success:function(r){
									if(r.indexOf("not")!= -1 ){
										console.log(r);
										alert("此筆親屬人已經報名行程，不可刪除");
										return false;
									}
									else{
// 										$("#familytable input[name='delete']").click(function(){
	// 										$("#familytable input[name='delete']").mouseup(function(){
											if(window.confirm("確定取消嗎?")){
												if( $("#errorcount").val(1)){
// 													$(this).parents("tr").remove();
													xxxxx.parents("tr").remove();
													$("#errorcount").val(0);
												}
											}
// 										})

// 										var famname = $(".repeat input[name='famname']");
// 										var famid = $(".repeat input[name='famid']");
										
// 										if(famname.val() !=null || famid.val() != null  ){
// 											famname.
// 										}else{
// 											if(window.confirm("確定取消嗎?")){
// 												if( $("#errorcount").val(1)){
// 													$(".repeat input[name='delete']").parents("tr").remove();
// 													$("#errorcount").val(0);
// 												}
// 											}
// 										}
										
									}
							}
					})
				
			})
			
			
// 			生日直接判斷特殊身分
			$("#familytable input[name*='fambdate']").on("blur",function(){
				var bdate = $(this).val();
				console.log(bdate);
					  var today = new Date();
					  var bdate = new Date(Date.parse(bdate.replace("-", "/")));
					  var between = today.getTime() - bdate.getTime();//時間差的毫秒数 
					  var between2 = Math.floor(between/(24*3600*1000));
					  if(between2<365*3){
						  $(this).closest("tr").find(".select select[name*='famspa'] ").val("bab");
						  console.log("xxxxx");
					  }
					  if(between2<365*11){
						  if(between2>365*3){
							 $(this).closest("tr").find(".select select[name*='famspa'] ").val("kid");
							 console.log("yyyyyyy");
						  }
					  }
			})
			
			
			
				$("#save").click(function(){
// 					$("#save").attr("type","submit");

					if($(".repeat input[name*='famname']").val()==""){
						alert("親屬姓名不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='famid']").val()==""){
						alert("親屬身分證不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='fambdate']").val()==""){
						alert("親屬生日不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='famphone']").val()==""){
						alert("親屬手機不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='famben']").val()==""){
						alert("親屬保險受益人不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='fambenrel']").val()==""){
						alert("親屬保險受益人關係不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='famemg']").val()==""){
						alert("親屬緊急聯絡人不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='famemgrel']").val()==""){
						alert("親屬緊急聯絡人關係不能為空白");
						$("#errorcount").val(1);
					}else if($(".repeat input[name*='famemgphone']").val()==""){
						alert("親屬緊急聯絡人電話不能為空白");
						$("#errorcount").val(1);
					}

// 					判斷資料有沒有輸入正確 
					if($("#errorcount").val()=="1"){
					$("#save").attr("type","button");
					alert("親屬資料未輸入完全")
					}
					
					if($("#errorcount").val()=="0"){
							//抓checkbox
							var idlength= $("#familytable input[name*='famcar']").length;//3
							var checkbox=[];
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
							var checkboxjson=JSON.stringify(checkbox);
							$("#checkbox").val(checkboxjson);//放一個隱藏的text傳值進去 按save時一次送出
							
							//抓多選(新增的值)要用save按下後才能判斷   除非全部都用前端blur抓要新增的值在全部傳進去??
							//下面都要改成去抓新增的值進去  新增的不能指部分新增 一定要全部一起進去才行 
							//想一下進去抓到值之後要怎麼拆開 放進去familyvo?
									//或是看能不能拆開成不同部分在放進去vo裡面?
							
							console.log($("#familytable select[name='famspa']").length);//抓到的select總共有幾筆
							var xxx=[];
							if($("#familytable select[name='famspa']").length > 0){
								$("#familytable select[name='famspa']").each(function(){
									var spa =$(this).val();
									console.log(spa);
									var spajson =JSON.stringify(spa);
									console.log(spajson);// JSON.stringify 將陣列轉換為 JSON 字串
									$(this).closest("tr").find("input[name='selectvalue']").val(spajson);
									console.log($(this).closest("tr").find("input[name='selectvalue']").val());
									
									
// 									console.log(spajson);//抓到json字串
// 									$(this).next("input[name='selectvalue']").val(spajson);
// 									$(this).closest("tr").find("input[name='selectvalue']").val(spajson);
// 									console.log($(this).closest("tr").find("input[name='selectvalue']").val());//抓到
								});
							}else{
								//??無親屬抓進去
							}
						$("#save").attr("type","submit");
						
						
					}// ==0
					
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
				$(".multiselect").kendoMultiSelect({autoClose : false});//多選的效果
				$("tr[name='repeat']").hide();
				$("#checkbox").hide();
				$("#familytable").attr("width", "1200px").attr("border", "3px")
						.attr("border-collapse", "collapse");
				$("#insert").click(function(event) {//按下新增後的動作， 之後新增所做的動作都會寫在裡面
									$("#familytable").append('<tr class=repeat>'+ $("tr[name='repeat']").html() + '</tr>');
									$(".repeat:last #multiselect").kendoMultiSelect({autoClose : false});//多選的效果
									
									//新增的欄位作正規劃
									var famname = /^.*\s*[^\s]/;
									$(".repeat td").on("blur","input[name='famname']",function() {
										
													if(this.value !=""){
														if (famname.test($(this).val())) {
															$(this).css("border-color","green");
															$(this).next(".famnameerror").text("");
															$("#errorcount").val(0);
// 															console.log($("#errorcount").val());
															//setTimeout(function() {$(".repeat td input[name='famname']")
// 																				.css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
															$("#errorcount").val(1);
// 															console.log($("#errorcount").val());
															$(this).next(".famnameerror").text("姓名格式錯誤");
															//setTimeout(function() {$(".repeat td input[name='famname']")
// 																				.css('border-color',"");}, 2000);};
														}
													}else{
														$(this).css("border-color","red");
														$("#errorcount").val(1);
// 														console.log($("#errorcount").val());
														$(this).next(".famnameerror").text("姓名不可為空白");
// 														  setTimeout(function() {$(".repeat td input[name='famname']").css('border-color',"");}, 2000);
													}
												});

									//id
									$(".repeat td").on("blur","input[name='famid']",function() {
												if(this.value !=""){
													search();
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
															//  setTimeout(function() {$(".repeat td input[name='famid']").css('border-color',"");}, 2000);
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
// 																setTimeout(function() {$(".repeat td input[name='famid']")
// 																					.css('border-color',"");}, 2000);
																$("#errorcount").val(1);
																$(this).next(".famiderror").text("身分證格式錯誤");
														} else {
															$(this).css("border-color","green");
															$("#errorcount").val(0);
// 															setTimeout(function() {$(".repeat td input[name='famid']")
// 																				.css('border-color',"");}, 2000);
															$(this).next(".famiderror").text("");
														}
														
												}else{//格是錯誤會瞬間消失?
													$(this).css("border-color","red");
// 													setTimeout(function() {$(".repeat td input[name='famid']")
// 																		.css('border-color',"");}, 2000);
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
// 																setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);	
															}else{
																$(this).css("border-color","red");
// 																setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);
																$("#errorcount").val(1);
																$(this).next(".fambdateerror").text("生日錯誤，日期超過今天");
															}
														
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".fambdateerror").text("生日格式錯誤");
														}
													}else{
														$(this).css("border-color","red");
// 														setTimeout(function() {$(".repeat td input[name='fambdate']").css('border-color',"");}, 2000);
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
// 															setTimeout(function() {$(".repeat td input[name='famphone']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='famphone']").css('border-color',"");
// 																	}, 2000);
															$("#errorcount").val(1);
															$(this).next(".famphoneerror").text("手機格式錯誤");
														}
													}else{
														$(this).css("border-color","red");
// 														setTimeout(function() {$(".repeat td input[name='famphone']").css('border-color',"");
// 																}, 2000);
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
// 															setTimeout(function() {$(".repeat td input[name='famben']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='famben']").css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".fambenerror").text("保險受益人格式錯誤");
															}
													}else{
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='famben']").css('border-color',"");}, 2000);
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
// 															setTimeout(function() {$(".repeat td input[name='fambenrel']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='fambenrel']").css('border-color',"");}, 2000);
															$(this).next(".fambenrelerror").text("保險受益人關係格式錯誤");
															$("#errorcount").val(1);
														}
													}else{
														$(this).css("border-color","red");
// 														setTimeout(function() {$(".repeat td input[name='fambenrel']").css('border-color',"");}, 2000);
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
// 															setTimeout(function() {$(".repeat td input[name='famemg']").css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='famemg']").css('border-color',"");
// 																	}, 2000);
															$(this).next(".famemgerror").text("緊急聯絡人格式錯誤");
															$("#errorcount").val(1);
														}
													}else{
														$(this).css("border-color","red");
// 														setTimeout(function() {$(".repeat td input[name='famemg']").css('border-color',"");
// 																}, 2000);
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
// 															setTimeout(function() {$(".repeat td input[name='famemgphpone']")
// 																				.css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='famemgphpone']")
// 																				.css('border-color',"");}, 2000);
															$("#errorcount").val(1);
															$(this).next(".famemgphoneerror").text("緊急聯絡人電話格式錯誤");
														}
													}else{
														$(this).css("border-color","red");
// 														setTimeout(function() {$(".repeat td input[name='famemgphpone']")
// 																			.css('border-color',"");}, 2000);
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
// 															setTimeout(function() {$(".repeat td input[name='famemgrel']")
// 																				.css('border-color',"");}, 2000);
														} else {
															$(this).css("border-color","red");
// 															setTimeout(function() {$(".repeat td input[name='famemgrel']").css(
// 																						'border-color',"");}, 2000);
															$(this).next(".famemgrelerror").text("緊急聯絡人關係格式錯誤");
															$("#errorcount").val(1);
														}
													}else{
														$(this).css("border-color","red");
// 														setTimeout(function() {$(".repeat td input[name='famemgrel']").css(
// 																					'border-color',"");}, 2000);
														$(this).next(".famemgrelerror").text("緊急聯絡人關係不可為空白");
														$("#errorcount").val(1);
													}
												});
									//focus在新增欄位
									$('#familytable input[name*="famname"]:last').focus();
									
									//用生日判斷特殊身分
// 									$(" .repeat input[name*='fambdate']").on("blur",function(){
// 										var pathName = document.location.pathname;
// 										var index = pathName.substr(1).indexOf("/");
// 										var result = pathName.substr(0, index + 1);
// 										var url = result + "/FamilyServlet";
// 											var bdaterepeat = $(this).val();
// 											console.log(bdaterepeat);
// 											 $.post(url,{"bdaterepeat":bdaterepeat},function(){
// 												 alert("bdaterepeat return susses");
// 											 })
// 									})
									
									//search方法 在動態新增紐的famid 檢驗法的最下方
			function search() {
				if (xh != null) {
					var famidnew = $(".repeat .famid").map(function() {
						return $(this).val();
					}).get();
					console.log(famidnew);//輸出陣列出來
					
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
					xh.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					xh.send("id=" + id);

				} else {
					alert("Your browser doesn't support JSON!");
				}
			}
			function ajaxReturn() {
				if (xh.readyState == 4) {
					if (xh.status == 200) {
						if (xh.responseText != "") {
							var ajaxreturn = xh.responseText;
// 							alert(ajaxreturn);
							if(ajaxreturn.match("repeat")!=null){
								$("#errorcount").val(1);
	 							$(".repeat td div[name='famiderror']:last").text(
	 									"身分證字號重複");
							}else{
								$("#errorcount").val(0);
	 							$(".repeat td div[name='famiderror']:last")
	 									.text("");
							}
						}
					}
				}
			}
			
			
			//抓新增親屬欄位的多選職
			$("#save").click(function(){
// 				console.log("save click");
// 				console.log($(".repeat select[name='famspa']").length);//抓到的select總共有幾筆  抓到
				
// 				if($(".repeat select[name='famspa']").length > 0){
// 					$(".repeat select[name='famspa']").each(function(){
// 						var spa =$(this).val();
// 						console.log(spa);//抓到
// 						var spajson =JSON.stringify(spa);
// 						console.log(spajson);//抓到json字串
// // 						$(this).next("input[name='selectvalue']").val(spajson);
// 						$(this).closest("tr").find("input[name='selectvalue']").val(spajson);
// 						console.log($(this).closest("tr").find("input[name='selectvalue']").val());//抓到

// 					});
// 				}else{
// 					//??無親屬抓進去
// 				}
			
// 				if($(".repeat input[name*='famname']").val()==""){
// 					alert("親屬姓名不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='famid']").val()==""){
// 					alert("親屬身分證不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='fambdate']").val()==""){
// 					alert("親屬生日不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='famphone']").val()==""){
// 					alert("親屬手機不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='famben']").val()==""){
// 					alert("親屬保險受益人不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='fambenrel']").val()==""){
// 					alert("親屬保險受益人關係不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='famemg']").val()==""){
// 					alert("親屬緊急聯絡人不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='famemgrel']").val()==""){
// 					alert("親屬緊急聯絡人關係不能為空白");
// 					$("#errorcount").val(1);
// 				}else if($(".repeat input[name*='famemgphone']").val()==""){
// 					alert("親屬緊急聯絡人電話不能為空白");
// 					$("#errorcount").val(1);
// 				}
// 				$("#save").attr("type","submit"); //暗下新增鍵後再執行submit動作
			})
				
				
									
								});//新增的最後誇號
				
// 				一開始進入的資料進行判斷
				var empphone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("#empphone").blur(function() {
				if(this.value !=""){
							if (empphone.test($(this).val())) {
									$(this).css("border-color", "green");
									$("#errorcount").val(0);
// 									setTimeout(function() {$("#empphone").css("border-color", "inherit");
// 									}, 2000);
									$("#empphoneerror").text("");
							} else {
								$("#empphoneerror").text("手機格式錯誤");
								$(this).css("border-color", "red");
// 								setTimeout(function() {
// 									$("#empphone").css("border-color", "inherit");}, 2000);
								$("#errorcount").val(1);
							}
					}else{
						$("#empphoneerror").text("手機不可為空值");
						$(this).css("border-color", "red");
// 						setTimeout(function() {$("#empphone").css("border-color", "inherit");
// 						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empben = /^.*\s*[^\s]/;
				$("#empben").blur(function() {
				if(this.value !=""){
						if (empben.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
// 							setTimeout(function() {$("#empben").css("border-color", "inherit");
// 							}, 2000);
							$("#empbenerror").text("");
							
	
						} else {
							$("#empbenerror").text("保險受益人格式錯誤");
							$(this).css("border-color", "red");
// 							setTimeout(function() {$("#empben").css("border-color", "inherit");
// 							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empbenerror").text("保險受益人不能為空值");
						$(this).css("border-color", "red");
// 						setTimeout(function() {$("#empben").css("border-color", "inherit");
// 						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empbenrel = /^.*\s*[^\s]/;
				$("#empbenrel").blur(function() {
				if(this.value !=""){
					if (empbenrel.test($(this).val())) {
						$(this).css("border-color", "green");
						$("#errorcount").val(0);
// 						setTimeout(function() {$("#empbenrel").css("border-color", "inherit");
// 						}, 2000);
						$("#empbenrelerror").text("");
					

					} else {
						$("#empbenrelerror").text("保險受益人關係格式錯誤");
						$(this).css("border-color", "red");
// 						setTimeout(function() {$("#empbenrel").css("border-color", "inherit");
// 						}, 2000);
						$("#errorcount").val(1);
					}
				}else{
					$("#empbenrelerror").text("保險受益人不可為空白");
					$(this).css("border-color", "red");
// 					setTimeout(function() {$("#empbenrel").css("border-color", "inherit");
// 					}, 2000);
					$("#errorcount").val(1);
				}
			});

				var empemg = /^.*\s*[^\s]/;
				$("#empemg").blur(function() {
					
				if(this.value !=""){
						if (empemg.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
// 							setTimeout(function() {
// 								$("#empemg").css("border-color", "inherit");
// 							}, 2000);
							$("#empemgerror").text("");
							
	
						} else {
							$("#empemgerror").text("緊急聯絡人格式錯誤");
							$(this).css("border-color", "red");
// 							setTimeout(function() {
// 								$("#empemg").css("border-color", "inherit");
// 							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empemgerror").text("緊急聯絡人不能為空值");
						$(this).css("border-color", "red");
// 						setTimeout(function() {
// 							$("#empemg").css("border-color", "inherit");
// 						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empemgphone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("#empemgphone").blur(function() {
					
				if(this.value !=""){
						if (empemgphone.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
// 							setTimeout(function() {
// 								$("#empemgphone").css("border-color", "inherit");
// 							}, 2000);
							$("#empemgphoneerror").text("");
						} else {
							$("#empemgphoneerror").text("手機格式錯誤");
							$(this).css("border-color", "red");
// 							setTimeout(function() {
// 								$("#empemgphone").css("border-color", "inherit");
// 							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empemgphoneerror").text("手機不可為空白");
						$(this).css("border-color", "red");
// 						setTimeout(function() {
// 							$("#empemgphone").css("border-color", "inherit");
// 						}, 2000);
						$("#errorcount").val(1);
					}
				});

				var empemail = /([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})/;
				$("#empemail").blur(function() {
				if(this.value !=""){
						if (empemail.test($(this).val())) {
							$(this).css("border-color", "green");
							$("#errorcount").val(0);
// 							setTimeout(function() {
// 								$("#empemail").css("border-color", "inherit");
// 							}, 2000);
							$("#empemailerror").text("");
							
	
						} else {
							$("#empemailerror").text("信箱格式錯誤");
							$(this).css("border-color", "red");
// 							setTimeout(function() {
// 								$("#empemail").css("border-color", "inherit");
// 							}, 2000);
							$("#errorcount").val(1);
						}
					}else{
						$("#empemailerror").text("信箱不可為空白");
						$(this).css("border-color", "red");
// 						setTimeout(function() {
// 							$("#empemail").css("border-color", "inherit");
// 						}, 2000);
						$("#errorcount").val(1);
					}
				})

				var famname = /^.*\s*[^\s]/;
				$("input[name*='famname']").on("blur",function() {
					if(this.value !=""){
							if (famname.test($(this).val())) {
								$(this).css("border-color", "green");
								$("#errorcount").val(0);
// 								setTimeout(function() {
// 									$("input[name*='famname']").css(
// 											'border-color', "");
// 								}, 2000);
								$(this).next(".famnameerror").text("");
								

							} else {
								$(this).css("border-color", "red");
// 								setTimeout(function() {
// 									$("input[name*='famname']").css('border-color', "");
// 								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famnameerror").text("姓名格式錯誤");
							}
						}else{
							$(this).css("border-color", "red");
// 							setTimeout(function() {
// 								$("input[name*='famname']").css('border-color', "");
// 							}, 2000);
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
// 										setTimeout(function() {
// 											$("input[name*='famid']").css('border-color', "");
// 										}, 2000);
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
// 										setTimeout(function() {$("input[name*='famid']").css('border-color', "");
// 										}, 2000);
										$(this).next(".famiderror").text("");
									}
								}else{
									$(this).css("border-color", "red");
// 									setTimeout(function() {$("input[name*='famid']").css('border-color', "");
// 									}, 2000);
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
// 									setTimeout(function() {$("input[name*='fambdate']").css('border-color', "");}, 2000);
									$(this).next(".fambdateerror").text("");
									
								} else {
									$(this).css("border-color", "red");
// 									setTimeout(function() {
// 										$("input[name*='fambdate']").css('border-color', "");
// 									}, 2000);
									$("#errorcount").val(1);
									$(this).next(".fambdateerror").text("生日錯誤，日期超過今天");
								}
							} else {
								//$("#fambdateerror").text("需要為年-月-日的規格");
								$(this).css("border-color", "red");
// 								setTimeout(function() {$("input[name*='fambdate']").css('border-color',"");}, 2000);
								$("#errorcount").val(1);
								$(this).next(".fambdateerror").text("生日格式錯誤");
							}
						}else{
							$(this).css("border-color", "red");
// 							setTimeout(function() {$("input[name*='fambdate']").css('border-color',"");}, 2000);
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
// 								setTimeout(function() {$("input[name*='famphone']").css('border-color', "");
// 								}, 2000);
								$(this).next(".famphoneerror").text("");
								
							} else {
								// 			$("#famnameerror").text("不符和手機規則");
								$(this).css("border-color", "red");
// 								setTimeout(function() {$("input[name*='famphone']").css('border-color', "");
// 								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famphoneerror").text("手機格式錯誤");
								
							}
						}else{
							$(this).css("border-color", "red");
// 							setTimeout(function() {$("input[name*='famphone']").css('border-color', "");
// 							}, 2000);
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
// 							setTimeout(function() {$("input[name*='famben']").css('border-color', "");
// 							}, 2000);
							$(this).next(".fambenerror").text("");
							
						} else {
							// 			$("#fambenerror").text("需要為中文");
							$(this).css("border-color", "red");
// 							setTimeout(function() {$("input[name*='famben']").css('border-color', "");
// 							}, 2000);
							$("#errorcount").val(1);
							$(this).next(".fambenerror").text("保險受益人格式錯誤");
						}
					}else{
						$(this).css("border-color", "red");
// 						setTimeout(function() {$("input[name*='famben']").css('border-color', "");
// 						}, 2000);
						$("#errorcount").val(1);
						$(this).next(".fambenerror").text("保險受益人不能為空白");
					}
				});

				var fambenrel = /^.*\s*[^\s]/;
				$("input[name*='fambenrel']").on("blur",function() {
					if(this.value !=""){
								if (fambenrel.test($(this).val())) {
									$(this).css("border-color", "green")
									$("#errorcount").val(0);
// 									setTimeout(function() {$("input[name*='fambenrel']").css('border-color', "");
// 									}, 2000);
									$(this).next(".fambenrelerror").text("");
									
								} else {
									// 			$("#fambenrelerror").text("需要為中文");
									$(this).css("border-color", "red");
// 									setTimeout(function() {$("input[name*='fambenrel']").css('border-color', "");
// 									}, 2000);
									$("#errorcount").val(1);
									$(this).next(".fambenrelerror").text("保險受益關係格式錯誤");
								}
							}else{
								$(this).css("border-color", "red");
// 								setTimeout(function() {$("input[name*='fambenrel']").css('border-color', "");
// 								}, 2000);
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
// 							setTimeout(function() {$("input[name*='famemg']").css('border-color', "");
// 							}, 2000);
							$(this).next(".famemgerror").text("");
							
						} else {
							$(this).css("border-color", "red");
// 							setTimeout(function() {$("input[name*='famemg']").css('border-color', "");
// 							}, 2000);
							$(this).next(".famemgerror").text("緊急聯絡人格式錯誤");
							$("#errorcount").val(1);
						}
					}else{
						(this).css("border-color", "red");
// 						setTimeout(function() {$("input[name*='famemg']").css('border-color', "");
// 						}, 2000);
						$(this).next(".famemgerror").text("緊急聯絡人不能為空白");
						$("#errorcount").val(1);
					}
				});

				var famemgphpone = /^09\d{2}-?\d{3}-?\d{3}$/;
				$("input[name*='famemgphpone']").on("blur",function() {
							if(this.value !=""){
								if (famemgphpone.test($(this).val())) {
									$(this).css("border-color", "green")
									$("#errorcount").val(0);
// 									setTimeout(function() {$("input[name*='famemgphpone']").css('border-color', "");
// 									}, 2000);
									$("#famemgphoneerror").text("");
								} else {
									$(this).css("border-color", "red");
// 									setTimeout(function() {$("input[name*='famemgphpone']").css('border-color', "");
// 									}, 2000);
									$("#errorcount").val(1);
									$(this).next(".famemgerror").text("緊急聯絡人電話格式錯誤");
								}
							}else{
								$(this).css("border-color", "red");
// 								setTimeout(function() {$("input[name*='famemgphpone']").css('border-color', "");
// 								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famemgerror").text("緊急聯絡人電話不能為空白");
							}
						});

				var famemgrel = /^.*\s*[^\s]/;
				$("input[name*='famemgrel']").on("blur",function() {
					if(this.value !=""){
								if (famemgrel.test($(this).val())) {
									$(this).css("border-color", "green")
									$("#errorcount").val(0);
// 									setTimeout(function() {$("input[name*='famemgrel']").css('border-color', "");
// 									}, 2000);
									$(this).next(".famemgrelerror").text("");
								
								} else {
									$(this).css("border-color", "red");
// 									setTimeout(function() {$("input[name*='famemgrel']").css('border-color', "");
// 									}, 2000);
									$("#errorcount").val(1);
									$(this).next("famemgrelerror").text("緊急聯絡人關係格式錯誤");
								}
							}else{
								$(this).css("border-color", "red");
// 								setTimeout(function() {$("input[name*='famemgrel']").css('border-color', "");
// 								}, 2000);
								$("#errorcount").val(1);
								$(this).next(".famemgrelerror").text("緊急聯絡人不能為空白");
							}
						});
			});
		</script>

	</div>
</body>

</html>