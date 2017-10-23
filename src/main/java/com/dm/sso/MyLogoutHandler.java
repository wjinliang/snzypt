package com.dm.sso;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;

public class MyLogoutHandler implements LogoutHandler {

    public MyLogoutHandler() {
    }

    @SuppressWarnings({"unchecked", "rawtypes"}) @Override
    public void logout(HttpServletRequest request, HttpServletResponse response,
        Authentication authentication) {
        // TODO Auto-generated method stub
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            response.setHeader("Content-Type", "application/json;charset=UTF-8");
request.getSession().removeAttribute("USER_KEY_SESSON");
            JsonGenerator jsonGenerator = objectMapper.getJsonFactory()
                .createJsonGenerator(response.getOutputStream(), JsonEncoding.UTF8);
            // 成功为0
            Map map = new HashMap();
            map.put("status", 1);
            map.put("msg", "logout success!");
            JSONObject jsonData = JSONObject.fromObject(map);
            objectMapper.writeValue(jsonGenerator, jsonData);
        } catch (JsonProcessingException ex) {
            throw new HttpMessageNotWritableException("Could not write JSON: " + ex.getMessage(),
                ex);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
