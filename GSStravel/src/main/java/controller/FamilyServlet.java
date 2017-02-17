package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import ch.qos.logback.core.net.SyslogOutputStream;
import model.EmployeeService;
import model.EmployeeVO;
import model.FamilyService;
import model.FamilyVO;

@WebServlet("/FamilyServlet")
public class FamilyServlet extends HttpServlet {

	private static final ArrayList<Object> Integer = null;
	private EmployeeService employeeservice = new EmployeeService();
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
		String[] famcar = req.getParameterValues("famcar");
		String[] famspa = req.getParameterValues("famspa");
		String[] famben = req.getParameterValues("famben");
		String[] fambenrel = req.getParameterValues("fambenrel");
		String[] famemg = req.getParameterValues("famemg");
		String[] famemgphpone = req.getParameterValues("famemgphpone");
		String[] famemgrel = req.getParameterValues("famemgrel");
		String[] famnote = req.getParameterValues("famnote");
		
		String ajaxid = req.getParameter("id");// 接到前端json格式資料
//		System.out.println(ajaxid);//["Q250939543","F261403341","F218757856",""]
//		String ajaxemail = req.getParameter("email");
//		System.out.println(ajaxemail);
		
		String buttondelete = req.getParameter("delete");
		String buttonsave = req.getParameter("button");

		PrintWriter out = res.getWriter();//ajax輸出???
		
		HttpSession session = req.getSession();
		Integer emp_No = (Integer) session.getAttribute("emp_No");
		List<String> id = familyservice.selectid(emp_No);
//		for(String yyyy:id){System.out.println(yyyy);}
		
		if (ajaxid != null) {// 轉成string[] 格式
			String[] items = ajaxid.replaceAll("\\[", "").replaceAll("\"", "").replaceAll("\\]", "").split(",");
			for (String dataid : items) {// 輸出
//				System.out.println(dataid);// Q250939543 F261403341 F218757856
				if (id.contains(dataid)) {//
//					System.out.println("xxxxxxxxxxxxxxxxxxxxx");
					out.print("親屬身分證字號重複");//用來傳出
					
//					req.setAttribute("idrepeat", "親屬身分證字號重複");
					//setAttribute需要用方法重新導向 回jsp頁面才可以顯示 ajax只有送過來 
				}
			}
		}
//		List<String> email = employeeservice.selectEmail();
//		System.out.println(email);
//		if(ajaxemail!=null){
//			String[] items = ajaxemail.replaceAll("\\[", "").replaceAll("\"", "").replaceAll("\\]", "").split(",");
//			for(String dataemail: items){
//				System.out.println(dataemail);
//				if(email.contains(dataemail)){
//					out.print("員工信箱重複");//一樣 可能會抓到兩個print 一起出來??
//				}
//			}
//		}

		if ("delete".equals(buttondelete)) {
			// familyservice.delete();//ajax傳值近來他的val來抓他的值? 前端配合把欄位remove掉
			System.out.println("xxxxxx");
		}
		;

		if ("儲存".equals(buttonsave)) {//前面""抓value
			Map<String, String> errormsg = new HashMap<String, String>();
			req.setAttribute("error", errormsg);

			// try{
			// String orderId = req.getAttribute("selectvalue").toString();
			//
			// System.out.println(orderId);
			//
			// }catch(Exception ex){
			// System.out.println("aaaaa");
			// }

			// 員工 轉值
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

			// HttpSession session = req.getSession();
			// Integer emp_No = (Integer) session.getAttribute("emp_No");

			// 親屬 轉值 家屬為null?
			// 判斷 假如只有一行空白刪除空白欄位 跟 兩行以上 一行有一行空白 把空白判斷掉
			List<Date> fambdate = new ArrayList<Date>();
			int idlength = 0;
			if (famid != null) {

				idlength = famid.length;

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

			// 網路頁面上取值
			EmployeeVO employeevo = new EmployeeVO();
			employeevo.setEmp_No(emp_No);
			employeevo.setEmp_Phone(empphone);
			employeevo.setEmp_Ben(empben);
			employeevo.setEmp_BenRel(empbenrel);
			employeevo.setEmp_Emg(empemg);
			employeevo.setEmp_EmgPhone(empemgphone);
			employeevo.setEmp_Mail(empemail);
			employeevo.setEmp_Eat(empeat);
			if (empnote != null || empnote.length() != 0) {
				employeevo.setEmp_Note(empnote);
			} else {
				employeevo.setEmp_Note(null);
			}

			// List<String> id = familyservice.selectid(emp_No);

			employeeservice.update(employeevo);
			System.out.println("員工資料更改完畢");

			if (famid != null) {// 這邊判斷匯錯 因為空值也算一筆?

				idlength = famid.length;
				for (int i = 0; i < idlength; i++) {// 0 1 2 3

					FamilyVO familyvo = new FamilyVO();
					familyvo.setEmp_No(emp_No);
					// 這邊的famno 帶錯 如果用name來入找famno會讓famno變成0( 新改的name
					// 會讓famno變0(找不到)
					// 假如 name抓不到改成用其他直抓famno 4 5 6
					Integer famno = familyservice.selectfam_No(famname[i]);
					Integer famnobyid = familyservice.selectfam_byid(famid[i]);
					if (famno != 0) {
						familyvo.setFam_No(famno);
						familyvo.setFam_Name(famname[i]);
					} else {
						// System.out.println(famid[i]);
						// System.out.println(famname[i]);
						// System.out.println(famnobyid);
						familyvo.setFam_No(famnobyid);
						familyvo.setFam_Name(famname[i]);
					}
					familyvo.setFam_Rel(famrel[i]);
					familyvo.setFam_Sex(famsex[i]);
					familyvo.setFam_Id(famid[i]);
					familyvo.setFam_Bdate(new java.sql.Date(fambdate.get(i).getTime()));
					familyvo.setFam_Phone(famphone[i]);
					familyvo.setFam_Eat(fameat[i]);

					// 測試
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
					if (famnote[i] != null) {
						familyvo.setFam_Note(famnote[i]);
					} else {
						familyvo.setFam_Note(null);
					}

					if (id.contains(famid[i]) == true) {

						familyservice.update(familyvo);
						System.out.println("update " + famid[i] + " famno=" + famno);

					} else {
						familyservice.insert(familyvo);
						System.out.println("insert " + famid[i]);

					}

				} // 回圈結束
				req.getRequestDispatcher("Register").forward(req, res);
			} else {
				req.getRequestDispatcher("Register").forward(req, res);
			} // 判斷 有沒有親屬資料

		} // 按下save的執行動作 結束
  
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.doPost(req, res);
	}

}
