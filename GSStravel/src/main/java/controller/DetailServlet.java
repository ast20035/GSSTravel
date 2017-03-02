package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;

import model.DetailBean;
import model.DetailService;
import model.EmployeeVO;
import model.FamilyVO;
import model.ItemService;
import model.ItemVO;
import model.TravelService;
import model.TravelVO;

@WebServlet(urlPatterns = { ("/detail") })
public class DetailServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private DetailService detailService = new DetailService();
	private TravelService travelService = new TravelService();
	private ItemService itemService = new ItemService();
	String test;
	List<DetailBean> result;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String prodaction = req.getParameter("prodaction");
		String tra_no = req.getParameter("tra_no");
		String can_detNo = req.getParameter("can_detNo");    //點選取消的明細流水號
		String doInsert = req.getParameter("doInsert");
		String tag = req.getParameter("detailTag");    //顯示10 20 50 100筆資料的控制
		if(tag == null || tag.length() ==0){           //初始預設為10
			tag = "10";
		}
		int intTag = Integer.parseInt(tag);
		String view = req.getParameter("selectTable");          //顯示全部 已報名 已取消過濾器
		int Count = detailService.selectDatailCount(tra_no);    //資料總筆數
		
		TravelVO traVO = travelService.Count(tra_no);           //查看此行程是否已過期，已過期無法取消編輯新增

		String excel = req.getParameter("excel");
		
		DetailBean bean = new DetailBean();
		TravelVO travelVO = new TravelVO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		bean.setTra_NO(tra_no);
		result = detailService.select(bean, 1, 10);    //初次進入頁面時，顯示第1~10筆的資料
		String page = req.getParameter("detailPage");
		
		HttpSession session = req.getSession();
		session.removeAttribute("DetCanError");

		// 點選匯出Excel動作(全部)
		if ("全部資料".equals(excel)) {
			bean.setTra_NO(tra_no);
			List<DetailBean> dResult = detailService.selectExcel(bean);
			int count = dResult.size();
			String[] exDetNo = new String[count];
			String[] exEmpNo = new String[count];
			String[] exFamNo = new String[count];
			String[] exRel = new String[count];
			String[] exName = new String[count];
			String[] exSex = new String[count];
			String[] exID = new String[count];
			String[] exBDate = new String[count];
			String[] exPhone = new String[count];
			String[] exEat = new String[count];
			String[] exCar = new String[count];
			String[] exFamBaby = new String[count];
			String[] exFamKid = new String[count];
			String[] exFamDis = new String[count];
			String[] exFamMom = new String[count];
			String[] exBen = new String[count];
			String[] exBenRel = new String[count];
			String[] exEmg = new String[count];
			String[] exEmgPhone = new String[count];
			String[] exDetDate = new String[count];
			String[] exDetCanDate = new String[count];
			String[] exNote = new String[count];
			String[] exDetCanNote = new String[count];
			File dir = new File("C:/detail");
			Excel ex = new Excel(dir);
			for (int i = 0; i < count; i++) {
				exDetNo[i] = dResult.get(i).getDet_No() + "";
				exEmpNo[i] = dResult.get(i).getEmp_No() + "";
				exFamNo[i] = dResult.get(i).getFam_No() + "";
				exRel[i] = dResult.get(i).getRel();
				exName[i] = dResult.get(i).getName();
				exSex[i] = dResult.get(i).getSex();
				exID[i] = dResult.get(i).getID();
				exBDate[i] = dResult.get(i).getBdate() + "";
				exPhone[i] = dResult.get(i).getPhone();
				exEat[i] = dResult.get(i).getEat();
				exCar[i] = dResult.get(i).getCar() + "";
				exFamBaby[i] = dResult.get(i).getFam_Bady() + "";
				exFamKid[i] = dResult.get(i).getFam_kid() + "";
				exFamDis[i] = dResult.get(i).getFam_Dis() + "";
				exFamMom[i] = dResult.get(i).getFam_Mom() + "";
				exBen[i] = dResult.get(i).getBen();
				exBenRel[i] = dResult.get(i).getBenRel();
				exEmg[i] = dResult.get(i).getEmg();
				exEmgPhone[i] = dResult.get(i).getEmgPhone();
				exDetDate[i] = dResult.get(i).getDet_Date();
				exDetCanDate[i] = dResult.get(i).getDet_CanDate();
				exNote[i] = dResult.get(i).getNote();
				exDetCanNote[i] = dResult.get(i).getDet_canNote();
			}
			ex.detailExcel(count, exDetNo, bean.getTra_NO(), exEmpNo, exFamNo, exRel, exName, exSex, exID, exBDate,
					exPhone, exEat, exCar, exFamBaby, exFamKid, exFamDis, exFamMom, exBen, exBenRel, exEmg, exEmgPhone,
					exDetDate, exDetCanDate, exNote, exDetCanNote,excel);
			req.getRequestDispatcher("/File_Detail.jsp").forward(req, resp);
			return;
			
		}

		// 點選匯出Excel動作(已報名)
		if ("已報名".equals(excel)) {
			bean.setTra_NO(tra_no);
			List<DetailBean> dResult = detailService.selectExcel2(bean);
			int count = dResult.size();
			String[] exDetNo = new String[count];
			String[] exEmpNo = new String[count];
			String[] exFamNo = new String[count];
			String[] exRel = new String[count];
			String[] exName = new String[count];
			String[] exSex = new String[count];
			String[] exID = new String[count];
			String[] exBDate = new String[count];
			String[] exPhone = new String[count];
			String[] exEat = new String[count];
			String[] exCar = new String[count];
			String[] exFamBaby = new String[count];
			String[] exFamKid = new String[count];
			String[] exFamDis = new String[count];
			String[] exFamMom = new String[count];
			String[] exBen = new String[count];
			String[] exBenRel = new String[count];
			String[] exEmg = new String[count];
			String[] exEmgPhone = new String[count];
			String[] exDetDate = new String[count];
			String[] exDetCanDate = new String[count];
			String[] exNote = new String[count];
			String[] exDetCanNote = new String[count];
			File dir = new File("C:/detail");
			Excel ex = new Excel(dir);
			for (int i = 0; i < count; i++) {
				exDetNo[i] = dResult.get(i).getDet_No() + "";
				exEmpNo[i] = dResult.get(i).getEmp_No() + "";
				exFamNo[i] = dResult.get(i).getFam_No() + "";
				exRel[i] = dResult.get(i).getRel();
				exName[i] = dResult.get(i).getName();
				exSex[i] = dResult.get(i).getSex();
				exID[i] = dResult.get(i).getID();
				exBDate[i] = dResult.get(i).getBdate() + "";
				exPhone[i] = dResult.get(i).getPhone();
				exEat[i] = dResult.get(i).getEat();
				exCar[i] = dResult.get(i).getCar() + "";
				exFamBaby[i] = dResult.get(i).getFam_Bady() + "";
				exFamKid[i] = dResult.get(i).getFam_kid() + "";
				exFamDis[i] = dResult.get(i).getFam_Dis() + "";
				exFamMom[i] = dResult.get(i).getFam_Mom() + "";
				exBen[i] = dResult.get(i).getBen();
				exBenRel[i] = dResult.get(i).getBenRel();
				exEmg[i] = dResult.get(i).getEmg();
				exEmgPhone[i] = dResult.get(i).getEmgPhone();
				exDetDate[i] = dResult.get(i).getDet_Date();
				exDetCanDate[i] = dResult.get(i).getDet_CanDate();
				exNote[i] = dResult.get(i).getNote();
				exDetCanNote[i] = dResult.get(i).getDet_canNote();
			}
			ex.detailExcel(count, exDetNo, bean.getTra_NO(), exEmpNo, exFamNo, exRel, exName, exSex, exID, exBDate,
					exPhone, exEat, exCar, exFamBaby, exFamKid, exFamDis, exFamMom, exBen, exBenRel, exEmg, exEmgPhone,
					exDetDate, exDetCanDate, exNote, exDetCanNote,excel);
			req.getRequestDispatcher("/File_Detail.jsp").forward(req, resp);
			return;
			
		}
		// 點選匯出Excel動作(已取消)
		if ("已取消".equals(excel)) {
			bean.setTra_NO(tra_no);
			List<DetailBean> dResult = detailService.selectExcel3(bean);
			int count = dResult.size();
			String[] exDetNo = new String[count];
			String[] exEmpNo = new String[count];
			String[] exFamNo = new String[count];
			String[] exRel = new String[count];
			String[] exName = new String[count];
			String[] exSex = new String[count];
			String[] exID = new String[count];
			String[] exBDate = new String[count];
			String[] exPhone = new String[count];
			String[] exEat = new String[count];
			String[] exCar = new String[count];
			String[] exFamBaby = new String[count];
			String[] exFamKid = new String[count];
			String[] exFamDis = new String[count];
			String[] exFamMom = new String[count];
			String[] exBen = new String[count];
			String[] exBenRel = new String[count];
			String[] exEmg = new String[count];
			String[] exEmgPhone = new String[count];
			String[] exDetDate = new String[count];
			String[] exDetCanDate = new String[count];
			String[] exNote = new String[count];
			String[] exDetCanNote = new String[count];
			File dir = new File("C:/detail");
			Excel ex = new Excel(dir);
			for (int i = 0; i < count; i++) {
				exDetNo[i] = dResult.get(i).getDet_No() + "";
				exEmpNo[i] = dResult.get(i).getEmp_No() + "";
				exFamNo[i] = dResult.get(i).getFam_No() + "";
				exRel[i] = dResult.get(i).getRel();
				exName[i] = dResult.get(i).getName();
				exSex[i] = dResult.get(i).getSex();
				exID[i] = dResult.get(i).getID();
				exBDate[i] = dResult.get(i).getBdate() + "";
				exPhone[i] = dResult.get(i).getPhone();
				exEat[i] = dResult.get(i).getEat();
				exCar[i] = dResult.get(i).getCar() + "";
				exFamBaby[i] = dResult.get(i).getFam_Bady() + "";
				exFamKid[i] = dResult.get(i).getFam_kid() + "";
				exFamDis[i] = dResult.get(i).getFam_Dis() + "";
				exFamMom[i] = dResult.get(i).getFam_Mom() + "";
				exBen[i] = dResult.get(i).getBen();
				exBenRel[i] = dResult.get(i).getBenRel();
				exEmg[i] = dResult.get(i).getEmg();
				exEmgPhone[i] = dResult.get(i).getEmgPhone();
				exDetDate[i] = dResult.get(i).getDet_Date();
				exDetCanDate[i] = dResult.get(i).getDet_CanDate();
				exNote[i] = dResult.get(i).getNote();
				exDetCanNote[i] = dResult.get(i).getDet_canNote();
			}
			ex.detailExcel(count, exDetNo, bean.getTra_NO(), exEmpNo, exFamNo, exRel, exName, exSex, exID, exBDate,
					exPhone, exEat, exCar, exFamBaby, exFamKid, exFamDis, exFamMom, exBen, exBenRel, exEmg, exEmgPhone,
					exDetDate, exDetCanDate, exNote, exDetCanNote,excel);
			req.getRequestDispatcher("/File_Detail.jsp").forward(req, resp);
			return;
			
		}
		
		List<ItemVO> itemVO = null;
		List<ItemVO> room = null;
		//新增動作
		if ("insert".equals(prodaction) || ("1").equals(doInsert)) {
			Long tra_No = Long.parseLong(tra_no);
			travelVO = detailService.Count(tra_no);
			if (travelVO != null) {
				if (travelVO.getTra_Total() > detailService.tra_count(tra_No) || ("1").equals(doInsert)) {
					room = itemService.getRoomMoney(tra_No);
					itemVO = itemService.getFareMoney(tra_No);
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
				resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_no);
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
				req.setAttribute("det_canTraNo", det_canTraNo);
				req.getRequestDispatcher("/Detail_CanSuccess.jsp").forward(req, resp);
				return;
			} else {
				session.setAttribute("DetCanError", "必須輸入取消原因！");
				req.getRequestDispatcher("/Detail_Cancel.jsp").forward(req, resp);
				return;
			}
		}

		//儲存動作
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
			//儲存家屬&親友
			if (!rel.equals("員工")) {
				try {
					String temp_FamNo = req.getParameter("fam_No");
					String car = req.getParameter("car");
					String spe = req.getParameter("text_multiselect");
					int fam_No = Integer.parseInt(temp_FamNo);
					if (name.contains("/") || name.trim().length() == 0 || name == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben.trim().length() == 0 || ben == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben_Rel.trim().length() == 0 || ben_Rel == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (emg.trim().length() == 0 || emg == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (!Phone.matches("^[09][0-9]{9}")) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (!detailService.isValidTWPID(ID)) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (sex.equals("男") && !ID.substring(1, 2).equals("1")) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (sex.equals("女") && !ID.substring(1, 2).equals("2")) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (detailService.selectSameId2(ID, fam_No, emp_No) != null) {
						session.setAttribute("CanError", "身份證字號重複！");
					}else {
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
					session.setAttribute("CanError", "儲存失敗！");
				}
				resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_no);
				return;
				//儲存員工資料，無親屬編號、特殊身分、車位欄位
			} else {
				try {
					if (name.contains("/") || name.trim().length() == 0 || name == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben.trim().length() == 0 || ben == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (ben_Rel.trim().length() == 0 || ben_Rel == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (emg.trim().length() == 0 || emg == null) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (!Phone.matches("^[09][0-9]{9}")) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (!detailService.isValidTWPID(ID)) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (sex.equals("男") && !ID.substring(1, 2).equals("1")) {
						session.setAttribute("CanError", "儲存失敗！");
					} else if (sex.equals("女") && !ID.substring(1, 2).equals("2")) {
						session.setAttribute("CanError", "儲存失敗！");
					}else {
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
					session.setAttribute("CanError", "儲存失敗！");
				}
			}
			resp.sendRedirect("/GSStravel/detail?tra_no=" + tra_no);
			return;
		}

		//當點選上方過濾器or下方頁碼時觸發動作
		if(view != null && view.length() != 0){
			if(view.equals("已取消")){
				result = detailService.selectCan(bean,1,intTag);
				Count = detailService.selectDetail_by_Tra_No_Can(tra_no);
				if(page != null && page.length() != 0){
					int intPage = Integer.parseInt(page);
					result = detailService.selectCan(bean, intPage*intTag-(intTag-1), intPage*intTag);
					view = "已取消";
				}
			}else if(view.equals("已報名")){
				result = detailService.selectNotCan(bean,1,intTag);
				Count = detailService.selectDetail_by_Tra_No(tra_no);
				if(page != null && page.length() != 0){
					int intPage = Integer.parseInt(page);
					result = detailService.selectNotCan(bean, intPage*intTag-(intTag-1), intPage*intTag);
					view = "已報名";
				}
			}else if(view.equals("顯示全部")){
				result = detailService.select(bean, 1, intTag);
				Count = detailService.selectDatailCount(tra_no);
				if(page != null && page.length() != 0){
					int intPage = Integer.parseInt(page);
					result = detailService.select(bean, intPage*intTag-(intTag-1), intPage*intTag);
					view = "顯示全部";
				}
			}
		}
		
		req.setAttribute("select", result);
		req.setAttribute("view", view);
		req.setAttribute("tag", tag);
		req.setAttribute("traVO", traVO);
		req.setAttribute("Count", Count);
		req.getRequestDispatcher("/Detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
