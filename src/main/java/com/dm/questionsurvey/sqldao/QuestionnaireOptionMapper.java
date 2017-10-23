package com.dm.questionsurvey.sqldao;

import java.util.List;

import com.dm.questionsurvey.model.QuestionnaireOption;

public interface QuestionnaireOptionMapper {
	
	int insert(QuestionnaireOption questionnaireOption);
	
	/**根据题目id查询相关的选项信息*/
	List<QuestionnaireOption> findByQuestiontopicId(String id);
	
	String selectByOptionId(String id);
	
	
	void  deletyByTopicId(String id);

	

}