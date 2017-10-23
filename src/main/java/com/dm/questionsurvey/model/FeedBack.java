package com.dm.questionsurvey.model;

import java.util.Date;

public class FeedBack {
    private String id;

    private String title;
    
    private String funcdesc;

    private String email;

    private String tel;

    private Date date;
    
    private String ip;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFuncdesc() {
        return funcdesc;
    }

    public void setFuncdesc(String funcdesc) {
        this.funcdesc = funcdesc == null ? null : funcdesc.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
    
    
}