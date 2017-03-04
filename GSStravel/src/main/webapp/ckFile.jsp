<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	window.onload= function(){
		var answer = confirm("是否要增加附件???");
		if (answer == true) {	
			document.location.href="<c:url value='/fileupload_control.jsp'/>";
		}else{
			document.location.href="<c:url value='/SetUpTravel.jsp'/>";
		}	
	}
	
</script>
<body>
</body>
</html>