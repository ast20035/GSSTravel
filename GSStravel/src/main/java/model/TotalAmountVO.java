package model;

public class TotalAmountVO {
	private String tra_No;
	private int emp_No;
	private float ta_Money;
	private boolean yearsub;
	private String thisyear;
	
	public boolean isYearsub() {
		return yearsub;
	}
	public void setYearsub(boolean yearsub) {
		this.yearsub = yearsub;
	}
	public String getThisyear() {
		return thisyear;
	}
	public void setThisyear(String thisyear) {
		this.thisyear = thisyear;
	}
	public String getTra_No() {
		return tra_No;
	}
	public void setTra_No(String tra_No) {
		this.tra_No = tra_No;
	}
	public int getEmp_No() {
		return emp_No;
	}
	public void setEmp_No(int emp_No) {
		this.emp_No = emp_No;
	}
	public float getTa_Money() {
		return ta_Money;
	}
	public void setTa_Money(float ta_Money) {
		this.ta_Money = ta_Money;
	}

}
