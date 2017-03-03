<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<style type="text/css">

.ui-timepicker-div .ui-widget-header { margin-bottom: 8px;}
.ui-timepicker-div dl { text-align: left; }
.ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
.ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
.ui-timepicker-div td { font-size: 90%; }
.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
.ui_tpicker_hour_label,.ui_tpicker_minute_label,.ui_tpicker_second_label,.ui_tpicker_millisec_label,.ui_tpicker_time_label{padding-left:20px}
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
<link href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<!-- <script src='js/jquery-3.1.1.min.js'></script> -->
<script type="text/javascript">
$(function(){
	
	$('#edittraOn').datepicker({
		changeMonth: true,
        dateFormat: "yy-mm-dd"
       
	});
	
	$('#edittraOff').datepicker({
		changeMonth: true,
        dateFormat: "yy-mm-dd"
	});

	$('#edittraEnd').datetimepicker({
	    showSecond: true,
	    showMillisec: false,
	    timeFormat: 'hh:mm:ss'
    });

	
	$('#edittraBeg').datetimepicker({
	    showSecond: true,
	    showMillisec: false,
	    timeFormat: 'hh:mm:ss'
    });

});


	/* 點選更新後，欄位再次判斷，無誤再送出資料 */
	
// 	function getElements()
//   {
//   var x=document.getElementsByName("edititemMoney");
//   alert(x.length);
//   }

	

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

 		var edititemMoney = document.getElementsByName("edititemMoney");
 		var item1 = document.getElementsByName("item1");
 		var item2 = document.getElementsByName("item2");

		var editdate = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
		var editdateTime = /20\d{2}(-|\/)((0[1-9])|(1[0-2]))(-|\/)((0[1-9])|([1-2][0-9])|(3[0-1]))(T|\s)(([0-1][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])/;
		var edittraPerson = /^\d*$/;
		var x = 0;
		var y = 0;
		var z = 0;
		var p = 0;
		var t = 0;
		var m = 0;
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
		} else if (edittraOff.value == "") {
			alert("請輸入活動結束日期");
			eval("document.formtable['edittraOff'].focus()");
			return false;
		} else if (edittraBeg.value == "") {
			alert("請輸入登記開始日期");
			eval("document.formtable['edittraBeg'].focus()");
			return false;
		} else if (edittraEnd.value == "") {
			alert("請輸入登記結束日期");
			eval("document.formtable['edittraEnd'].focus()");
			return false;
		} else if (edittraTotal.value == 0) {
			alert("請輸入活動總人數上限");
			eval("document.formtable['edittraTotal'].focus()");
			return false;
		} else if (edittraMax.value == 0) {
			alert("請輸入本團人數上限");
			eval("document.formtable['edittraMax'].focus()");
			return false;
		}

		else if (edittraCon.value == "") {
			alert("請輸入活動內容");
			eval("document.formtable['edittraCon'].focus()");
			return false;
		}
		else if (item1.value == "") {
			alert("請輸入金額");
			//eval("document.formtable['item1'].focus()");
			return false;
		}
		else if (item2.value == "") {
			alert("請輸入金額");
			//eval("document.formtable['item2'].focus()");
			return false;
		}

		else  {
		    for(var money=0;money<edititemMoney.length;money++){
			    if(edititemMoney[money].value == ""){
			    	//console.log(1);
				    alert("請輸入金額");
			        return false;
			    }
			    else;
			}
			//x = 1;
		    for(var name=0;name<edititemName.length;name++){
			    if(edititemName[name].value == "請選擇"){
			    	//console.log(1);
				    alert("請選擇費用項目");
			        return false;
			    }
			    else;
			}
			x = 1;
		}


		if (edittraOn.value != "") {
			if (editdate.test($(edittraOn).val())) {
				if (edittraOff.value != "") {
					if (editdate.test($(edittraOff).val())) {
						//alert("行程已修改GG");
						if (Date.parse($(edittraOn).val()).valueOf() > Date
								.parse($(edittraOff).val()).valueOf()) {
							alert("活動開始時間不能晚於結束時間！");
							eval("document.formtable['edittraOn'].focus()");
							return false;
						} else {

							y = 1;
						}
					} else {
						alert("活動結束日期格式錯誤");
						eval("document.formtable['edittraOff'].focus()");
						return false;
					}
				}

			} else {
				alert("活動開始日期格式錯誤");
				eval("document.formtable['edittraOn'].focus()");
				return false;
			}
		}

		if (edittraBeg.value != "") {
			if (editdateTime.test($(edittraBeg).val())) {
				if (edittraEnd.value != "") {
					if (editdateTime.test($(edittraEnd).val())) {
						if (Date.parse($(edittraOn).val()).valueOf() > Date
								.parse($(edittraBeg).val()).valueOf()) {
							if (Date.parse($(edittraOn).val()).valueOf() > Date
									.parse($(edittraEnd).val()).valueOf()) {
								if (Date.parse($(edittraBeg).val()).valueOf() < Date
										.parse($(edittraEnd).val()).valueOf()) {
									z = 1; //完成登記時間驗證
								} else {
									alert("登記開始時間不能晚於結束時間！");
									eval("document.formtable['edittraBeg'].focus()");
									return false;
								}
							} else {
								alert("登記結束時間不能晚於活動開始時間！");
								eval("document.formtable['edittraEnd'].focus()");
								return false;
							}
						} else {
							alert("登記開始時間不能晚於活動開始時間！");
							eval("document.formtable['edittraBeg'].focus()");
							return false;
						}
					} else {
						alert("登記結束日期格式錯誤");
						eval("document.formtable['edittraEnd'].focus()");
						return false;
					}

				}

			} else {
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
						if (Number(edittraMax.value) > Number(edittraTotal.value)) { //方法1
							// 							if(m.IsGreatThan(t))	//方法2
							alert("本團人數不能多於活動總人數！");
							eval("document.formtable['edittraMax'].focus()");
							return false;
						} else {
							//alert("行程已修改GXX");
							p = 1;
						}
					} else {
						alert("本團人數格式錯誤");
						eval("document.formtable['edittraMax'].focus()");
						return false;
					}
				}

			} else {
				alert("活動總人數格式錯誤");
				eval("document.formtable['edittraTotal'].focus()");
				return false;
			}
		}
		
		
		if (item1.value != "") {
			if (edittraPerson.test($(item1).val())) {
				if (item2.value != "") {
					if (edittraPerson.test($(item2).val())) {
						
							t = 1;
						
					} else {
						alert("活動結束日期格式錯誤");
						//eval("document.formtable['item1'].focus()");
						return false;
					}
				}

			} else {
				alert("活動開始日期格式錯誤");
				//eval("document.formtable['item2'].focus()");
				return false;
			}
		}
		
		for(var money=0;money<edititemMoney.length;money++){
		    if(edittraPerson.test(edititemMoney[money].value)){
		    	//console.log(1);
// 			    alert("金額格式錯誤");
// 		        return false;
		    	m = 1;
		    }
		    else{
		    	alert("金額格式錯誤");
			    return false;	
		    }
		    
		}
		
		
		
			

		if (x == 1 && y == 1 && z == 1 && p == 1 && m==1) {

			alert("行程已修改");
			return true;

		}
	}
