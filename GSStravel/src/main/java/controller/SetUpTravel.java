package controller;

import java.io.IOException;
import java.util.ArrayList;
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
		String[] rooms = request.getParameterValues("edititemName");
		String[] roomsMoney = request.getParameterValues("edititemMoney");
		java.sql.Date tra_On = null;
		java.sql.Date tra_Off = null;
		java.sql.Timestamp tra_Beg = null;
		java.sql.Timestamp tra_End = null;
		int tra_Total;
		int tra_Max;
		
		int ckTra_On=0;
		int ckTra_Off=0;
		int ckTra_Beg=0;
		int ckTra_End=0;
		
		float Money1;//團費
		float Money2;//保險費
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
				ckTra_On=1;
			} catch (Exception e) {
				error.add("旅遊開始日格式錯誤!!格式:yyyy-MM-dd");
			}
		}
		if (Off.trim() == "" || Off == null) {
			error.add("旅遊結束日不能為空");
		} else {
			try {
				tra_Off = java.sql.Date.valueOf(Off);
				ckTra_Off=1;
			} catch (Exception e) {
				error.add("旅遊結束日格式錯誤!!格式:yyyy-MM-dd");
			}
		}
		
		if(ckTra_On==1 && ckTra_Off==1){
			if(tra_On.after(tra_Off)){
				error.add("旅遊時間不正確!!旅遊開始日比旅遊結束日還要晚");
			}
		}
		
		if (Beg.trim() == "" || Beg == null) {
			error.add("旅遊登記日不能為空");
		} else {
			try {
				tra_Beg = java.sql.Timestamp.valueOf(Beg);
				ckTra_Beg=1;
			} catch (Exception e) {
				error.add("旅遊登記日格式錯誤!!格式:yyyy-MM-dd HH:mm:ss");
			}
		}
		if (End.trim() == "" || End == null) {
			error.add("旅遊登記結束日不能為空");
		} else {
			try {
				tra_End = java.sql.Timestamp.valueOf(End);
				ckTra_End=1;
			} catch (Exception e) {
				error.add("旅遊登記結束日格是錯誤!!格式:yyyy-MM-dd HH:mm:ss");
			}
		}
		if(ckTra_Beg==1 && ckTra_End==1){
			if(tra_Beg.after(tra_End)){
				error.add("旅遊登記時間不正確!!旅遊登記開始日比旅遊登記結束日還要晚");
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
		if (tra_Intr.trim() == "" || tra_Intr == null) {
			tra_Intr="無";
		}
		if (tra_Con.trim() == "" || tra_Con == null) {
			error.add("活動內容不能為空");
		}
		if (tra_Atter.trim() == "" || tra_Atter == null) {
			tra_Atter="無";
		}
		if (tra_File.trim() == "" || tra_File == null) {
			tra_File="無";
		}
		if (item1.trim() == "" || item1 == null) {
			error.add("團費不能為空");
		}else{
			try{
				Money1=Float.valueOf(item1);
				if(Money1<0){
					error.add("團費必須是正數");
				}
			}catch(Exception e){
				error.add("團費必須是正數");
			}
		}
		if (item2.trim() == "" || item2 == null) {
			error.add("保險費名稱不能為空");
		}else{
			try{
				Money2=Float.valueOf(item2);
				if(Money2<0){
					error.add("保險費必須是正數");
				}
			}catch(Exception e){
				error.add("保險費必須是正數");
			}
		}
				
		//如果有房間費用
		if(rooms!=null && roomsMoney!=null){
			float Money;		
			for(int i=0;i<rooms.length;i++){
				if(rooms[i]=="" || roomsMoney[i]==""){
					error.add("房型跟費用資料不齊全");
				}else{
					try{
						Money=Float.valueOf(roomsMoney[i]);
						if(Money<0){
							error.add("房間費用必須是正數");
						}
					}catch(Exception e){
						error.add("房間費用必須是正數");
					}
				}
			}			
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
//		for(String a :rooms){
//			System.out.println(a);
//		}
//		for(String a :roomsMoney){
//			System.out.println(a);
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
