package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QandAService;
import model.QandAVO;

@WebServlet("/QandAServlet")
public class QandAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodaction=request.getParameter("prodaction");
		if("question".equals(prodaction)){
		
		}
		QandAService QAService =new QandAService();
		List<QandAVO> list = new ArrayList<QandAVO>();
		list=QAService.selectALL();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/QandA.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
