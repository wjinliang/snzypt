package com.dm.example.controller;

import com.dm.example.dto.JstreeNode;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cgj on 2015/12/13.
 */
@Controller @RequestMapping("/jstree") public class JstreeDemoController {
    @RequestMapping("/page") public String page(Model model) {
        return "demo/jstree/page";
    }

    @RequestMapping(value = "/json", method = RequestMethod.GET) @ResponseBody
    public Object json(HttpServletRequest httpServletRequest,
        @RequestParam(value = "parent", required = false) String parent) {
        String baseDir = "/";
        if (StringUtils.isNotBlank(parent)) {
            parent = parent.equals("#") ? "" : parent;
            baseDir += parent;
        }
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(baseDir);
        List<JstreeNode> list = new ArrayList<>();
        File file = new File(wholeRealPath);
        if (file.isDirectory()) {
            File[] subFiles = file.listFiles();
            if (subFiles.length > 0) {
                for (File subFile : subFiles) {
                    JstreeNode jstreeNode = new JstreeNode(subFile,parent,"dmbase");
                    list.add(jstreeNode);
                }
            }
        }
        return list;
    }
}

