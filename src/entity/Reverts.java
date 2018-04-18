package entity;

import java.util.Date;

/**
 * 回复
 * @author Administrator
 *
 */
public class Reverts {
	private int revertId;   //回复ID
	private int messagesId;     //留言Id
	private String content;     //回复内容
	private int uId;        //回复者Id
	private Date publishTime;  //回复时间
	
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
