package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import ch.qos.logback.core.net.SyslogOutputStream;
import model.DetailInsertBean;
import model.DetailInsertSelectService;
import model.DetailService;
import model.TravelService;
import model.TravelVO;

@WebServlet("/DetailInsertSelectServlet")
public class DetailInsertSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DetailInsertSelectService dISS = new DetailInsertSelectService();
	private DetailInsertBean bean;
	private DetailInsertBean emp_bean;
	private List<DetailInsertBean> fam_bean;
	private TravelService travelService;
	private TravelVO travelVO;
	private DetailService detailService;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String emp_no = request.getParameter("emp_No");
		String tra_No = request.getParameter("tra_No");
		JSONObject DetData = new JSONObject();
		int emp_No = 0;
		Long tra_no = Long.parseLong(tra_No);
		try {
			if (emp_no.trim().length() != 0) {
				emp_No = Integer.parseInt(emp_no);
				dISS = new DetailInsertSelectService();
				emp_bean = dISS.selectempName(emp_No);
				if (emp_bean != null) { // 判斷是否有這員工
					bean = new DetailInsertBean();
					bean = dISS.selectDetailEmp(emp_No, tra_No);
					if (bean == null) { // 判斷這員工是否有報名此行程
						JSONArray jsonArrayNames = new JSONArray();
						fam_bean = new ArrayList<DetailInsertBean>();
						fam_bean = dISS.selecDetailFam(emp_No, tra_No);
						travelService = new TravelService();
						detailService = new DetailService();
						travelVO = new TravelVO();
						travelVO = travelService.Count(tra_No);
						int emp_Max= detailService.detail_Count(emp_no, tra_no) ;
						// 判斷此員工是否已報名額滿
						if (travelVO.getTra_Max() <= emp_Max+1) {
							DetData.put("emp_Max", "此員工已報名此行程個人可報名人數之上限");
						}
						if (fam_bean.size() != 0) { // 判斷此員工的家屬是否已報名
							String[] name = new String[fam_bean.size()];
							int i = 0;
							for (DetailInsertBean b : fam_bean) {
								name[i] = b.getName();
								jsonArrayNames.add(name[i]);
								i++;
							}
							DetData.put("fam_Name", jsonArrayNames.toString());
						} else {
							DetData.put("fam_No", "此員工之親屬皆已全數報名，是否欲報名新親屬?");
						}
					} else {
						DetData.put("emp_Name", bean.getName());
					}
				} else {
					DetData.put("InError", "此公司並無此人編號");
				}
			} else {
				DetData.put("InError", "請輸入員工編號");
			}
		} catch (Exception e) {
			e.printStackTrace();
			DetData.put("InError", "員工編號輸入非數字之字");
		}
		PrintWriter out = response.getWriter();
		out.println(DetData);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
