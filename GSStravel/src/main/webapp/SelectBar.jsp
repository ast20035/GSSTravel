<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script>
		var pathNamejs = document.location.pathname;
		var indexjs = pathNamejs.substr(1).indexOf("/");
		var resultjs = pathNamejs.substr(0, indexjs + 1);
	</script>
<style>
.topBar{
padding-bottom: 5%;
}
</style>
<div class='row-fluid topBar'>
	<div class='col-md-11'>
		<div class="btn-group" role="group" aria-label="...">
			<input type='button' value='報名/查詢' class="btn btn-default"
				onclick="window.location.href=resultjs+'/AllTravel';" /> <input
				type='button' value='資料輸入' class="btn btn-default"
				onclick="window.location.href=resultjs+'/Register';" />
			<c:if test='${sessionScope.emp_Role==true}'>
				<input type='button' value='行程維護' class="btn btn-default"
					onclick="window.location.href=resultjs+'/search2.jsp';" />
				<input type='button' value='報名維護' class="btn btn-default"
					onclick="window.location.href=resultjs+'/search.jsp';" />
				<input type='button' value='罰則維護' class="btn btn-default"
					onclick="window.location.href=resultjs+'/FineServlet?FineSetting=罰則設定';" />
				<input type='button' value='旅費統計' class="btn btn-default"
					onclick="window.location.href=resultjs+'/search1.jsp';" />
			</c:if>
		</div>
	</div>
	<div class='col-md-1'>
		<input type="button" value='登出' class="btn btn-default"
			onclick="window.location.href=resultjs+'/LogOut.do';">
	</div>
</div>
	
	