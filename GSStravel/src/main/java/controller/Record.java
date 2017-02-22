package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Recordservice;

@WebServlet("/Record")
public class Record extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Recordservice recordService=new Recordservice();
    public Record() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String emp_No = session.getAttribute("emp_No").toString();
		List<String[]> record = recordService.selectRecord(emp_No);
		int counts = 0;
		try{
			counts=record.size();
		}catch(Exception e){
			counts=0;
		}		
		request.setAttribute("counts",counts);
		request.setAttribute("record",record);
		request.getRequestDispatcher("/Record.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
