package model;

import java.util.List;

public class QandAService {
	IQandADAO qaDAO=new QandADAO();
	public List<QandAVO> selectALL(){
		return qaDAO.selectALL();
	}
	public boolean insertQuestion(QandAVO bean){
		return qaDAO.insertQuestion(bean);
	}
	public QandAVO getALL(int qa_No){
		return qaDAO.getALL(qa_No);
	}
	public boolean insertAnswer(QandAVO bean){
		return qaDAO.insertAnswer(bean);
	}
}
