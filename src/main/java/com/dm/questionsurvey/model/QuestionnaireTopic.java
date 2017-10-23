package com.dm.questionsurvey.model;

import java.util.ArrayList;
import java.util.List;

/**
 *问卷名称一级标题对应的实体类
 *question_topic
 * @author Lenovo
 *
 */
public class QuestionnaireTopic {
	private String topicId;
	private String questionId;
	private String topicName;
	private String topicType;
	private String topicSort;
	private String ifnecessary;
	
	QuestionnaireName questionName;
	QuestionnaireOption option;
	List<QuestionnaireOption> options;
	public String getTopicId() {
		return topicId;
	}
	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	public QuestionnaireName getQuestionName() {
		return questionName;
	}
	public void setQuestionName(QuestionnaireName questionName) {
		this.questionName = questionName;
	}
	public String getTopicType() {
		return topicType;
	}
	public void setTopicType(String topicType) {
		this.topicType = topicType;
	}
	public QuestionnaireOption getOption() {
		return option;
	}
	public void setOption(QuestionnaireOption option) {
		this.option = option;
	}
	public String getIfnecessary() {
		return ifnecessary;
	}
	public void setIfnecessary(String ifnecessary) {
		this.ifnecessary = ifnecessary;
	}
	public List<QuestionnaireOption> getOptions() {
		return options;
	}
	public void setOptions(List<QuestionnaireOption> options) {
		this.options = options;
	}
	public String getTopicSort() {
		return topicSort;
	}
	public void setTopicSort(String topicSort) {
		this.topicSort = topicSort;
	}
	
	

}
