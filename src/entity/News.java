package entity;

import java.util.Date;

/**
 * 新闻
 * @author Administrator
 *
 */
public class News {
	private int newsId;   //新闻Id
	private String title;   //新闻标题
	private String content;   //新闻内容
	private Date publishTime;  //发表时间
	
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