</script>

<title>行程修改</title>

<style type="text/css">
table {
	font-size: 15px;
}

body {
	margin-top: 2%;
	margin-bottom: 4%;
}

h2 {
	color: #00AAAA;
	font-weight: bold;
	border-left: 6px solid gray;
	padding-left: 10px;
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
			<div class='col-md-2 col-md-offset-3'>
				<h2>新增行程</h2>
			</div>
		</div>
		<br> <br>
		<div class='row'>
			<div class='col-md-6 col-md-offset-3'>
				<form action="<c:url value='/SetUpTravel'/>" method="POST" form
					onsubmit="return formtable_b()">
					<table class="t table">

						<tr>
							<td>活動代碼</td>
							<td><input name="edittraNO" value="${tra_No}" readonly
								class='form-control' style="width: 300px" type="text" /></td>
							<td></td>
							<div id=tra_noerror></div>
						</tr>
						<tr>
							<td><em style="color: red">*</em>活動名稱</td>

							<td><input type="text" name="edittraName" id="edittraName"
								class='form-control' value="" style="width: 300px">
							<div id=edittraNameerror></div></td>

							<td></td>
						</tr>
						<tr>
							<td>*活動地點</td>
							<td><select name="edittraLoc" class='form-control'
								id="edittraLoc" style='width: 80px;'>

									<option value="北" ${params.tra_Loc == '北' ? 'selected' : ''}>北</option>
									<option value="中" ${params.tra_Loc == '中' ? 'selected' : ''}>中</option>
									<option value="南" ${params.tra_Loc == '南' ? 'selected' : ''}>南</option>
									<option value="東" ${params.tra_Loc == '東' ? 'selected' : ''}>東</option>
									<option value="外島" ${params.tra_Loc == '外島' ? 'selected' : ''}>外島</option>


							</select>
							<div id=edittraLocerror></div>
							
							<td></td>
						</tr>
						<tr>
						<tr>
							<td>*活動日期</td>

							<td>
								<div class="row">
									<div class="col-xs-4">
										<div class="Input-group">
											<label>開始日期</label> <input type="" name="edittraOn"
												id="edittraOn" class='form-control' style='width: 150px;'
												value="">
											<div id = edittraOnerror></div>


										</div>
									</div>
									<!-- col-xs-4 -->

									<div class="col-xs-4">
										<div class="Input-group">
											<label>結束日期</label> <input type="" class='form-control'
												style='width: 150px;' name="edittraOff" id="edittraOff"
												value="">
											<div id= edittraOfferror></div>
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
											<label>開始時間</label> <input type="text" id="edittraBeg"
												name="edittraBeg" id="edittraBeg" class='form-control'
												style='width: 200px;' value="">
											<div id=edittraBegerror></div>
										</div>
									</div>


									<div class="col-xs-4">
										<div class="Input-group">
											<label>結束時間</label> <input type="text" class='form-control'
												style='width: 200px;' name="edittraEnd" id="edittraEnd"
												value="">

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
								class='form-control' style='width: 80px;' value="">
								<div id=edittraTotalerror></div></td>

							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>本團人數上限</td>

							<td><input type="text" name="edittraMax" id="edittraMax"
								class='form-control' style='width: 80px;' value="">
								<div id=edittraMaxerror></div></td>
							<td></td>
						</tr>
						<tr>

							<td><em style="color: red"></em>活動說明</td>
							<td><textarea cols="50" rows="8" name="edittraIntr"
									id="edittraIntr" class='form-control'></textarea>
								<div id=edittraIntrerror></div></td>
							<td></td>

						</tr>
						<tr>

							<td><em style="color: red">*</em>活動內容</td>
							<td><textarea cols="50" rows="12" class='form-control'
									name="edittraCon" id="edittraCon"></textarea>
								<div id=edittraConerror></div></td>
							<td></td>
						</tr>
						<tr>
							<td><em style="color: red"></em>注意事項</td>

							<td><textarea cols="50" rows="5" name="edittraAtter"
									id="edittraAtter" class='form-control'></textarea>
								<div id=edittraAttererror></div></td>
							<td></td>
						</tr>
						<!-- 						<tr> -->
						<!-- 							<td>附件</td> -->

						<!-- 							<td><input type="text" name="edittraFile" -->
						<!-- 								class='form-control' style='width: 300px;' -->
						<%-- 								value="${params.tra_File}"></td> --%>
						<!-- 							<td></td> -->
						<!-- 						</tr> -->


						<tr>
							<td>費用</td>
							<td><input type="button" value="新增欄位" id="insert"
								class='btn btn-success' name="button"></td>
						</tr>
					</table>

					<table id="Itemtable" class="t table">

						<tr>

							<td class="t">項目</td>
							<td class="t">金額</td>

						</tr>
						<tr>
							<td class="t">團費</td>
							<td class="t"><input type="text" name="item1"
								id="edititemMoney01" class='form-control'
								style='width: 100px; text-align: right;' />
								<div id="edititemMoneyerror01"></div></td>
						</tr>
						<tr>
							<td class="t">保險費</td>
							<td class="t"><input type="text" name="item2"
								id="edititemMoney02" class='form-control'
								style='width: 100px; text-align: right;' />
							<div id="edititemMoneyerror02"></div></td>
							<td></td>
						</tr>
						<c:forEach var="row" items="${paramsi}">
							<tr>

								<td><SELECT name="edititemName" class='form-control'
									id="edititemName" style='width: 150px;'>

										<option value="住宿費(兩人房)"
											${row.item_Name == '住宿費(兩人房)' ? 'selected' : ''}>住宿費(兩人房)</option>
										<option value="住宿費(通鋪8人)"
											${row.item_Name == '住宿費(通鋪8人)' ? 'selected' : ''}>住宿費(通鋪8人)</option>
										<option value="住宿費(加床)"
											${row.item_Name == '住宿費(加床)' ? 'selected' : ''}>住宿費(加床)</option>

								</SELECT>
								<div id="edititemNameerror"></div></td>
								<td><input type="text" name="edititemMoney"
									class='form-control' value="${row.item_Money}">
								<div class="edititemMoneyerror2"></div></td>
								<td><input type="submit" name="delete" id="delete"
									class='btn btn-danger' value="刪除"></td>
							</tr>

						</c:forEach>
					</table>
					<script>
									var search2 = '<c:url value='/search2.jsp'/>'
					</script>
					<input type="submit" value="新增" class='btn btn-primary'> <input
						type="button" value='回上一頁' class='btn btn-primary'
						onclick="window.location.href=search2;" />
				</form>
				<table>
					<!-- 動態新增用 -->
					<tr name="newtable">

					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
				

					/*按扭動作*/

					$(function() {
						$("tr[name='newtable']").hide();
						//動態新增tr
						$("#insert").click(
										function(event) {$("#Itemtable").append('<tr class=newtable>'+ "<td><SELECT name='edititemName' id='edititemName' style='width: 150px;' class='form-control'><option selected='selected' disabled='disabled'>請選擇</option><option value='住宿費(兩人房)' ${row.item_Name == '住宿費(兩人房)' ? 'selected' : ''}>住宿費(兩人房)</option><option value='住宿費(通鋪8人)' ${row.item_Name == '住宿費(通鋪8人)' ? 'selected' : ''}>住宿費(通鋪8人)</option><option value='住宿費(加床)' ${row.item_Name == '住宿費(加床)' ? 'selected' : ''}>住宿費(加床)</option></SELECT><div class='edititemNameerror2'></div></td><td><input type='text' name='edititemMoney' style='width: 100px; text-align: right;' id='edititemMoney' class='form-control' value='${row.item_Money}''><div class='edititemMoneyerror2'></div></td><td><input type='submit' name='delete' id='delete' class='btn btn-danger' value='刪除'></td>"
												+ '</tr>');
										var edititemMoney = /^\d*$/;
											$(".newtable td").on("blur","input[name='edititemMoney']",
															function() {if (this.value != "") {
			
															
															if (edititemMoney.test($(this).val())) {
																//直接在正規上面判斷空值? 錯誤訊息 空值+格式錯誤 +檔掉不能用變換save type
																//跟servlet一樣 有錯誤集中在一起 有錯 就做動作 沒錯就讓他過
																//怕的就是程式一行行判斷 這行如果有錯 做動作後 下一行程式沒錯 會蓋掉他
																$(this).css("border-color","green");
																$(this).next(".edititemMoneyerror2").text("");
																setTimeout(function() {$(".newtable td input[name='edititemMoney']")
																					.css('border-color',"");},2000);
															} else {$(this).css("border-color","red");
																$(this).next('.edititemMoneyerror2').text("只能輸入數字");
																setTimeout(function() {$(".newtable td input[name='edititemMoney']")
																					.css('border-color',"");},2000);
																};
														} else {$(this).css("border-color","red");
															$(this).next('.edititemMoneyerror2').text("請輸入金額");
															setTimeout(function() {$(".newtable td input[name='edititemMoney']").css(
																						'border-color',"");},2000);
														}
											
											});
															

										})
						//刪除動態tr		
						$("#Itemtable").on("click", "input[name='delete']",
								function() {
									$(this).parents("tr").remove();
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
// 								alert("活動日期開始成功");
							} else {
								$('#edittraOnerror').text('開始日期格式錯誤')
								$(this).css("border-color", "red")
								
							}

						} else {
							$('#edittraOnerror').text('請輸入開始日期')
							$(this).css("border-color", "red")
// 							alert("活動日期開始空白");
						}

					});

					var edittraOff = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;

					$("#edittraOff").blur(function() {
						if (this.value != "") {
							if (edittraOff.test($(this).val())) {
								$('#edittraOfferror').text('')
								$(this).css("border-color", "green")
// 								alert("活動日期結束成功");
							} else {
								$('#edittraOfferror').text('開始日期格式錯誤')
								$(this).css("border-color", "red")
								
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edittraOfferror').text('請輸入結束日期')
							$(this).css("border-color", "red")
// 							alert("活動日期結束空白");
						}

					});

					var edittraBeg = /20\d{2}(-|\/)((0[1-9])|(1[0-2]))(-|\/)((0[1-9])|([1-2][0-9])|(3[0-1]))(T|\s)(([0-1][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])/;
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

					var edittraEnd = /20\d{2}(-|\/)((0[1-9])|(1[0-2]))(-|\/)((0[1-9])|([1-2][0-9])|(3[0-1]))(T|\s)(([0-1][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])/;
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

					var edittraCon = /./;
					$("#edittraCon").blur(function() {
						if (edittraCon.test($(this).val())) {
							$('#edittraConerror').text('')
							$(this).css("border-color", "green")
						} else {
							$('#edittraConerror').text('活動內容不可為空白')
							$(this).css("border-color", "red")
						}
					})

					var edititemMoney = /^\d*$/;
					$("input[name*='edititemMoney']").on("blur",function() {

								if (this.value != "") {
									if (edititemMoney.test($(this).val())) {
										//直接在正規上面判斷空值? 錯誤訊息 空值+格式錯誤 +檔掉不能用變換save type
										//跟servlet一樣 有錯誤集中在一起 有錯 就做動作 沒錯就讓他過
										//怕的就是程式一行行判斷 這行如果有錯 做動作後 下一行程式沒錯 會蓋掉他
										$(this).css("border-color", "green");
										$(this).next("#edititemMoneyerror2")
												.text("");
										setTimeout(function() {
											$("input[name*='edititemMoney']")
													.css('border-color', "");
										}, 2000);
									} else {
										$(this).css("border-color", "red");

										$(this).next('#edititemMoneyerror2')
												.text("只能輸入數字");
										setTimeout(function() {
											$("input[name*='edititemMoney']")
													.css('border-color', "");
										}, 2000);
									}
									;
								} else {
									$(this).css("border-color", "red");

									$(this).next('.edititemMoneyerror2').text(
											"請輸入金額");
									setTimeout(function() {
										$("input[name*='edititemMoney']").css(
												'border-color', "");
									}, 2000);
								}
							});
					
					
					var item1 = /^\d*$/;
					$("#edititemMoney01").blur(function() {
						if (this.value != "") {
							if (item1.test($(this).val())) {
								$('#edititemMoneyerror01').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edititemMoneyerror01').text('只能輸入數字')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edititemMoneyerror01').text('請輸入金額')
							$(this).css("border-color", "red")
						}

					});
					
					var item2 = /^\d*$/;
					$("#edititemMoney02").blur(function() {
						if (this.value != "") {
							if (item2.test($(this).val())) {
								$('#edititemMoneyerror02').text('')
								$(this).css("border-color", "green")
							} else {
								$('#edititemMoneyerror02').text('只能輸入數字')
								$(this).css("border-color", "red")
							}

						} else {
							//alert('開始日期格式錯誤');
							$('#edititemMoneyerror02').text('請輸入金額')
							$(this).css("border-color", "red")
						}

					});
					});
				</script>
</html>