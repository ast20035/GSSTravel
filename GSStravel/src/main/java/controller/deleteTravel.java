package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AnnouncementService;
import model.deleteTravelService;

@WebServlet("/deleteTravel")
public class deleteTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private deleteTravelService deleteTravelService=new deleteTravelService();
	private AnnouncementService announcementService = new AnnouncementService();
	
    public deleteTravel() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tra_No = request.getParameter("tra_No");
		String tra_Name = request.getParameter("tra_Name");
		
		List<String> message = deleteTravelService.deleteTravel(tra_No);
		if(message.get(2).equals("deleteNo")){
			request.setAttribute("message", message);
			request.getRequestDispatcher("/deleteNo.jsp").forward(request, response);
			return;
		}
		if(message.get(2).equals("deleteOk")){
			
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// HH:24小時制
			Date date = new Date();
			String now = sdFormat.format(date);// 取得現在時間
			announcementService.insert(now, tra_Name+"行程已取消", "不好意思，因為某些緣故而取消行程，不便之處敬請見諒！", "1");// 新增公告
			
			request.setAttribute("message", message);
			request.getRequestDispatcher("/deleteOk.jsp").forward(request, response);
			return;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
