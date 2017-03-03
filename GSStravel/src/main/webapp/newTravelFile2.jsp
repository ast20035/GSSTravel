<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh"
	content="0;url=http://localhost:8080/GSStravel/search2.jsp" />
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	if (${tra_No!=null}) {
		alert("旅遊編碼:${tra_No}"+"\n"+"旅遊名稱:${tra_Name}"+"\n"+"附件為${fileName}"+"\n"+"更新成功!!");
	}
</script>

</body>
</html>