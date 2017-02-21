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
$("#tsfield").inputmask("timestamp", { 
    mask:        "y/1/2 h:s:s",
    placeholder: "yyyy/mm/dd hh:mm:ss",
    separator:   "/",
    alias:       "datetime",
    hourFormat:  "24"
});
</script>

<style type="text/css">
li {
	list-style-type: none;
}

.t {
	border: 1px solid black;
}

.a {
	text-decoration: none;
	color: black;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class='container-fluid'>
		<h1>--行程編輯--</h1>
		<form action="<c:url value='/Travel_Edit'/>" method="GET">
			<table class="t">

				<tr>
					<td>活動代碼</td>
					<td><input name="tra_no" value="${params.tra_NO}" readonly
						type="text" /></td>
					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>活動名稱</td>

					<td><input type="text" name="edittraName"
						value="${params.tra_Name}" style="width: 320px"></td>
					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>活動地點</td>
					<td><SELECT name="edittraLoc">
							<OPTION selected="selected">${params.tra_Loc}</OPTION>
							<!-- <option selected="selected" value="null">請選擇地點</option> -->
							<OPTION value="北">北</OPTION>
							<OPTION value="中">中</OPTION>
							<OPTION value="南">南</OPTION>
							<OPTION value="東">東</OPTION>
							<OPTION value="外島">外島</OPTION>
					</SELECT></td>
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
					<td><em style="color: red">*</em>活動日期</td>

					<td><input type="text" name="edittraOn"
						value="${params.tra_On}"><a> ~</a> <input type="date"
						name="edittraOff" value="${params.tra_Off}"></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>登記時間</td>
					<td><input type="text" name="edittraBeg"
						value="${params.tra_Beg}"><a> ~</a> <input type="date"
						name="edittraEnd" value="${params.tra_End}"></td>

					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>活動總人數上限</td>

					<td><input type="text" name="edittraTotal"
						value="${params.tra_Total}"></td>
					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>本團人數上限</td>

					<td><input type="text" name="edittraMax"
						value="${params.tra_Max}"></td>
					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>活動說明</td>
					<td><textarea cols="50" rows="10" name="edittraIntr">${params.tra_Intr}</textarea></td>
					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>活動內容</td>
					<td><textarea cols="50" rows="10" name="edittraCon">${params.tra_Con}</textarea></td>
					<td></td>
				</tr>
				<tr>
					<td><em style="color: red">*</em>注意事項</td>

					<td><input type="text" name="edittraAtter"
						value="${params.tra_Atter}"></td>
					<td></td>
				</tr>
				<tr>
					<td>附件</td>

					<td><input type="text" name="edittraFile"
						value="${params.tra_File}"></td>
					<td></td>
				</tr>


				<tr>
					<td>費用</td>
					<td><input type="button" value="新增欄位" id="insert"
						name="button"></td>>
				</tr>
			</table>

			<table id="Itemtable" class="t">

				<tr>

					<td class="t">項目</td>
					<td class="t">金額</td>

				</tr>
				<c:forEach var="row" items="${paramsi}">
					<tr>

						<td><SELECT name="edititemName">
								<option selected="selected">${row.item_Name}</option>
								<OPTION value="團費">團費</OPTION>
								<OPTION value="保險費">保險費</OPTION>
								<OPTION value="住宿費(兩人房)">住宿費(兩人房)</OPTION>
								<OPTION value="住宿費(通鋪8人)">住宿費(通鋪8人)</OPTION>
								<OPTION value="住宿費(加床)">住宿費(加床)</OPTION>
						</SELECT></td>
						<td><input type="text" name="edititemMoney"
							value="${row.item_Money}"></td>

						<td><input type="text" name="edititemNo"
							value="${row.item_No}"></td>
							<td><input type="text" name="tra_no" value="${row.tra_No}"
					></td>
<%-- 						<td class="t">tra_No : ${row.tra_No}</td> --%>
<%-- 						<td class="t">item_No : ${row.item_No}</td> --%>
					<td><input type="submit" name="delete" id="delete"
								value="delete"></td>
					</tr>
					
				</c:forEach>
			</table>

			<a><input type="submit" name="inputerrors" value="Update">
				<input type="submit" name="inputerrors" value="Delete"> <input
				type="submit" name="" value="關閉"></a>
		</form>
		<table>

			<tr name="newtable">
				<td><SELECT name="edititemName">
						<option selected="selected">${row.item_Name}</option>
						<OPTION value="團費">團費</OPTION>
						<OPTION value="保險費">保險費</OPTION>
						<OPTION value="住宿費(兩人房)">住宿費(兩人房)</OPTION>
						<OPTION value="住宿費(通鋪8人)">住宿費(通鋪8人)</OPTION>
						<OPTION value="住宿費(加床)">住宿費(加床)</OPTION>
				</SELECT></td>
				<td><input type="text" name="edititemMoney"
					value="${row.item_Money}"></td>

				<td><input type="text" name="edititemNo" value="${row.item_No}"
					></td>
					<td><input type="text" name="tra_no" value="${row.tra_No}"></td>
<%-- 				<td class="t">tra_No : ${row.tra_No}</td> --%>
<%-- 				<td class="t">item_No : ${row.item_No}</td> --%>
				<td><input type="submit" name="delete" id="delete"
								value="delete"></td>
			</tr>
		</table>

		<script>
			$(function() {
				$("tr[name='newtable']").hide();
				$("#insert").click(function(event) {$("#Itemtable").append('<tr class=newtable>'+ $("tr[name='newtable']").html()
											+ '</tr>');
						})
				//刪除動態tr		
				$("#Itemtable").on("click", "input[name='delete']",
						function() {
						$(this).parents("tr").remove();
						});

						
			});
			

		</script>
	</div>
</body>
</html>