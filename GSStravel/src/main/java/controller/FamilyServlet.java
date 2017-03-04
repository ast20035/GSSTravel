package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

//import org.apache.el.parser.BooleanNode;
//import org.json.simple.JSONObject;


import ch.qos.logback.core.net.SyslogOutputStream;
import model.EmployeeDAO;
import model.EmployeeService;
import model.EmployeeVO;
import model.FamilyService;
import model.FamilyVO;

@WebServlet("/FamilyServlet")
public class FamilyServlet extends HttpServlet {

	private static final ArrayList<Object> Integer = null;
	private EmployeeService employeeservice = new EmployeeService();
	private EmployeeDAO employeedao =new EmployeeDAO();
	private FamilyService familyservice = new FamilyService();

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
    	res.setContentType ("text/html;charset=utf-8");
		// 接收資料 驗證資料 轉換資料 呼叫Model 根據Model執行結果，決定需要顯示的View元件
		String empphone = req.getParameter("empphone");
		String empben = req.getParameter("empben");
		String empbenrel = req.getParameter("empbenrel");
		String empemg = req.getParameter("empemg");
		String empemgphone = req.getParameter("empemgphone");
		String empeat = req.getParameter("empeat");
		String empnote = req.getParameter("empnote");
		String empemail = req.getParameter("empemail");
		// 親屬
		String[] famrel = req.getParameterValues("famrel");
		String[] famname = req.getParameterValues("famname");
		String[] famsex = req.getParameterValues("famsex");
		String[] famid = req.getParameterValues("famid");
		String[] fambdatedate = req.getParameterValues("fambdate");
		String[] famphone = req.getParameterValues("famphone");
		String[] fameat = req.getParameterValues("fameat");
		String[] famben = req.getParameterValues("famben");
		String[] fambenrel = req.getParameterValues("fambenrel");
		String[] famemg = req.getParameterValues("famemg");
		String[] famemgphpone = req.getParameterValues("famemgphpone");
		String[] famemgrel = req.getParameterValues("famemgrel");
		String[] famnote = req.getParameterValues("famnote");
		String[] selectvalue =req.getParameterValues("selectvalue");
//		String[] repeatselectvalue = req.getParameterValues("repeatselectvalue");
		
		
		String buttonsave = req.getParameter("button");
		String ajaxid = req.getParameter("id");//判斷前端寫親屬身分證有無重複
		String ajaxfamid = req.getParameter("ajaxfamid");//用前端的親屬身分證去刪親屬
		String ajaxcheckbox =req.getParameter("checkbox");
//		String ajaxmultiselect =req.getParameter("multiselect");
//		String ajaxfamname=req.getParameter("famnameajax");
		String ajaxemail = req.getParameter("email");
		String ajaxrepeatfamid=req.getParameter("repeatfamid");
		String ajaxwebfamid= req.getParameter("webfamid");
		PrintWriter out = res.getWriter();//ajax輸出???
		
		HttpSession session = req.getSession();
		Integer emp_No = (Integer) session.getAttribute("emp_No");
		List<String> id = familyservice.selectid();
		List<String> email = employeedao.selectEmail_Not_emp_No(emp_No);
		
		
		//判斷員工信箱是否重複
		if(ajaxemail != null){
			for(String xxx:email){
				if(ajaxemail.equals(xxx)==false){
					out.print("");
				}else{
					out.print("repeat");
				}
			}
		}
		
