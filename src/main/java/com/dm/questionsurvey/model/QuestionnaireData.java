package com.dm.questionsurvey.model;

import java.util.Date;
import java.util.List;

/**
 * 整体页面中问卷的相关信息
 * @author Lenovo
 *
 */
public class QuestionnaireData {
	private String id;
	private String questionId;
	private Date reportTime;
	private String ip;
	
	AnswerName answere;
	List<AnswerName> answereList;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	
	public Date getReportTime() {
		return reportTime;
	}
	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public AnswerName getAnswere() {
		return answere;
	}
	public void setAnswere(AnswerName answere) {
		this.answere = answere;
	}
	public List<AnswerName> getAnswereList() {
		return answereList;
	}
	public void setAnswereList(List<AnswerName> answereList) {
		this.answereList = answereList;
	}


}
