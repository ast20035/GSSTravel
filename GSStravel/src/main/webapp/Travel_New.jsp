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
}
body{
margin-bottom: 4%;
}
</style>
<title>行程編輯</title>
</head>
<script type="text/javascript">
	if(${error!=null}){
		alert("${error}");
	}
</script>
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1 col-md-offset-1'>
				<h2>行程修改</h2>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-6 col-md-offset-1'>
				<form action="<c:url value='/SetUpTravel'/>" method="GET">
					<table class="t table">

						<tr>
							<td>活動代碼</td>
							<td><input name="edittraNO" value="${tra_No}" readonly class='form-control' style="width: 300px"
								type="text" /></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動名稱</td>

							<td><input type="text" name="edittraName" class='form-control'
								value="" style="width: 300px"></td>
							<td></td>
						</tr>
						<tr>
							<td>*活動地點</td>
							<td><select name="edittraLoc" class='form-control' style='width:60px;'>

									<option value="北" ${params.tra_Loc == '北' ? 'selected' : ''}>北</option>
									<option value="中" ${params.tra_Loc == '中' ? 'selected' : ''}>中</option>
									<option value="南" ${params.tra_Loc == '南' ? 'selected' : ''}>南</option>
									<option value="東" ${params.tra_Loc == '東' ? 'selected' : ''}>東</option>
									<option value="外島" ${params.tra_Loc == '外島' ? 'selected' : ''}>外島</option>


							</select></td>
							<td></td>
						</tr>
						<tr>
							<tr>
						<td>*活動日期</td>

						<td><input type="text" name="edittraOn" class='form-control' style='width:150px;'
								value=""><a> ~</a> <input type="text" class='form-control' style='width:150px;'
								name="edittraOff" value=""></td>
					</tr>
					<tr>
						<td>*登記時間</td> 
						<td><input type="text" name="edittraBeg" class='form-control' style='width:200px;'
								value=""><a> ~</a> <input type="text" class='form-control' style='width:200px;'
								name="edittraEnd" value=""></td>

						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動總人數上限</td>

						<td><input type="text" name="edittraTotal" class='form-control' style='width:80px;'
								value=""></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>本團人數上限</td>

						<td><input type="text" name="edittraMax" class='form-control' style='width:80px;'
								value=""></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動說明</td>
						<td><textarea cols="50" rows="8" name="edittraIntr" class='form-control'></textarea></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>活動內容</td>
						<td><textarea cols="50" rows="12" class='form-control' name="edittraCon"></textarea></td>
						<td></td>
					</tr>
					<tr>
						<td><em style="color: red">*</em>注意事項</td>

						<td><textarea cols="50" rows="5" name="edittraAtter"
									class='form-control'  value=""></textarea></td>
						<td></td>
					</tr>
					<tr>
						<td>附件</td>

						<td><input type="text" name="edittraFile" class='form-control' style='width:300px;'
								value=""></td>
						<td></td>
					</tr>


					<tr>
						<td>費用</td>
						<td><input type="button" value="新增欄位" id="insert" class='btn btn-success'
								name="button"></td>
					</tr>
				</table>

				<table id="Itemtable" class="t table">

					<tr>

						<td class="t">項目</td>
						<td class="t">金額</td>

					</tr>
					<tr>
						<td class="t">團費</td>
						<td class="t"><input type="text" name="item1"/></td>
					</tr>
					<tr>
						<td class="t">保險費</td>
						<td class="t"><input type="text" name="item2"/></td>
					</tr>
					<c:forEach var="row" items="${paramsi}">
						<tr>

							<td><SELECT name="edititemName" class='form-control'>
									
									<option value="住宿費(兩人房)"
											${row.item_Name == '住宿費(兩人房)' ? 'selected' : ''}>住宿費(兩人房)</option>
									<option value="住宿費(通鋪8人)"
											${row.item_Name == '住宿費(通鋪8人)' ? 'selected' : ''}>住宿費(通鋪8人)</option>
									<option value="住宿費(加床)"
											${row.item_Name == '住宿費(加床)' ? 'selected' : ''}>住宿費(加床)</option>

							</SELECT></td>
							<td><input type="text" name="edititemMoney" class='form-control'
									value="${row.item_Money}"></td>
							<td><input type="submit" name="delete" id="delete" class='btn btn-danger'
									value="delete"></td>
						</tr>

					</c:forEach>
				</table>

				<input type="submit"  value="新增" class='btn btn-primary'>	
			</form>
			<button class='btn  btn-primary'><a href="<c:url value='/search2.jsp'/>" style="color:white;text-decoration:none;">回到上一頁</a></button>
			<table>

				<tr name="newtable">
					<td><SELECT name="edititemName" class='form-control'>
							<option selected="selected" disabled="disabled">請選擇</option>
							<option value="住宿費(兩人房)"
									${row.item_Name == '住宿費(兩人房)' ? 'selected' : ''}>住宿費(兩人房)</option>
							<option value="住宿費(通鋪8人)"
									${row.item_Name == '住宿費(通鋪8人)' ? 'selected' : ''}>住宿費(通鋪8人)</option>
							<option value="住宿費(加床)"
									${row.item_Name == '住宿費(加床)' ? 'selected' : ''}>住宿費(加床)</option>

					</SELECT></td>
					<td><input type="text" name="edititemMoney" class='form-control'
							value="${row.item_Money}"></td>
					<td><input type="submit" name="delete" id="delete" class='btn btn-danger'
							value="delete"></td>
				</tr>
			</table>

			<script>
				$(function() {
					$("tr[name='newtable']").hide();
					//動態新增tr
					$("#insert").click(
							function(event) {
								$("#Itemtable").append(
										'<tr class=newtable>'
												+ $("tr[name='newtable']")
														.html() + '</tr>');

							})
					//刪除動態tr		
					$("#Itemtable").on("click", "input[name='delete']",
							function() {
								$(this).parents("tr").remove();
							});

				});
			</script>
			</div>
		</div></div>
</body>
</html>