package entity;

/**
 * ����Ա
 * @author Administrator
 *
 */
public class Admin {
	private int adminId;    //����ԱId
	private String adminName;  //����Ա��
	private String adminPass;   //����
	private int adminStatus;   //�û�״̬
	
	public Admin() {
		super();
	}

	public Admin(int adminId, String adminName, String adminPass, int adminStatus) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminPass = adminPass;
		this.adminStatus = adminStatus;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	public int getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(int adminStatus) {
		this.adminStatus = adminStatus;
	}
	
	

}
