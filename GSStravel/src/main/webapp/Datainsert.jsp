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
<style>
tr>td {
	padding-top: 3px;
	padding-bottom: 3px;
	padding-right: 10px;
}

td>input[type='text'] {
	width: 200px;
}

</style>
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
						<table class='table-responsive table1'>

							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon1">員工編號</span>
								<input type='text' class='form-control' readonly value='${empno}' aria-describedby="sizing-addon1"/></div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon2">姓名</span>
								<input type='text' class='form-control' readonly value='${empname}' aria-describedby="sizing-addon2" /></div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon3">手機</span>
								<input type="text" name="empphone" id="empphone" class='form-control' autofocus aria-describedby="sizing-addon3" 
									value="${empphone}"></div>
									<div id=empphoneerror>${error.empphone}</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon4">保險受益人</span>
								<input type="text" name="empben" id="empben" class='form-control' aria-describedby="sizing-addon4"
									value="${empben}"></div>
									<div id=empbenerror>${error.empben}</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon5">與受益人關係</span>
								<input type="text" name="empbenrel" id="empbenrel" class='form-control' aria-describedby="sizing-addon5"
									value="${empbenrel}"></div>
									<div id=empbenrelerror>${error.empbenrel}</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon6">緊急聯絡人</span>
								<input type="text" name="empemg" id="empemg" class='form-control' aria-describedby="sizing-addon6"
									value="${empemg}"></div>
									<div id=empemgerror>${error.empemg}</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon7">緊急聯絡人電話</span>
								<input type="text" name="empemgphone" id="empemgphone" class='form-control'  aria-describedby="sizing-addon7"
									value="${empemgphone}"></div>
									<div id=empemgphoneerror>${error.empemgphone}</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon8">信箱</span>
								<input type="text" name="empemail" id="empemail" class='form-control' aria-describedby="sizing-addon8"
									value="${empemail}"></div>
									<div id=empemailerror>${error.empemailerror}</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon8">用餐</span>
								<select name="empeat" aria-describedby="sizing-addon8" class='form-control'>
										<c:if test="${empeat=='葷'}">
											<option value="葷" selected>葷</option>
											<option value="素">素</option>
										</c:if>
										<c:if test="${empeat=='素'}">
											<option value="葷">葷</option>
											<option value="素" selected>素</option>
										</c:if>
								</select> (如有特別要求請填寫於備註)</div></td>
							</tr>
							<tr>
								<td><div class='input-group'><span class="input-group-addon info" id="sizing-addon9">備註</span>
							<input type="text" name="empnote" id="empnote" aria-describedby="sizing-addon9" class='form-control'
									value="${empnote}"></div>
									<div id=empnoteerror></div></td>
							</tr>

						</table>
				</div>
			</div>
			<div class='row'>
				<div class='col-md-1'></div>
				<div class='col-md-11'>
					<div>
						－眷屬親友資訊－<br> *眷屬包含直系及旁系二等親，納入補助計算<br>
						*親友為旁系三等親以上及朋友，不納入補助計算<br>
					</div>


					<table id="familytable"
						class='table table-bordered table-responsive'>
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
										value="delete" class="${start.fam_No}"></td>
									<td><select name="famrel">
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
										value="${start.fam_Name}">
										<div class="famnameerror" name="famnameerror">${error.famneme}</div></td>
									<td><select name="famsex">
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

									<td><input type="text" name="famid" class="famid"
										value="${start.fam_Id}">
										<div class="famiderror" name="famiderror">${error.famid}</div></td>
									<td><input type="date" id="fambdate" name="fambdate"
										class="fambdate" value="${start.fam_Bdate}" />
										<div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div></td>
									<td><input type="text" name="famphone" id="famphone"
										value="${start.fam_Phone}">
										<div class=famphoneerror>${error.famphone}</div></td>
									<td><select name="fameat">
											<!-- 今天的日期 減去 他的生日 < 三歲  (剩幾天?) (看年底還是年初)  看年?  -->
											<c:if test="${start.fam_Eat=='葷'}">
												<option value="葷" selected>葷食</option>
												<option value="素">素食</option>
											</c:if>
											<c:if test="${start.fam_Eat=='素'}">
												<option value="葷">葷</option>
												<option value="素" selected>素</option>
											</c:if>
									</select> <c:if test="${start.fam_Car=='true'}">
											<input id="${start.fam_No}_car" name="famcar" type="checkbox"
												value="true" checked>
											<div>占車位</div>
										</c:if> <c:if test="${start.fam_Car=='false'}">
											<input id="${start.fam_No}_car" name="famcar" type="checkbox"
												value="true">
											<div>占車位</div>
										</c:if></td>

									<td><select class="multiselect aaa" name="famspa"
										style="width: 400px;" multiple="multiple"
										data-placeholder="請選擇">

											<c:if test="${start.fam_Bady=='false'}">
												<option value="baby">幼童(0~3歲)</option>
											</c:if>
											<c:if test="${start.fam_Bady}">
												<option id="${start.fam_No}_span_1" value="baby" Selected>幼童(0~3歲)</option>
											</c:if>
											<script>
												console
														.log('${start.fam_No}_span_1');
											</script>

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
									</select></td>

									<td><input type="text" name="famben" id="famben"
										value="${start.fam_Ben}">
										<div class="fambenerror">${error.famben}</div></td>
									<td><input type="text" name="fambenrel" id="fambenrel"
										value="${start.fam_BenRel}">
										<div class="fambenrelerror">${error.fambenrel}</div></td>
									<td><input type="text" name="famemg" id="famemg"
										value="${start.fam_Emg}">
										<div class="famemgerror">${error.famemg}</div></td>
									<td><input type="text" name="famemgphpone"
										id="famemgphone" value="${start.fam_EmgPhone}">
										<div class="famemgphoneerror">${error.famemgphone}</div></td>
									<td><input type="text" name="famemgrel" id="famemgrel"
										value="${start.fam_EmgRel}">
										<div class="famemgrelerror">${error.famemgrel}</div></td>
									<td><input type="text" name="famnote" id="famnote"
										value="${start.fam_Note}">
										<div class="famnoteerror"></div></td>
								</tr>
							</c:forEach>

						</c:if>

					</table>
					<br>
					<!--新增、儲存 -->
					<input type="button" value="新增欄位" id="insert" name="button"
						class='btn btn-primary' /> <input type="submit" value="儲存"
						class='btn btn-primary' id="save" name="button"><br>
					<span>${error.famblock}</span>
				</div>
			</div>

		</form>

		<table class='table table-bordered'>
			<!-- 空白欄位 -->
			<tr name="repeat">
				<td><input type="button" name="delete" id="delete"
					value="delete"></td>
				<td><select name="famrel">
						<option value="眷屬">眷屬</option>
						<option value="親友">親友</option>
				</select></td>
				<td><input type="text" name="famname" id="famname">
					<div class="famnameerror" name="famnameerror">${error.famneme}</div></td>
				<td><select name="famsex">
						<!--  servlet抓name db抓值會抓進value值進去-->
						<option value="女">女</option>
						<option value="男">男</option>
				</select></td>
				<td><input type="text" name="famid" class="famid">
					<div class="famiderror" name="famiderror">${error.famid}</div></td>
				<td><input type="date" id="fambdate" name="fambdate"
					class="fambdate" />
					<div class="fambdateerror">${error.fambdate}${error.fambdatedate}</div></td>
				<td><input type="text" name="famphone" id="famphone">
					<div class=famphoneerror>${error.famphone}</div></td>
				<td><select name="fameat">
						<option value="葷">葷</option>
						<option value="素">素</option>
					</select> 
					<input name="famcar" type="checkbox" value="true" class="${start.fam_No}">
					<div>不占車位</div></td>
				<td><select name="famspa" id="multiselect" multiple="multiple"
					style="width: 400px;" data-placeholder="請選擇">
						<option>幼童(0~3歲)</option>
						<option>兒童(4~11歲)</option>
						<option>持身心障礙手冊</option>
						<option>孕婦(媽媽手冊)</option>
				</select></td>
				<td><input type="text" name="famben" id="famben">
					<div class="fambenerror">${error.famben}</div></td>
				<td><input type="text" name="fambenrel" id="fambenrel">
					<div class="fambenrelerror">${error.fambenrel}</div></td>
				<td><input type="text" name="famemg" id="famemg">
					<div class="famemgerror">${error.famemg}</div></td>
				<td><input type="text" name="famemgphpone" id="famemgphone">
					<div class="famemgphoneerror">${error.famemgphone}</div></td>
				<td><input type="text" name="famemgrel" id="famemgrel">
					<div class="famemgrelerror">${error.famemgrel}</div></td>
				<td><input type="text" name="famnote" id="famnote">
					<div class="famnoteerror"></div></td>
			</tr>
		</table>

		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>報名維護</h2>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-2'>
				<br>
				<fieldset>
					<form>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon1">活動代碼:</span><input
								type='text' id='id' value='' aria-describedby="sizing-addon1"
								class='form-control' />
						</div>
						<br>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon2">活動名稱:</span> <input
								type='text' id='tra_name' value=''
								aria-describedby="sizing-addon2" class='form-control' />
						</div>
						<br>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon3"> 開始日期:</span><input
								type='date' id='Sdate' name='startDay' value=''
								aria-describedby="sizing-addon3" class='form-control' /> <input
								type='date' id='Edate' name='endDay' value=''
								class='form-control' />
						</div>
						<br>
						<div class='input-group'>
							<span class="input-group-addon info" id="sizing-addon3">活動地點:</span> <select
								class="multiselect" name="loca" multiple="multiple"
								data-placeholder="請選擇" style="width: 300px;">
								<option>東</option>
								<option>西</option>
								<option>南</option>
								<option>北</option>

							</select>
						</div>
						<br> 
						<div class='btn-group'>
						<input type="button" value="查詢" onclick="search()"  class='btn btn-primary'/> 
						<input  class='btn btn-primary' 
							type="reset"></div>
					</form>
				</fieldset>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-10'>
				<table class='table' cellpadding="10">
					<thead>
						<tr>
							<th>活動代碼</th>
							<th>活動名稱</th>
							<th>活動開始</th>
							<th>活動結束</th>
							<th>登記開始</th>
							<th>登記結束</th>
							<th>人數上限</th>
							<th>已報名人數</th>
							<th>活動地點</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class='col-md-1'></div>
		</div>
	</div>

	</div>
</body>

</html>