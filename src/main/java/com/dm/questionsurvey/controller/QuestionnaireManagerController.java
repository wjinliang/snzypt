package com.dm.questionsurvey.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.platform.util.UUIDUtils;
import com.dm.questionsurvey.model.AnswerName;
import com.dm.questionsurvey.model.QuestionnaireData;
import com.dm.questionsurvey.model.QuestionnaireName;
import com.dm.questionsurvey.model.QuestionnaireOption;
import com.dm.questionsurvey.model.QuestionnaireTopic;
import com.dm.questionsurvey.service.AnswerNameService;
import com.dm.questionsurvey.service.QuestionnaireDataService;
import com.dm.questionsurvey.service.QuestionnaireNameService;
import com.dm.questionsurvey.service.QuestionnaireOptionService;
import com.dm.questionsurvey.service.QuestionnaireTopicService;
import com.dm.questionsurvey.util.IpUtil;
import com.github.pagehelper.PageInfo;


/**
 * 问卷管理模块
 * @author zpp
 * 
 *
 */
@Controller
@RequestMapping("/questionManager")
public class QuestionnaireManagerController {
	@Autowired
	QuestionnaireNameService questionnaireNameService;
	@Autowired
	QuestionnaireTopicService questionnaireTopicService;
	@Autowired
	QuestionnaireOptionService questionnaireOptionService;
	@Autowired
	AnswerNameService answerNameService;
	@Autowired
	QuestionnaireDataService questionnaireDataService;
	
