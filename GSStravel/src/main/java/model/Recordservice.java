package model;

import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

public class Recordservice {

	public List<String[]> selectRecord(String emp_No) {
		FineService fineService = new FineService();
		ItemDAO itemDAO = new ItemDAO();
		DetailDAO detailDAO = new DetailDAO();
		List<DetailVO> detailVOs = detailDAO.selectALL(emp_No);
		List<String[]> Record = new ArrayList<>();
		for (DetailVO vo : detailVOs) {
			TravelDAO travelDAO = new TravelDAO();
			TotalAmountDAO totalAmountDAO = new TotalAmountDAO();
			String tra_No = vo.getTra_No();
			String tra_Name = travelDAO.getAll(Long.parseLong(vo.getTra_No())).getTra_Name();
			String tra_On = travelDAO.getAll(Long.parseLong(vo.getTra_No())).getTra_On().toString();
			String tra_Off = travelDAO.getAll(Long.parseLong(vo.getTra_No())).getTra_Off().toString();
			String det_Date = vo.getDet_Date().toString();
			String det_CanDate;
			String end = null;
			String cancel = null;
			String signUp = null;
			String Ta_Money = null;
			if (vo.getDet_CanDate() == null) {
				det_CanDate = "無";
				String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());// 現在系統時間
				int b = java.sql.Date.valueOf(tra_Off).compareTo(java.sql.Date.valueOf(date));
				if (b == 1) {
					signUp = "報名中";
				} else if (b == -1) {
					end = "已結束";
				}
				Ta_Money = "NT$" + Math.round(totalAmountDAO.select(emp_No, vo.getTra_No()).getTa_Money());
			} else {
				det_CanDate = vo.getDet_CanDate().toString();
				cancel = "已取消";
//				System.out.println("tra_No:"+tra_No);
//				System.out.println("tra_On:"+travelDAO.getAll(Long.parseLong(vo.getTra_No())).getTra_On());
				long day = (travelDAO.getAll(Long.parseLong(vo.getTra_No())).getTra_On().getTime()
						- vo.getDet_CanDate().getTime()) / 1000 / 60 / 60 / 24;
				List<ItemVO> money = itemDAO.selectOne(tra_No);
				for (int i = 0; i < fineService.select().size(); i++) {
					int fineDate = fineService.select().get(i).getFine_Dates();
//					System.out.println("fineDate:"+fineDate);
//					System.out.println("day:"+day);
					if (day == 0) {
						Ta_Money = "罰NT$" + Math.round(money.get(0).getItem_Money());
//						System.out.println("Ta_Money==0:"+Ta_Money);
						break;
					} else if (fineDate <= day) {
						float finePer = fineService.selectPercent(fineDate);
						Ta_Money = "罰NT$" + Math.round(money.get(0).getItem_Money() * finePer / 100);
//						System.out.println("finePer!=0:"+finePer);
//						System.out.println("Ta_Money!=0:"+Ta_Money);
						break;
					}
				}
//				System.out.println();
			}
			if (cancel == null) {
				if (signUp == null) {
					String[] record = { tra_No, tra_Name, tra_On, tra_Off, det_Date, det_CanDate, end, Ta_Money };
					Record.add(record);
				} else {
					String[] record = { tra_No, tra_Name, tra_On, tra_Off, det_Date, det_CanDate, signUp, Ta_Money };
					Record.add(record);
				}
			} else {
				String[] record = { tra_No, tra_Name, tra_On, tra_Off, det_Date, det_CanDate, cancel, Ta_Money };
				Record.add(record);
			}
		}
		return Record;
	}
}
