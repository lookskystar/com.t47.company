package entity;

import java.util.Date;

/**
 * �ظ�
 * @author Administrator
 *
 */
public class Reverts {
	private int revertId;   //�ظ�ID
	private int messagesId;     //����Id
	private String content;     //�ظ�����
	private int uId;        //�ظ���Id
	private Date publishTime;  //�ظ�ʱ��
	
	public Reverts() {
		super();
	}

	public Reverts(int revertId, int messagesId, String content, int id,
			Date publishTime) {
		super();
		this.revertId = revertId;
		this.messagesId = messagesId;
		this.content = content;
		uId = id;
		this.publishTime = publishTime;
	}

	public int getRevertId() {
		return revertId;
	}

	public void setRevertId(int revertId) {
		this.revertId = revertId;
	}

	public int getMessagesId() {
		return messagesId;
	}

	public void setMessagesId(int messagesId) {
		this.messagesId = messagesId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUId() {
		return uId;
	}

	public void setUId(int id) {
		uId = id;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	
	
	
	

}
