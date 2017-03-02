package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QandAService;
import model.QandAVO;
import model.TravelService;
import model.TravelVO;

@WebServlet("/QandAServlet")
public class QandAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String prodaction=request.getParameter("prodaction");
		String role =request.getParameter("role");
		//role=false身分才可進入我要詢問.JSP
		if("question".equals(prodaction)&&"false".equals(role)){
			try {
				TravelService traService =new TravelService();
				List<TravelVO> list=traService.select_forSearch();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/QandAQuestion.jsp").forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//查看詳細詢問內容
		if("select".equals(prodaction)){
			String temp=request.getParameter("qa_No");
			int qa_No = Integer.parseInt(temp);
			QandAService qaService =new QandAService();
			QandAVO bean = new QandAVO();
			bean = qaService.getALL(qa_No);
			request.setAttribute("list", bean);
			request.setAttribute("role", role);
			request.getRequestDispatcher("/QandAResponse.jsp").forward(request, response);
			return;
		}
		QandAService QAService =new QandAService();
		List<QandAVO> list = new ArrayList<QandAVO>();
		list=QAService.selectALL(prodaction);
		int count =list.size();
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("role", role);
		if("false".equals(role)){
			request.getRequestDispatcher("/QandAGuest.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/QandAManager.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
