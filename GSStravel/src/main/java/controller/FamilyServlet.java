package controller;

import java.io.IOException;
import java.sql.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import model.EmployeeService;
import model.EmployeeVO;
import model.FamilyService;
import model.FamilyVO;



@WebServlet("/FamilyServlet")
public class FamilyServlet extends HttpServlet {
	
private static final ArrayList<Object> Integer = null;
private EmployeeService employeeservice = new EmployeeService();
private FamilyService familyservice= new FamilyService();
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		//接收資料 驗證資料 轉換資料 呼叫Model 根據Model執行結果，決定需要顯示的View元件
		String empphone = req.getParameter("empphone");
		String empben =  req.getParameter("empben");
		String empbenrel = req.getParameter("empbenrel");
		String empemg =req.getParameter("empemg");
		String empemgphone= req.getParameter("empemgphone");		
		String empeat = req.getParameter("empeat");
		String empnote = req.getParameter("empnote");
		String empemail =req.getParameter("empemail");
		//親屬
		String[] famrel = req.getParameterValues("famrel");
		String[] famname = req.getParameterValues("famname");
		String[] famsex = req.getParameterValues("famsex");
		String[] famid = req.getParameterValues("famid");
		String[] fambdatedate= req.getParameterValues("fambdate");
		String[] famphone=req.getParameterValues("famphone");
		String[] fameat = req.getParameterValues("fameat");
		String[] famcar=req.getParameterValues("famcar");
		String[] famspa=req.getParameterValues("famspa");
		String[] famben = req.getParameterValues("famben");
		String[] fambenrel = req.getParameterValues("fambenrel");
		String[] famemg = req.getParameterValues("famemg");
		String[] famemgphpone = req.getParameterValues("famemgphpone");
		String[] famemgrel =req.getParameterValues("famemgrel");
		String[] famnote = req.getParameterValues("famnote");
		
		String buttondelete =req.getParameter("delete");
		String buttonsave = req.getParameter("button");
		
		
		
		
		Map<String,String> errormsg = new HashMap<String, String>();
		req.setAttribute("error", errormsg);
		
//		try{
//	           String orderId = req.getAttribute("selectvalue").toString();
//	 
//	           System.out.println(orderId);
//	       
//		}catch(Exception ex){
//			System.out.println("aaaaa");
//		}
		
		
		//員工 轉值
		if(empphone==null|| empphone.length()==0){
			errormsg.put("empphone", "員工電話不能為空值");}
		if(empemgphone==null|| empemgphone.length()==0){
			errormsg.put("empemgphone", "員工緊急聯絡人電話不能為空值");}
		if(empben==null || empben.length()==0 ){
			errormsg.put("empben", "員工保險受益人不能為空值");}
		if( empbenrel ==null ||empbenrel.length()==0){
			errormsg.put("empbenrel", "員工保險受益人關係不能為空值");}
		if(empemg ==null ||empemg.length()==0){
			errormsg.put("empemg", "員工緊急聯絡人不能為空值");}
		if(empemail==null ||empemail.length()==0){
			errormsg.put("empemail", "原公信箱不能為空值");
		}
		
//		String[] famcar=req.getParameterValues("famcar");
//		for(String car:famcar){ //1筆   true  看要不要用前端判斷加值近來
//		System.out.println(famcar.length);
//		System.out.println(car);
//		};
		
		//親屬 轉值  家屬為null?
		List<Date> fambdate=new ArrayList<Date>();
		if(famname!=null){//原本為檔全部空值//判斷如果 有一筆 空白 有一筆 有填寫好的家屬欄的話應該怎麼做
								//如果 抓到空白欄位的跨日期會出錯 (null轉換為日期)
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
					for(String bdate:fambdatedate){					
						try {
							fambdate.add(sdf.parse(bdate));
						} catch (ParseException e) {
							errormsg.put("fambdate","日期錯誤必須符合 年-月-日格式");
							System.out.println("使用者輸入日期錯誤");
						}
					}
					
			if(famname==null || famname.length==0 ){
				errormsg.put("famname", "親屬家人不能為空值");}
			if( famid ==null ||famid.length==0){
				errormsg.put("famid", "親屬身分證不能為空值");}
			if(famphone==null || famphone.length==0){
				errormsg.put("famphone", "親屬電話不能為空值");}
			if(famben ==null ||famben.length==0){
				errormsg.put("famben", "親屬保險受益人不能為空值");}
			if(fambenrel ==null ||fambenrel.length==0){
				errormsg.put("fambenrel", "親屬保險受益人關係不能為空值");}
			if(famemg ==null ||famemg.length==0){
				errormsg.put("famemg", "親屬緊急聯絡人不能為空值");}
			if(famemgphpone ==null ||famemgphpone.length==0){
				errormsg.put("famemgphpone", "親屬緊急聯絡人電話不能為空值");}
			if(famemgrel==null || famemgrel.length==0){
				errormsg.put("famemgrel", "親屬緊急聯絡人關係不能為空值");}
		}	
		
		
		
