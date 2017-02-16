package model;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class FineService {
	private IFineDAO ifineDao = new FineDAO();
	
	public JSONArray to_Json(List<FineVO> fineBean){
		JSONArray array = new JSONArray();
		for(FineVO v:fineBean){
			JSONObject obj = new JSONObject();
			obj.put("day", v.getFine_Dates());
			obj.put("percent", v.getFine_Per());
			array.add(obj);
		}
		return array;
	}

	public List<FineVO> select(FineVO bean) {
		List<FineVO> result = null;
		if (bean != null && bean.getFine_Dates() != 0) {
			FineVO temp = ifineDao.select(bean.getFine_Dates());
			if (temp != null) {
				result = new ArrayList<FineVO>();
				result.add(temp);
			}
		} else {
			result = ifineDao.select();
		}
		return result;
	}

	public FineVO insert(FineVO bean) {
		FineVO result = null;
		if (bean != null) {
			result = ifineDao.insert(bean);
		}
		return result;
	}

//	public FineVO update(FineVO bean) {
//		FineVO result = null;
//		if (bean != null) {
//			result = ifineDao.update(bean.getFine_Per(), bean.getFine_Dates());
//		}
//		return result;
//	}

//	public boolean delete(FineVO bean) {
//		boolean result = false;
//		if (bean != null) {
//			result = ifineDao.delete(bean.getFine_Dates());
//		}
//		return result;
//	}
	
	public void delete(FineVO bean) {
		ifineDao.delete(bean.getFine_Dates());
	}

}
