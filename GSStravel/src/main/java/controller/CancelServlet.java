package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import model.Cancelservice;
import model.DetailService;
import model.EmployeeService;
import model.FamilyService;
import model.FamilyVO;
import model.ItemService;
import model.ItemVO;
import model.TravelService;
import model.TravelVO;

@WebServlet("/CancelServlet")
public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DetailService detailService=new DetailService();
	private EmployeeService employeeService=new EmployeeService();
	private FamilyService familyService=new FamilyService();
	private TravelService travelService=new TravelService();
	private ItemService itemService=new ItemService();
	private Cancelservice cancelservice=new Cancelservice();
	public CancelServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long tra_No=Long.parseLong(request.getParameter("tra_No"));//旅遊編號
		Integer emp_No=Integer.parseInt(request.getParameter("emp_No"));//員工標號
		String myName = employeeService.getName(emp_No.toString());//登入者姓名		
		LinkedHashSet<String> names = detailService.detailName(tra_No);//已經報明姓名
		Map<String, Integer> mp = detailService.detail(tra_No);//(姓名,人數)
		List<FamilyVO> familyVO = familyService.selectFam(emp_No.toString(),tra_No);//親朋好友
		int familySize = familyVO.size();//親朋好友數量
		TravelVO tra_Vo = travelService.select(tra_No);
		List<ItemVO> itemVo = itemService.getRoomMoney(tra_No);
		List<Long> detail = cancelservice.detail(emp_No, tra_No);
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		int a = (tra_Vo.getTra_End()).compareTo(java.sql.Timestamp.valueOf(date));
		// a 回傳-1 登記已截止
		request.setAttribute("a", a);
		request.setAttribute("detail", detail);
		request.setAttribute("itemVo", itemVo);
		request.setAttribute("tra_Vo", tra_Vo);
		request.setAttribute("familySize", familySize);
		request.setAttribute("familyVO", familyVO);
		request.setAttribute("myName", myName);
		request.setAttribute("emp_No", emp_No);
		request.setAttribute("name", names);
		request.setAttribute("mp", mp);
		request.setAttribute("tra_count", detailService.tra_count(tra_No));//單行程旅遊人數
		request.setAttribute("tra_order", detailService.ranking(tra_No,myName));//報名順序
		request.getRequestDispatcher("/Cancel.jsp").forward(request, response);;	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
