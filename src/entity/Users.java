package entity;

/*
 * �û���ʵ����
 */
public class Users {
	private int userID;         //�û�ID
	private String userName;    //�û���
	private String passwords;   //�û�����
	private int status;         //�û�Ȩ��0-3
	
	//�޲����Ĺ��캯��
	public Users() {
		super();
	} 
	//���������캯��
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


