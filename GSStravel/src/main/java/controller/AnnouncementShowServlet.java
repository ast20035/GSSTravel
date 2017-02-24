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

@WebServlet("/AnnouncementShowServlet")
public class AnnouncementShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnnouncementService announcementService = new AnnouncementService();

	public AnnouncementShowServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		long beforeNow = (date.getTime() / 1000) - 60 * 60 * 24 * 31;
		date.setTime(beforeNow * 1000);
		String beforeDate = formatYMD.format(date);
		
		PrintWriter out = response.getWriter();
		List<AnnouncementVO> result = announcementService.select();
		result = announcementService.AfterOn(result, beforeDate);
		out.print(announcementService.to_Json(result));
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
