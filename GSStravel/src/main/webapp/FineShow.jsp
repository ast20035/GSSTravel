<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>罰則一覽表</title>
<style>
td, th {
	border: 2px outset black;
	text-align: center;
	font-size: 15px;
	padding: 5px;
}

table {
	font-size: 15px;
	margin-bottom: 3%;
}

td>strong {
	color: #CC6600;
	font-size: 20px;
}
</style>
<script>
		var btn=null;
		var myImg=null;
		var close1=null;
		var close2=null;
		var close3=null;
		var close4=null;
		var close5=null;
		var close6=null;
		var close7=null;
		var closeBtn=null;
		var down1=null;
		var down2=null;
		
		window.onload = function() {
			btn = document.getElementById("FineEmail");
			myImg = document.getElementById("img1"), xhr = null;
			close1 = document.getElementById("close1");
			close2 = document.getElementById("close2");
			close3 = document.getElementById("close3");
			close4 = document.getElementById("close4");
			close5 = document.getElementById("close5");
			close6 = document.getElementById("close6");
			close7 = document.getElementById("close7");
			closeBtn = document.getElementById("closeBtn");
			down1 = document.getElementById("down1");
			down2 = document.getElementById("down2");
			if(${em == 1} && ${btn == 1}){
				btn.removeAttribute("disabled");
			}
			var $BodyWidth = $(document).width();  
			var $ViewportWidth=$(window).width();  
			var $ScrollLeft=$(this).scrollLeft();
			if($BodyWidth>($ViewportWidth+$ScrollLeft)){   
	               $('#span').show();
			} 
			else if($BodyWidth==($ViewportWidth+$ScrollLeft)){   
	              $('#span').hide();
			}
		}
		
		function load() {
			xhr = new XMLHttpRequest();
			if (xhr != null) {
				xhr.addEventListener("readystatechange", callback);
				xhr.open("GET", "FineServlet?FineEmail=寄送罰則異動通知");
				xhr.send();
			} else {
				alert("很抱歉，您的瀏覽器不支援AJAX功能！");
			}
		}
		function callback() {
			if (xhr.readyState == 1) {
				close1.removeAttribute("href");
				close2.removeAttribute("href");
				close3.removeAttribute("href");
				close4.removeAttribute("href");
				close5.disabled = true;
				close6.removeAttribute("href");
				close7.removeAttribute("href");
				closeBtn.disabled = true;
				down1.setAttribute("style","display:none");
				down2.setAttribute("style","display:none");
				myImg.style.display = "inline";
				btn.setAttribute("disabled", "disabled");
				btn.value = "Email寄送中...";
			} else if (xhr.readyState == 4) {
				close1.setAttribute("href","<c:url value='/Register'/>");
				close2.setAttribute("href","<c:url value='/search2.jsp'/>");
				close3.setAttribute("href","<c:url value='/search.jsp'/>");
				close4.setAttribute("href","<c:url value='/search1.jsp'/>");
				close5.disabled = false;
				close6.setAttribute("href","<c:url value='/BoardMaintain.jsp'/>");
				close7.setAttribute("href","<c:url value='/Board.jsp'/>");
				closeBtn.disabled = false;
				down1.removeAttribute("style");
				down2.removeAttribute("style");
				myImg.style.display = "none";
				btn.value = "Email寄送成功！";
			}
		}
