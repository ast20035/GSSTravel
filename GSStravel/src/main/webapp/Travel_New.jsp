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
<script type="text/javascript">
	
</script>

<style type="text/css">
table{
font-size: 15px;
}
</style>
<title>新增行程</title>
</head>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1 col-md-offset-1'>
				<h2>新增行程</h2>
			</div>
		</div>
		<div class='col-md-6 col-md-offset-1'>
			<form action="<c:url value='/Travel_Edit'/>" method="GET" class='form'>
				<table class="t table">

					<tr>
						<td>活動代碼</td>
						<td><input type="text" name="edittraNO" class='form-control' readonly
							value="${params.tra_NO}" style="width: 300px"></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動名稱</td>

						<td><input type="text" name="edittraName" class='form-control' autofocus
							value="${params.tra_Name}" style="width: 300px"></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動地點</td>
						<td><SELECT name="edittraLoc" class='form-control' style='width:60px;'>
								<OPTION selected>${params.tra_Loc}</OPTION>
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

						<td><input type="text" name="edittraOn" class='form-control' style='width:150px;'
							value="${params.tra_On}"><a> ~</a> <input type="text" class='form-control' style='width:150px;'
							name="edittraOff" value="${params.tra_Off}"></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>登記時間</td>
						<td><input type="text" name="edittraBeg" class='form-control' style='width:200px;'
							value="${params.tra_Beg}"><a> ~</a> <input type="text" class='form-control' style='width:200px;'
							name="edittraEnd" value="${params.tra_End}"></td>

						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動總人數上限</td>

						<td><input type="text" name="edittraTotal" class='form-control' style='width:80px;'
							value="${params.tra_Total}"></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>本團人數上限</td>

						<td><input type="text" name="edittraMax" class='form-control' style='width:80px;'
							value="${params.tra_Max}"></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動說明</td>
						<td><textarea cols="50" rows="8" name="edittraIntr" class='form-control'>${params.tra_Intr}</textarea></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動內容</td>
						<td><textarea cols="50" rows="12" name="edittraCon" class='form-control'>${params.tra_Con}</textarea></td>
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

						<td><input type="text" name="edittraFile" class='form-control' style='width:300px;'
							value="${params.tra_File}"></td>
						<td></td>
					</tr>
					<tr>
						<td>費用</td>
						<td class="t">項目</td>
						<td class="t">金額</td>

					</tr>

					<c:forEach var="row" items="${paramsi}">
						<tr>

							<!-- 			<td></td> -->
							<%-- 			<td><input type="text"  value="${row.item_Name}"></td> --%>
							<%-- 			<td><input type="text"  value="${row.item_Money}"></td> --%>
							<!-- 			<!--<td><input type="text"  value="${row.tra_No}"></td> -->
							<!-- 			<td><input type="text"  value="${row.item_No}"></td>-->
							<%-- 			<td class="t">tra_No : ${row.tra_No}</td> --%>
							<%-- 			<td class="t">item_No : ${row.item_No}</td> --%>

						</tr>
					</c:forEach>

					<tr>
						<td><input type="submit" name="inputerrors" value="Insert" class='btn btn-primary'>
							<input type="submit" name="" value="取消" class='btn btn-primary'></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 	<button><a href="<c:url value="/AllTravel"></c:url>" class="a">回上一頁</a></button><button><a href="<c:url value="/Login_Information?tra_No=${traveResult.tra_NO}&emp_No=${emp_No}" ></c:url>" class="a">報名</a></button>
	 -->

	</div>
</body>
</html>