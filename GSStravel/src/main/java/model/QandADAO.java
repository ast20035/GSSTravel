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
	
	private final String selectALL="select QA_No , tra_No , Question_No ,Question_Title,Question_text,Question_Time ,Answer_No from QandA";
	@Override
	public List<QandAVO> selectALL(){
		List<QandAVO> result = null;
		try (Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(selectALL);
			ResultSet rset = stmt.executeQuery();) {
			result = new ArrayList<QandAVO>();
			while (rset.next()) {
				QandAVO bean =new QandAVO();
				bean.setQa_No(rset.getInt("QA_No"));
				bean.setTra_No(rset.getString("tra_No"));
				bean.setQuestion_No(rset.getInt("Question_No"));
				bean.setQuestion_Title(rset.getString("Question_Title"));
				bean.setQuestion_Text(rset.getString("Question_Text"));
				bean.setQuestion_Time(rset.getString("Question_Time"));
				bean.setAnswer_No(rset.getInt("Answer_No"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	private final String insertQuestion= "insert into QandA (tra_No,Question_No,Question_Title,Question_Text,Question_Time) values(?,?,?,?,getDate())";
	@Override
	public boolean insertQuestion(QandAVO bean){
		boolean b=false;
		try(Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(insertQuestion);) {
			stmt.setString(1, bean.getTra_No());
			stmt.setInt(2, bean.getQuestion_No());
			stmt.setString(3, bean.getQuestion_Title());
			stmt.setString(4, bean.getQuestion_Text());
			stmt.executeUpdate();
			b=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return b;
	}
	private final String getALL="select QA_No , tra_No , Question_No ,Question_Title,Question_text,Question_Time,Answer_No,Answer_Text,Answer_time from QandA where qa_No=?";
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
				bean.setTra_No(rset.getString("tra_No"));
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
}
