package entity;
//�����࣬�̳�tip��
public class Topic extends Tip {
private int topicId=1;   //Ψһ��־����id
private int boardId=1;  //���ð��id��������ʾ���������Ǹ�����
private int tClickCount=0;  //�������
//�޲εĹ��췽��
public Topic() {
	super();
    //System.out.println("�������޲����Ĺ��췽��");
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

//�����ǰ������Ϣ����̬��
public  void getInfo() {
	//System.out.println("==������Ϣ==");
	//System.out.println("������⣺"+this.getTitle());
	//System.out.println("��������"+this.getContent());
	//System.out.println("����ʱ��"+this.getPublisTime()+"\n");	
}

}
