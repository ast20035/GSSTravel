<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh"
	content="0;url=<c:url value='/search2.jsp'/>" />
<title>Insert title here</title>
<style type="text/css">
#backPic{
		position:fixed;
		top:0;
		z-index: -1;
		opacity: 0.4;
		height:100%;
		width: 100%;
	}
</style>
</head>
<body>
<script type="text/javascript">
	if (${tra_No!=null}) {
		alert("旅遊編碼:${tra_No}"+"\n"+"旅遊名稱:${tra_Name}"+"\n"+"附件為${fileName}"+"\n"+"新增成功!!");
	}
</script>
<img src="images/Travel.jpg" id="backPic">
</body>
</html>