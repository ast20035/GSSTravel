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
<title>檔案上傳</title>
<style type="text/css">
#backPic {
	position: fixed;
	top: 0;
	z-index: -1;
	opacity: 0.2;
	height: 100%;
	width: 100%;
}

h2, h3, p, div {
	border-bottom: 1px solid #DDDDDD;
	padding-bottom: 15px;
	margin-bottom: 30px;
}

.container-fluid {
	margin-top: 60px;
}
</style>
<script src='js/jquery-3.1.1.min.js'></script>
</head>
<script type="text/javascript">
	if(${error!=null}){
		alert("${error}");
	}
</script>
<body>
	<div class='container-fluid'>
		<div class='col-md-offset-1 col-md-4'>
			<h3>檔案上傳</h3>
			<h3>旅遊編碼:${tra_No}</h3>
			<h3>旅遊名稱:${tra_Name}</h3>
			<form name="upload" enctype="multipart/form-data" method="POST"
				action="<c:url value='/fileupload'/>">
				<!-- 					<label class="control-label">上傳檔案 </label><input type="file" name="file" size="20" maxlength="20" class='file'/> -->
				<div class='input-group'>
					<label style='color:white;' class="btn btn-primary btn-file input-group-addon"> 檔案上傳 <input
						type="file" style="display: none;" name='file' class='file'>
					</label> <input type="text" readonly="readonly" value='' class='form-control' id='txt1' style='width:200px;'>
					<script>
					$(document).on('change', ':file', function() {
					    var input = $(this),
					        numFiles = input.get(0).files ? input.get(0).files.length : 1,
					        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
					    $('#txt1').val(label);
					});
					</script>
				</div>
				<p>
					<input type="submit" value="上傳" class='btn btn-primary' /> <input
						type="reset" value="清除" class='btn btn-primary' /> <input
						type="button" value="取消" onclick="window.location.href=search2;"
						class='btn btn-primary' />
				</p>
			</form>
			<h4>資料大小不能超過100MB,檔案格式必須是".txt .pdf .doc .ppt .xls .csv .dbf
				.gif .jpg .jpeg .png .swf .htm .html .zip .rar"</h4>
		</div>

	</div>
	<img src="images/Travel.jpg" id="backPic">
</body>
<script type="text/javascript">	
	var search2 = "<c:url value='/CancelFile?tra_No=${tra_No}&tra_Name=${tra_Name}'/>"
</script>
</html>