		//判斷原來的親屬身分證有沒有重複
				if(ajaxrepeatfamid != null) {
//					System.out.println(ajaxrepeatfamid+"++++++");
					int yyy= familyservice.selectfam_byid(ajaxrepeatfamid);
					List<String> idnotmyself= familyservice.selectid_not_myself(yyy);
					
					for(String xxx: idnotmyself){//A191101620
//						System.out.println(xxx);
						if(ajaxrepeatfamid.equals(xxx)){
							out.print("repeat");
						}else{
							out.print("");
						}
					}
					
//					System.out.println(ajaxwebfamid);
					List<String>webid=new ArrayList<String>();
					String webfamid=ajaxwebfamid.replace("[", "").replace("]", "").replace("\"", "").replace(",", "");
					System.out.println(webfamid);
					for(int i=0;i<=webfamid.length();){
						String xxxx = webfamid.substring(i,i+9);//F111111111
						i=i+9;
						webid.add(xxxx);
						
					}
//					for(String xx:webid){
//						System.out.println(xx);
//					}
//					for(int x=0;x<xxx.length();){
//						 String y=xxx.substring(x, x+3);//mom
//						 x=x+3;
//						 ssss.add(y);
//					 }
//					System.out.println(webfamid);
//					if(webfamid.equals(ajaxrepeatfamid)){
//						
//						out.print("repeat");
//					}else{
//						out.print("");
//					}
					
				}
		
				
		//判斷新增的親屬身分證有沒有重複
		if(ajaxid != null){
			if(id.contains(ajaxid)){
				System.out.println("repeat");
				out.print("repeat");
			}else{
				out.print("");
			}
		}
		
		
		//按下delete鍵的動作
		if(ajaxfamid!=null){
				 int famno = familyservice.selectfam_byid(ajaxfamid);//用id找famno
				 List<java.sql.Date> listdate= familyservice.selectfam_Nodelete(famno);//用famno去找有活動的親屬
				 long betweenDate=0;
				 if(famno!=0){
					 if(listdate.size()!=0){
						 for(Date date: listdate){
							 Calendar calendar = Calendar.getInstance();
							 long nowDate = calendar.getTime().getTime(); //獲得毫秒型 現在日期
							 long specialDate = date.getTime();//把要比較的值放這(親屬日期)
							 betweenDate = (specialDate - nowDate) / (1000 * 60 * 60 * 24);
							 if(betweenDate>0){//比對 能不能刪除
//								 System.out.println(betweenDate);
//								 System.out.println("not");
								 out.println("not");
							 }else{
								//可以刪除  全部過期才會到此 才能刪除
								familyservice.delete(ajaxfamid);
//								System.out.println("delete1");
								out.println("delete");
							 }
						 }//迴圈結束
					 }else{//detail沒有相符
						 familyservice.delete(ajaxfamid);
//						 System.out.println("delete2");
						 out.println("delete");
					 }
				 }else{//沒抓到親屬no 直接刪掉
					 familyservice.delete(ajaxfamid);
//					 System.out.println("delete3");
					 out.println("delete");
				 }
			}

		
		//按下儲存submit回來
		if ("儲存".equals(buttonsave)) {//前面""抓value 

			Map<String, String> errormsg = new HashMap<String, String>();
			req.setAttribute("error", errormsg);
			
			// 員工判斷空值 轉型態
			if (empphone == null || empphone.length() == 0) {
				errormsg.put("empphone", "員工電話不能為空值");
			}
			if (empemgphone == null || empemgphone.length() == 0) {
				errormsg.put("empemgphone", "員工緊急聯絡人電話不能為空值");
			}
			if (empben == null || empben.length() == 0) {
				errormsg.put("empben", "員工保險受益人不能為空值");
			}
			if (empbenrel == null || empbenrel.length() == 0) {
				errormsg.put("empbenrel", "員工保險受益人關係不能為空值");
			}
			if (empemg == null || empemg.length() == 0) {
				errormsg.put("empemg", "員工緊急聯絡人不能為空值");
			}
			if (empemail == null || empemail.length() == 0) {
				errormsg.put("empemail", "員工信箱不能為空值");
			}


			// 判斷 假如只有一行空白刪除空白欄位 跟 兩行以上 一行有一行空白 把空白判斷掉
			List<Date> fambdate = new ArrayList<Date>();
			
			if (famid!=null) {
				int idlength = famid.length;
				for (int i = 0; i < idlength; i++) {

					if (!famid[i].equals("") || famid[i] != null || !famname[i].equals("") || famname[i] != null
							|| !fambdatedate[i].equals("") || fambdatedate[i] != null || !famphone[i].equals("")
							|| famphone[i] != null || !famben[i].equals("") || famben[i] != null
							|| !fambenrel[i].equals("") || fambenrel[i] != null || !famemg[i].equals("")
							|| famemg[i] != null || !famemgrel[i].equals("") || famemgrel[i] != null
							|| !famemgphpone[i].equals("") || famemgphpone[i] != null) {// 判斷空白
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

						for (String bdate : fambdatedate) {
							try {
								fambdate.add(sdf.parse(bdate));
							} catch (ParseException e) {
								errormsg.put("fambdate", "日期錯誤必須符合 年-月-日格式");
								System.out.println("使用者輸入日期錯誤");
							}
						}
					}
				}
				
				if (famname == null || famname.length == 0) {
					errormsg.put("famname", "親屬家人不能為空值");
				}
				if (famid == null || famid.length == 0) {
					errormsg.put("famid", "親屬身分證不能為空值");
				}
				if (famphone == null || famphone.length == 0) {
					errormsg.put("famphone", "親屬電話不能為空值");
				}
				if (famben == null || famben.length == 0) {
					errormsg.put("famben", "親屬保險受益人不能為空值");
				}
				if (fambenrel == null || fambenrel.length == 0) {
					errormsg.put("fambenrel", "親屬保險受益人關係不能為空值");
				}
				if (famemg == null || famemg.length == 0) {
					errormsg.put("famemg", "親屬緊急聯絡人不能為空值");
				}
				if (famemgphpone == null || famemgphpone.length == 0) {
					errormsg.put("famemgphpone", "親屬緊急聯絡人電話不能為空值");
				}
				if (famemgrel == null || famemgrel.length == 0) {
					errormsg.put("famemgrel", "親屬緊急聯絡人關係不能為空值");
				}

			}
			
			if (errormsg != null && !errormsg.isEmpty()) {
				System.out.println("親屬員工檢查錯誤");
				req.getRequestDispatcher("Register").forward(req, res);
				return;
			} else {
				System.out.println("親屬員工檢查完畢");
			}

			
			// 網路頁面上取值 抓員工值
			EmployeeVO employeevo = new EmployeeVO();
			employeevo.setEmp_No(emp_No);
			employeevo.setEmp_Phone(empphone);
			employeevo.setEmp_Ben(empben);
			employeevo.setEmp_BenRel(empbenrel);
			employeevo.setEmp_Emg(empemg);
			employeevo.setEmp_EmgPhone(empemgphone);
			employeevo.setEmp_Mail(empemail);
			employeevo.setEmp_Eat(empeat);
			if (empnote != null ) {
				employeevo.setEmp_Note(empnote);
			} else {
				employeevo.setEmp_Note(null);
			}
			employeeservice.update(employeevo);
			System.out.println("員工資料更改完畢");
			
			
			if (famid!=null) {
				int idlength = famid.length;
				ArrayList<Boolean> carcheckbox =new ArrayList<Boolean>();
				String[] items = ajaxcheckbox.replaceAll("\\[", "").replaceAll("\\]", "").split(",");
				String[] results = new String[items.length];
				 for (int j = 0; j < items.length; j++) {
						results[j] = String.valueOf(items[j].trim());
					 	}
				 for (String element : results) {
					 if(element.equals("0")){//有改
						 carcheckbox.add(false);
					 }
					 if(element.equals("1")){
						 carcheckbox.add(true);
					 }
				 }
				 
				idlength = famid.length;
				for (int i = 0; i < idlength; i++) {// 0 1 2 3
					
					FamilyVO familyvo = new FamilyVO();
					familyvo.setEmp_No(emp_No);
					Integer famno = familyservice.selectfam_No(famname[i]);
					Integer famnobyid = familyservice.selectfam_byid(famid[i]);
					if (famno != 0) {
						familyvo.setFam_No(famno);
						familyvo.setFam_Name(famname[i]);
					} else {
						familyvo.setFam_No(famnobyid);
						familyvo.setFam_Name(famname[i]);
					}
					familyvo.setFam_Rel(famrel[i]);
					familyvo.setFam_Sex(famsex[i]);
					familyvo.setFam_Id(famid[i]);
					familyvo.setFam_Bdate(new java.sql.Date(fambdate.get(i).getTime()));
					familyvo.setFam_Phone(famphone[i]);
					familyvo.setFam_Eat(fameat[i]);

					//用來帶入  不占車位的勾選是與否
					if(carcheckbox!=null && carcheckbox.size()!=0){
						if(carcheckbox.get(i)==true){
							familyvo.setFam_Car(true);
						}
						if(carcheckbox.get(i)==false){
							familyvo.setFam_Car(false);
						}
					}else{
						familyvo.setFam_Car(false);
					}

					familyvo.setFam_Ben(famben[i]);
					familyvo.setFam_BenRel(fambenrel[i]);
					familyvo.setFam_Emg(famemg[i]);
					familyvo.setFam_EmgPhone(famemgphpone[i]);
					familyvo.setFam_EmgRel(famemgrel[i]);
					if (famnote[i] != null) {
						familyvo.setFam_Note(famnote[i]);
					} else {
						familyvo.setFam_Note(null);
					}

					
					
					if (id.contains(famid[i]) == true) {//資料庫找身分證是否重複 有重複用update 沒有重複用insert
						
						String value = selectvalue[i].replace("[", "").replace("]", "").replace(",","").replace("\"", "");
//						System.out.println(selectvalue[i]);
//						System.out.println(value);
						if(value!=""){
							if(value.contains("bab")){
								familyvo.setFam_Bady(true);
							}else{
								familyvo.setFam_Bady(false);
							}
							
							if(value.contains("kid")){
								familyvo.setFam_kid(true);
							}else{
								familyvo.setFam_kid(false);
							}
							
							if(value.contains("dis")){
								familyvo.setFam_Dis(true);
							}else{
								familyvo.setFam_Dis(false);
							}
							
							if(value.contains("mom")){
								familyvo.setFam_Mom(true);
							}else{
								familyvo.setFam_Mom(false);
							}
						}else{
							familyvo.setFam_Bady(false);
							familyvo.setFam_kid(false);
							familyvo.setFam_Dis(false);
							familyvo.setFam_Mom(false);
						}
						familyservice.update(familyvo);
						System.out.println("update " + famid[i] + " famno=" + famno);

					} else {
						
						String value = selectvalue[i].replace("[", "").replace("]", "").replace(",","").replace("\"", "");
//						System.out.println(selectvalue[i]);
//						System.out.println(value);
						if(value!=""){
							if(value.contains("bab")){
								familyvo.setFam_Bady(true);
							}else{
								familyvo.setFam_Bady(false);
							}
							
							if(value.contains("kid")){
								familyvo.setFam_kid(true);
							}else{
								familyvo.setFam_kid(false);
							}
							
							if(value.contains("dis")){
								familyvo.setFam_Dis(true);
							}else{
								familyvo.setFam_Dis(false);
							}
							
							if(value.contains("mom")){
								familyvo.setFam_Mom(true);
							}else{
								familyvo.setFam_Mom(false);
							}
						}else{
							familyvo.setFam_Bady(false);
							familyvo.setFam_kid(false);
							familyvo.setFam_Dis(false);
							familyvo.setFam_Mom(false);
						}
						
						familyservice.insert(familyvo);
						System.out.println("insert " + famid[i]);

							
					}

				} // 回圈結束
				req.getRequestDispatcher("Register").forward(req, res);
			}else{
				req.getRequestDispatcher("Register").forward(req, res);
			}
			
		} // 按下save的執行動作 結束
  
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}

}
