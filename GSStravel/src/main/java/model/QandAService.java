package model;

import java.util.List;

public class QandAService {
	IQandADAO qaDAO=new QandADAO();
	public List<QandAVO> selectALL(String prodaction){
		return qaDAO.selectALL(prodaction);
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
	public boolean deleteOne(int qa_No){
		return qaDAO.deleteOne(qa_No);
	}
	public boolean delete(String prodaction){
		return qaDAO.delete(prodaction);
	}
}
