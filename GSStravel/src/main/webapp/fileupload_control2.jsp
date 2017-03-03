<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='js/jquery-3.1.1.min.js'></script>
</head>
<script type="text/javascript">
	if(${error!=null}){
		alert("${error}");
	}
</script>
<body>
	<h2>檔案上傳</h2>
	<h2>旅遊編碼:${tra_No}</h2> 
	<h2>旅遊名稱:${tra_Name}</h2> 
	<form name="upload" enctype="multipart/form-data" method="POST"
		action="<c:url value='/fileupload2'/>">	
		<p>
			上傳檔案： <input type="file" name="file" size="20" maxlength="20" />
		</p>
		<p>
			<input type="submit" value="上傳" /> <input type="reset" value="清除" /><input
				type="button" value="取消" onclick="window.location.href=search2;" />
		</p>
	</form>
	<h3>資料大小不能超過100MB,檔案格式必須是".txt .pdf .doc .ppt .xls .csv .dbf .gif .jpg .jpeg .png .swf .htm .html .zip .rar"</h3>
</body>
<script type="text/javascript">	
	var search2 = "<c:url value='/CancelFile2?tra_No=${tra_No}&tra_Name=${tra_Name}'/>"
</script>
</html>