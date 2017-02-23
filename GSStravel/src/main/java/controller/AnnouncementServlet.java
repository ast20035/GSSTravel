package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AnnouncementService;
import model.AnnouncementVO;
import model.FineVO;
import model.TravelService;
import model.TravelVO;

@WebServlet("/AnnouncementServlet")
public class AnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnnouncementService announcementService = new AnnouncementService();

	public AnnouncementServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String title = request.getParameter("title");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		PrintWriter out = response.getWriter();
		List<AnnouncementVO> result = announcementService.select();
		if (title == null && startDay == null && endDay == null) {
			out.print(announcementService.to_Json(result));
			return;
		}
		if (title != null) {
			result = announcementService.get_by_title(title);
		}
		if (startDay != null && startDay != "") {
			result = announcementService.AfterOn(result, startDay);
		}
		if (endDay != null && endDay != "") {
			result = announcementService.BeforeOff(result, endDay);
		}
		out.print(announcementService.to_Json(result));
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
