package entity;

import java.util.Date;

/**
 * ��Ա��Ϣ
 * @author Administrator
 *
 */
public class User {
	private int uId;    //��ԱId
	private String uNumber;  //��Ա���
	private String uName;    //��Ա����
	private String uIdentification; //֤��Id
	private String uPass;  //����
	private String head;  //ͷ����
	private Date regTime; //ע��ʱ��
	private int uGender;  //�Ա�0Ů��1��
	private String uLink;  //��ϵ��ʽ
	private String uAaddress;  //��ַ
	private float uTotalprices;  //�����ܶ�
	private int uIntegration;  //����
	private String uRemark;  //��ַ
	private String Email;    //�����ʼ�
	
	public User() {
		super();
	}

	public User(int id, String number, String name, String identification,
			String pass, String head, Date regTime, int gender, String link,
			String aaddress, float totalprices, int integration, String remark,String Email) {
		super();
		this.uId = id;
		this.uNumber = number;
		this.uName = name;
		this.uIdentification = identification;
		this.uPass = pass;
		this.head = head;
		this.regTime = regTime;
		this.uGender = gender;
		this.uLink = link;
		this.uAaddress = aaddress;
		this.uTotalprices = totalprices;
		this.uIntegration = integration;
		this.uRemark = remark;
		this.Email=Email;
	}

	public int getUId() {
		return uId;
	}

	public void setUId(int id) {
		uId = id;
	}

	public String getUNumber() {
		return uNumber;
	}

	public void setUNumber(String number) {
		uNumber = number;
	}

	public String getUName() {
		return uName;
	}

	public void setUName(String name) {
		uName = name;
	}

	public String getUIdentification() {
		return uIdentification;
	}

	public void setUIdentification(String identification) {
		uIdentification = identification;
	}

	public String getUPass() {
		return uPass;
	}

	public void setUPass(String pass) {
		uPass = pass;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public int getUGender() {
		return uGender;
	}

	public void setUGender(int gender) {
		uGender = gender;
	}

	public String getULink() {
		return uLink;
	}

	public void setULink(String link) {
		uLink = link;
	}

	public String getUAaddress() {
		return uAaddress;
	}

	public void setUAaddress(String aaddress) {
		uAaddress = aaddress;
	}

	public float getUTotalprices() {
		return uTotalprices;
	}

	public void setUTotalprices(float totalprices) {
		uTotalprices = totalprices;
	}

	public int getUIntegration() {
		return uIntegration;
	}

	public void setUIntegration(int integration) {
		uIntegration = integration;
	}

	public String getURemark() {
		return uRemark;
	}

	public void setURemark(String remark) {
		uRemark = remark;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}
	
	
	
	
	
	

}
