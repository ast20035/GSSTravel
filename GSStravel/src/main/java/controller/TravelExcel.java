package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/TravelExcel")
public class TravelExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TravelExcel() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String excel = request.getParameter("excel");
		File dir = new File("C:/travel");
		Excel ex = new Excel(dir);
		JSONArray jsonArray = new JSONArray(excel);
		String[] id = new String[jsonArray.length()];
		String[] name = new String[jsonArray.length()];
		String[] onDate = new String[jsonArray.length()];
		String[] offDate = new String[jsonArray.length()];
		String[] bDate = new String[jsonArray.length()];
		String[] eDate = new String[jsonArray.length()];
		String[] people = new String[jsonArray.length()];
		String[] peopleNow = new String[jsonArray.length()];
		String[] location = new String[jsonArray.length()];
		int count = jsonArray.length();
		for (int i = 0; i < count; i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			id[i] = jsonObject.getString("id");
			name[i] = jsonObject.getString("name");
			onDate[i] = jsonObject.getString("onDate");
			offDate[i] = jsonObject.getString("offDate");
			bDate[i] = jsonObject.getString("bDate");
			eDate[i] = jsonObject.getString("eDate");
			people[i] = jsonObject.getInt("people")+"";
			peopleNow[i] = jsonObject.getInt("peopleNow")+"";
			location[i] = jsonObject.getString("location");
		}
		ex.travelExcel(count, id, name, onDate, offDate, bDate, eDate, people, peopleNow, location);
		request.getRequestDispatcher("/File_Travel.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
