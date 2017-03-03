package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TravelService;

@WebServlet("/CancelFile")
public class CancelFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TravelService travelService=new TravelService();
    public CancelFile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tra_No = request.getParameter("tra_No");
		String tra_Name = request.getParameter("tra_Name");
		travelService.updateraFile("無", tra_No);
		request.setAttribute("tra_No", tra_No);
		request.setAttribute("tra_Name", tra_Name);
		response.sendRedirect(request.getContextPath() + "/SetUpTravel.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
