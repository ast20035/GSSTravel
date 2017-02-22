package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AnnouncementService;
import model.AnnouncementVO;
import model.FineVO;

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
		
		// 1.接收資料
		// 2.驗證資料
		// 3.轉換資料
		// 4.呼叫Model
		// 5.根據Model執行結果，決定需要顯示的View元件
		
		String select = request.getParameter("select");
		if("查詢".equals(select)){
			PrintWriter out = response.getWriter();
			List<AnnouncementVO> result = announcementService.select();
			out.print(announcementService.to_Json(result));
			return;
		}
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		AnnouncementVO bean = new AnnouncementVO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
