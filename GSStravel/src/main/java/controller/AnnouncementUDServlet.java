package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AnnouncementService;
import model.AnnouncementVO;
import model.FineVO;

@WebServlet("/AnnouncementUDServlet")
public class AnnouncementUDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnnouncementService announcementService = new AnnouncementService();
	String time;
//	String b;

	public AnnouncementUDServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		String save = request.getParameter("save");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		HttpSession session = request.getSession();
		time = request.getParameter("anno_Time");

		if (session.getAttribute("time") == null) {
			session.setAttribute("time", time);
		}
		if (time != null) {
			session.removeAttribute("time");
			session.setAttribute("time", time);
		}
		
		PrintWriter out = response.getWriter();

		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = new Date();
		String now = sdFormat.format(date);

		time = session.getAttribute("time").toString();

		if ("儲存".equals(save)) {
			announcementService.insert(now, title, content);
			response.sendRedirect(request.getContextPath() + "/BoardMaintain.jsp");
		} else if ("更新".equals(update)) {
			time = session.getAttribute("time").toString();
			announcementService.update(now, title, content, time);
			response.sendRedirect(request.getContextPath() + "/BoardMaintain.jsp");
		} else if ("刪除".equals(delete)) {
			time = session.getAttribute("time").toString();
			announcementService.delete(time);
			response.sendRedirect(request.getContextPath() + "/BoardMaintain.jsp");
		} else {
			List<AnnouncementVO> result = announcementService.get_by_time(time);
			out.print(announcementService.to_Json(result));
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
