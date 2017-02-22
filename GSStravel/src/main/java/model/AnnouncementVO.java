package model;

import java.util.Date;

public class AnnouncementVO {
	private int anno_No;
	private String anno_Title;
	private Date anno_Time;
	private String anno_Content;

	public int getAnno_No() {
		return anno_No;
	}

	public void setAnno_No(int anno_No) {
		this.anno_No = anno_No;
	}

	public String getAnno_Title() {
		return anno_Title;
	}

	public void setAnno_Title(String anno_Title) {
		this.anno_Title = anno_Title;
	}

	public Date getAnno_Time() {
		return anno_Time;
	}

	public void setAnno_Time(Date anno_Time) {
		this.anno_Time = anno_Time;
	}

	public String getAnno_Content() {
		return anno_Content;
	}

	public void setAnno_Content(String anno_Content) {
		this.anno_Content = anno_Content;
	}

}
