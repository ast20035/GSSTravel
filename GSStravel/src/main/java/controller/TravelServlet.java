package controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import model.AnnouncementService;
import model.IItemDAO;
import model.ItemDAO;
import model.ItemService;
import model.ItemVO;
import model.TravelService;
import model.TravelVO;

@WebServlet(urlPatterns = { ("/Travel_Edit") })

public class TravelServlet extends HttpServlet {

	private TravelService travelService = new TravelService();
	private ItemService itemService = new ItemService();
	private AnnouncementService announcementService = new AnnouncementService();

	/* 初始化 */

	private SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat sDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/* 初始化END */
	
	//get取值
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		
		String traNo = request.getParameter("tra_no"); 
		TravelVO travelview = travelService.select(traNo);
		List<ItemVO> itemview = itemService.select(traNo); 
		request.setAttribute("params", travelview);
		request.setAttribute("paramsi", itemview);
		request.getRequestDispatcher("/Travel_Edit.jsp").forward(request,response);
	}
	
	//post送值
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/htm; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// 1.接收資料
		String inputdate = "";
		if (request.getParameter("inputdate") != "" && request.getParameter("inputdate") != null)
			inputdate = request.getParameter("inputdate");

		String traNoNew = request.getParameter("edittraNO");// 正式用
		String traNo = request.getParameter("tra_no"); // 單頁更新測試用
		String traName = request.getParameter("edittraName");
		String traLoc = request.getParameter("edittraLoc");
		String traOn = request.getParameter("edittraOn");
		String traOff = request.getParameter("edittraOff");
		String traBeg = request.getParameter("edittraBeg");
		String traEnd = request.getParameter("edittraEnd");
		String traTotal = request.getParameter("edittraTotal");
		String traMax = request.getParameter("edittraMax");
		String traIntr = request.getParameter("edittraIntr");
		String traCon = request.getParameter("edittraCon");
		String traAtter = request.getParameter("edittraAtter");
		String traFile = request.getParameter("edittraFile");

		String[] itemNo = request.getParameterValues("edititemNo");
		String[] itemName = request.getParameterValues("edititemName");
		String[] itemMoney = request.getParameterValues("edititemMoney");
		String inputerrors = request.getParameter("inputerrors");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);

		// 3.轉換資料

		
		// 單筆測試用

		String edittraNO = "";
		if (traNoNew != null && traNoNew.length() != 0) {
			try {
				edittraNO = traNoNew;
			} catch (Exception e) {
				e.printStackTrace();
				errors.put("edittraNO", "活動代碼必須輸入");
			}
		}

		/* 活動地點 */ // 測試用

		String edittraLoc = "";
		if (traLoc != null && traLoc.length() != 0) {
			try {
				edittraLoc = traLoc;
			} catch (Exception e) {
				e.printStackTrace();
				errors.put("edittraLoc", "活動名稱必須輸入");
			}

		}
		/* 活動名稱 */ // 測試用

		String edittraName = "";
		if (traName != null && traName.length() != 0) {
			try {
				edittraName = traName;
			} catch (Exception e) {
				e.printStackTrace();
				errors.put("edittraName", "活動名稱必須輸入");
			}

		}
		// System.out.println(edittraName+","+request.getParameter("edittraName"));

		/* 活動起始日 */

		java.util.Date edittraOn = null;
		if (traOn != null && traOn.length() != 0) {
			try {
				edittraOn = sDate.parse(traOn);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("edittraOn", "活動起始日必須是符合yyyy-Mm-dd格式的日期");
			}
		}

		/*---活動結束日---*/

		java.util.Date edittraOff = null;
		if (traOff != null && traOff.length() != 0) {
			try {
				edittraOff = sDate.parse(traOff);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("edittraOff", "活動結束日必須是符合yyyy-Mm-dd格式的日期");
			}
		}

		/*---活動報名登記日---*/
		java.util.Date edittraBeg = null;
		if (traBeg != null && traBeg.length() != 0) {
			try {
				edittraBeg = sDateTime.parse(traBeg);
				// edittraBeg = Timestamp.valueOf(traBeg.replace("T"," "));
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("edittraBeg", "活動報名登記日必須是符合yyyy-Mm-dd HH:mm:ss格式的日期");
			}
		}

		/*---活動報名結束日---*/

		// java.sql.Timestamp edittraEnd = null;
		java.util.Date edittraEnd = null;
		if (traEnd != null && traEnd.length() != 0) {
			try {
				edittraEnd = sDateTime.parse(traEnd);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("edittraEnd", "活動報名結束日必須是符合yyyy-Mm-dd HH:mm:ss格式的日期");
			}
		}

		/*---活動總人數---*/

		int edittraTotal = 0;
		if (traTotal != null && traTotal.length() != 0) {
			try {
				edittraTotal = Integer.parseInt(traTotal);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("edittraTotal", "活動總人數必須是整數");
			}
		}

		/*---活動報名上限人數---*/

		int edittraMax = 0;
		if (traMax != null && traMax.length() != 0) {
			try {
				edittraMax = Integer.parseInt(traMax);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("edittraMax", "活動報名上限人數必須是整數");
			}
		}

		/*---活動說明---*/

		String edittraIntr = "0";
		if (traIntr != null && traIntr.length() != 0) {
			try {
				edittraIntr = traIntr;
			} catch (NumberFormatException e) {
				// e.printStackTrace();
				// errors.put("edittraIntr", "活動說明必須輸入");
			}
		}

		/*---活動內容---*/

		String edittraCon = "0";
		if (traCon != null && traCon.length() != 0) {
			try {
				edittraCon = traCon;
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("edittraCon", "活動內容必須是輸入");
			}
		}

		/*---活動注意事項---*/

		String edittraAtter = "";
		if (traAtter != null && traAtter.length() != 0) {
			try {
				edittraAtter = traAtter;
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("edittraAtter", "活動注意事項必須是輸入");
			}
		}

		/*---費用項目代碼---*/ // 測試用
		List<Integer> edititemNo = new ArrayList<Integer>();
		if (itemNo != null && itemNo.length != 0) {
			for (int i = 0; i < itemNo.length; i++) {
				try {
					edititemNo.add(Integer.parseInt(itemNo[i]));
				} catch (NumberFormatException e) {
					e.printStackTrace();
					errors.put("edititemName", "費用項目必須是輸入");
				}
			}
		}

		/*---費用項目---*/

		List<String> edititemName = new ArrayList<String>();
		if (itemName != null && itemName.length != 0) {
			for (int i = 0; i < itemName.length; i++) {

				try {
					// System.out.println("123");
					edititemName.add(itemName[i]);
				} catch (NumberFormatException e) {
					e.printStackTrace();
					errors.put("edititemName", "費用項目必須是輸入");
				}
			}
		}
		/*---費用金錢---*/

		List<Float> edititemMoney = new ArrayList<Float>();
		if (itemMoney != null && itemMoney.length != 0) {
			for (int i = 0; i < itemMoney.length; i++) {
				try {
					edititemMoney.add(Float.parseFloat(itemMoney[i]));
				} catch (NumberFormatException e) {
					e.printStackTrace();
					errors.put("edititemMoney", "xxxxxx");
				}
			}
		}

		/* 回報錯誤 */
		if (errors != null && !errors.isEmpty()) {
			request.getRequestDispatcher("Travel_Edit.jsp").forward(request, response);
			return;
			
			
		}
		// 4.呼叫Model

		/*---單頁測試用---*/
		TravelVO travelview = travelService.select(traNo);
		// System.out.println("travelService位置 : "+travelview);
		List<ItemVO> itemview = itemService.select(traNo); // list
		// System.out.println("itemService位置 : "+itemview);
		request.setAttribute("params", travelview);
		request.setAttribute("paramsi", itemview);
		

		// 5.根據Model執行結果，決定需要顯示的View元件


		/*----Update----*/
		
		if ("儲存".equals(inputerrors)) {	//Travel_Edit修改確認
			
			
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// HH:24小時制
			Date date = new Date();
			String now = sdFormat.format(date);// 取得現在時間
			announcementService.insert(now, traName + "行程異動", traCon, "1");// 新增公告

			/*--Travel--*/
			travelview.setTra_Name(edittraName);
			travelview.setTra_Loc(edittraLoc);
			travelview.setTra_On(new java.sql.Date(edittraOn.getTime()));
			travelview.setTra_Off(new java.sql.Date(edittraOff.getTime()));
			travelview.setTra_Beg(new java.sql.Timestamp(edittraBeg.getTime()));
			travelview.setTra_End(new java.sql.Timestamp(edittraEnd.getTime()));
			travelview.setTra_Total(edittraTotal);
			travelview.setTra_Max(edittraMax);
			travelview.setTra_Intr(traIntr);
			travelview.setTra_Con(traCon);
			travelview.setTra_Atter(traAtter);
			travelview.setTra_File(traFile);

			/*--item--*/
			List<ItemVO> itemfor = new ArrayList<ItemVO>();
			ItemVO v = new ItemVO();
			v.setTra_No(traNo);
			IItemDAO itemDAO = new ItemDAO();
			List<ItemVO> itemVOs = itemDAO.select(traNo);
			int x = 2;
			for (ItemVO itemVO : itemVOs) {
				if (itemVO.getItem_No() == 1) {
					ItemVO Vo = new ItemVO();
					Vo.setItem_Name(itemName[0]);
					Vo.setItem_Money(Float.parseFloat(itemMoney[0]));
					Vo.setTra_No(traNo);
					Vo.setItem_No(1);
					itemDAO.update(Vo);
				}
				if (itemVO.getItem_No() == 2) {
					ItemVO Vo = new ItemVO();
					Vo.setItem_Name(itemName[1]);
					Vo.setItem_Money(Float.parseFloat(itemMoney[1]));
					Vo.setTra_No(traNo);
					Vo.setItem_No(2);
					itemDAO.update(Vo);
				}
				if (itemVO.getItem_No() != 1 && itemVO.getItem_No() != 2) {
					itemDAO.delete(itemVO.getItem_No(), traNo);
				}
			}
			for (int y = x; y < itemName.length; y++) {
				ItemVO Vo = new ItemVO();
				Vo.setItem_Name(itemName[y]);
				Vo.setItem_Money(Float.parseFloat(itemMoney[y]));
				Vo.setTra_No(traNo);
				Vo.setItem_No(y + 1);
				itemDAO.insert(Vo);
			}


			TravelVO resultEdit = travelService.update(travelview);


			if (resultEdit == null) { 
				errors.put("action", "Update fail");
			} else {
				session.setAttribute("update", resultEdit);
			}
			
			String file = request.getParameter("file");
		
			if("".equals(file) || file == ""){
				response.sendRedirect(request.getContextPath()+"/search2.jsp");
				 //request.getRequestDispatcher("/Travel_Edit.jsp").forward(request,response);
				 return;
			}else{
				String tra_No = request.getParameter("tra_no");
				String tra_Name = request.getParameter("edittraName");		

				HttpSession son = request.getSession();
				son.setAttribute("tra_No", tra_No);
				son.setAttribute("tra_Name", tra_Name);		
				request.getRequestDispatcher("/fileupload_control2.jsp").forward(request, response);
				return;
			}
		}
		request.getRequestDispatcher("/search2.jsp").forward(request, response);
		 return;
		// response.sendRedirect(request.getContextPath() + "/Travel_Edit.jsp");
	}// doPost


}// END