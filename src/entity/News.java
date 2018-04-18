package entity;

import java.util.Date;

/**
 * ����
 * @author Administrator
 *
 */
public class News {
	private int newsId;   //����Id
	private String title;   //���ű���
	private String content;   //��������
	private Date publishTime;  //����ʱ��
	
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	public News(int newsId, String title, String content, Date publishTime) {
		super();
		this.newsId = newsId;
		this.title = title;
		this.content = content;
		this.publishTime = publishTime;
	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
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

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	
	
	

}
