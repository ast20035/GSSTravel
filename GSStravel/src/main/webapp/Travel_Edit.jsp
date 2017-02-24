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


<script src='js/jquery-3.1.1.min.js'></script>
<script type="text/javascript">
	function show_confirm() {
		var r = confirm("確定取消?");
		if (r == true) {
			window.history.back()
		}

	}
	
	String.prototype.IsGreatThan = function(mvarCompareTo){
		  if(isNaN(parseFloat(this))||isNaN(parseFloat(mvarCompareTo))) 
		    return this>mvarCompareTo;
		  else
		return parseFloat(this)>parseFloat(mvarCompareTo);
		}
	
/* 點選更新後，欄位再次判斷，無誤再送出資料 */
 
	function formtable_b(form) {
		var edittraName = document.getElementById("edittraName");
		var edittraLoc = document.getElementById("edittraLoc");
		var edittraOn = document.getElementById("edittraOn");
		var edittraOff = document.getElementById("edittraOff");
		var edittraBeg = document.getElementById("edittraBeg");
		var edittraEnd = document.getElementById("edittraEnd");
		var edittraTotal = document.getElementById("edittraTotal");
		var edittraMax = document.getElementById("edittraMax");
		var edittraIntr = document.getElementById("edittraIntr");
		var edittraCon = document.getElementById("edittraCon");
		var edittraAtter = document.getElementById("edittraAtter");
		var edittraTotal = document.getElementById("edittraTotal");
		var edittraMax = document.getElementById("edittraMax");
		var editdate = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
		var editdateTime =/20\d{2}(-|\/)((0[1-9])|(1[0-2]))(-|\/)((0[1-9])|([1-2][0-9])|(3[0-1]))(T|\s)(([0-1][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])/;
		var edittraPerson = /^\d*$/;
		var x = 0;
		var y = 0;
		var z = 0;
		var p = 0;
		if (edittraName.value == "") {
			alert("活動名稱為空值");
			eval("document.formtable['edittraName'].focus()");
			return false;
		} else if (edittraLoc.value == "請選擇") {
			alert("請選擇地點");
			eval("document.formtable['edittraLoc'].focus()");
			return false;
		} else if (edittraOn.value == "") {
			alert("請輸入活動開始日期");
			eval("document.formtable['edittraOn'].focus()");
			return false;
		}else if (edittraOff.value == "") {
			alert("請輸入活動結束日期");
			eval("document.formtable['edittraOff'].focus()");
			return false;
		}else if (edittraBeg.value == "") {
			alert("請輸入登記開始日期");
			eval("document.formtable['edittraBeg'].focus()");
			return false;
		}else if (edittraEnd.value == "") {
			alert("請輸入登記結束日期");
			eval("document.formtable['edittraEnd'].focus()");
			return false;
		}else if (edittraTotal.value == 0) {
			alert("請輸入活動總人數上限");
			eval("document.formtable['edittraTotal'].focus()");
			return false;
		}else if (edittraMax.value == 0) {
			alert("請輸入本團人數上限");
			eval("document.formtable['edittraMax'].focus()");
			return false;
		}
// 		else if (edittraIntr.value == "") {
// 			alert("請輸入活動說明");
// 			eval("document.formtable['edittraIntr'].focus()");
// 			return false;
// 		}
		else if (edittraCon.value == "") {
			alert("請輸入活動內容");
			eval("document.formtable['edittraCon'].focus()");
			return false;
		}
// 		else if (edittraAtter.value == "") {
// 			alert("請輸入注意事項");
// 			eval("document.formtable['edittraAtter'].focus()");
// 			return false;
// 		}
		else {
			x = 1;
		}

		if (edittraOn.value != "") {
			if (editdate.test($(edittraOn).val())) {
				if (edittraOff.value != "") {
					if (editdate.test($(edittraOff).val())) {
						//alert("行程已修改GG");
						if(Date.parse($(edittraOn).val()).valueOf() > Date.parse($(edittraOff).val()).valueOf()){
							alert("活動開始時間不能晚於結束時間！");
							return false;
							}else{
								
 						y = 1;
					}
					} else {
						alert("活動結束日期格式錯誤");
						eval("document.formtable['edittraOff'].focus()");
						return false;
					}
				} 

			}else {
				alert("活動開始日期格式錯誤");
				eval("document.formtable['edittraOn'].focus()");
				return false;
			}
		}
		
		if (edittraBeg.value != "") {
			if (editdateTime.test($(edittraBeg).val())) {
				if (edittraEnd.value != "") {
					if (editdateTime.test($(edittraEnd).val())) {
						if(Date.parse($(edittraBeg).val()).valueOf() > Date.parse($(edittraEnd).val()).valueOf()){
							alert("登記開始時間不能晚於結束時間！");
							return false;
							}else{
								//alert("行程已修改GG");
						z = 1;
							}
					} else {
						alert("登記結束日期格式錯誤");
						eval("document.formtable['edittraEnd'].focus()");
						return false;
					}
				} 

			}else {
				alert("登記開始日期格式錯誤");
				eval("document.formtable['edittraBeg'].focus()");
				return false;
			}
		}
		 
		if (edittraTotal.value != "") {
			if (edittraPerson.test($(edittraTotal).val())) {
				if (edittraMax.value != "") {
					if (edittraPerson.test($(edittraMax).val())) {
						m = edittraMax.value;	
						t = edittraTotal.value;
						if(Number(edittraMax.value) > Number(edittraTotal.value)){	//方法1
// 							if(m.IsGreatThan(t)){	//方法2
							alert("本團人數不能多於活動總人數！");
							return false;
							}else{
								//alert("行程已修改GXX");
						p = 1;
							}
					} else {
						alert("本團人數格式錯誤");
						eval("document.formtable['edittraMax'].focus()");
						return false;
					}
				} 

			}else {
				alert("活動總人數格式錯誤");
				eval("document.formtable['edittraTotal'].focus()");
				return false;
			}
		}	
		
		if(x==1&&y==1&&z==1&&p==1){
			
					 alert("行程已修改");
					 return true;
			
		}
	}
</script>


<title>Insert title here</title>

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
<body>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1 col-md-offset-1'>
				<h3>行程修改</h3>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-6 col-md-offset-1'>
				<form name="formtable" id="formtable"action="<c:url value='/Travel_Edit'/>" method="GET" form onsubmit="return formtable_b()">
					<table class="t table">

						<tr>
							<td>活動代碼</td>
							<td><input name="tra_no" value="${params.tra_NO}" readonly
								class='form-control' style="width: 300px" type="text" /></td>
							<td></td>
							<div id=tra_noerror></div>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動名稱</td>

							<td><input type="text" name="edittraName" id="edittraName"
								class='form-control' value="${params.tra_Name}"
								style="width: 300px">
								<div id=edittraNameerror></div></td>
							<td></td>

						</tr>
						<tr>
							<td>*活動地點</td>
							<td><select name="edittraLoc" id="edittraLoc"
								class='form-control' style='width: 60px;'>

									<option value="北" ${params.tra_Loc == '北' ? 'selected' : ''}>北</option>
									<option value="中" ${params.tra_Loc == '中' ? 'selected' : ''}>中</option>
									<option value="南" ${params.tra_Loc == '南' ? 'selected' : ''}>南</option>
									<option value="東" ${params.tra_Loc == '東' ? 'selected' : ''}>東</option>
									<option value="外島" ${params.tra_Loc == '外島' ? 'selected' : ''}>外島</option>


							</select>
								<div id=edittraLocerror></div></td>
							<td></td>

						</tr>
						<tr>
						<tr>
							<td>*活動日期</td>

							<td>
								<div class="row">
									<div class="col-xs-4">
										<div class="Input-group">
											<a>開始日期</a> <input type="date" name="edittraOn"
												id="edittraOn" class='form-control' style='width: 150px;'
												value="${params.tra_On}">
											<div id=edittraOnerror></div>
										</div>
									</div>
									<!-- col-xs-4 -->

									<div class="col-xs-4">
										<div class="Input-group">
											<a>結束日期</a> <input type="date" class='form-control'
												style='width: 150px;' name="edittraOff" id="edittraOff"
												value="${params.tra_Off}">
											<div id=edittraOfferror></div>
										</div>
									</div>
									<!-- col-xs-4 -->
								</div> <!--row -->
							</td>

						</tr>
						<tr>
							<td>*登記時間</td>
							<td>
								<div class="row">
									<div class="col-xs-4">
										<div class="Input-group">

											<a>開始時間</a> <input type="text" name="edittraBeg"
												id="edittraBeg" class='form-control' style='width: 200px;'
												value="${params.tra_Beg}">
											<div id=edittraBegerror></div>
										</div>
									</div>
									<!-- col-xs-4 -->

									<div class="col-xs-4">
										<div class="Input-group">

											<a>結束時間</a> <input type="text" class='form-control'
												style='width: 200px;' name="edittraEnd" id="edittraEnd"
												value="${params.tra_End}">

											<div id=edittraEnderror></div>
										</div>
									</div>
									<!-- col-xs-4 -->
								</div> <!--row -->
							</td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動總人數上限</td>

							<td><input type="text" name="edittraTotal" id="edittraTotal"
								class='form-control' style='width: 80px;'
								value="${params.tra_Total}">
							<div id=edittraTotalerror></div></td>
							<td></td>

						</tr>
						<tr>
							<td><em style="color: red">*</em>本團人數上限</td>

							<td><input type="text" name="edittraMax" id="edittraMax"
								class='form-control' style='width: 80px;'
								value="${params.tra_Max}">
							<div id=edittraMaxerror></div></td>
							<td></td>

						</tr>
						<tr>
							<td><em style="color: red">*</em>活動說明</td>
							<td><textarea cols="50" rows="8" name="edittraIntr"
									id="edittraIntr" class='form-control'>${params.tra_Intr}</textarea>
								<div id=edittraIntrerror></div></td>
							<td></td>

						</tr>
						<tr>
							<td><em style="color: red">*</em>活動內容</td>
							<td><textarea cols="50" rows="12" class='form-control'
									name="edittraCon" id="edittraCon">${params.tra_Con}</textarea>
								<div id=edittraConerror></div></td>
							<td></td>

						</tr>
						<tr>
							<td><em style="color: red">*</em>注意事項</td>

							<td><textarea cols="50" rows="5" name="edittraAtter"
									id="edittraAtter" class='form-control'>${params.tra_Atter}</textarea>
								<div id=edittraAttererror></div></td>
							<td></td>

						</tr>
						<tr>
							<td>附件</td>

							<td><input type="text" name="edittraFile"
								class='form-control' style='width: 300px;'
								value="${params.tra_File}"></td>
							<td></td>
						</tr>


						<tr>
							<td>費用</td>
							<td><input type="button" value="新增費用" id="insert"
								class='btn btn-success' name="button"></td>
						</tr>
					</table>

					<table id="Itemtable" class="t table">

						<tr>

							<td class="t">項目</td>
							<td class="t">金額</td>

						</tr>
						<c:forEach var="row" items="${paramsi}">
							<tr>

								<td><SELECT name="edititemName" id="edititemName"
									class='form-control'>
										<option value="團費" ${row.item_Name == '團費' ? 'selected' : ''}>團費</option>
										<option value="保險費"
											${row.item_Name == '保險費' ? 'selected' : ''}>保險費</option>
										<option value="住宿費(兩人房)"
											${row.item_Name == '住宿費(兩人房)' ? 'selected' : ''}>住宿費(兩人房)</option>
										<option value="住宿費(通鋪8人)"
											${row.item_Name == '住宿費(通鋪8人)' ? 'selected' : ''}>住宿費(通鋪8人)</option>
										<option value="住宿費(加床)"
											${row.item_Name == '住宿費(加床)' ? 'selected' : ''}>住宿費(加床)</option>


							</SELECT></td>
								<div id=edititemNameerror></div></td>
						<td><input type="text" name="edititemMoney"
							id="edititemMoney" class='form-control' value="${row.item_Money}">
							<div id=edititemMoneyerror></div></td>
						<td><input type="submit" name="delete" id="delete"
							class='btn btn-success' value="delete"></td>


						</c:forEach>
					</table>

					<a><input type="submit" id="inputdate" name="inputerrors"
						value="更新" class='btn btn-primary'> <input type="button"
						onclick="show_confirm()" value="取消更新" class='btn btn-primary'>
						<input type="submit" name="inputerrors" value="刪除行程"
						class='btn btn-primary'> </a>
				</form>
				<table>

					<tr name="newtable">
						<td><SELECT name="edititemName" id="edititemName"
							class='form-control'>
								<option selected="selected" disabled="disabled">請選擇</option>
								<option value="住宿費(兩人房)"
									${row.item_Name == '住宿費(兩人房)' ? 'selected' : ''}>住宿費(兩人房)</option>
								<option value="住宿費(通鋪8人)"
									${row.item_Name == '住宿費(通鋪8人)' ? 'selected' : ''}>住宿費(通鋪8人)</option>
								<option value="住宿費(加床)"
									${row.item_Name == '住宿費(加床)' ? 'selected' : ''}>住宿費(加床)</option>


						</SELECT>
							<div id=edititemNameerror></div></td>
						<td><input type="text" name="edititemMoney"
							id="edititemMoney" class='form-control' value="${row.item_Money}">
							<div id=edititemMoneyerror></div></td>
						<td><input type="submit" name="delete" id="delete"
							class='btn btn-success' value="delete"></td>
					</tr>
				</table>

				<script>
					/*按扭動作*/

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

					/*欄位判斷*/
					var edittraName = /./;
					$("#edittraName").blur(function() {
						if (edittraName.test($(this).val())) {
							$('#edittraNameerror').text('')
							$(this).css("border-color", "green")
						} else {
							$('#edittraNameerror').text('活動名稱不可為空白')
							$(this).css("border-color", "red")
						}
					})

					var edittraLoc = /./;
					$("#edittraLoc").blur(function() {
						if (edittraLoc.test($(this).val())) {
							$('#edittraLocerror').text('')
							$(this).css("border-color", "green")
						} else {
							$('#edittraLocerror').text('請選擇地點')
							$(this).css("border-color", "red")
						}
					})

					var edittraOn = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;

					$("#edittraOn").blur(function() {
						if (this.value != "") {
							if (edittraOn.test($(this).val())) {
								$('#edittraOnerror').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edittraOnerror').text('開始日期格式錯誤')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraOnerror').text('請輸入開始日期')
							$(this).css("border-color", "red")
						}

					});

					var edittraOff = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;

					$("#edittraOff").blur(function() {
						if (this.value != "") {
							if (edittraOn.test($(this).val())) {
								$('#edittraOfferror').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edittraOfferror').text('開始日期格式錯誤')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraOfferror').text('請輸入結束日期')
							$(this).css("border-color", "red")
						}
					
					});
					
					var edittraBeg =/20\d{2}(-|\/)((0[1-9])|(1[0-2]))(-|\/)((0[1-9])|([1-2][0-9])|(3[0-1]))(T|\s)(([0-1][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])/;
					$("#edittraBeg").blur(function() {
						if (this.value != "") {
							if (edittraBeg.test($(this).val())) {
								$('#edittraBegerror').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edittraBegerror').text('開始日期格式錯誤')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraBegerror').text('請輸入開始日期')
							$(this).css("border-color", "red")
						}
					
					});
					
					var edittraEnd =/20\d{2}(-|\/)((0[1-9])|(1[0-2]))(-|\/)((0[1-9])|([1-2][0-9])|(3[0-1]))(T|\s)(([0-1][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])/;
					$("#edittraEnd").blur(function() {
						if (this.value != "") {
							if (edittraEnd.test($(this).val())) {
								$('#edittraEnderror').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edittraEnderror').text('開始日期格式錯誤')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraEnderror').text('請輸入開始日期')
							$(this).css("border-color", "red")
						}
					
					});
					
					var edittraTotal = /^\d*$/;
					$("#edittraTotal").blur(function() {
						if (this.value != "") {
							if (edittraTotal.test($(this).val())) {
								$('#edittraTotalerror').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edittraTotalerror').text('只能輸入數字')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraTotalerror').text('請輸入總人數')
							$(this).css("border-color", "red")
						}
					
					});
					
					var edittraMax = /^\d*$/;
					$("#edittraMax").blur(function() {
						if (this.value != "") {
							if (edittraMax.test($(this).val())) {
								$('#edittraMaxerror').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edittraMaxerror').text('只能輸入數字')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraMaxerror').text('請輸入本團人數')
							$(this).css("border-color", "red")
						}
					
					});
					
// 					var edittraIntr = /./;
// 					$("#edittraIntr").blur(function() {
// 						if (edittraIntr.test($(this).val())) {
// 							$('#edittraIntrerror').text('')
// 							$(this).css("border-color", "green")
// 						} else {
// 							$('#edittraIntrerror').text('活動說明不可為空白')
// 							$(this).css("border-color", "red")
// 						}
// 					})
					
					var edittraCon = /./;
					$("#edittraCon").blur(function() {
						if (edittraIntr.test($(this).val())) {
							$('#edittraConerror').text('')
							$(this).css("border-color", "green")
						} else {
							$('#edittraConerror').text('活動內容不可為空白')
							$(this).css("border-color", "red")
						}
					})
					
// 					var edittraAtter = /./;
// 					$("#edittraAtter").blur(function() {
// 						if (edittraAtter.test($(this).val())) {
// 							$('#edittraAttererror').text('')
// 							$(this).css("border-color", "green")
// 						} else {
// 							$('#edittraAttererror').text('注意事項不可為空白')
// 							$(this).css("border-color", "red")
// 						}
// 					})
				</script>
			</div>
		</div>
	</div>
</body>
</html>