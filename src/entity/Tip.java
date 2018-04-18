package entity;

import java.util.Date;


//父类（帖子）
public class Tip {
     private String title ="";       //帖子标题
     private String content ="";  //帖子内容
     private Date publisTime=new Date();     //发表时间
     private Date modifyTime=new Date();     //修改时间
     private int uid =1;  //引用用户的ID，用来表示该贴是那个用户发表的。
	//帖子类的无参构造函数
     public Tip(){
    	 //title="re:我是新手，请大家指教";
    	 //content="好的，我们一起学习";
    	 //publisTime=null;
    	 //System.out.println("帖子类的无参构造方法");
     }
     //帖子类的有参构造方法
     public Tip(String pTitle,String pContent,Date pTime){
         title=pTitle;
         content=pContent;
         publisTime=pTime;
         //System.out.println("帖子类的有参构造方法");
     }
     /**
	 * 输出当前帖子的信息
	 */
     public void getInfo() {
		//System.out.println("===帖子信息===");
		//System.out.println("帖子标题"+title);
		//System.out.println("帖子内容"+content);
		//System.out.println("发表时间"+publisTime+"\n");
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
