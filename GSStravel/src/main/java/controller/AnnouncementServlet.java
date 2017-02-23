package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AnnouncementService;
import model.AnnouncementVO;

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

		SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String n = formatYMD.format(date);
		Date nowDay = java.sql.Date.valueOf(n);
		
		Date boardDay = null;
		String time = null;
		for (int i = 0; i < result.size(); i++) {
			time = result.get(i).getAnno_Time();
			String b = result.get(i).getAnno_Time().substring(0, 10);
			boardDay = java.sql.Date.valueOf(b);
		}
		
		long day = (nowDay.getTime() - boardDay.getTime()) / (24 * 60 * 60 * 1000);
		if (day >= 31) {
			//announcementService.delete(time);
		}

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
