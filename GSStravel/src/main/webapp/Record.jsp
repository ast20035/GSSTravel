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
table, th, td {
	border: 1px solid black;
}
</style>
<title>歷史紀錄</title>
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
				<h2>歷史紀錄</h2>
			</div>
		</div><br><br>
		<div class='row'>
		<div class='col-md-offset-1 col-md-1'>
		<input type="button" class='btn btn-primary' onclick='window.location.href=resultjs+"/AllTravel";' value='報名/查詢'>
		</div>
			<div class='col-md-offset-0 col-md-8'>
				<br>
				<c:if test="${counts!=0}">
					<table class='table'>
						<thead>
							<tr>
								<th>行程編號</th>
								<th>行程名稱</th>
								<th>行程開始日</th>
								<th>行程結束日</th>
								<th>登記日</th>
								<th>取消日</th>
								<th>狀態</th>
								<th>費用</th>
							</tr>
						</thead>
						<c:forEach var="row" items="${record}">
							<tr>
								<td><a href="<c:url value="/FeeTravel?tra_No=${row[0]}" />">${row[0]}</a></td>
								<td>${row[1]}</td>
								<td>${row[2]}</td>
								<td>${row[3]}</td>
								<td>${row[4]}</td>
								<td>${row[5]}</td>
								<td>${row[6]}</td>
								<td>${row[7]}</td>
							</tr>
						</c:forEach>
					</table>
					共${counts}筆 
				<br />
				<ul class="pagination">
					<li><a onclick="before()">&laquo;</a></li>
					<li class="page active" onclick="page(this)" value="0"><a>1</a></li>
					<c:if test="${Math.ceil(counts/2)!=0}">
						<c:forEach var="i" begin="1" end="${Math.ceil(counts/10)-1}">
							<li class="page" onclick="page(this)" value="${i}"><a>${i+1}</a></li>
						</c:forEach>
					</c:if>
					<li><a onclick="next()">&raquo;</a></li>
				</ul>
				<br />
				</c:if>
				<c:if test="${counts==0}">
					<h1 style='font-size: 60px;'>目前沒有任何歷史訊息</h1>
				</c:if>
			</div>
		</div>
	</div>
</body>
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
</html>