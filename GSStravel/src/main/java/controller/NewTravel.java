package controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewTravel")
public class NewTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewTravel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String tra_No = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).replaceAll("-", "");;
		request.setAttribute("tra_No",tra_No);
		request.getRequestDispatcher("/Travel_New.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
