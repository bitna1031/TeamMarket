package kr.co.domain;

public class LoginDTO{

	
	private String userId;
	private String userName;
	private String userPw;
	
	public LoginDTO() {
		// TODO Auto-generated constructor stub
	}


	public LoginDTO(String userId, String userName, String userPw) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPw = userPw;
	}
	
	

	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getuserName() {
		return userName;
	}

	public void setuserName(String userName) {
		this.userName = userName;
	}


}
