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
<link href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" />

<script src='js/jquery.inputmask.date.extensions.js'></script>
<script src='js/jquery-3.1.1.min.js'></script>
<script type="text/javascript">
	
</script>

<style type="text/css">
table {
	font-size: 15px;
	margin-bottom: 20px;
}

input[type='text'], textarea {
	font-size: 15px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1 col-md-offset-1'>
				<h2>行程編輯</h2>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-offset-1 col-md-6'>
				<form action="<c:url value='/Travel_Edit'/>" method="GET"
					class='form'>
					<table class="t table">

						<tr>
							<td>活動代碼</td>
							<td><input name="tra_no" value="${params.tra_NO}" readonly
								class='form-control' type="text" style="width: 300px" /></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動名稱</td>

							<td><input type="text" name="edittraName"
								value="${params.tra_Name}" style="width: 300px"
								class='form-control'></td>
							<td></td>
						</tr>
						<tr>
							<td>*活動地點 ${params.tra_Loc}</td>

							<td><SELECT name="edittraLoc" class='form-control'
								style='width: 80px;'>
									<option value="" selected>${params.tra_Loc}</option>
									<OPTION value="北">北</OPTION>
									<OPTION value="中">中</OPTION>
									<OPTION value="南">南</OPTION>
									<OPTION value="東">東</OPTION>
									<OPTION value="外島">外島</OPTION>
							</SELECT></td>
							<!-- 					<td><select name="edittraLoc"> -->

							<%-- 							<option value="北" ${params.tra_Loc == '北' ? 'selected' : ''}>北</option> --%>
							<%-- 							<option value="中" ${params.tra_Loc == '中' ? 'selected' : ''}>中</option> --%>
							<%-- 							<option value="南" ${params.tra_Loc == '南' ? 'selected' : ''}>南</option> --%>
							<%-- 							<option value="東" ${params.tra_Loc == '東' ? 'selected' : ''}>東</option> --%>
							<%-- 							<option value="外島" ${params.tra_Loc == '外島' ? 'selected' : ''}>外島</option> --%>


							<!-- 					</select></td> -->
							<!-- 				<td><select name="edittraLoc"> -->
							<%-- 				<option selected="selected">${params.tra_Loc}</option> --%>
							<%-- 				<c:if test="${params.tra_Loc=='北'}"> --%>
							<!-- 		     <option value="北" selected>北</option> -->
							<!-- 		     <option value="中">中</option> -->
							<!-- 		     <option value="南">南</option> -->
							<!-- 		     <option value="東">東</option> -->
							<!-- 		     <option value="外島">外島</option> -->
							<%-- 			 </c:if> --%>

							<%-- 			<c:if test="${params.tra_Loc=='中'}"> --%>
							<!-- 		     <option value="北" >北</option> -->
							<!-- 		     <option value="中" selected>中</option> -->
							<!-- 		     <option value="南" >南</option> -->
							<!-- 		     <option value="東">東</option> -->
							<!-- 		     <option value="外島">外島</option> -->
							<%-- 			 </c:if> --%>

							<%-- 			 <c:if test="${params.tra_Loc=='南'}"> --%>
							<!-- 		     <option value="北" >北</option> -->
							<!-- 		     <option value="中"	>中</option> -->
							<!-- 		     <option value="南" selected>南</option> -->
							<!-- 		     <option value="東">東</option> -->
							<!-- 		     <option value="外島">外島</option> -->
							<%-- 			 </c:if> --%>

							<%-- 			 <c:if test="${params.tra_Loc=='東'}"> --%>
							<!-- 		     <option value="北" >北</option> -->
							<!-- 		     <option value="中">中</option> -->
							<!-- 		     <option value="南">南</option> -->
							<!-- 		     <option value="東" selected>東</option> -->
							<!-- 		     <option value="外島">外島</option> -->
							<%-- 			 </c:if> --%>

							<%-- 			  <c:if test="${params.tra_Loc=='外島'}"> --%>
							<!-- 		     <option value="北" >北</option> -->
							<!-- 		     <option value="中">中</option> -->
							<!-- 		     <option value="南">南</option> -->
							<!-- 		     <option value="東">東</option> -->
							<!-- 		     <option value="外島" selected>外島</option> -->
							<%-- 			 </c:if> --%>


							<!-- 				</select></td> -->

							<!-- 
<select class="" name ="edittraName"  m data-placeholder="請選擇" style="width: 200px;">
			 <c:if test="${start.fam_Bady=='false'} ${start.fam_kid=='false'} ${start.fam_Dis=='false'} ${start.fam_Mom=='false'}" >
			 <option value="no" Selected>請選擇</option>
			 </c:if>
			 
		     <c:if test="${start.fam_Bady=='false'}">
		     <option value="baby">幼童(0~3歲)</option>
			 </c:if>
			 <c:if test="${start.fam_Bady}">
			 <option value="baby" Selected>幼童(0~3歲)</option>
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

	-->

							<!--<td><input type="text" name="edittraLoc" value="${params.tra_Loc}"></td>-->
							<td></td>
						</tr>
						<tr>
						<tr>
							<td>*活動日期</td>

							<td><input type="text" name="edittraOn" class='form-control'
								style='width: 150px;' value="${params.tra_On}"><a> ~</a>
								<input type="text" class='form-control' name="edittraOff"
								value="${params.tra_Off}" style='width: 150px;'></td>
						</tr>
						<tr>
							<td>*登記時間</td>
							<td><input type="text" name="edittraBeg"
								style='width: 200px;' class='form-control'
								value="${params.tra_Beg}"><a> ~</a> <input type="text"
								class='form-control' name="edittraEnd" style='width: 200px;'
								value="${params.tra_End}"></td>

							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動總人數上限</td>

							<td><input type="text" name="edittraTotal"
								style='width: 80px;' class='form-control'
								value="${params.tra_Total}"></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>本團人數上限</td>

							<td><input type="text" name="edittraMax"
								style='width: 80px;' class='form-control'
								value="${params.tra_Max}"></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動說明</td>
							<td><textarea cols="50" rows="8" name="edittraIntr"
									class='form-control'>${params.tra_Intr}</textarea></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動內容</td>
							<td><textarea cols="50" rows="12" name="edittraCon"
									class='form-control'>${params.tra_Con}</textarea></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>注意事項</td>

							<td><textarea cols="50" rows="5" name="edittraAtter"
									class='form-control' value="${params.tra_Atter}"></textarea></td>
							<td></td>
						</tr>
						<tr>
							<td>附件</td>

							<td><input type="text" name="edittraFile"
								style='width: 300px;' class='form-control'
								value="${params.tra_File}"></td>
							<td></td>
						</tr>


						<tr>
							<td>費用</td>
							<td><input type="button" value="新增欄位" id="insert"
								class='btn btn-success' name="button"></td>
						</tr>
					</table>

					<table id="Itemtable" class="t">

						<tr>

							<td class="t">項目</td>
							<td class="t">金額</td>

						</tr>
						<c:forEach var="row" items="${paramsi}">
							<tr>

								<td><SELECT name="edititemName" class='form-control'>
										<option selected="selected">${row.item_Name}</option>
										<OPTION value="團費">團費</OPTION>
										<OPTION value="保險費">保險費</OPTION>
										<OPTION value="住宿費(兩人房)">住宿費(兩人房)</OPTION>
										<OPTION value="住宿費(通鋪8人)">住宿費(通鋪8人)</OPTION>
										<OPTION value="住宿費(加床)">住宿費(加床)</OPTION>
								</SELECT></td>
								<td><input type="text" name="edititemMoney"
									class='form-control' value="${row.item_Money}"></td>

								<td><input type="text" name="edititemNo"
									class='form-control' value="${row.item_No}"></td>
								<td><input type="text" name="tra_no" value="${row.tra_No}"
									class='form-control'></td>
								<%-- 						<td class="t">tra_No : ${row.tra_No}</td> --%>
								<%-- 						<td class="t">item_No : ${row.item_No}</td> --%>
								<td><input type="submit" name="delete" id="delete"
									class='btn btn-success' value="delete"></td>
							</tr>

						</c:forEach>
					</table>
					<br> <input type="submit" name="inputerrors" value="Update"
						class='btn btn-primary'> <input type="submit"
						name="inputerrors" value="Delete" class='btn btn-primary'>
					<input type="button" name="" value="回上一頁" class='btn btn-primary'>
				</form>
				<table>

					<tr name="newtable">
						<td><SELECT name="edititemName" class='form-control'>
								<option selected="selected">${row.item_Name}</option>
								<OPTION value="團費">團費</OPTION>
								<OPTION value="保險費">保險費</OPTION>
								<OPTION value="住宿費(兩人房)">住宿費(兩人房)</OPTION>
								<OPTION value="住宿費(通鋪8人)">住宿費(通鋪8人)</OPTION>
								<OPTION value="住宿費(加床)">住宿費(加床)</OPTION>
						</SELECT></td>
						<td><input type="text" name="edititemMoney"
							class='form-control' value="${row.item_Money}"></td>

						<td><input type="text" name="edititemNo" class='form-control'
							value="${row.item_No}"></td>
						<td><input type="text" name="tra_no" value="${row.tra_No}"
							class='form-control'></td>
						<%-- 				<td class="t">tra_No : ${row.tra_No}</td> --%>
						<%-- 				<td class="t">item_No : ${row.item_No}</td> --%>
						<td><input type="submit" name="delete" id="delete"
							class='btn btn-success' value="delete"></td>
					</tr>
				</table>
			</div>
		</div>
		<script>
			$(function() {
				$("tr[name='newtable']").hide();
				$("#insert").click(
						function(event) {
							$("#Itemtable").append(
									'<tr class=newtable>'
											+ $("tr[name='newtable']").html()
											+ '</tr>');
						})
				//刪除動態tr		
				$("#Itemtable").on("click", "input[name='delete']", function() {
					$(this).parents("tr").remove();
				});

			});
		</script>


	</div>

</body>
</html>