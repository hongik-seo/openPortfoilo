package com.nanam.boardDB;

import java.sql.Timestamp;

public class Board {

	
	private int qseq;


	private int essay_qseq;    
	
	private int nanam_qseq;   
	private int notice_qseq;   
	private String subject; 
	private String content; 
	private String list;  
	private Timestamp adjustIndate;
	
	
	

	public Board(){}
	
	
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	
	public int getNanam_qseq() {
		return nanam_qseq;
	}


	public void setNanam_qseq(int nanam_qseq) {
		this.nanam_qseq = nanam_qseq;
	}


	public int getNotice_qseq() {
		return notice_qseq;
	}


	public void setNotice_qseq(int notice_qseq) {
		this.notice_qseq = notice_qseq;
	}
	
	public int getEssay_qseq() {
		return essay_qseq;
	}




	public void setEssay_qseq(int essay_qseq) {
		this.essay_qseq = essay_qseq;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}

	public Timestamp getAdjustIndate() {
		return adjustIndate;
	}

	public void setAdjustIndate(Timestamp adjustIndate) {
		this.adjustIndate = adjustIndate;
	}
	
}
