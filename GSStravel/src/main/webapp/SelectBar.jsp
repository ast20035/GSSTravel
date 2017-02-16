<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var pathNamejs = document.location.pathname;
	var indexjs = pathNamejs.substr(1).indexOf("/");
	var resultjs = pathNamejs.substr(0, indexjs + 1);
</script>
<style>
.topBar {
	padding-bottom: 5%;
}
</style>
<ul class="nav nav-pills">

</ul>
<div class='row-fluid topBar'>
	<div class='col-md-11'>
		<ul class="nav nav-pills">
			<!-- 			<input type='button' value='報名/查詢' class="btn btn-primary btn-lg" -->
			<!-- 				onclick="window.location.href=resultjs+'/AllTravel';" /> -->
			<!-- 			<input type='button' value='資料輸入' class="btn btn-primary btn-lg" -->
			<!-- 				onclick="window.location.href=resultjs+'/Register';" /> -->
			<%-- 			<c:if test='${sessionScope.emp_Role==true}'> --%>
			<!-- 				<input type='button' value='行程維護' class="btn btn-primary btn-lg" -->
			<!-- 					onclick="window.location.href=resultjs+'/search2.jsp';" /> -->
			<!-- 				<input type='button' value='報名維護' class="btn btn-primary btn-lg" -->
			<!-- 					onclick="window.location.href=resultjs+'/search.jsp';" /> -->
			<!-- 				<input type='button' value='罰則維護' class="btn btn-primary btn-lg" -->
			<!-- 					onclick="window.location.href=resultjs+'/FineServlet?FineSetting=罰則設定';" /> -->
			<!-- 				<input type='button' value='旅費統計' class="btn btn-primary btn-lg" -->
			<!-- 					onclick="window.location.href=resultjs+'/search1.jsp';" /> -->
			<%-- 			</c:if> --%>
<%-- 			<c:url value='/FineServlet?FineSetting=罰則設定'/> --%>
			<li role="presentation" class='active'><a 
				href="<c:url value='/AllTravel'/>" >報名/查詢</a></li>
			<li role="presentation"><a href="<c:url value='/Register'/>" >資料輸入</a></li>
			<c:if test='${sessionScope.emp_Role==true}'>
				<li role="presentation"><a href="<c:url value='/search2.jsp'/>" >行程維護</a></li>
				<li role="presentation"><a href="<c:url value='/search.jsp'/>" >報名維護</a></li>
				<li role="presentation"><a
					href="<c:url value='/FineSetting.jsp'/>" >罰則維護</a></li>
				<li role="presentation"><a href="<c:url value='/search1.jsp'/>" >旅費統計</a></li>
			</c:if>
		</ul>
	</div>
	<div class='col-md-1'>
		<input type="button" value='登出' class="btn btn-danger btn-lg"
			onclick="window.location.href=resultjs+'/LogOut.do';">
	</div>
</div>

