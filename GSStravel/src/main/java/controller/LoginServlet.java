package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmployeeService;
import model.EmployeeVO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 用來轉換日期格式
//	private static SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
//	private EmployeeService empService = new EmployeeService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		SimpleDateFormat formatNewYMD1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateNew = new Date();
		long beforeNowNew = (dateNew.getTime() / 1000) - 60 * 60 * 24 * 7;// 一星期之內為最新公告
		dateNew.setTime(beforeNowNew * 1000);
		String beforeDateNew = formatNewYMD1.format(dateNew);
		session.setAttribute("beforeDateNew", beforeDateNew);
		
		String act = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		int account = 0;
		byte[] password =null;
		EmployeeService empService = new EmployeeService();

		Map<String, String> msg = new HashMap<String, String>();
		request.setAttribute("error", msg);


			try {
				account = Integer.parseInt(act);
			    password=pwd.getBytes();
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				msg.put("act", "登入失敗!");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				return;
			}


		EmployeeVO empVO = new EmployeeVO();
		empVO.setEmp_No(account);
		empVO.setEmp_PW(password);
		
		EmployeeVO result = empService.login(account, pwd);
		if(result == null){
			msg.put("act", "登入失敗!");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
			
//			HttpSession session=request.getSession();
			session.setAttribute("emp_No", result.getEmp_No());
			session.setAttribute("emp_Name", result.getEmp_Name());
			session.setAttribute("emp_Role", result.isEmp_Role());
			request.getRequestDispatcher("/Board.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
