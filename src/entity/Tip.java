package entity;

import java.util.Date;


//���ࣨ���ӣ�
public class Tip {
     private String title ="";       //���ӱ���
     private String content ="";  //��������
     private Date publisTime=new Date();     //����ʱ��
     private Date modifyTime=new Date();     //�޸�ʱ��
     private int uid =1;  //�����û���ID��������ʾ�������Ǹ��û�����ġ�
	//��������޲ι��캯��
     public Tip(){
    	 //title="re:�������֣�����ָ��";
    	 //content="�õģ�����һ��ѧϰ";
    	 //publisTime=null;
    	 //System.out.println("��������޲ι��췽��");
     }
     //��������вι��췽��
     public Tip(String pTitle,String pContent,Date pTime){
         title=pTitle;
         content=pContent;
         publisTime=pTime;
         //System.out.println("��������вι��췽��");
     }
     /**
	 * �����ǰ���ӵ���Ϣ
	 */
     public void getInfo() {
		//System.out.println("===������Ϣ===");
		//System.out.println("���ӱ���"+title);
		//System.out.println("��������"+content);
		//System.out.println("����ʱ��"+publisTime+"\n");
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
	public Date getPublisTime() {
		return publisTime;
	}
	public void setPublisTime(Date publisTime) {
		this.publisTime = publisTime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime0(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
     
	

}
