package com.dm.questionsurvey.model;

import java.util.Date;

/**
 * 问卷调查实体类
 * @author Lenovo
 *
 */
public class QuestionnaireSuvery {
    private String id;

    private String title;
    
    private String email;

    private String type;

    private String weibanju;

    private String fundes;
    
    private String ip;
    
    private Date date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getWeibanju() {
        return weibanju;
    }

    public void setWeibanju(String weibanju) {
        this.weibanju = weibanju == null ? null : weibanju.trim();
    }

    public String getFundes() {
        return fundes;
    }

    public void setFundes(String fundes) {
        this.fundes = fundes == null ? null : fundes.trim();
    }

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
    
    
}