package com.dm.questionsurvey.sqldao;

import com.dm.questionsurvey.model.QuestionnaireData;

public interface QuestionnaireDataMapper {

    int insert(QuestionnaireData questionnaireData);
    void deleteByQuestionId(String id);


}