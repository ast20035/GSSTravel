<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>報名明細新增</title>

<style>
input[type='text'] {
	width: 150px;
}

.center_a {
	font-size: 15px;
}
</style>
<script src="js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	
</script>
<style>
td, th {
	padding: 10px;
	border: 1px solid #DDDDDD;
}

table {
	margin-right: 50px;
}
</style>
</head>
<body>
	<%@include file="SelectBar.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('now');
		$('.navbar-nav>li:eq(3)').addClass('now');
	</script>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>一報名明細新增一</h2>
			</div>
		</div>
		<div class='row'>
			<div class='col-md-offset-1 col-md-11'>
				<form action=<c:url value="/detail_insert"/> method="post">
					<p>報名活動代碼：${tra_no}</p>
					<input type="hidden" name="tra_no" class="tra_no" value="${tra_no}"
						class='form-control'>
					<table>
						<tr>
							<th>員工編號</th>
							<th>報名人姓名</th>
							<th>報名總金額</th>
						</tr>
						<tr>
							<td><input type="text" id="emp_No" name="emp_No" style='width:65px;'
								class='form-control' onblur="select_emp_No()"
								onfocus="clearName()"></td>
							<td><select id="select" name="select" onchange="checkbox()" class='form-control select'></select></td>
							<td><input type="text" id="money" name="money"
								class="money form-control" value="${money}" readonly></td>
						</tr>
					</table>
					<p class="p"></p>
					<br />
					<div class="div" style="display: none;">
						<table border="1" style="font-size: 15px;">
							<tr>
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
							<tr>
								<td><select name="fam_Rel" class="center_a form-control"
									style='width: 80px;'>
										<option>眷屬</option>
										<option>親友</option>
								</select></td>
								<td><input type="text" id="fam_Name" name="fam_Name"
									style='width: 90px;' class="fam_Name center_a form-control"
									placeholder="請填寫">
								<td><select name="fam_Sex" class="fam_Sex form-control"
									style='width: 70px;'>
										<option>男</option>
										<option>女</option>
								</select></td>
								<td><input type="text" name="fam_Id" style='width: 130px;'
									class="fam_Id center_a form-control" placeholder="請填寫"></td>
								<td><input type="date" name="fam_Bdate"
									style='width: 170px;' class="fam_Bdate center_a form-control"
									placeholder="請填寫"></td>
								<td><input type="text" name="fam_Phone"
									style='width: 130px;' class="fam_Phone center_a form-control"
									placeholder="請填寫"></td>
								<td><select name="fam_Eat" class="center_a form-control"
									style='width: 100px;'>
										<option>葷</option>
										<option>素</option>
										<option>不佔餐</option>
								</select> <input name="fam_Car" type="checkbox" value="不占車位">不占車位
								</td>
								<td><select
									class="multiselect center_a form-control select " name="fam_spa"
									id="multiselect" data-placeholder="請點擊" multiple="multiple"
									style="width: 200px;">
										<option>幼童(0~3歲)</option>
										<option>兒童(4~11歲)</option>
										<option>持身心障礙手冊</option>
										<option>孕婦(媽媽手冊)</option>
								</select></td>
								<td><input type="text" name="fam_Ben" style='width: 100px;'
									class="fam_Ben center_a form-control" placeholder="請填寫"></td>
								<td><input type="text" name="fam_BenRel"
									style='width: 100px;' class="fam_BenRel center_a form-control"
									placeholder="請填寫"></td>
								<td><input type="text" name="fam_Emg" style='width: 120px;'
									class="fam_Emg center_a form-control" placeholder="請填寫"></td>
								<td><input type="text" name="fam_EmgPhone"
									style='width: 130px;'
									class="fam_EmgPhone center_a form-control" placeholder="請填寫"></td>
								<td><input type="text" name="fam_EmgRel"
									style='width: 100px;' class="fam_EmgRel center_a form-control"
									placeholder="請填寫"></td>
								<td><input type="text" name="fam_note"
									class="center_a form-control" style='width: 200px;'
									placeholder="請填寫"></td>
							</tr>

						</table>
					</div>
					<br />
					<c:if test="${fn:length(room)!=0}">
						<div>
							<table border="1">
								<tr>
									<th>請選擇</th>
									<th>房型</th>
									<th>費用</th>
								</tr>
								<c:forEach var="list" items="${room}">
									<tr>
										<td><input type="checkbox" class="checkbox"
											value="${list.item_No}" onclick="checkedA()"></td>
										<td><input type="text" class="line form-control"
											value="${list.item_Name}" readonly></td>
										<td><input type="text" class="line ${list.item_No} form-control"
											value="${list.item_Money}" readonly></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:if>
					<p style="color: red" class="Error"></p>
					<p class="nofam"></p>
					<br /> <input type="submit" class="insertSave btn btn-primary" id="insertSave"
						name="prodaction" value="儲存" onclick="saveData()"> <input
						type="submit" name="prodaction" value="回前頁" class='btn btn-primary'>
				</form>
			</div>
		</div>
	</div>
</body>
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.common-material.min.css" />
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.min.css" />
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.1.118/styles/kendo.material.mobile.min.css" />

<script src="https://kendo.cdn.telerik.com/2017.1.118/js/kendo.all.min.js"></script>

