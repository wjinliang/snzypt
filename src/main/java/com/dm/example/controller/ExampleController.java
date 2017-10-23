package com.dm.example.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.util.DateUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dm.example.model.ExampleEntity;
import com.dm.example.service.ExampleService;
import com.dm.platform.controller.DefaultController;
import com.dm.platform.util.UserAccountUtil;

@Controller @RequestMapping("/example") public class ExampleController extends DefaultController {
    @Resource ExampleService exampleService;

    @RequestMapping("/ajaxExample") public ModelAndView ajaxExample(ModelAndView model) {
        try {
            model.setViewName("/pages/example/ajax_list");
            return Model(model);
        } catch (Exception e) {
            e.printStackTrace();
            return Error(e);
        }
    }

    @RequestMapping("/ajaxList") public @ResponseBody Object ajaxList(HttpServletResponse response,
        @RequestParam(value = "pageNum", required = false) Integer thispage,
        @RequestParam(value = "pageSize", required = false) Integer pagesize,
        @RequestParam(value = "sort", required = false) String sort, ExampleEntity searchEntity)
        throws Exception {
        try {
            if (pagesize == null) {
                pagesize = 10;
            }
            if (thispage == null) {
                thispage = 1;
            }
            Long totalcount = exampleService.count(searchEntity);
            if ((thispage - 1) * pagesize >= totalcount && totalcount > 0) {
                thispage--;
            }
            List<Order> orders = new ArrayList<Order>();
            if (!StringUtils.isEmpty(sort)) {
                if (sort.indexOf("_desc") != -1) {
                    orders.add(new Order(Direction.DESC, sort.replace("_desc", "")));
                } else if (sort.indexOf("_asc") != -1) {
                    orders.add(new Order(Direction.ASC, sort.replace("_asc", "")));
                }
            } else {
                orders.add(new Order(Direction.DESC, "id"));
            }
            List<ExampleEntity> list =
                exampleService.listByPage(searchEntity, thispage - 1, pagesize, orders);
            Map map = new HashMap();
            map.put("data", list);
            map.put("total", totalcount);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return errorJson("异常");
        }
    }

    @RequestMapping("/ajaxLoad") public @ResponseBody Object ajaxLoad(
        @RequestParam(value = "exampleid", required = false) String exampleid) {
        try {
            ExampleEntity ee = new ExampleEntity();
            if (exampleid != null) {
                ee = exampleService.findById(Long.valueOf(exampleid));
            }
            return ee;
        } catch (Exception e) {
            e.printStackTrace();
            return errorJson("异常！");
        }
    }

    @RequestMapping("/ajaxSave") public @ResponseBody Object ajaxSave(ExampleEntity entity) {
        try {
            if (entity.getId() != null && !entity.getId().equals("")) {
                entity.setUpdateTime(DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
                entity.setModifier(UserAccountUtil.getInstance().getCurrentUser());
                exampleService.update(entity);
            } else {
                entity.setCreateTime(DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
                entity.setCreator(UserAccountUtil.getInstance().getCurrentUser());
                entity.setValidFlag("1");
                exampleService.save(entity);
            }
            return successJson();
        } catch (Exception e) {
            e.printStackTrace();
            return errorJson("异常");
        }
    }

    @RequestMapping("/ajaxDelete") public @ResponseBody Object ajaxDelete(
        @RequestParam(value = "exampleid", required = false) String exampleid) throws Exception {
        try {
            if (exampleid != null) {
                String[] ids = exampleid.split(",");
                for (String str : ids) {
                    exampleService.deleteById(Long.valueOf(str));
                }
            }
            return successJson();
        } catch (Exception e) {
            e.printStackTrace();
            return errorJson("异常");
        }
    }

    @RequestMapping("/exampleItems") public @ResponseBody Object exampleItems() throws Exception {
        try {
            List list = new ArrayList();
            Map map = new HashMap();
            map.put("text", "a");
            map.put("value", "4");
            list.add(map);
            Map map2 = new HashMap();
            map2.put("text", "b");
            map2.put("value", "5");
            list.add(map2);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return errorJson("异常");
        }
    }

    @RequestMapping("/checkName") @ResponseBody
    public Object checkDomain(@RequestParam(value = "name", required = false) String name,
        @RequestParam(value = "id", required = false) String id) {
        try {
            Long count = exampleService.checkUnique(name, id);
            if (count.intValue() > 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 分支待开发功能
     */
    public void testBranch() {
        //comment
    }
}
