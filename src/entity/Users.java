package entity;

/*
 * 用户表实体类
 */
public class Users {
	private int userID;         //用户ID
	private String userName;    //用户名
	private String passwords;   //用户密码
	private int status;         //用户权限0-3
	
	//无参数的构造函数
	public Users() {
		super();
	} 
	//带参数构造函数
	public Users(int userID, String userName, String passwords, int status) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.passwords = passwords;
		this.status = status;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPasswords() {
		return passwords;
	}
	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}


