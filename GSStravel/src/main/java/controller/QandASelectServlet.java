package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QandAService;
import model.QandAVO;

@WebServlet("/QandASelectServlet")
public class QandASelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp=request.getParameter("qa_No");
		int qa_No = Integer.parseInt(temp);
		QandAService qaService =new QandAService();
		QandAVO bean = new QandAVO();
		bean = qaService.getALL(qa_No);
		request.setAttribute("list", bean);
		request.getRequestDispatcher("/QandAResponse.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
