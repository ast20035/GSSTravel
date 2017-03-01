package model;

import java.util.List;

public interface IQandADAO {
	public List<QandAVO> selectALL();
	public boolean insertQuestion(QandAVO bean);
	public QandAVO getALL(int qa_No);
}
