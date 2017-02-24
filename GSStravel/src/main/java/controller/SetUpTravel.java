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

@WebServlet("/SetUpTravel")
public class SetUpTravel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SetUpTravel() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String tra_No = request.getParameter("edittraNO");
		String tra_Name = request.getParameter("edittraName");
		String tra_Loc = request.getParameter("edittraLoc");
		String On = request.getParameter("edittraOn");
		String Off = request.getParameter("edittraOff");
		String Beg = request.getParameter("edittraBeg");
		String End = request.getParameter("edittraEnd");
		String Total = request.getParameter("edittraTotal");
		String Max = request.getParameter("edittraMax");
		String tra_Intr = request.getParameter("edittraIntr");
		String tra_Con = request.getParameter("edittraCon");
		String tra_Atter = request.getParameter("edittraAtter");
		String tra_File = request.getParameter("edittraFile");
		java.sql.Date tra_On;
		java.sql.Date tra_Off;
		java.sql.Timestamp tra_Beg;
		java.sql.Timestamp tra_End;
		int tra_Total;
		int tra_Max;

		String item1 = request.getParameter("item1");
		String item2 = request.getParameter("item2");

		List<String> error = new ArrayList<>();

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
			} catch (Exception e) {
				error.add("旅遊開始日格是錯誤!!格式:yyyy-MM-dd");
			}
		}
		if (Off.trim() == "" || Off == null) {
			error.add("旅遊結束日不能為空");
		} else {
			try {
				tra_Off = java.sql.Date.valueOf(Off);
			} catch (Exception e) {
				error.add("旅遊結束日格是錯誤!!格式:yyyy-MM-dd");
			}
		}
		if (Beg.trim() == "" || Beg == null) {
			error.add("旅遊登記日不能為空");
		} else {
			try {
				tra_Beg = java.sql.Timestamp.valueOf(Beg);
			} catch (Exception e) {
				error.add("旅遊登記日格是錯誤!!格式:yyyy-MM-dd HH:mm:ss");
			}
		}
		if (End.trim() == "" || End == null) {
			error.add("旅遊登記結束日不能為空");
		} else {
			try {
				tra_End = java.sql.Timestamp.valueOf(End);
			} catch (Exception e) {
				error.add("旅遊登記結束日格是錯誤!!格式:yyyy-MM-dd HH:mm:ss");
			}
		}
		if (Total.trim() == "" || Total == null) {
			error.add("活動總人數上限不能為空");
		} else {
			try {
				tra_Total = Integer.valueOf(Total);
				if (tra_Total < 0) {
					error.add("活動總人數上限必須是正整數!!");
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
				}
			} catch (Exception e) {
				error.add("本團人數上限必須是正整數!!");
			}
		}
//		if (tra_Intr.trim() == "" || tra_Intr == null) {
//			error.add("活動說明不能為空");
//		}
		if (tra_Con.trim() == "" || tra_Con == null) {
			error.add("活動內容不能為空");
		}
//		if (tra_Atter.trim() == "" || tra_Atter == null) {
//			error.add("注意事項不能為空");
//		}
//		if (tra_File.trim() == "" || tra_File == null) {
//			error.add("附件不能為空");
//		}
		if (item1.trim() == "" || item1 == null) {
			error.add("團費不能為空");
		}
		if (item2.trim() == "" || item2 == null) {
			error.add("保險費名稱不能為空");
		}

		if (error.size() != 0) {
			request.setAttribute("tra_No", tra_No);
			request.setAttribute("error", error);
			request.getRequestDispatcher("/Travel_New.jsp").forward(request, response);
		}

		// System.out.println(tra_No);
		// System.out.println(tra_Name);
		// System.out.println(tra_Loc);
		// System.out.println(tra_On);
		// System.out.println(tra_Off);
		// System.out.println(tra_Beg);
		// System.out.println(tra_End);
		// System.out.println(tra_Total);
		// System.out.println(tra_Max);
		// System.out.println(tra_Intr);
		// System.out.println(tra_Con);
		// System.out.println(tra_Atter);
		// System.out.println(tra_File);
		// System.out.println(item1);
		// System.out.println(item2);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
