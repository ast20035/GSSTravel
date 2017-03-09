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

public class FineDAO implements IFineDAO {
	private static final String SELECT_ALL_STMT = "SELECT * FROM Fines ORDER BY fine_Dates DESC";
	private static final String SELECT_PERCENT = "SELECT fine_Per FROM Fines WHERE fine_Dates=?";
	private static final String INSERT_STMT = "INSERT INTO Fines VALUES(?, ?)";
	private static final String DELETE_STMT = "DELETE FROM Fines";

	private DataSource dataSource;

	public FineDAO() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/testDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public List<FineVO> select() {
		List<FineVO> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_STMT);
				ResultSet rset = stmt.executeQuery();) {
			result = new ArrayList<FineVO>();
			while (rset.next()) {
				FineVO bean = new FineVO();
				bean.setFine_Dates(rset.getInt("fine_Dates"));
				bean.setFine_Per(rset.getFloat("fine_Per"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public float selectPercent(int fineDate) {
		float result = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_PERCENT);) {
			stmt.setInt(1, fineDate);
			ResultSet rset = stmt.executeQuery();
			while (rset.next()) {
				result = rset.getFloat("fine_Per");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void insert(FineVO bean) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT_STMT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getFine_Dates());
				stmt.setFloat(2, bean.getFine_Per());
				stmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int day) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_STMT);) {
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
