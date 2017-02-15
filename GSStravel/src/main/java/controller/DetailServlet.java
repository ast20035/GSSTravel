package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DetailBean;
import model.DetailService;
import model.EmployeeVO;
import model.FamilyVO;
import model.ItemService;
import model.ItemVO;
import model.TravelVO;

@WebServlet(urlPatterns = { ("/detail") })
public class DetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private DetailService detailService = new DetailService();
	private ItemService itemService = new ItemService();
	String test;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String prodaction = req.getParameter("prodaction");
		String tra_no = req.getParameter("tra_no");
		String can_detNo = req.getParameter("can_detNo");

		DetailBean bean = new DetailBean();
		TravelVO travelVO;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = req.getSession();
		session.removeAttribute("DetCanError");

		List<ItemVO> itemVO = null;
		List<ItemVO> room = null;
		if ("insert".equals(prodaction)) {
			Long tra_No = Long.parseLong(tra_no);
			travelVO = detailService.Count(tra_no);
			if (travelVO != null) {
				if (travelVO.getTra_Total() > detailService.tra_count(tra_No)) {
					itemVO = itemService.getFareMoney(tra_No);
					room = itemService.getRoomMoney(tra_No);
					float f = 0;
					for (ItemVO i : itemVO) {
						f = f + i.getItem_Money();
					}
					req.setAttribute("tra_no", tra_no);
					req.setAttribute("money", f);
					req.setAttribute("room", room);
					req.getRequestDispatcher("/Detail_Insert.jsp").forward(req, resp);
					return;
				} else {
					session.setAttribute("DetMsg", "此報名總人數已額滿，是否要繼續新增?");
					resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_no);
					return;
				}
			} else {
				session.setAttribute("CanError", "此報名已結束");
				req.getRequestDispatcher("/Detail.jsp?tra_no=" + tra_no).forward(req, resp);
				return;
			}
		}
		// 點選取消按鈕，更新取消日期
		if ("送出".equals(prodaction) && can_detNo != null) {
			String det_canNote = req.getParameter("det_CanNote");
			String det_canTraNo = req.getParameter("can_traNo");
			if (det_canNote.trim().length() != 0) {
				int canNum = Integer.parseInt(can_detNo);
				bean.setDet_No(canNum);
				bean.setDet_canNote(det_canNote);
				bean.setTra_NO(det_canTraNo);
				List<DetailBean> result1 = detailService.update(bean);
				req.setAttribute("select", result1);
				req.getRequestDispatcher("/Detail_CanSuccess.jsp").forward(req, resp);
				return;
			} else {
				session.setAttribute("DetCanError", "必須輸入取消原因！");
				req.getRequestDispatcher("/Detail_Cancel.jsp").forward(req, resp);
				return;
			}
		}

		if ("save".equals(prodaction)) {
			String tempEmp_No = req.getParameter("emp_No");
			int emp_No = Integer.parseInt(tempEmp_No);
			String rel = req.getParameter("fam_Rel");
			String name = req.getParameter("name");
			String sex = req.getParameter("sex");
			String ID = req.getParameter("ID");
			String Bdate = req.getParameter("Bdate");
			String Phone = req.getParameter("Phone");
			String eat = req.getParameter("eat");
			String ben = req.getParameter("ben");
			String ben_Rel = req.getParameter("ben_Rel");
			String emg = req.getParameter("emg");
			String emg_Phone = req.getParameter("emg_Phone");
			String note = req.getParameter("note");
			if (!rel.equals("員工")) {
				try {
					if (name.trim().length() == 0 || name == null) {
						System.out.println("name");
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben.trim().length() == 0 || ben == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben_Rel.trim().length() == 0 || ben_Rel == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (emg.trim().length() == 0 || emg == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if(!Phone.matches("^[09][0-9]{9}")){
						session.setAttribute("CanError", "儲存失敗！");
					}else if(!detailService.isValidTWPID(ID)){
						session.setAttribute("CanError", "儲存失敗！");
					}else if(sex.equals("男")&&!ID.substring(1, 2).equals("1")){
						session.setAttribute("CanError", "儲存失敗！");
					}else if(sex.equals("女")&&!ID.substring(1, 2).equals("2")){
						session.setAttribute("CanError", "儲存失敗！");
					}else {
						String temp_FamNo = req.getParameter("fam_No");
						String car = req.getParameter("car");
						String spe = req.getParameter("text_multiselect");
						int fam_No = Integer.parseInt(temp_FamNo);
						FamilyVO Fbean = new FamilyVO();
						Fbean.setFam_Name(name);
						Fbean.setFam_Rel(rel);
						Fbean.setFam_Phone(Phone);
						Fbean.setFam_Sex(sex);
						Fbean.setFam_Id(ID);
						java.util.Date JDate = sdf.parse(Bdate);
						Date date = new Date(JDate.getTime());
						Fbean.setFam_Bdate(date);
						Fbean.setFam_Eat(eat);
						if (car == null) {
							Fbean.setFam_Car(true);
						} else {
							Fbean.setFam_Car(false);
						}
						if (spe.contains("幼童(0~3歲)")) {
							Fbean.setFam_Bady(true);
						} else {
							Fbean.setFam_Bady(false);
						}
						if (spe.contains("兒童(4~11歲)")) {
							Fbean.setFam_kid(true);
						} else {
							Fbean.setFam_kid(false);
						}
						if (spe.contains("持身心障礙手冊")) {
							Fbean.setFam_Dis(true);
						} else {
							Fbean.setFam_Dis(false);
						}
						if (spe.contains("孕婦(媽媽手冊)")) {
							Fbean.setFam_Mom(true);
						} else {
							Fbean.setFam_Mom(false);
						}
						Fbean.setFam_Ben(ben);
						Fbean.setFam_BenRel(ben_Rel);
						Fbean.setFam_Emg(emg);
						Fbean.setFam_EmgPhone(emg_Phone);
						Fbean.setFam_Note(note);
						Fbean.setFam_No(fam_No);
						detailService.update_famData(Fbean);
						session.setAttribute("CanError", "儲存成功！");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_no);
				return;
			} else {
				try {
					if (name.trim().length() == 0 || name == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben.trim().length() == 0 || ben == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben_Rel.trim().length() == 0 || ben_Rel == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (emg.trim().length() == 0 || emg == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if(!Phone.matches("^[09][0-9]{9}")){
						session.setAttribute("CanError", "儲存失敗！");
					}else if(!detailService.isValidTWPID(ID)){
						session.setAttribute("CanError", "儲存失敗！");
					}else if(sex.equals("男")&&!ID.substring(1, 2).equals("1")){
						session.setAttribute("CanError", "儲存失敗！");
					}else if(sex.equals("女")&&!ID.substring(1, 2).equals("2")){
						session.setAttribute("CanError", "儲存失敗！");
					} else {
						EmployeeVO Ebean = new EmployeeVO();
						Ebean.setEmp_Name(name);
						Ebean.setEmp_Phone(Phone);
						Ebean.setEmp_Sex(sex);
						Ebean.setEmp_ID(ID);
						java.util.Date JDate = sdf.parse(Bdate);
						Date date = new Date(JDate.getTime());
						Ebean.setEmp_Bdate(date);
						Ebean.setEmp_Eat(eat);
						Ebean.setEmp_Ben(ben);
						Ebean.setEmp_BenRel(ben_Rel);
						Ebean.setEmp_Emg(emg);
						Ebean.setEmp_EmgPhone(emg_Phone);
						Ebean.setEmp_Note(note);
						Ebean.setEmp_No(emp_No);
						detailService.update_empData(Ebean);
						session.setAttribute("CanError", "儲存成功！");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_no);
			return;
		}
		bean.setTra_NO(tra_no);
		List<DetailBean> result = detailService.select(bean);
		req.setAttribute("select", result);
		req.getRequestDispatcher("/Detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
