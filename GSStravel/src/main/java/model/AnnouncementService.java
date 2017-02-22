package model;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
			array.add(obj);
		}
		return array;
	}

	public List<AnnouncementVO> select() {
		List<AnnouncementVO> result = iannouncementDao.select();
		return result;
	}

	public void insert(AnnouncementVO bean) {
		iannouncementDao.insert(bean);
	}

	public void update(AnnouncementVO bean, String date) {
		iannouncementDao.update(bean, date);
	}

	public void delete(AnnouncementVO bean) {
		iannouncementDao.delete(bean.getAnno_Time());
	}
}
