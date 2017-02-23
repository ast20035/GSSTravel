package model;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class FineService {
	private IFineDAO ifineDao = new FineDAO();

	public JSONArray to_Json(List<FineVO> fineBean) {
		JSONArray array = new JSONArray();
		for (FineVO v : fineBean) {
			JSONObject obj = new JSONObject();
			obj.put("day", v.getFine_Dates());
			obj.put("percent", v.getFine_Per());
			array.add(obj);
		}
		return array;
	}

	public List<FineVO> select() {
		List<FineVO> result = ifineDao.select();
		return result;
	}

	public void insert(FineVO bean) {
		ifineDao.insert(bean);
	}

	public void delete(FineVO bean) {
		ifineDao.delete(bean.getFine_Dates());
	}

}
