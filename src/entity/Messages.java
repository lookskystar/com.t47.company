package entity;

import java.util.*;

/**
 * ���Ա�
 * @author Administrator
 *
 */
public class Messages {
	private int messagesId; //����Id
	private String title; //���Ա���
	private String content; //��������
	private int uId; //������Id
	private Date publishTime; //����ʱ��
	private int count; //�ظ����� 

	public Messages() {
		super();
	}

	public Messages(int messagesId, String title, String content, int id,
			Date publishTime, int count) {
		super();
		this.messagesId = messagesId;
		this.title = title;
		this.content = content;
		uId = id;
		this.publishTime = publishTime;
		this.count = count;
	}

	public int getMessagesId() {
		return messagesId;
	}

	public void setMessagesId(int messagesId) {
		this.messagesId = messagesId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
