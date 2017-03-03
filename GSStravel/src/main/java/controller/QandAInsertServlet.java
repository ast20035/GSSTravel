package controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QandAService;
import model.QandAVO;

@WebServlet("/QandAInsertServlet")
public class QandAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		QandAService QAService =new QandAService();
		Map<String,String> Msg = new HashMap<String, String>();
		request.setAttribute("Msg", Msg);
		String prodaction =request.getParameter("prodaction");
		boolean b;
		//新增詢問
		if("insertQuestion".equals(prodaction)){
			QandAVO bean = new QandAVO();
			String temp= request.getParameter("Question_No");
			String tra_No=request.getParameter("Select");
			String temp2= request.getParameter("radio");
			String Qestion_Title = request.getParameter("Qestion_Title");
			String Qestion_Text = request.getParameter("Qestion_Text");
			int Question_No = Integer.parseInt(temp);
			boolean question_secret=Boolean.parseBoolean(temp2);
			if(Qestion_Title.trim().length()==0){
				Msg.put("message", "詢問標題不可為空值");
				request.getRequestDispatcher("/QandAServlet?prodaction=question&role=false").forward(request, response);
				return;
			}
			if(Qestion_Text.trim().length()==0){
				Msg.put("message", "詢問內容不可為空值");	
				request.getRequestDispatcher("/QandAServlet?prodaction=question&role=false").forward(request, response);
				return;
			}
			bean.setQuestion_No(Question_No);
			bean.setTra_No(tra_No);
			bean.setQuestion_Title(Qestion_Title);
			bean.setQuestion_Text(Qestion_Text);
			bean.setQuestion_secret(question_secret);
			b=QAService.insertQuestion(bean);
			if(b){
				Msg.put("message", "詢問成功，請等候福委會通知");
			}
			else{
				Msg.put("message", "詢問失敗");
			}
			request.getRequestDispatcher("/QandAServlet?role=false").forward(request, response);
			return;
		}
		//新增回應、修改回應
		if("insertAnswer".equals(prodaction)||"updateAnswer".equals(prodaction)){
			QandAVO bean = new QandAVO();
			String temp = request.getParameter("qa_No");
			String temp2= request.getParameter("answer_No");
			String answer_Text=request.getParameter("answer_Text");
			int qa_No=Integer.parseInt(temp);
			int answer_No=Integer.parseInt(temp2);
			if(answer_Text.trim().length()==0){
				Msg.put("message", "回應欄不可為空值");
				request.getRequestDispatcher("/QandAServlet?prodaction=select&role=true&qa_No="+qa_No).forward(request, response);
				return;
			}
			bean.setQa_No(qa_No);
			bean.setAnswer_No(answer_No);
			bean.setAnswer_Text(answer_Text);
			b=QAService.insertAnswer(bean);
			if("insertAnswer".equals(prodaction)){
				if(b){
					Msg.put("message", "回應成功");
				}
				else{
					Msg.put("message", "回應失敗");
				}
			}else{
				if(b){
					Msg.put("message", "修改成功");
				}
				else{
					Msg.put("message", "修改失敗");
				}
			}
		}
		//刪除單筆
		if("deleteOne".equals(prodaction)){
			String temp = request.getParameter("qa_No");
			int qa_No=Integer.parseInt(temp);
			b=QAService.deleteOne(qa_No);
			if(b){
				Msg.put("message", "刪除成功");
			}else{
				Msg.put("message", "刪除失敗");
			}
		}
		//刪除一定時間內的筆數
		if("Years".equals(prodaction)||"9month".equals(prodaction)||"6month".equals(prodaction)||"3month".equals(prodaction)){
			b=QAService.delete(prodaction);
			if(b){
				Msg.put("message", "刪除成功");
			}else{
				Msg.put("message", "刪除失敗");
			}
		}
		request.getRequestDispatcher("/QandAServlet?role="+request.getParameter("role")).forward(request, response);
		return;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
