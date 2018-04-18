package entity;
//主题类，继承tip类
public class Topic extends Tip {
private int topicId=1;   //唯一标志主题id
private int boardId=1;  //引用板块id，用来表示该帖子是那个板块的
private int tClickCount=0;  //点击次数
//无参的构造方法
public Topic() {
	super();
    //System.out.println("主题类无参数的构造方法");
}

public Topic(int topicId, int boardId, int checkNumber) {
	super();
	this.topicId = topicId;
	this.boardId = boardId;
	this.tClickCount = checkNumber;
}



public int getTopicId() {
	return topicId;
}
public void setTopicId(int topicId) {
	this.topicId = topicId;
}
public int getBoardId() {
	return boardId;
}
public void setBoardId(int boardId) {
	this.boardId = boardId;
}
public int getTClickCount() {
	return tClickCount;
}

public void setTClickCount(int clickCount) {
	tClickCount = clickCount;
}

//输出当前主题信息（多态）
public  void getInfo() {
	//System.out.println("==主题信息==");
	//System.out.println("主题标题："+this.getTitle());
	//System.out.println("主题内容"+this.getContent());
	//System.out.println("发表时间"+this.getPublisTime()+"\n");	
}

}
