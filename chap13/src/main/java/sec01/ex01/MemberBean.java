package sec01.ex01;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberBean {
	private Integer num_id;
	private String name;
	private String pwd;
	private Date joinDate;
	
	public MemberBean() {
		
	}
	
	public MemberBean(String name,String pwd) {
		this.name = name;
		this.pwd = pwd;


	}

	public Integer getNum_id() {
		return num_id;
	}

	public void setNum_id(Integer num_id) {
		this.num_id = num_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	




}
