package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class AnnouncementService {
	private IAnnouncementDAO iannouncementDao = new AnnouncementDAO();

	public JSONArray to_Json(List<AnnouncementVO> announcementBean) {
		JSONArray array = new JSONArray();
		for (AnnouncementVO v : announcementBean) {
			JSONObject obj = new JSONObject();
			obj.put("time", v.getAnno_Time().substring(0, 19));
			obj.put("title", v.getAnno_Title());
			obj.put("content", v.getAnno_Content());
			obj.put("important", v.getAnno_Important());
			array.add(obj);
		}
		return array;
	}
	
	public List<AnnouncementVO> get_by_time(String time) {
		return new AnnouncementDAO().pk(time);
	}

	public List<AnnouncementVO> get_by_title(String title) {
		return new AnnouncementDAO().search(title);
	}

	public List<AnnouncementVO> AfterOn(List<AnnouncementVO> AnnouncementVO, String start) {
		List<AnnouncementVO> bean = new ArrayList<AnnouncementVO>();
		for (AnnouncementVO v : AnnouncementVO) {
			Date sDay = java.sql.Date.valueOf(start);
			Date date = java.sql.Date.valueOf(v.getAnno_Time().substring(0, 10));
			if (date.after(sDay) || date.equals(sDay)) {
				bean.add(v);
			}
		}
		return bean;
	}

	public List<AnnouncementVO> BeforeOff(List<AnnouncementVO> AnnouncementVO, String end) {
		List<AnnouncementVO> bean = new ArrayList<AnnouncementVO>();
		for (AnnouncementVO v : AnnouncementVO) {
			Date eDay = java.sql.Date.valueOf(end);
			Date date = java.sql.Date.valueOf(v.getAnno_Time().substring(0, 10));
			if (date.before(eDay) || date.equals(eDay)) {
				bean.add(v);
			}
		}
		return bean;
	}

	public List<AnnouncementVO> select() {
		List<AnnouncementVO> result = iannouncementDao.select();
		return result;
	}

	public void insert(String now, String title, String content, String important) {
		iannouncementDao.insert(now, title, content, important);
	}

	public void update(String now, String title, String content, String important, String date) {
		iannouncementDao.update(now, title, content, important, date);
	}

	public void delete(String date) {
		iannouncementDao.delete(date);
	}
}
