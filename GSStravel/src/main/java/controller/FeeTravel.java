package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemService;
import model.ItemVO;
import model.TravelService;
import model.TravelVO;

@WebServlet("/FeeTravel")
public class FeeTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemService itemService = new ItemService();
	private TravelService travelService = new TravelService();

	public FeeTravel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ItemVO> itemResult;
		TravelVO traveResult;
		try {
			long tra_NO = Long.parseLong(request.getParameter("tra_No"));// 旅遊編號
			itemResult = itemService.select(tra_NO);
			traveResult = travelService.select(tra_NO);
			String tra_File = traveResult.getTra_File();
			if(tra_File!=null){
				StringBuffer sb = new StringBuffer(tra_File);
				int pos = tra_File.lastIndexOf(".") + 1;
				try {
					for (int i = 0; i < 4; i++) {
						sb.deleteCharAt(pos);
					}
					tra_File=sb.toString();
					int lengths=tra_File.length();
					tra_File=tra_File.substring(0, lengths-1);
				} catch (Exception e) {
					tra_File=sb.toString();
					int lengths=tra_File.length();
					if(lengths>0){
					tra_File=tra_File.substring(0, lengths-1);		
					}
				}
			}
		
			HttpSession session = request.getSession();
			session.setAttribute("itemResult", itemResult);
			session.setAttribute("traveResult", traveResult);
			session.setAttribute("tra_File", tra_File);
			request.getRequestDispatcher("/Travel_No.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
