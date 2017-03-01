package model;

import java.sql.Timestamp;

public class AnnouncementVO {
	private String anno_Time;
	private String anno_Title;
	private String anno_Content;
	private String anno_Important;

	public String getAnno_Time() {
		return anno_Time;
	}

	public void setAnno_Time(String anno_Time) {
		this.anno_Time = anno_Time;
	}

	public String getAnno_Title() {
		return anno_Title;
	}

	public void setAnno_Title(String anno_Title) {
		this.anno_Title = anno_Title;
	}

	public String getAnno_Content() {
		return anno_Content;
	}

	public void setAnno_Content(String anno_Content) {
		this.anno_Content = anno_Content;
	}

	public String getAnno_Important() {
		return anno_Important;
	}

	public void setAnno_Important(String anno_Important) {
		this.anno_Important = anno_Important;
	}

}
