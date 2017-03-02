package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.deleteTravelService;

@WebServlet("/deleteTravel")
public class deleteTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private deleteTravelService deleteTravelService=new deleteTravelService();
    public deleteTravel() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tra_No = request.getParameter("tra_No");
		List<String> message = deleteTravelService.deleteTravel(tra_No);
		if(message.get(2).equals("deleteNo")){
			request.setAttribute("message", message);
			request.getRequestDispatcher("/deleteNo.jsp").forward(request, response);
			return;
		}
		if(message.get(2).equals("deleteOk")){
			request.setAttribute("message", message);
			request.getRequestDispatcher("/deleteOk.jsp").forward(request, response);
			return;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
