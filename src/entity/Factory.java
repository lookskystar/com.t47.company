package entity;

/**
 * ��������
 * @author Administrator
 *
 */
public class Factory {
	private int factoryID; //����Id
	private String factoryName;   //������
	private String link;   //��ϵ��ʽ:�绰
	private String linkman; //��ϵ��
	private String Paddress; //��ַ
	private String remark;   //��ע
	
	public Factory() {
		super();
	}

	public Factory(int factoryID, String factoryName, String link,
			String linkman, String paddress, String remark) {
		super();
		this.factoryID = factoryID;
		this.factoryName = factoryName;
		this.link = link;
		this.linkman = linkman;
		Paddress = paddress;
		this.remark = remark;
	}

	public int getFactoryID() {
		return factoryID;
	}

	public void setFactoryID(int factoryID) {
		this.factoryID = factoryID;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getPaddress() {
		return Paddress;
	}

	public void setPaddress(String paddress) {
		Paddress = paddress;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	

}
