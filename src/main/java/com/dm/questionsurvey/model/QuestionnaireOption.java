package com.dm.questionsurvey.model;
/**
 * 问卷管理中二级选项信息
 * question_option
 * @author Lenovo
 *
 */
public class QuestionnaireOption {
	private String optionId;
	private String topicId;
	private String optionName;
	private String num;
	private String percent;
	QuestionnaireTopic topic;

	public String getOptionId() {
		return optionId;
	}

	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public QuestionnaireTopic getTopic() {
		return topic;
	}

	public void setTopic(QuestionnaireTopic topic) {
		this.topic = topic;
	}
	
	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	
}