</script>
</head>
<body>
	<%@include file="SelectBar.jsp"%>
	<script>
		$('.navbar-nav>li').removeClass('now');
		$('.navbar-nav>li:eq(5)').addClass('now');
	</script>
	<div class='container-fluid'>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-11'>
				<h2>罰則明細</h2>
			</div>
		</div>
		<form id="EmailData" action="<c:url value="/FineServlet" />"
			method="GET">
			<div class='row'>
				<div class='col-md-1'></div>
				<div class='col-md-2'>
					<br> <input type="button" value="罰則設定" name="FineSetting"
						class='btn btn-primary' id="closeBtn"
						onclick="window.location.href=resultjs+'/FineSetting.jsp'" /><br>
					<br> <input class='btn btn-primary' type="button"
						id="FineEmail" name="FineEmail" value="寄送罰則異動通知" onclick="load()" disabled="disabled"/> 
					<img src="images/ajax-loader.gif" id="img1" style="display: none" />
					<div id="div1"></div>
				</div>
				<div class='col-md-7'>

					<c:if test="${power==true}">
						<c:if test="${countI+1 ne 0 && countJ+1 ne 0}">
							<table id="resultTable" class='table-responsive'>
								<tr>
									<td>行程 ＼ 罰則</td>
									<c:forEach var="i" varStatus="statusI" begin="0"
										end="${countI}">
										<c:if test="${statusI.count==1}">
											<td>旅遊前<strong>${fSelect[i].fine_Dates}</strong>天通知<br>扣款總費用
												* ${fSelect[i].fine_Per}%
											</td>
										</c:if>
										<c:if test="${statusI.count>1}">
											<c:if
												test="${fSelect[i].fine_Dates==fSelect[i-1].fine_Dates-1}">
												<td>旅遊前<strong>${fSelect[i].fine_Dates}</strong>天通知<br>扣款總費用
													* ${fSelect[i].fine_Per}%
												</td>
											</c:if>
											<c:if
												test="${fSelect[i].fine_Dates!=fSelect[i-1].fine_Dates-1}">
												<td>旅遊前<strong>${fSelect[i].fine_Dates} ～
														${fSelect[i-1].fine_Dates-1}</strong>天通知<br>扣款總費用 *
													${fSelect[i].fine_Per}%
												</td>
											</c:if>
										</c:if>
									</c:forEach>
									<td>旅遊<strong>開始</strong>日<br>扣款總費用 * 100%
									</td>

								</tr>
								<c:forEach var="i" begin="0" end="${countJ}">
									<tr>
										<td>${tSelect[i].tra_Name}<br>${totalDays[i][countI+1]}</td>
										<c:forEach var="j" varStatus="statusJ" begin="0"
											end="${countI}">
											<c:if test="${statusJ.count==1}">
												<td>報名截止日 ～ ${totalDays[i][j]}<br> <fmt:formatNumber
														value="${iSelect[i].item_Money}" groupingUsed="true"
														type="currency" maxFractionDigits="0" /> *
													${fSelect[j].fine_Per}% ＝<br> <strong><fmt:formatNumber
															value="${iSelect[i].item_Money*fSelect[j].fine_Per/100}"
															groupingUsed="true" type="currency" maxFractionDigits="0" /></strong>
												</td>
											</c:if>
											<c:if test="${statusJ.count!=1}">
												<c:if test="${afterDay[i][j-1]==totalDays[i][j]}">
													<td>${totalDays[i][j]}<br>
												</c:if>
												<c:if test="${afterDay[i][j-1]!=totalDays[i][j]}">
													<td>${afterDay[i][j-1]}～ ${totalDays[i][j]}<br>
												</c:if>
												<fmt:formatNumber value="${iSelect[i].item_Money}"
													groupingUsed="true" type="currency" maxFractionDigits="0" /> *
													${fSelect[j].fine_Per}% ＝ <br>
												<strong><fmt:formatNumber
														value="${iSelect[i].item_Money*fSelect[j].fine_Per/100}"
														groupingUsed="true" type="currency" maxFractionDigits="0" /></strong>
												</td>
											</c:if>
										</c:forEach>
										<td>${totalDays[i][countI+1]}<br> <!-- 100% --> <br>
											<strong><fmt:formatNumber
													value="${iSelect[i].item_Money}" groupingUsed="true"
													type="currency" maxFractionDigits="0" /> </strong></td>
									</tr>

								</c:forEach>
							</table>
						</c:if>
					</c:if>

					<c:choose>
						<c:when test="${countI+1 eq 0 && countJ+1 eq 0}">
							<h2>目前尚無罰則＆行程資訊！</h2>
						</c:when>
						<c:when test="${countI+1 eq 0}">
							<h2>目前尚無罰則資訊！</h2>
						</c:when>
						<c:when test="${countJ+1 eq 0}">
							<h2>目前尚無行程資訊！</h2>
						</c:when>
					</c:choose>

				</div>
				<div class='col-md-2'></div>
			</div>
		</form>
	</div>
</body>
</html>