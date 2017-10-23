package com.dm.questionsurvey.model;

import java.util.Date;

import javax.persistence.Column;

public class AnswerName {
	private String id;
	private String topicId;
	private String optionId;
	private Date reportTime;
	
	QuestionnaireData questionnaireData;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public String getOptionId() {
		return optionId;
	}

	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}
	public Date getReportTime() {
		return reportTime;
	}

	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}

	public QuestionnaireData getQuestionnaireData() {
		return questionnaireData;
	}

	public void setQuestionnaireData(QuestionnaireData questionnaireData) {
		this.questionnaireData = questionnaireData;
	}
	
	
	
	
}
