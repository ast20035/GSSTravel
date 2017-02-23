package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AnnouncementDAO implements IAnnouncementDAO {
	private static final String SEARCH_BY_TITLE = " SELECT * FROM Announcement where anno_Title LIKE ?";
	private static final String SELECT_ONE_STMT = "SELECT * FROM Announcement WHERE anno_Time=?";
	private static final String SELECT_ALL_STMT = "SELECT * FROM Announcement ORDER BY anno_Time DESC";
	public static final String INSERT_STMT = "INSERT INTO Announcement VALUES(?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE Announcement SET anno_Time=?, anno_Title=?, anno_Content=? WHERE anno_Time=?";
	private static final String DELETE_STMT = "DELETE FROM Announcement WHERE anno_Time=?";

	private DataSource dataSource;

	public AnnouncementDAO() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/testDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public List<AnnouncementVO> search(String title) {
		List<AnnouncementVO> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SEARCH_BY_TITLE);) {
			if (title == null) {
				title = "";
			}
			stmt.setString(1, "%" + title + "%");
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<AnnouncementVO>();
			while (rset.next()) {
				AnnouncementVO bean = new AnnouncementVO();
				bean.setAnno_Time(rset.getString("anno_Time"));
				bean.setAnno_Title(rset.getString("anno_Title"));
				bean.setAnno_Content(rset.getString("anno_Content"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<AnnouncementVO> pk(String time) {
		List<AnnouncementVO> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ONE_STMT);) {
			stmt.setString(1, time);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<AnnouncementVO>();
			while (rset.next()) {
				AnnouncementVO bean = new AnnouncementVO();
				bean.setAnno_Time(rset.getString("anno_Time"));
				bean.setAnno_Title(rset.getString("anno_Title"));
				bean.setAnno_Content(rset.getString("anno_Content"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public AnnouncementVO select(String date) {
		AnnouncementVO result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ONE_STMT)) {
			stmt.setString(1, date);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new AnnouncementVO();
				result.setAnno_Time(rset.getString("anno_Time"));
				result.setAnno_Title(rset.getString("anno_Title"));
				result.setAnno_Content(rset.getString("anno_Content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public List<AnnouncementVO> select() {
		List<AnnouncementVO> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_STMT);
				ResultSet rset = stmt.executeQuery();) {
			result = new ArrayList<AnnouncementVO>();
			while (rset.next()) {
				AnnouncementVO bean = new AnnouncementVO();
				bean.setAnno_Time((rset.getString("anno_Time")));
				bean.setAnno_Title(rset.getString("anno_Title"));
				bean.setAnno_Content(rset.getString("anno_Content"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void insert(String now, String title, String content) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT_STMT);) {
			stmt.setString(1, now);
			stmt.setString(2, title);
			stmt.setString(3, content);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(String now, String title, String content, String date) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE_STMT);) {
			stmt.setString(1, now);
			stmt.setString(2, title);
			stmt.setString(3, content);
			stmt.setString(4, date);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(String date) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_STMT);) {
			stmt.setString(1, date);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
