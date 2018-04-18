package entity;

public class Reply extends Tip {
private int replyId=1;
private int topicId=1;
public int getReplyId() {
	return replyId;
}
public void setReplyId(int replyId) {
	this.replyId = replyId;
}
public int getTopicId() {
	return topicId;
}
public void setTopicId(int topicId) {
	this.topicId = topicId;
}

//输出当前主题信息（多态）
public  void getInfo() {
	//System.out.println("==回复信息==");
	//System.out.println("回复标题："+this.getTitle());
	//System.out.println("回复内容"+this.getContent());
	//System.out.println("回复时间"+this.getPublisTime()+"\n");	
}
}
