package model;

import java.util.List;

public interface IQandADAO {
	public List<QandAVO> selectALL(String prodaction , int guestion_Category);
	public boolean insertQuestion(QandAVO bean);
	public QandAVO getALL(int qa_No);
	public boolean insertAnswer(QandAVO bean);
	public boolean deleteOne(int qa_No);
	public boolean delete(String prodaction);
}
