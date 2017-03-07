<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Q&A</title>
<style type="text/css">
	#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.4;
		height:100%;
		width: 100%;
	}
	td, tr {
		padding: 3px;
		border: 1px solid gray;
	}
	
	input[type='text'] {
		border: none;
		text-align: center;
		padding: 3px;
		background-color: transparent;
	}
	.delBtn{
	margin-left: 30px;
	}
</style>
</head>
<body>
	<%@include file="Manage.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('Mnow');
		$('.navbar-nav>li:eq(2)').addClass('Mnow');
	</script>
	<%
		String prodaction = request.getParameter("prodaction");
		String prodaction2 = request.getParameter("prodaction2");
		int question_Category=-1;
		if(prodaction2!=null){
			question_Category=Integer.parseInt(prodaction2);
		}
	%>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>Q&A維護</h2>
			</div>
		</div>
		<br>
		<div class='row'>
			<div class='col-md-offset-1 col-md-6'>
					<div class='row'>
						<c:if test="${emp_Role eq true}">
							<div class='col-md-2'>
								<select class="prodaction form-control" style='width: 150px;'>
									<option value="Years" selected>刪除前一年</option>
									<option value="9month">刪除9個月前</option>
									<option value="6month">刪除6個月前</option>
									<option value="3month">刪除3個月前</option>
								</select>
							</div>
							<div class='col-md-offset-0 col-md-1 delBtn'>
								<button class='btn btn-danger' type="button"
									onclick="checkdelete()">刪除</button>
							</div>
						</c:if>
					</div>
					<br>
						<select id="selecta" onchange="window.location = '/GSStravel/QandAServlet?role=true&prodaction2='+this.value+'&prodaction='+$('#selectb').val();" class='form-control' style='width: 150px;'>
							<option value="-1" <%if ("-1".equals(prodaction2)) { out.print("selected"); }%>>全部</option>
							<option value="0" <%if ("0".equals(prodaction2)) { out.print("selected"); }%>>行程</option>
							<option value="1" <%if ("1".equals(prodaction2)) { out.print("selected"); }%>>費用</option>
							<option value="2" <%if ("2".equals(prodaction2)) { out.print("selected"); }%>>其他</option>
						</select>
						<br />
						<select id="selectb" onchange="window.location = '/GSStravel/QandAServlet?role=true&prodaction='+this.value+'&prodaction2='+$('#selecta').val();" class='form-control' style='width: 150px;'>
							<option value="all" <%if ("all".equals(prodaction)) { out.print("selected"); }%>>顯示全部</option>
							<option value="yes" <%if ("yes".equals(prodaction)) { out.print("selected"); }%>>顯示已回應</option>
							<option value="no" <%if ("no".equals(prodaction)) { out.print("selected");  }%>>顯示未回應</option>
						</select>
					<br />
					<c:if test="${list.size()!=0}">
					<table>
						<thead>
							<tr>
								<th><label style='width:300px;'>詢問時間</label></th>
								<th><label style='width:150px;'>提問類型</label></th>
								<th><label style='width:250px;'>標題</label></th>
								<th><label style='width:100px;'>詢問人員</label></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<c:if test="${list.question_secret}">
									<tr>
										<td><div class="centeraa">${list.question_Time}<c:if test="${list.newimg==true}"> <img src="images/new.gif"></c:if></div></td>
										<td>
											<c:if test="${list.question_Category==0}"><input type="text" value="行程" readonly style='width: 100%;'></c:if>
											<c:if test="${list.question_Category==1}"><input type="text" value="費用" readonly style='width: 100%;'></c:if>
											<c:if test="${list.question_Category==2}"><input type="text" value="其他" readonly style='width: 100%;'></c:if>	
										</td>
										<td><a
											href="/GSStravel/QandAServlet?prodaction=select&role=true&qa_No=${list.qa_No}">
												<c:if test="${list.answer_No!=0}">
													<span>[已回應]</span><br />
												</c:if><span style="color: red">[私密]${list.question_Title}</span>
										</a></td>
										<td><input type="text" value="${list.question_No}" style='width:100%;' readonly></td>
									</tr>
								</c:if>
								<c:if test="${!list.question_secret}">
									<tr>
										<td><div class="centeraa">${list.question_Time}<c:if test="${list.newimg==true}"> <img src="images/new.gif"></c:if></div></td>
										<td>
											<c:if test="${list.question_Category==0}"><input type="text" value="行程" readonly style='width: 100%;'></c:if>
											<c:if test="${list.question_Category==1}"><input type="text" value="費用" readonly style='width: 100%;'></c:if>
											<c:if test="${list.question_Category==2}"><input type="text" value="其他" readonly style='width: 100%;'></c:if>	
										</td>
										<td><a
											href="/GSStravel/QandAServlet?prodaction=select&role=true&qa_No=${list.qa_No}">
												<c:if test="${list.answer_No!=0}">
													<span>[已回應]</span>
												</c:if>${list.question_Title}</a></td>
										<td><input type="text" value="${list.question_No}" style='width:100%;' readonly></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				共${count}筆 <br />
					<ul class="pagination">
						<li><a onclick="before()">&laquo;</a></li>
						<li class="page active" onclick="page(this)" value="0"><a>1</a></li>
						<c:if test="${Math.ceil(count)!=0}">
							<c:forEach var="i" begin="1" end="${Math.ceil(count/7)-1}">
								<li class="page" onclick="page(this)" value="${i}"><a>${i+1}</a></li>
							</c:forEach>
						</c:if>
						<li><a onclick="next()">&raquo;</a></li>
					</ul>
				</c:if>
				<c:if test="${list.size()==0}">
					<%
						if (prodaction == null || prodaction2==null) {
								out.print("<h2>現在尚無留言</h2>");
						}else{
							switch (question_Category){
							case -1:
								if ("all".equals(prodaction)) {
									out.print("<h2>現在尚無留言</h2>");
								}
								if ("yes".equals(prodaction)) {
									out.print("<h2>全部皆無回應</h2>");
								}
								if ("no".equals(prodaction)) {
									out.print("<h2>全部皆已回應</h2>");
								}
								break;
							case 0:
								if ("all".equals(prodaction)) {
									out.print("<h2>現在尚無留言</h2>");
								}
								if ("yes".equals(prodaction)) {
									out.print("<h2>全部皆無回應</h2>");
								}
								if ("no".equals(prodaction)) {
									out.print("<h2>全部皆已回應</h2>");
								}
								break;
							case 1:
								if ("all".equals(prodaction)) {
									out.print("<h2>現在尚無留言</h2>");
								}
								if ("yes".equals(prodaction)) {
									out.print("<h2>全部皆無回應</h2>");
								}
								if ("no".equals(prodaction)) {
									out.print("<h2>全部皆已回應</h2>");
								}
								break;
							case 2:
								if ("all".equals(prodaction)) {
									out.print("<h2>現在尚無留言</h2>");
								}
								if ("yes".equals(prodaction)) {
									out.print("<h2>全部皆無回應</h2>");
								}
								if ("no".equals(prodaction)) {
									out.print("<h2>全部皆已回應</h2>");
								}
								break;
							}
						}
					%>			 				
				</c:if>
				<br />
				<c:if test="${emp_Role eq false}">
					<button
						onclick="window.location = '/GSStravel/QandAServlet?prodaction=question';">我要詢問問題</button>
				</c:if>
			</div>
		</div>
	</div>
	<script>
	if(${Msg!=null}){
		alert("${Msg.message}") ;
	}
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
		$("tr:gt(" + i * 7 + "):lt(" + 7 + ")").css("display", "");
	}
	function checkdelete() {
		if (confirm("確定要刪除?")){
			window.location = '/GSStravel/QandAInsertServlet?role=true&prodaction='+$(".prodaction").val();
		}
	}
	</script>
<img src="images/Travel.jpg" id="backPic">
</body>
</html>
