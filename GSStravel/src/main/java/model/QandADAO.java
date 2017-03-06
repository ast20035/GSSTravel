package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class QandADAO implements IQandADAO{
	private DataSource ds;

	public QandADAO() {
		super();
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/testDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<QandAVO> selectALL(String prodaction , int question_Category){
		List<QandAVO> result = null;
		String where="";
		String where1="";
		
		if(question_Category != -1){
			where = "where question_Category="+question_Category;
			where1 = "and question_Category="+question_Category;
		}
		String selectALL="select QA_No , Question_Category , Question_No ,Question_Title,Question_text,Question_Time ,Answer_No ,Question_secret , DATEADD(dd,7,Question_Time) as newimg from QandA "+where+" order by Question_Time desc";
		String selectYes="select QA_No , Question_Category , Question_No ,Question_Title,Question_text,Question_Time ,Answer_No ,Question_secret , DATEADD(dd,7,Question_Time) as newimg from QandA where Answer_No is not null "+where1+" order by Question_Time desc";
		String selectNo="select QA_No , Question_Category , Question_No ,Question_Title,Question_text,Question_Time ,Answer_No ,Question_secret , DATEADD(dd,7,Question_Time) as newimg from QandA where Answer_No is null "+where1+" order by Question_Time desc";
		
		String select=selectALL;
		if("yes".equals(prodaction)){
			select=selectYes;
		}else if("no".equals(prodaction)){
			select=selectNo;		
		}
		try (Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(select);
			ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<QandAVO>();
			while (rset.next()) {
				QandAVO bean =new QandAVO();
				bean.setQa_No(rset.getInt("QA_No"));
				bean.setQuestion_Category(rset.getInt("Question_Category"));
				bean.setQuestion_No(rset.getInt("Question_No"));
				bean.setQuestion_Title(rset.getString("Question_Title"));
				bean.setQuestion_Text(rset.getString("Question_Text"));
				bean.setQuestion_Time(rset.getString("Question_Time").substring(0, 19));
				bean.setAnswer_No(rset.getInt("Answer_No"));
				bean.setQuestion_secret(rset.getBoolean("Question_secret"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date newimg = sdf.parse(rset.getString("newimg"));
				Date date = new Date();
				if(date.before(newimg)){
					bean.setNewimg(true);
				}else{
					bean.setNewimg(false);
				}
				result.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	private final String insertQuestion= "insert into QandA (Question_Category,Question_No,Question_Title,Question_Text,Question_Time,Question_secret) values(?,?,?,?,getDate(),?)";
	@Override
	public boolean insertQuestion(QandAVO bean){
		boolean b=false;
		try(Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertQuestion);) {
			stmt.setInt(1, bean.getQuestion_Category());
			stmt.setInt(2, bean.getQuestion_No());
			stmt.setString(3, bean.getQuestion_Title());
			stmt.setString(4, bean.getQuestion_Text());
			stmt.setBoolean(5, bean.getQuestion_secret());
			stmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	}
	private final String getALL="select QA_No , Question_Category , Question_No ,Question_Title,Question_text,Question_Time,Answer_No,Answer_Text,Answer_time from QandA where qa_No=?";
	@Override
	public QandAVO getALL(int qa_No) {
		QandAVO bean = null;
		try (Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(getALL);) {
			stmt.setInt(1, qa_No);
			ResultSet rset = stmt.executeQuery();
			bean = new QandAVO();
			while (rset.next()) {
				bean.setQa_No(rset.getInt("QA_No"));
				bean.setQuestion_Category(rset.getInt("question_Category"));
				bean.setQuestion_No(rset.getInt("Question_No"));
				bean.setQuestion_Title(rset.getString("Question_Title"));
				bean.setQuestion_Text(rset.getString("Question_Text"));
				bean.setQuestion_Time(rset.getString("Question_Time"));
				bean.setAnswer_No(rset.getInt("Answer_No"));
				bean.setAnswer_Text(rset.getString("Answer_Text"));
				bean.setAnswer_Time(rset.getString("Answer_Time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	private final String updateAnswer="update QandA set Answer_No=? , Answer_Text=? where QA_No=?";
	@Override
	public boolean insertAnswer(QandAVO bean){
		boolean b=false;
		try (Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(updateAnswer);) {
			stmt.setInt(1, bean.getAnswer_No());
			stmt.setString(2, bean.getAnswer_Text());
			stmt.setInt(3, bean.getQa_No());
			stmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	private final String deletOne="delete from QandA where QA_No=?";
	@Override
	public boolean deleteOne(int qa_No){
		boolean b=false;
		try (Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(deletOne);) {
				stmt.setInt(1, qa_No);
				stmt.executeUpdate();
				b=true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return b;
	}
	private final String deletYears="delete from QandA where Question_Time<DATEADD(yyyy,-1,GETDATE())";
	private final String deletthreeMonth="delete from QandA where Question_Time<DATEADD(mm,-3,GETDATE())";
	private final String deletnightMonth="delete from QandA where Question_Time<DATEADD(mm,-9,GETDATE())";
	private final String delethalfYears="delete from QandA where Question_Time<DATEADD(mm,-6,GETDATE())";
	@Override
	public boolean delete(String prodaction){
		String delete=deletYears;
		if("3month".equals(prodaction)){
			delete=deletthreeMonth;
		}else if("6month".equals(prodaction)){
			delete=delethalfYears;
		}else if("9month".equals(prodaction)){
			delete=deletnightMonth;
		}
		boolean b=false;
		try (Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(delete);) {
				stmt.executeUpdate();
				b=true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return b;
	}
}
