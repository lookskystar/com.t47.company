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

//�����ǰ������Ϣ����̬��
public  void getInfo() {
	//System.out.println("==�ظ���Ϣ==");
	//System.out.println("�ظ����⣺"+this.getTitle());
	//System.out.println("�ظ�����"+this.getContent());
	//System.out.println("�ظ�ʱ��"+this.getPublisTime()+"\n");	
}
}
