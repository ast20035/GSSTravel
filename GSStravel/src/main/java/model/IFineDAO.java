package model;

import java.util.List;

public interface IFineDAO {
	public List<FineVO> select();
	
	public float selectPercent(int fineDate);

	public void insert(FineVO bean);
	
	public void delete(int day);
}
