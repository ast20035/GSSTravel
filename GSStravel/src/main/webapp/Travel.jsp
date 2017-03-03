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
<style type="text/css">
#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.2;
		height:100%;
		width: 100%;
	}
table {
	margin-top: 2%;
	font-size: 15px
}

td, th {
	padding: 10px;
}
</style>
<title>報名／查詢</title>
<script>
	window.onload = function() {
		var $BodyWidth = $(document).width();
		var $ViewportWidth = $(window).width();
		var $ScrollLeft = $(this).scrollLeft();
		if ($BodyWidth > ($ViewportWidth + $ScrollLeft)) {
			$('#span').show();
		} else if ($BodyWidth == ($ViewportWidth + $ScrollLeft)) {
			$('#span').hide();
		}

	};

</script>
</head>

<body>
	<%@include file="SelectBar.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('now');
		$('.navbar-nav>li:eq(1)').addClass('now');
	</script>
	<div class='container-fluid'>

		<div class='row'>
			<div class='col-lg-1'></div>
			<div class='col-lg-11'>
				<h2>報名／查詢</h2>
				<br>
				<h4 style="color: red">說明:當取消報名時，將該員工的所有名額一起取消，再重新報名，以避免排名不公</h4>
				<br> <input type="button" value='歷史紀錄'
					onclick='window.location.href=resultjs+"/Record"'
					class='btn btn-primary' />
			</div>
		</div>
		<div class='row'>
			<div class='col-lg-1'></div>
			<div class='col-lg-11'>
				<table class="t table-responsive table-bordered">
					<thead class="t">
						<tr>
							<th class="t">活動代碼</th>
							<th class="t">活動名稱</th>
							<th class="t">活動開始</th>
							<th class="t">活動結束</th>
							<th class="t">登記開始</th>
							<th class="t">登記結束</th>
							<th class="t">登記活動人數限制</th>
							<th class="t">目前已報名人數</th>
							<th class="t">員工可報名總人數</th>
							<th class="t">報名</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${select}">
							<tr>
								<td class="t"><a
									href="<c:url value="/FeeTravel?tra_No=${row.tra_NO}" />">${row.tra_NO}</a></td>
								<td class="t">${row.tra_Name}</td>
								<td class="t">${row.tra_On}</td>
								<td class="t">${row.tra_Off}</td>
								<script>
									var tra_Beg="${row.tra_Beg}";
									tra_Beg=tra_Beg.substring(0,19);
									document.write("<td>");
							        document.write(tra_Beg);
									document.write("</td>");
								</script>
								<script>
									var tra_End="${row.tra_End}";
									tra_End=tra_End.substring(0,19);
									document.write("<td>");
							        document.write(tra_End);
									document.write("</td>");
								</script>
								<td class="t">${row.tra_Total}</td>
								<c:if test="${row.tra_Total>row.sign_InTotal}">
									<td class="t">${row.sign_InTotal}</td>
								</c:if>
								<c:if test="${row.tra_Total<row.sign_InTotal}">
									<td class="t">額滿</td>
								</c:if>							
								<td class="t">${row.tra_Max}</td>
								<c:set var="tra_no" value="${row.tra_NO}" />
								<c:if test="${mp[tra_no]==0}">
									<td class="t"><a
										href="<c:url value="/Login_Information?tra_No=${row.tra_NO}&emp_No=${emp_No}"></c:url>"><button
												class='btn btn-success'>我要報名</button></a></td>
								</c:if>
								<c:if test="${mp[tra_no]==1}">
									<td class="t">登記已截止</td>
								</c:if>
								<c:if test="${mp[tra_no]==2}">
									<td class="t">人數已額滿</td>
								</c:if>
								<c:if test="${mp[tra_no]==3}">
									<td class="t"><a
										href="<c:url value="/CancelServlet?tra_No=${row.tra_NO}&emp_No=${emp_No}"></c:url>"><button
												class='btn btn-success'>取消報名</button></a></td>
								</c:if>
								<c:if test="${mp[tra_no]==4}">
									<td class="t">活動已結束</td>
								</c:if>
								<c:if test="${mp[tra_no]==5}">
									<td class="t">活動尚未開始登記</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				共${count}筆 
				<br />
				<ul class="pagination">
					<li><a onclick="before()">&laquo;</a></li>
					<li class="page active" onclick="page(this)" value="0"><a>1</a></li>
					<c:if test="${Math.ceil(count/2)!=0}">
						<c:forEach var="i" begin="1" end="${Math.ceil(count/10)-1}">
							<li class="page" onclick="page(this)" value="${i}"><a>${i+1}</a></li>
						</c:forEach>
					</c:if>
					<li><a onclick="next()">&raquo;</a></li>
				</ul>
				<br />
			</div>
		</div>
	</div>
	<script>
	var i;
	var $page = $(".page");
	$("tr:gt(10)").css("display", "none");
	function next() {
		i = $(".active");
		$page.removeClass("active");
		if (i.val() < $page.length - 1) {
			$page[i.val() + 1].className = "active";
			light(i.val() + 1);
		} else {
			$page[0].className = "active";
			light(0);
		}
	}
	function before() {
		i = $(".active");
		$page.removeClass("active");
		if (i.val() < $page.length && i.val() > 0) {
			$page[i.val() - 1].className = "active";
			light(i.val() - 1);
		} else {
			$page[$page.length - 1].className = "active";
			light($page.length - 1);
		}
	}
	function page(obj) {
		$page.removeClass("active");
		$(obj).prop("class", "active");
		i = $(".active");
		light(i.val());
	}
	function light(i) {
		$("tr:gt(0)").css("display", "none");
		$("tr:gt(" + i * 10 + "):lt(" + 10 + ")").css("display", "");
	}
	</script>
	<img src="images/Travel.jpg" id="backPic">
</body>
</html>
	