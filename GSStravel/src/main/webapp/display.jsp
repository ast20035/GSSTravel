<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<meta http-equiv="refresh"
	content="0;url=http://localhost:8080/GSStravel/AllTravel" />
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
</head>
<body>
${bl}
${bl1}
</body>
<script type="text/javascript">
if(${bl}){
 		alert("報名失敗!!報名人數超過可參加人數!!");  
}else{		
		if(${bl1}){
			var money;
			var subMoney=4500;
			if(${drtail[1]*drtail[2]} < subMoney){
				money=0;
			}else{
				money=${drtail[1]*drtail[2]}-subMoney;
			}
			if(${drtail[4]}!=0){
				subMoney=(subMoney/12)*${drtail[4]};
			}
			alert("報名成功!!"+"\n"+"團費試算  年度可使用補助金額:"+subMoney+";個人團費:${drtail[1]}*${drtail[2]}=${drtail[1]*drtail[2]}"+"\n"+"個人補助金:"+subMoney+";應補團費:"+money+"\n"+"PS:團費試算僅供參考，需繳納費用以福委會通知為主"+"\n"+"補助金轉移!!!!!"+"\n"+"從原本旅遊編碼:${decide[0]};旅遊名稱:${decide[1]}"+"\n"+"轉移至"+"\n"+"旅遊編碼:${decide[2]};旅遊名稱:${decide[3]}");
		
		}else{
		    alert("報名成功!!"+"\n"+"團費試算  年度可使用補助金額:${drtail[0]};個人團費:${drtail[1]}*${drtail[2]}=${drtail[1]*drtail[2]}"+"\n"+"個人補助金:${drtail[0]};應補團費:${drtail[3]}"+"\n"+"PS:團費試算僅供參考，需繳納費用以福委會通知為主");  			
		}
		
}
</script>
</html>