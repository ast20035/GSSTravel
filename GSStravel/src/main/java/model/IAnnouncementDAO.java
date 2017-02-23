package model;

import java.sql.Date;
import java.util.List;

public interface IAnnouncementDAO {
	public AnnouncementVO select(String date);

	public List<AnnouncementVO> select();

	public void insert(String now, String title, String content);

	public void update(String now, String title, String content, String date);

	public void delete(String date);
}