<script>
	
	$(".multiselect").kendoMultiSelect({
		autoClose : false
	});

	var a1 = a2 = a3 = a4 = a5 = a6 = a7 = a8 = a9 = false;
	$(function() {
		$(".fam_Id").on("blur",function() {
							// 依照字母的編號排列，存入陣列備用。
							var letters = new Array('A', 'B', 'C', 'D', 'E',
									'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N',
									'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X',
									'Y', 'W', 'Z', 'I', 'O');
							// 儲存各個乘數
							var multiply = new Array(1, 9, 8, 7, 6, 5, 4, 3, 2,
									1);
							var nums = new Array(2);
							var firstChar;
							var firstNum;
							var lastNum;
							var total = 0;
							// 撰寫「正規表達式」。第一個字為英文字母，
							// 第二個字為1或2，後面跟著8個數字，不分大小寫。
							var sex = $(".fam_Sex").val();
							if (sex == "男") {
								var regExpID = /^[a-z](1)\d{8}$/i;
							} else {
								var regExpID = /^[a-z](2)\d{8}$/i;
							}
							// 使用「正規表達式」檢驗格式
							if (regExpID.test($(this).val())) {
								// 取出第一個字元和最後一個數字。
								firstChar = $(this).val().charAt(0)
										.toUpperCase();
								lastNum = $(this).val().charAt(9);
							} else {
								$(this).css("border-width", "1px");
								$(this).css("border-color", "red");
								$(".insertSave").attr("type", "button");
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
									total += parseInt($(this).val().charAt(
											i - 1))
											* multiply[i];
								}
							}
							// 和最後一個數字比對
							if (((10 - (total % 10)) != lastNum)
									&& ((10 - (total % 10) - 10) != lastNum)) {
								$(this).css("border-width", "1px");
								$(this).css("border-color", "red");
								$(".insertSave").attr("type", "button");
							} else {
								$(this).css({
									'border-width' : '0'
								});
								a1 = true;
								if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8
										& a9)) {
									$(".insertSave").attr("type", "button");
								} else {
									$(".insertSave").attr("type", "submit");
								}
							}

						})
		var cellPhone = /^09\d{2}-?\d{3}-?\d{3}$/;
		$(".fam_Phone").on("blur", function() {
			if (cellPhone.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a2 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});
		$(".fam_EmgPhone").on("blur", function() {
			if (cellPhone.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a3 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});

		var thisName = /^.*\s*[^\s]/;
		$(".fam_Name").blur(function() {
			if (thisName.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a4 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}

		});
		$(".fam_Ben").blur(function() {
			if (thisName.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a5 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});
		$(".fam_BenRel").blur(function() {
			if (thisName.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a6 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});
		$(".fam_Emg").blur(function() {
			if (thisName.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a7 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});
		$(".fam_EmgRel").blur(function() {
			if (thisName.test($(this).val())) {
				$(this).css({
					'border-width' : '0'
				});
				a8 = true;
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");
				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});

		var fambdate = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
		$(".fam_Bdate").on("blur", function() {
			if (fambdate.test($(this).val())) {
				a9 = true;
				$(this).css({
					'border-width' : '0'
				});
				if (!(a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 & a9)) {
					$(".insertSave").attr("type", "button");

				} else {
					$(".insertSave").attr("type", "submit");
				}
			} else {
				$(this).css("border-width", "1px");
				$(this).css("border-color", "red");
				$(".insertSave").attr("type", "button");
			}
		});

	});

	function saveData() {
		if (document.getElementById("insertSave").type == 'button') {
			alert("儲存失敗！");
		}
	}
	function select_emp_No() {
		$.ajax({
			type : "post",
			url : "/GSStravel/DetailInsertSelectServlet",
			data : {
				emp_No : $("#emp_No").val(),
				tra_No : $(".tra_no").val()
			},
			datatype : 'json',
			success : function(data) {
				var Msg = jQuery.parseJSON(data);
				$(".Error").html(Msg.InError);
				if (Msg.emp_Name != null) {
					$("#select").append($("<option></option>").attr("class", 'emp_name').text(Msg.emp_Name));
				}
				if (Msg.fam_No) {
					insertnewfam(Msg.fam_No);
				}
				$(".name").val(Msg.emp_Name);
				if (Msg.fam_Name != null) {
					var fam_Name = jQuery.parseJSON(Msg.fam_Name);
					$.each(fam_Name, function(key, value) {
						$("#select").append($("<option></option>").attr("class", 'fam_name').text(fam_Name[key]));
					});
					$("#select").append($("<option></option>").attr("class", 'fam_name').text("其他"));
				}
				if (Msg.emp_Max) {
					alert(Msg.emp_Max);
				}
			}
		})
	}
	function clearName() {
		$('.Error').text('');
		$('.nofam').text('');
		$("#select option").remove();
		$(".div").hide();
	}
	function insertnewfam(nofam) {
		if (confirm(nofam)) {
			$(".div").show();
			$(".multiselect").prop("id", "multiselect");
			$("#select").append($("<option></option>").attr("class", 'fam_name').text("其他"));
		}
	}
	function checkedA() {
		var money = Number("${money}");
		var $checkbox = $(".checkbox:checked");
		var sum = Number(0);
		$.each($checkbox, function(key, value) {
			sum = sum + Number($("." + $checkbox[key].value).val());
		});
		money = money + sum;
		$(".money").val(money);
	}
	function checkbox(){
		var $checkbox = $(".select");
		if($checkbox.val()=="其他"){
			$(".div").show();
		}else{
			$(".div").hide();
			$(".insertSave").attr("type", "submit");
		}
	}
	var Error ='<%=session.getAttribute("DataError")%>';
	<%session.removeAttribute("DataError");%>
	if (Error != "null") {
		$(".Error").html(Msg.Error);
	}
</script>
</html>