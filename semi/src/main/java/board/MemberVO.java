package board;

import java.sql.Date;

public class MemberVO {
	
	private int id;
	private String name;
	private String main;
	private Date date;

	
	public MemberVO() {
		System.out.println("MemberVO 생성자 호출");
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getMain() {
		return main;
	}


	public void setMain(String main) {
		this.main = main;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}
	
}




