<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
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
<title>Insert title here</title>
<script>
	window.onload = function() {
		if ('${error.act ne true}' != null && '${error.act}' != '') {
			alert('${error.act}');
		} else {
			;
		}
	}
	function check() {
		if (document.getElementById('account').value == '') {
			alert('帳號未填');
			document.getElementById('account').focus();
		} else if (document.getElementById('pwd').value == '') {
			alert('密碼未填');
			document.getElementById('pwd').focus();
		} else {
			document.getElementById('login.do').submit();
		}
	}
</script>
<style>
#title {
	margin-top: 15%;
}

form {
	margin-top: 2%;
}
</style>
</head>
<body>
	<div class='container-fluid'>
		<div class='row' id='title'>
			<div class='col-lg-12' align="center">
				<h1>叡揚旅遊報名系統</h1>
			</div>
			<!-- 			<div class='col-lg-10'></div> -->
		</div>

		<form method="POST" action=<c:url value="/controller/login.do" />
			id="login.do" role='form' class='form-horizontal'>
			<div class='form-group'>
				<label for='account' class='control-label col-lg-5'>帳號:</label>
				<div class='col-lg-3'>
					<input type="text" name='account' id='account' value=""
						class='form-control' />
				</div>
			</div>
			<div class='form-group'>
				<label for='pwd' class='control-label col-lg-5'>密碼:</label>
				<div class='col-lg-3'>
					<input type="password" name='pwd' id='pwd' class='form-control' />
				</div>
			</div>
			<div class='form-group'>
				<div class='col-lg-5'></div>
				<div class='col-lg-7'>
					<input id='sub' type="button" value='登入' onclick='check()'
						class='btn btn-primary' /> <input type='reset'
						class='btn btn-primary' />
				</div>
			</div>
		</form>
	</div>

</body>
</html>