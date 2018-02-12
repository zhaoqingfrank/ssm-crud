package com.atguigu.crud.bean;

public class Classes {
    private Integer cid;

    private String cname;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

	@Override
	public String toString() {
		return "Classes [cid=" + cid + ", cname=" + cname + "]";
	}

	public Classes(Integer cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
    
    public Classes() {
		// TODO Auto-generated constructor stub
	}
}