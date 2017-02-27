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
		
		String day = request.getParameter("day");
		int count = Integer.parseInt(day);

		String title = request.getParameter("title");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String delete = request.getParameter("delete");
		PrintWriter out = response.getWriter();
		List<AnnouncementVO> result = announcementService.select();
		
		SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		long beforeNow = (date.getTime() / 1000) - 60 * 60 * 24 * count;
		date.setTime(beforeNow * 1000);
		String beforeDate = formatYMD.format(date);
		
		List<AnnouncementVO> resultDelete = announcementService.select();
		resultDelete = announcementService.BeforeOff(resultDelete, beforeDate);
		if("刪除".equals(delete)){
			for(int i=0;i<resultDelete.size();i++){
				announcementService.delete(resultDelete.get(i).getAnno_Time());
			}
			response.sendRedirect(request.getContextPath() + "/BoardMaintain.jsp");
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
