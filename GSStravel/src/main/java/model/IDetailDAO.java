package model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

public interface IDetailDAO {
	public Map<String, Integer> tra_count();//抓取所有旅遊目前報名人數
	public int tra_count(long tra_No);//抓取單一旅遊目前報名人數
	public LinkedHashSet<String> detail_Emp_No(long tra_No);//現在已經報名的員工編號
	public int detail_Count(String emp_No,long tra_No);//報名人員攜帶人數	
	public void tra_Enter(int emp_No,String fam_No,String tra_No ,String det_Date, float det_money);//報名
	public int detail_Enter(String emp_No,String tra_No);//查詢是否報名過
	public void updateDet_CanDate(String emp_No,String tra_No);//登記取消時間	
	public abstract List<DetailBean> select(String tra_No, int firstPage, int lastPage);//SELECT報名維護所有欄位
	public abstract List<DetailBean> selectCan(String tra_No, int firstPage, int lastPage);//SELECT報名維護已取消欄位
	public abstract List<DetailBean> selectNotCan(String tra_No, int firstPage, int lastPage);//SELECT報名維護已報名欄位
	public abstract int selectDatailCount(String tra_No);//計算報名總筆數
	public abstract String select_emp_Name(int Emp_No, String Emp_Name);//由姓名判斷是否為員工(SELECT_emp_Name)or親屬(SELECT_fam_Name)
	public abstract String select_fam_Name(int Emp_No, String Fam_Name);
	public abstract String SELECT_emp_SubTra(int Emp_No);//找到員工目前所套用的emp_SubTra
	public abstract String SELECT_top1_Tra_No(int Emp_No);//找到員工所報名的所有旅費中花費最高的Tra_No
	public abstract String SELECT_top2_Tra_No(int Emp_No);//找到員工所報名的所有旅費中花費第二高的Tra_No
	public abstract String selectSameId(String id, int emp_No);//insert時用，查詢身份證字號是否已使用
	public abstract String Select_SamId2(String id, int fam_No);//update親屬資料時用，查詢身份證字號是否已使用
	public abstract int select_emp_No(int det_No);//取消員工的detail用，點選取消找到附屬的emp_No
	public abstract String Select_Rel(int det_No);//查詢此det_No的人是員工or親屬
	public abstract float select_TotalMoney(int emp_No, String Tra_No);//查詢員工在某一Tra_No花費的總金額
	public abstract boolean insert(DetailVO bean);//由福委會新增親屬
	public abstract boolean insert_emp(DetailVO bean);//由福委會新增員工
	public abstract boolean INSERT_TA(String Tra_No, int Emp_No, float TA_money, String thisyear, boolean yearsub);//新增員工時，insert一筆TotalAmount
	public abstract List<DetailBean> update(int det_No, String det_canNote, String tra_No);//更新取消日期=點選當下的時間，連同親屬一起取消(員工)
	public abstract List<DetailBean> update_FamCanDate(int det_No, String det_canNote);// 更新取消日期=點選當下的時間，單筆取消(親屬)
	public abstract boolean UPDATE_emp_Sub(int Emp_No);//當員工沒有花費第二高的Tra_No時，將他的輔助金變回尚未使用，emp_SubTra=NULL
	public abstract boolean UPDATE_emp_SubTra(String Tra_No, int Emp_No);//當員工有花費第二高的Tra_No時，將他的輔助金套用至該Tra_No(轉移輔助金)
	public abstract boolean UPDATE_empData(EmployeeVO bean);//由報名明細update員工table
	public abstract boolean UPDATE_famData(FamilyVO bean); //由報名明細update親屬table
	public abstract boolean Update_TA(float TA_money, Boolean yearsub, int Emp_No, String Tra_No);//取消or新增家屬時更新TotalAmount
	public abstract boolean Update_TA_SUB(int emp_No, String thisyear);//將TotalAmount的輔助金變為未套用
	public abstract boolean DELETE_TA(String Tra_No, int Emp_No);//取消員工時，刪除TotalAmount明細
	public List<TotalAmountFormBean> selectBean(String tra_No);
	public boolean update_empNo( String det_note ,float det_noteMoney, String tra_No, int emp_No);
	public boolean update_famNo(String det_note,float det_noteMoney, String tra_No , int fam_No);
	public boolean selectFam_No(int fam_No,long tra_No);
	public List<String> selectFam_Rel(int emp_No,long tra_No);
	public List<DetailBean> selectExcel(String Tra_No);
	public List<DetailBean> selectExcel2(String Tra_No);
	public List<DetailBean> selectExcel3(String Tra_No);
	public int selectDetail_by_Tra_No(String tra_No);
	public int selectDetail_by_Tra_No_Can(String tra_No);
	public Boolean ckselect(String tra_NO);
	}
