package com.toy.spring.model;

public class UserDto {
	private String userid;
	private String userpwd;
	private String username;
	private String useremail;
	private String joindate;
	private String status;
	public UserDto() {}
	public UserDto(String userid, String userpwd, String username, String useremail, String joindate, String status) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.useremail = useremail;
		this.joindate = joindate;
		this.status = status;
	}
	@Override
	public String toString() {
		return "UserDto [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", useremail="
				+ useremail + ", joindate=" + joindate + ", status=" + status + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
