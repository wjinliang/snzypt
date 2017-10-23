package com.dm.questionsurvey.model;

import java.util.Date;
import java.util.List;

/**
 * 问卷名称实体类
 * 对应的数据库表为question_name
 * @author zpp
 *
 */
public class QuestionnaireName {
	
	private String id; //问卷id
	private String name;//问卷名称
	private String starttime;//问卷开始时间
	private String endtime;//问卷结束时间
	private Date date;//问卷提交时间
	
	QuestionnaireTopic topic;
	List<QuestionnaireTopic> questionTopicList;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public QuestionnaireTopic getTopic() {
		return topic;
	}
	public void setTopic(QuestionnaireTopic topic) {
		this.topic = topic;
	}
	public List<QuestionnaireTopic> getQuestionTopicList() {
		return questionTopicList;
	}
	public void setQuestionTopicList(List<QuestionnaireTopic> questionTopicList) {
		this.questionTopicList = questionTopicList;
	}
	
	
}
