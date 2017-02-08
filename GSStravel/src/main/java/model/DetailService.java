package model;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DetailService {
	public IDetailDAO detailDAO;
	public IEmployeeDAO employeeDAO;
	public IItemDAO itemDAO;
	public IFamilyDAO familyDAO;
	public ITravelDAO travelDAO;
	public ITotalAmountDAO totalAmountDAO;
	public int tra_count(long tra_No){   
		return (detailDAO=new DetailDAO()).tra_count(tra_No);
	}
	public Map<String,Integer> detail(long tra_No){	
		Map<String,Integer>mp=new HashMap<>();
		detailDAO=new DetailDAO();
		employeeDAO=new EmployeeDAO();
		List<String> detail_Emp_No = detailDAO.detail_Emp_No(tra_No);
		for(String emp_No:detail_Emp_No){
			int count = detailDAO.detail_Count(emp_No, tra_No)+1;
			String name = employeeDAO.selectEmp_Name(emp_No);
			mp.put(name, count);
		}
		return mp;
	}
	public List<String> detailName(long tra_No){
		List<String>result=new ArrayList<>();;
		detailDAO=new DetailDAO();
		employeeDAO=new EmployeeDAO();
		List<String> detail_Emp_No = detailDAO.detail_Emp_No(tra_No);
		for(String emp_No:detail_Emp_No){	
			String name = employeeDAO.selectEmp_Name(emp_No);
			result.add(name);
		}
		return result;
	}
	
	public boolean tra_Enter(String[] fams ,String emp_No,String tra_No ) throws NumberFormatException, SQLException{
		detailDAO=new DetailDAO();
		itemDAO=new ItemDAO();
		familyDAO=new FamilyDAO();
		travelDAO=new TravelDAO();
		float money = 0;
		String date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());//現在系統時間
		List<ItemVO> itemVO = itemDAO.getFee(Long.parseLong(tra_No));
		for(ItemVO a:itemVO){
			money+=a.getItem_Money();
		}	
		if(fams==null){		
			detailDAO.tra_Enter(Integer.parseInt(emp_No), null, tra_No, date,money);
			return false;
		}else{
			TravelVO vo = travelDAO.getAll(Long.parseLong(tra_No));
			int x = detailDAO.tra_count(Long.parseLong(tra_No));
			int total = vo.getTra_Total();
			int max = vo.getTra_Max();
			if((x+fams.length+1)<=total){
				if(fams.length+1<=max){
					detailDAO.tra_Enter(Integer.parseInt(emp_No), null, tra_No, date,money);
					for(String fam:fams){
						detailDAO.tra_Enter(Integer.parseInt(emp_No), familyDAO.selectfam_No(fam).toString(), tra_No, date,money);
					}
					return false;
				}else{
					return true;
				}				
			}else{
				return true;
			}			
		}
	}//false報名成功true報名失敗	
	
	public List<Float> drtail(String emp_No,String tra_No,String[] fams,String room[]) throws NumberFormatException, SQLException{
		employeeDAO=new EmployeeDAO();
		Integer emp_Sub = employeeDAO.selectEmp_Sub(emp_No);
		float payMoney = 0;
		float counts=0;
		float subMoney=0;
		float titleMoney=0;
		float friebdCounts=0;
		long hireMonths = 0;
		List<Float> drtail =new ArrayList<>();
		List<ItemVO> itemVO = itemDAO.getFareMoney(Long.parseLong(tra_No));
		for(ItemVO a:itemVO){
			payMoney+=a.getItem_Money();
		}
		if(room!=null){
			for(String x:room){
				payMoney+=Float.parseFloat(x);
			}
		}
		if(fams==null){
			counts=1;
		}else{
			counts=(fams.length)+1;			
				for(String fam:fams){
					familyDAO=new FamilyDAO();
					String fam_Rel=familyDAO.selectfam_Rel(emp_No, fam);					
					if("親友".equals(fam_Rel)){
						friebdCounts+=1;
					}
				}
			
		}
		
		if(emp_Sub==1){
			employeeDAO=new EmployeeDAO();
			java.sql.Date hireDate = employeeDAO.select(Integer.parseInt(emp_No)).getEmp_HireDate();			
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());//現在系統時間
			java.sql.Date today = java.sql.Date.valueOf(date);
			if(hireDate.getTime()/(24*60*60*1000)+365<today.getTime()/(24*60*60*1000)){
				subMoney=4500;
			}else{				
				long x = today.getTime()/(24*60*60*1000)-hireDate.getTime()/(24*60*60*1000);//相差天數
				
				hireMonths=x/31;
				subMoney=4500/12*hireMonths;			
			}			
		}else{
			employeeDAO=new EmployeeDAO();
			java.sql.Date hireDate = employeeDAO.select(Integer.parseInt(emp_No)).getEmp_HireDate();			
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());//現在系統時間
			java.sql.Date today = java.sql.Date.valueOf(date);
			if(hireDate.getTime()/(24*60*60*1000)+365<today.getTime()/(24*60*60*1000)){
				subMoney=4500;
			}else{				
				long x = today.getTime()/(24*60*60*1000)-hireDate.getTime()/(24*60*60*1000);//相差天數
				hireMonths=x/31;
				subMoney=4500/12*hireMonths;			
			}
			subMoney=0;
		}
		if((payMoney*(counts-friebdCounts))<=subMoney){
			titleMoney=0+(friebdCounts*payMoney);
		}else{
			titleMoney=(payMoney*(counts-friebdCounts))-subMoney+(friebdCounts*payMoney);
		}
		drtail.add(subMoney);
		drtail.add(payMoney);
		drtail.add(counts);	
		drtail.add(titleMoney);
		drtail.add((float)hireMonths);
		return drtail;
	}
	
	public boolean decide(String emp_No,float TA_money){
		totalAmountDAO=new TotalAmountDAO();
		TotalAmountVO totalAmountVO = totalAmountDAO.selectTa_money(emp_No);
		if(totalAmountVO.getTa_Money()!=0){
			if(TA_money<totalAmountVO.getTa_Money()){
				return false;
			}else{
				return true;
			}				
		}else{
			return true;
		}		
	}
	
	public void updateDet_CanDate(String emp_No,String tra_No){
		detailDAO=new DetailDAO();
		detailDAO.updateDet_CanDate(emp_No, tra_No);
	}
	//羅集
	public List<DetailBean> select(DetailBean bean){
		List<DetailBean> result = new ArrayList<>();
		detailDAO=new DetailDAO();
		if(bean!=null && bean.getTra_NO()!=null) {
			result = detailDAO.select(bean.getTra_NO());
		} else {
//			result = detailDAO.select(""); 
		}
		return result;
	}
	
	public String SELECT_Name(int Emp_No, String Name) {
		detailDAO=new DetailDAO();
		String result = detailDAO.select_emp_Name(Emp_No, Name);
		if(result == null) {
			result = detailDAO.select_fam_Name(Emp_No, Name);	
		}
		return result;
	}
	
	public DetailVO insert(DetailVO bean) {
		DetailVO result = null;
		if(bean!=null) {
			result = detailDAO.insert(bean);
		}
		return result;
	}
	
	public DetailVO insert_emp(DetailVO bean) {
		DetailVO result = null;
		if(bean!=null) {
			result = detailDAO.insert_emp(bean);
		}
		return result;
	}
	
	public List<DetailBean> update(DetailBean bean) {
		List<DetailBean> result = null;
		if(bean!=null) {
			result = detailDAO.update(bean.getDet_No(), bean.getTra_NO());
		}
		return result;
	}
	
	//雅婷
	public List<TotalAmountFormBean> select(String tra_No) {
		detailDAO=new DetailDAO();
		List<TotalAmountFormBean> list = detailDAO.selectBean(tra_No);
		return list;
	}
	public boolean update_empNo(String det_note , float det_noteMoney , String tra_No , int emp_No){
		detailDAO=new DetailDAO();
		boolean b = true;
		b=detailDAO.update_empNo(det_note, det_noteMoney, tra_No, emp_No);
		return b;
	}
	public boolean update_famNo(String det_note , float det_noteMoney , String tra_No , int fam_No){
		detailDAO=new DetailDAO();
		boolean b=true;
		b=detailDAO.update_famNo(det_note, det_noteMoney, tra_No, fam_No);
		return b;
	}
	
}