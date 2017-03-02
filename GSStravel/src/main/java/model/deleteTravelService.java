package model;

import java.util.ArrayList;
import java.util.List;

public class deleteTravelService {
	IDetailDAO detailDAO=new DetailDAO();
	IItemDAO ItemDAO=new ItemDAO();
	ITravelDAO travelDAO=new TravelDAO();
	
	public List<String> deleteTravel(String tra_No){
		List<String> message=new ArrayList<>();
		
		TravelVO vo = travelDAO.getAll(Long.valueOf(tra_No));
		message.add(vo.getTra_Name());
		message.add(vo.getTra_NO());
		
		if(detailDAO.ckselect(tra_No)){
			//有報名紀錄不可以刪除
			message.add("deleteNo");
		}else{
			//做刪除		
			ItemDAO.deleteTravelItem(tra_No);
			travelDAO.deleteTravel(tra_No);
			message.add("deleteOk");
		}
		return message;
	}
}
