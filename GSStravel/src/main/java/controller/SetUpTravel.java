package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AnnouncementService;
import model.ItemService;
import model.ItemVO;
import model.TravelService;
import model.TravelVO;

@WebServlet("/SetUpTravel")
public class SetUpTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TravelService travelService = new TravelService();
	private ItemService itemService = new ItemService();
	private AnnouncementService announcementService = new AnnouncementService();

	public SetUpTravel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String tra_File = request.getParameter("file");
		String tra_No = request.getParameter("edittraNO");
		String tra_Name = new String(request.getParameter("edittraName").getBytes("iso-8859-1"), "utf-8");
		String tra_Loc = new String(request.getParameter("edittraLoc").getBytes("iso-8859-1"), "utf-8");
		String On = request.getParameter("edittraOn");
		String Off = request.getParameter("edittraOff");
		String Beg = request.getParameter("edittraBeg");
		String End = request.getParameter("edittraEnd");
		String Total = request.getParameter("edittraTotal");
		String Max = request.getParameter("edittraMax");
		String tra_Intr = new String(request.getParameter("edittraIntr").getBytes("iso-8859-1"), "utf-8");
		String tra_Con = new String(request.getParameter("edittraCon").getBytes("iso-8859-1"), "utf-8");
		String tra_Atter = new String(request.getParameter("edittraAtter").getBytes("iso-8859-1"), "utf-8");
		String[] rooms = request.getParameterValues("edititemName");
		String[] roomsMoney = request.getParameterValues("edititemMoney");

		java.sql.Date tra_On = null;
		java.sql.Date tra_Off = null;
		java.sql.Timestamp tra_Beg = null;
		java.sql.Timestamp tra_End = null;
		int tra_Total = 0;
		int tra_Max = 0;

		int ckTra_On = 0;
		int ckTra_Off = 0;
		int ckTra_On_Off = 0;
		int ckTra_Beg = 0;
		int ckTra_End = 0;
		int ckTra_Beg_End = 0;
		java.sql.Timestamp today = java.sql.Timestamp
				.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		int ckTra_Total = 0;
		int ckTra_Max = 0;

		float Money1 = 0;// 團費
		float Money2 = 0;// 保險費
		String item1 = request.getParameter("item1");
		String item2 = request.getParameter("item2");
		int ckItem1 = 0;
		int ckItem2 = 0;
		int ckRoom = 0;
		List<String> error = new ArrayList<>();

		if (tra_File.equals("")) {
			tra_File = "無";
		}

		if (tra_Name.trim() == "" || tra_Name == null) {
			error.add("旅遊名稱不能為空");
		}
		if (tra_Loc.trim() == "" || tra_Loc == null) {
			error.add("旅遊地點不能為空");
		}
		if (On.trim() == "" || On == null) {
			error.add("旅遊開始日不能為空");
		} else {
			try {
				tra_On = java.sql.Date.valueOf(On);
				if (today.after(tra_On)) {
					error.add("旅遊開始日不正確!!旅遊開始日設定成過去");
				} else {
					ckTra_On = 1;
				}
			} catch (Exception e) {
				error.add("旅遊開始日格式錯誤!!格式:yyyy-MM-dd");
			}
		}
		if (Off.trim() == "" || Off == null) {
			error.add("旅遊結束日不能為空");
		} else {
			try {
				tra_Off = java.sql.Date.valueOf(Off);
				ckTra_Off = 1;
			} catch (Exception e) {
				error.add("旅遊結束日格式錯誤!!格式:yyyy-MM-dd");
			}
		}

		if (ckTra_On == 1 && ckTra_Off == 1) {
			if (tra_On.after(tra_Off)) {
				error.add("旅遊時間不正確!!旅遊開始日比旅遊結束日還要晚");
			} else {
				ckTra_On_Off = 1;
			}
		}

		if (Beg.trim() == "" || Beg == null) {
			error.add("旅遊登記日不能為空");
		} else {
			try {
				tra_Beg = java.sql.Timestamp.valueOf(Beg);
				if (today.after(tra_Beg)) {
					error.add("旅遊登記日不正確!!旅遊登記日設定成過去");
				} else {
					ckTra_Beg = 1;
				}
			} catch (Exception e) {
				error.add("旅遊登記日格式錯誤!!格式:yyyy-MM-dd HH:mm:ss");
			}
		}
		if (End.trim() == "" || End == null) {
			error.add("旅遊登記結束日不能為空");
		} else {
			try {
				tra_End = java.sql.Timestamp.valueOf(End);
				ckTra_End = 1;
			} catch (Exception e) {
				error.add("旅遊登記結束日格是錯誤!!格式:yyyy-MM-dd HH:mm:ss");
			}
		}
		if (ckTra_Beg == 1 && ckTra_End == 1) {
			if (tra_Beg.after(tra_End)) {
				error.add("旅遊登記時間不正確!!旅遊登記開始日比旅遊登記結束日還要晚");
			} else {
				ckTra_Beg_End = 1;
			}
		}

		if (ckTra_On_Off == 1 && ckTra_Beg_End == 1) {
			if (tra_Beg.after(tra_On)) {
				error.add("旅遊時間不正確!!旅遊登記開始日比旅遊開始日還要晚");
			}
		}

		if (Total.trim() == "" || Total == null) {
			error.add("活動總人數上限不能為空");
		} else {
			try {
				tra_Total = Integer.valueOf(Total);
				if (tra_Total < 0) {
					error.add("活動總人數上限必須是正整數!!");
				} else {
					ckTra_Total = 1;
				}
			} catch (Exception e) {
				error.add("活動總人數上限必須是正整數!!");
			}
		}
		if (Max.trim() == "" || Max == null) {
			error.add("本團人數上限不能為空");
		} else {
			try {
				tra_Max = Integer.valueOf(Max);
				if (tra_Max < 0) {
					error.add("本團人數上限必須是正整數!!");
				} else {
					ckTra_Max = 1;
				}
			} catch (Exception e) {
				error.add("本團人數上限必須是正整數!!");
			}
		}
		if (ckTra_Total == 1 && ckTra_Max == 1) {
			if (tra_Total < tra_Max) {
				error.add("活動總人數上限必須大於本團人數上限");
			}
		}

		if (tra_Intr.trim() == "" || tra_Intr == null) {
			tra_Intr = "無";
		}
		if (tra_Con.trim() == "" || tra_Con == null) {
			error.add("活動內容不能為空");
		}
		if (tra_Atter.trim() == "" || tra_Atter == null) {
			tra_Atter = "無";
		}
		// if (tra_File.trim() == "" || tra_File == null) {
		// tra_File = "無";
		// }
		if (item1.trim() == "" || item1 == null) {
			error.add("團費不能為空");
		} else {
			try {
				Money1 = Float.valueOf(item1);
				if (Money1 < 0) {
					error.add("團費必須是正數");
				} else {
					ckItem1 = 1;
				}
			} catch (Exception e) {
				error.add("團費必須是正數");
			}
		}
		if (item2.trim() == "" || item2 == null) {
			error.add("保險費名稱不能為空");
		} else {
			try {
				Money2 = Float.valueOf(item2);
				if (Money2 < 0) {
					error.add("保險費必須是正數");
				} else {
					ckItem2 = 1;
				}
			} catch (Exception e) {
				error.add("保險費必須是正數");
			}
		}

		// 如果有房間費用
		if (rooms != null && roomsMoney != null) {
			float Money;
			for (int i = 0; i < rooms.length; i++) {
				if (rooms[i] == "" || roomsMoney[i] == "") {
					error.add("房型跟費用資料不齊全");
				} else {
					try {
						Money = Float.valueOf(roomsMoney[i]);
						if (Money < 0) {
							error.add("房間費用必須是正數");
						} else {
							ckRoom = 1;
						}
					} catch (Exception e) {
						error.add("房間費用必須是正數");
					}
				}
			}
		}

		if (error.size() != 0) {
			request.setAttribute("tra_No", tra_No);
			request.setAttribute("error", error);
			request.getRequestDispatcher("/Travel_New.jsp").forward(request, response);
			return;
		}

		TravelVO travelVO = new TravelVO();
		travelVO.setTra_NO(tra_No);
		travelVO.setTra_Name(tra_Name);
		travelVO.setTra_Loc(tra_Loc);
		travelVO.setTra_On(tra_On);
		travelVO.setTra_Off(tra_Off);
		travelVO.setTra_Beg(tra_Beg);
		travelVO.setTra_End(tra_End);
		travelVO.setTra_Total(tra_Total);
		travelVO.setTra_Max(tra_Max);
		travelVO.setTra_Intr(tra_Intr);
		travelVO.setTra_Con(tra_Con);
		travelVO.setTra_Atter(tra_Atter);
		travelVO.setTra_File(tra_File);

		travelService.insert(travelVO);

		if (ckItem1 == 1) {
			ItemVO itemlVO = new ItemVO();
			itemlVO.setItem_Name("團費");
			itemlVO.setItem_Money(Money1);
			itemlVO.setItem_No(1);
			itemlVO.setTra_No(tra_No);
			itemService.insert(itemlVO);
		}
		if (ckItem2 == 1) {
			ItemVO itemlVO = new ItemVO();
			itemlVO.setItem_Name("保險費");
			itemlVO.setItem_Money(Money2);
			itemlVO.setItem_No(2);
			itemlVO.setTra_No(tra_No);
			itemService.insert(itemlVO);
		}
		if (ckRoom == 1) {
			int item_No = 3;
			for (int i = 0; i < rooms.length; i++) {
				ItemVO itemlVO = new ItemVO();
				itemlVO.setItem_Name(rooms[i]);
				itemlVO.setItem_Money(Float.parseFloat(roomsMoney[i]));
				itemlVO.setItem_No(item_No);
				itemlVO.setTra_No(tra_No);
				itemService.insert(itemlVO);
				item_No++;
			}
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("tra_No", tra_No);
		session.setAttribute("tra_Name", tra_Name);

		// 新增公告
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// HH:24小時制
		Date date = new Date();
		String now = sdFormat.format(date);// 取得現在時間
		announcementService.insert(now, "新增" + tra_Name + "行程", tra_Con, "2");
		request.getRequestDispatcher("/ckFile.jsp").forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
