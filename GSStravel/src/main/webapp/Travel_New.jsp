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

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<!-- <script src='js/jquery-3.1.1.min.js'></script> -->
<script type="text/javascript">



$(function(){
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var today = yyyy+'-'+mm+'-'+dd;
	var today1 = yyyy+'-'+mm+'-'+dd;
	document.getElementById("edittraOn").value = today;
	document.getElementById("edittraOff").value = today1;
	

	
	$('#edittraOn').datepicker({
		
       
       
	});
	
	$('#edittraOff').datepicker({
		
        
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

</script>

<script type="text/javascript">
	if(${error!=null}){
		alert("${error}");
	}
</script>


<style type="text/css">
#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.4;
		height:100%;
		width: 100%;
	}
table {
	font-size: 15px;
}

body {
	margin-top: 2%;
	margin-bottom: 4%;
}

label {
	color: #33CCFF;
	font-weight: lighter;
}

h2 {
	color: #00AAAA;
	font-weight: bold;
	border-left: 6px solid gray;
	padding-left: 10px;
}
</style>
<title>新增行程</title>


</head>

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
				<form action="<c:url value='/SetUpTravel'/>" method="POST" id="newTravel">
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
								class='form-control' value="" style="width: 300px" autocomplete="off">
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
											<label>開始日期</label> <input type="text" name="edittraOn"
												id="edittraOn" class='form-control' style='width: 150px;'

												value="" readonly="readonly"/>

											<div id = edittraOnerror></div>


										</div>
									</div>
									<!-- col-xs-4 -->

									<div class="col-xs-4">
										<div class="Input-group" style="margin-left:-25px;">
											<label>結束日期</label> <input type="text" class='form-control'
												style='width: 150px;' name="edittraOff" id="edittraOff"

												value="" readonly="readonly"/>

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
												style='width: 200px;' value="" readonly="readonly" >
											<div id=edittraBegerror></div>
										</div>
									</div>

									
									<div class="col-xs-4">
										<div class="Input-group" style="margin-left:25px;">
											<label>結束時間</label> <input type="text" class='form-control'
												style='width: 200px;' name="edittraEnd" id="edittraEnd"
												value="" readonly="readonly">

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
								class='form-control' style='width: 80px;' value="" autocomplete="off">
								<div id=edittraTotalerror></div></td>

							<td></td>
						</tr>
						<tr>
							<td><em style="color: red">*</em>個人可報名人數</td>

							<td><input type="text" name="edittraMax" id="edittraMax"
								class='form-control' style='width: 80px;' value="" autocomplete="off">
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
						<tr>
							<td>費用</td>
							<td><input type="button" value="新增欄位" id="insert"
								class='btn btn-success' name="button" autocomplete="off"></td>
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
								style='width: 100px; text-align: right;' autocomplete="off"/>
								<div id="edititemMoneyerror01"></div></td>
						</tr>
						<tr>
							<td class="t">保險費</td>
							<td class="t"><input type="text" name="item2"
								id="edititemMoney02" class='form-control'
								style='width: 100px; text-align: right;' autocomplete="off" />
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
					<input type='hidden' name='file' value='' id='file'/>
					<script>
							var search2 = '<c:url value='/search2.jsp'/>'	
							function check() {
								var edittraCon = document.getElementById("edittraCon");
								var edittraIntr = document.getElementById("edittraIntr");
								var edittraAtter = document.getElementById("edittraAtter");
								if (edittraCon.value.length >= 2000) {
									alert("活動內容過長！");
								}else if(edittraIntr.value.length >= 2000){
									alert("活動說明過長！");
								}else if(edittraAtter.value.length >= 2000){
									alert("注意事項過長！");
								} else {
									$("#newTravel").submit();
								}
							}
					</script>
					儲存後選擇是否上傳附件<br>
					<input type="button" value="儲存" class='btn btn-success' onclick="check();"/> <input
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
	<img src="images/Travel.jpg" id="backPic">
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
							$('#edittraOnerror').text('')
								$(this).css("border-color", "green")
// 							if (edittraOn.test($(this).val())) {
// 								$('#edittraOnerror').text('')
// 								$(this).css("border-color", "green")
// // 								alert("活動日期開始成功");
// 							} else {
// 								$('#edittraOnerror').text('開始日期格式錯誤')
// 								$(this).css("border-color", "red")
								
// 							}

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