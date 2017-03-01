package controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QandAService;
import model.QandAVO;

@WebServlet("/QandAInsertServlet")
public class QandAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QandAService QAService =new QandAService();
		Map<String,String> Msg = new HashMap<String, String>();
		
		String prodaction =request.getParameter("prodaction");
		request.setAttribute("Msg", Msg);
		if("insertQuestion".equals(prodaction)){
			QandAVO bean = new QandAVO();
			String temp= request.getParameter("Question_No");
			String tra_No=request.getParameter("tra_No");
			String Qestion_Title = request.getParameter("Qestion_Title");
			String Qestion_Text = request.getParameter("Qestion_Text");
			int Question_No = Integer.parseInt(temp);
			
			bean.setQuestion_No(Question_No);
			bean.setTra_No(tra_No);
			bean.setQuestion_Title(Qestion_Title);
			bean.setQuestion_Text(Qestion_Text);
			QAService.insertQuestion(bean);
		}
		if("insertAnswer".equals(prodaction)){
			
		}
		response.sendRedirect("/GSStravel/QandAServlet");
		return;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