	@RequestMapping("/page")
	public String list(){
		return "/app/questionsurvey/qmPage";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object list(
			QuestionnaireName questionName,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize) {
		Map map = new SqlParam<QuestionnaireName>().autoParam(questionName,null);
		map.put("model", questionName);
		PageInfo<QuestionnaireName> page = questionnaireNameService.findQuestionNameByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	/**
	 * 添加相关的问卷调查管理信息
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView addQuestionnarieManage(){
		ModelAndView model=new ModelAndView();
		model.setViewName("app/questionsurvey/add");
		return model;
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object saveQuestionnarieManage(HttpServletRequest req,QuestionnaireName questionName){
		String uuid=UUIDUtils.getUUID8();
		questionName.setId(uuid);
		questionName.setDate(new Date());
		questionnaireNameService.save(questionName);
		int i=0;
		if(questionName.getQuestionTopicList() != null){
			for(QuestionnaireTopic t:questionName.getQuestionTopicList()){
				if(t.getTopicName()!=null && !"".equals(t.getTopicName())){
					QuestionnaireTopic topic=new QuestionnaireTopic();
					String topicId=UUIDUtils.getUUID8();
					topic.setTopicId(topicId);
					topic.setQuestionId(uuid);
					topic.setTopicName(t.getTopicName());
					topic.setTopicType(t.getTopicType());
					topic.setTopicSort(String.valueOf(i));
					if(t.getIfnecessary()!=null)	topic.setIfnecessary(t.getIfnecessary());
					else 	topic.setIfnecessary("0");
					questionnaireTopicService.save(topic);
					String[] optins = req.getParameterValues("optiontt"+i);
					if(optins !=null && optins.length>0){
						for(String o :optins){
							QuestionnaireOption option = new QuestionnaireOption();
							String optionId=UUIDUtils.getUUID8();
							option.setOptionId(optionId);
							option.setTopicId(topicId);
							option.setOptionName(o);
							questionnaireOptionService.save(option);
						}
					}
					i++;
				}
				
			}
		}
		return "添加成功";
	}
	/**
	 * 加载页面相关信息
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/load")
	@ResponseBody
	public Object loadRecontent(Model model,String id)
	{
		return questionnaireNameService.findOne(id);
	}
	
	/**
	 * 保存相关的问卷信息
	 * @param questionnaireData
	 * @param request
	 * @return
	 */
	@RequestMapping("/ajax/tijiaoAnswer")
	@ResponseBody
	public String add(QuestionnaireData questionnaireData,HttpServletRequest request){
		String questionNameId=request.getParameter("questionNameId");
		Date reportTime=new Date();
		//用于存放回答的相关信息
		if(questionnaireData.getAnswereList()!=null){
			List<AnswerName> answerList=questionnaireData.getAnswereList();
			for(AnswerName answerName:answerList){
				String optionIds=answerName.getOptionId();
				if(optionIds!=null){
					String[] options=optionIds.split(",");
					for(String o:options){
						answerName.setId(UUID.randomUUID().toString());
						answerName.setOptionId(o);
						answerName.setTopicId(answerName.getTopicId());
						answerName.setReportTime(reportTime);
						answerNameService.save(answerName);
					}

				}
				
			}
		}
		//用于存放调查问题相关信息
		String questionUUID=UUID.randomUUID().toString();
		questionnaireData.setId(questionUUID);
		questionnaireData.setQuestionId(questionNameId);
		questionnaireData.setReportTime(reportTime);
		questionnaireData.setIp(IpUtil.getIpAddr(request));
		questionnaireDataService.save(questionnaireData);
		return "/template/sn_questionnaire_name";
	}
	
/**
 * 查看问卷选项统计
 */
	@RequestMapping("getOptionStatistics")
	@ResponseBody
	public ModelAndView getOptionStatistics(HttpServletRequest request){
		String questionNameId=request.getParameter("id");
		//根据问卷名称查询相关的topic信息
		List<QuestionnaireTopic> topicList=questionnaireTopicService.findByQuestionId(questionNameId);
		if(topicList!=null && topicList.size()>0){
			for(QuestionnaireTopic t:topicList){
				List<QuestionnaireOption> optionList=questionnaireOptionService.findByQuestionTopicId(t.getTopicId());
				for(QuestionnaireOption options:optionList){
					String percent=answerNameService.getPercent(t.getTopicId(), options.getOptionId());
					String num=answerNameService.getNumber(options.getOptionId());
					options.setNum(num);
					options.setPercent(percent);
				}
				t.setOptions(optionList);
			}
		}
		request.setAttribute("topicList", topicList);
		
		return new ModelAndView("/app/questionsurvey/optionStatistics");
	}
	@RequestMapping("getNameOptions")
	@ResponseBody
	public ModelAndView getNameOptions(HttpServletRequest request){
		String id=request.getParameter("id");
		List<String> list= answerNameService.selectNamesByTopicId(id);
		request.setAttribute("list", list);
		return new ModelAndView("/app/questionsurvey/optionNameOptions");
	}
	/**
	 * 问卷选项比例
	 */
	@RequestMapping("getOptionPercent")
	@ResponseBody
	public List<Map<String,Object>> getOptionPercent(HttpServletRequest request){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		String id=request.getParameter("id");
		List<Map<String,Object>> answerList=answerNameService.selectByTopicId(id);
		Map<String,Object> map=null;
		for (Map<String,Object> a : answerList){
			map = new HashMap<String, Object>();
			String name=questionnaireOptionService.selectByOptionId(String.valueOf(a.get("optionId")));
			map.put("num",a.get("num"));
			map.put("name",name);
			list.add(map);
		}
		return list;
	}
	/**
	 * 删除问卷
	 * @param request
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Map delete(HttpServletRequest request){
		
		String id=request.getParameter("id");
		questionnaireDataService.deleteByQuestionId(id);
		List<QuestionnaireTopic> topicList=questionnaireTopicService.findByQuestionId(id);
		for(QuestionnaireTopic q:topicList){
			questionnaireTopicService.deletyByTopicId(q.getTopicId());
			questionnaireOptionService.deletyByTopicId(q.getTopicId());
			answerNameService.deletyByTopicId(q.getTopicId());
		}
		questionnaireNameService.deleteByPrimaryKey(id);
	
		
		return ResponseUtil.success("操作成功！");
	}
}