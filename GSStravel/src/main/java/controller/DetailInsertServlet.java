package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DetailService;
import model.DetailVO;
import model.FamilyService;
import model.FamilyVO;

@WebServlet(urlPatterns = { ("/detail_insert") })
public class DetailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DetailService detailService = new DetailService();
	private FamilyService familyService = new FamilyService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		DetailVO detailVO = new DetailVO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String prodaction = req.getParameter("prodaction");
		String tra_No = req.getParameter("tra_no");
		HttpSession session = req.getSession();
		session.removeAttribute("DataError");
		if ("儲存".equals(prodaction)) {
			try {
				String temp1 = req.getParameter("emp_No");
				String name = req.getParameter("select");
				String temp2 = req.getParameter("money");

				float det_money = Float.parseFloat(temp2);
				if (temp1 != "" && temp1.trim().length() != 0) {
					int emp_no = Integer.parseInt(temp1);
					if (!name.equals("其他")) {
						int fam_no = familyService.select_byname(emp_no, name);
						if (fam_no == 0) {
							detailVO.setEmp_No(emp_no);
							detailVO.setTra_No(tra_No);
							detailVO.setDet_money(det_money);
							boolean b = detailService.insert_emp(detailVO);
							if (b) {
								session.setAttribute("CanError", "員工新增成功");
								resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
								return;
							} else {
								session.setAttribute("CanError", "員工新增失敗");
								resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
								return;
							}
						} else {
							detailVO.setEmp_No(emp_no);
							detailVO.setTra_No(tra_No);
							detailVO.setDet_money(det_money);
							detailVO.setFam_No(fam_no);
							boolean b = detailService.insert(detailVO);
							if (b) {
								session.setAttribute("CanError", "家屬新增成功");
								resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
								return;
							} else {
								session.setAttribute("CanError", "家屬新增失敗");
								resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
								return;
							}
						}
					} else { // 增加新家屬
						try {
							FamilyVO familyVO = new FamilyVO();
							String fam_Rel = req.getParameter("fam_Rel"); // 家屬
							String fam_Name = req.getParameter("fam_Name"); // 姓名
							String fam_Sex = req.getParameter("fam_Sex"); // 性別
							String fam_Id = req.getParameter("fam_Id"); // 身分證字號
							String temp3 = req.getParameter("fam_Bdate"); // 生日
							String fam_Phone = req.getParameter("fam_Phone"); // 手機
							String fam_Eat = req.getParameter("fam_Eat"); // 用餐
							String temp4 = req.getParameter("fam_Car"); // 車位
							String Sfam_spa = req.getParameter("fam_spa"); // 特殊身份
							String[] fam_spa = req.getParameterValues("fam_spa"); // 特殊身份
							String fam_Ben = req.getParameter("fam_Ben"); // 保險受益人
							String fam_BenRel = req.getParameter("fam_BenRel"); // 保險受益人關係
							String fam_Emg = req.getParameter("fam_Emg"); // 緊急聯絡人
							String fam_EmgPhone = req.getParameter("fam_EmgPhone"); // 緊急聯絡人電話
							String fam_EmgRel = req.getParameter("fam_EmgRel"); // 緊急聯絡人關係
							String fam_Note = req.getParameter("fam_note"); // 備註
							familyVO.setEmp_No(emp_no);
							familyVO.setFam_Rel(fam_Rel);
							familyVO.setFam_Name(fam_Name);
							familyVO.setFam_Sex(fam_Sex);
							familyVO.setFam_Id(fam_Id);
							java.util.Date Bdate = sdf.parse(temp3);
							java.sql.Date fam_Bdate = new java.sql.Date(Bdate.getTime());
							familyVO.setFam_Bdate(fam_Bdate);
							familyVO.setFam_Phone(fam_Phone);
							familyVO.setFam_Eat(fam_Eat);
							familyVO.setFam_Car(true);
							if (temp4 != null) {
								familyVO.setFam_Car(false);
							}
							familyVO.setFam_Bady(false);
							familyVO.setFam_kid(false);
							familyVO.setFam_Dis(false);
							familyVO.setFam_Mom(false);
							if (Sfam_spa != null) {
								for (String k : fam_spa) {
									if ("幼童(0~3歲)".equals(k)) {
										familyVO.setFam_Bady(true);
									}
									if ("兒童(4~11歲)".equals(k)) {
										familyVO.setFam_kid(true);
									}
									if ("持身心障礙手冊".equals(k)) {
										familyVO.setFam_Dis(true);
									}
									if ("孕婦(媽媽手冊)".equals(k)) {
										familyVO.setFam_Mom(true);
									}
								}
							}
							familyVO.setFam_Ben(fam_Ben);
							familyVO.setFam_BenRel(fam_BenRel);
							familyVO.setFam_Emg(fam_Emg);
							familyVO.setFam_EmgPhone(fam_EmgPhone);
							familyVO.setFam_EmgRel(fam_EmgRel);
							familyVO.setFam_Note(fam_Note);
							String sId = detailService.selectSameId(fam_Id);
							if (sId == null) {
								boolean a = familyService.insert_fam(familyVO);
								if (a) {
									int fam_no = familyService.select_byname(emp_no, fam_Name);
									detailVO.setEmp_No(emp_no);
									detailVO.setTra_No(tra_No);
									detailVO.setDet_money(det_money);
									detailVO.setFam_No(fam_no);
									boolean b = detailService.insert(detailVO);
									if (b) {
										session.setAttribute("CanError", "家屬新增成功");
										resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
										return;

									} else {
										session.setAttribute("CanError", "家屬新增失敗");
										resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
										return;
									}
								} else {
									session.setAttribute("CanError", "家屬新增失敗");
									resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
									return;
								}
							}else{
								session.setAttribute("CanError", "身份證字號重複");
								resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
								return;
							}
						} catch (Exception e) {
							session.setAttribute("DataError", "儲存失敗");
							resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No + "&doInsert=1");
							return;
						}
					}
				} else {
					resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No + "&doInsert=1");
					return;
				}
			} catch (Exception e) {
				session.setAttribute("DataError", "儲存失敗");
				resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No + "&doInsert=1");
				return;
			}
		}
		if ("回前頁".equals(prodaction)) {
			resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_No);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}