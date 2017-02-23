package model;

import java.sql.Date;
import java.util.List;

public interface IAnnouncementDAO {
	public AnnouncementVO select(String date);

	public List<AnnouncementVO> select();

	public void insert(AnnouncementVO bean);

	public void update(AnnouncementVO bean, String date);

	public void delete(String date);
}
