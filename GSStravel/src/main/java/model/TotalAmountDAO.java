package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TotalAmountDAO implements ITotalAmountDAO {

	private DataSource dataSource;
	public TotalAmountDAO() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/testDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String UPDATE_TOTALAMOUNT_FOR_EMP_NO = "update TotalAmount set TA_money=? where emp_No=? and tra_No=?";
	private static final String insertTotalAmount ="insert into TotalAmount (tra_No,emp_No,TA_money,thisyear,yearsub) values(?,?,?,?,?)";	
	private static final String deleteTotalAmount="Delete from TotalAmount where emp_No=? and tra_No=?"; 
	private static final String selectTa_money="select  TOP(1)Ta_money, tra_No from TotalAmount where emp_No=? and thisyear=(select * from year)";
	private static final String selectAll="select * from TotalAmount where emp_No=? and thisyear=(select * from year)";
	private static final String counts="select count(emp_No)as count from TotalAmount where emp_No=? and thisyear=(select * from year)";
	private static final String select="select * from TotalAmount where emp_No=? and tra_No=? ";
	private static final String selectTra_No="select tra_No from TotalAmount where emp_No=? and thisyear=(select * from year)";
	private static final String updateYearSub="update TotalAmount set yearsub=? where emp_No=? and tra_No=?";
	
	public void updateYearSub(boolean yearsub,Integer emp_No,String tra_No){		
		try(Connection conn=dataSource.getConnection();
		    PreparedStatement stmt=conn.prepareStatement(updateYearSub);
		    ){
			stmt.setBoolean(1, yearsub);
			stmt.setInt(2, emp_No);
			stmt.setString(3, tra_No);
			stmt.executeUpdate();			
		}catch(SQLException e){
			e.printStackTrace();
		}				
	}
	
	
	public List<String> selectTra_No(Integer emp_No){
		List<String> tra_Nos=new ArrayList<>();
		try(Connection conn=dataSource.getConnection();
		    PreparedStatement stem=conn.prepareStatement(selectTra_No);
		    ){
			stem.setInt(1, emp_No);
			ResultSet rest =stem.executeQuery();
			while(rest.next()){
				String tra_No =rest.getString("tra_No");
				tra_Nos.add(tra_No);
			}			
		}catch(SQLException e){
			e.printStackTrace();
		}		
		return tra_Nos;
	}
	
	@Override
	public TotalAmountVO select(String emp_No,String tra_NO){
		TotalAmountVO totalAmountVO=new TotalAmountVO();
		try(
			Connection conn=dataSource.getConnection();
			PreparedStatement stem=conn.prepareStatement(select);
				){
			stem.setString(1, emp_No);
			stem.setString(2, tra_NO);
			ResultSet rest = stem.executeQuery();
			while(rest.next()){
				totalAmountVO.setTra_No(rest.getString("tra_No"));
				totalAmountVO.setTa_Money(Float.parseFloat(rest.getString("Ta_money")));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return totalAmountVO;
	}
	
	@Override
	public int counts(String emp_No) {
		int count = 0;
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(counts);
			stmt.setString(1, emp_No);	
			ResultSet rest = stmt.executeQuery();
			while(rest.next()){
				count=rest.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public boolean selectAll(String emp_No) {
		
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(selectAll);
			stmt.setString(1, emp_No);			
			ResultSet rest = stmt.executeQuery();
			while(rest.next()){
					return false;			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	@Override
	public boolean update(float TA_money, String tra_No, int emp_No) {
		try(Connection conn = dataSource.getConnection() ) {
			PreparedStatement stmt = conn.prepareStatement(UPDATE_TOTALAMOUNT_FOR_EMP_NO);
			stmt.setFloat(1, TA_money);
			stmt.setInt(2, emp_No);
			stmt.setString(3, tra_No);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	public boolean delete(String tra_No, int emp_No) {
		return false;
	}
	
	@Override
	public void insertTotalAmount( String tra_No, Integer emp_No,float TA_money) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(insertTotalAmount);
			stmt.setString(1, tra_No);
			stmt.setInt(2, emp_No);
			stmt.setDouble(3, TA_money);
			DetailDAO detailDAO=new DetailDAO();
			String det_Date = detailDAO.detail(emp_No.toString(),tra_No).substring(0,4);
			stmt.setString(4,  det_Date);
			TotalAmountDAO totalAmountDAO = new TotalAmountDAO();
			if(totalAmountDAO.selectAll(emp_No.toString())){
				//今年還未報名
				stmt.setBoolean(5, true);
			}else{
				//今年已經報名
				TotalAmountVO totalAmountVo = totalAmountDAO.selectTa_money(emp_No.toString());
				float ta_Money = totalAmountVo.getTa_Money();
				if(ta_Money<TA_money){	
					List<String> tra_Nos = totalAmountDAO.selectTra_No(emp_No);
					for(String no:tra_Nos){
						if(no.equals(tra_No)){							
						}else{
							totalAmountDAO.updateYearSub(false,emp_No,no);
						}					
					}	
					stmt.setBoolean(5, true);
				}else{
					stmt.setBoolean(5, false);
				}				
			}		
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}	
	@Override
	public void deleteTotalAmount( String emp_No,String tra_No ) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(deleteTotalAmount);
			stmt.setString(1, emp_No);
			stmt.setString(2, tra_No);			
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	@Override
	public TotalAmountVO selectTa_money(String emp_No){
		TotalAmountVO totalAmountVO=new TotalAmountVO();
		try(
			Connection conn=dataSource.getConnection();
			PreparedStatement stem=conn.prepareStatement(selectTa_money);
				){
			stem.setString(1, emp_No);
			ResultSet rest = stem.executeQuery();
			while(rest.next()){
				totalAmountVO.setTra_No(rest.getString("tra_No"));
				totalAmountVO.setTa_Money(Float.parseFloat(rest.getString("Ta_money")));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return totalAmountVO;
	}
	
	//雅婷
	private final String select_yearsub="select yearsub from TotalAmount where emp_No=? and tra_No=?";
	
	public boolean select_yearsub(int emp_No ,String tra_No){
		try(Connection conn=dataSource.getConnection();
			PreparedStatement stem=conn.prepareStatement(select_yearsub);){
				stem.setInt(1, emp_No);
				stem.setString(2, tra_No);
				ResultSet rest = stem.executeQuery();
				while(rest.next()){
					return	rest.getBoolean("yearsub");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		return false;
	}
}