				if(errormsg!=null && !errormsg.isEmpty()){
					System.out.println("親屬員工檢查錯誤");
					req.getRequestDispatcher("Register").forward(req, res);
					return;	
				}else{
					System.out.println("親屬員工檢查完畢");
				}
		
			
	    	HttpSession session = req.getSession();
			Integer emp_No = (Integer) session.getAttribute("emp_No");
//			System.out.println(emp_No);//102
		//網路頁面上取值 
		EmployeeVO employeevo = new EmployeeVO();
		employeevo.setEmp_No(emp_No);
		employeevo.setEmp_Phone(empphone);
		employeevo.setEmp_Ben(empben);
		employeevo.setEmp_BenRel(empbenrel);
		employeevo.setEmp_Emg(empemg);
		employeevo.setEmp_EmgPhone(empemgphone); 
		employeevo.setEmp_Mail(empemail);
		employeevo.setEmp_Eat(empeat);
		if(empnote!=null || empnote.length()!=0){
			employeevo.setEmp_Note(empnote);
		}else{
			employeevo.setEmp_Note(null);
		}
		
		//假如執行delete方法後 如果報名欄位是空白得?  ajax?

		//抓delete放事件進去
		System.out.println(buttondelete);
		if("delete".equals(buttondelete)){
			System.out.println("xxxxxx");
		};
		
//		if(buttondelete!=null){
//			if(buttondelete.equals("delete")){
//				System.out.println("yyyyy");
//			};
//		};
		
		
		
		if("save".equals(buttonsave)){
		 employeeservice.update(employeevo);
		 System.out.println("員工資料更改完畢");
		 
		 if(famname!=null){
			 int idlength=0;
			 idlength = famid.length;
	//		 System.out.println(idlength);//3筆 前端輸入的親屬id筆數 (前端寫多少欄位近來)
	
			 	//判斷 新增或是修改(親屬) 判斷前端欄位親屬id在資料庫有沒有   有id此欄未做修改 沒id此欄未做新增
				//還是看看用fam_id[i]來判斷進來的是跟資料庫一樣的id還是不同 
				//fam_id[i]那一筆   有   在資料庫 來判斷
			 List<String> id = familyservice.selectid(emp_No);	 
			 
			 for(int i=0;i<idlength;i++){//0 1 2 3
					FamilyVO familyvo = new FamilyVO();
					familyvo.setEmp_No(emp_No);
					Integer famno=familyservice.selectfam_No(famname[i]);
		//			System.out.println(familyservice.selectfam_No(famname[i]));// 4 5 6 7
					familyvo.setFam_No(famno);
					familyvo.setFam_Rel(famrel[i]);
					familyvo.setFam_Name(famname[i]);
					familyvo.setFam_Sex(famsex[i]);
					familyvo.setFam_Id(famid[i]);
					familyvo.setFam_Bdate(new java.sql.Date(fambdate.get(i).getTime()));
					familyvo.setFam_Phone(famphone[i]);
					familyvo.setFam_Eat(fameat[i]);
					
					//測試	
					familyvo.setFam_Car(false);
					familyvo.setFam_Bady(false);
					familyvo.setFam_kid(false);
					familyvo.setFam_Dis(false);
					familyvo.setFam_Mom(false);
					
					familyvo.setFam_Ben(famben[i]);
					familyvo.setFam_BenRel(fambenrel[i]);
					familyvo.setFam_Emg(famemg[i]);
					familyvo.setFam_EmgPhone(famemgphpone[i]);
					familyvo.setFam_EmgRel(famemgrel[i]);
					if(famnote[i]!=null){
						familyvo.setFam_Note(famnote[i]);
					}else{
						familyvo.setFam_Note(null);
					}
					
					
					if(id.contains(famid[i])==true){//可以insert進去 但不能update成功
						
						familyservice.update(familyvo);
						System.out.println("update " +famid[i]+" famno="+famno );
						
					}else{ 
						familyservice.insert(familyvo);
						System.out.println("insert "+famid[i]);
					}
			 	}//回圈結束
			 	req.getRequestDispatcher("Register").forward(req, res);
		 }else{//判斷此員工有沒有家屬
			 req.getRequestDispatcher("Register").forward(req, res);
		 }
		 	
		}//按下save的執行動作
		
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}
	
}
 