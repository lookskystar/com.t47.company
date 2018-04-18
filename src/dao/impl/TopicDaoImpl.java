package dao.impl;

import dao.*;
import entity.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.*;

//实现TopicDao类
public class TopicDaoImpl extends BaseDao implements TopicDao {
	private Connection conn=null;    //用于保存数据库连接
	private PreparedStatement pstmt=null;   //用于执行SQL语句
	private ResultSet rs=null;   //用户保存查询结果集
	
	BaseDao baseDao=new BaseDao();
	Topic topic=new Topic();
    /*
     * 添加主题
     * topic
     * return增加条数
     */
	public int addTopic(Topic topic) {
		int count = 0; // 接受返回值
			// SQL语句
			String preparedSql = "insert into TBL_TOPIC (title,content,publishTime,modifyTime,uId,boardId) values(?,?,?,?,?,?)";
			// 时间(进行了格式化)
			String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // 取得日期时间
			// 占位符号数组
			Object[] param = {topic.getTitle(),topic.getContent(),time,time,topic.getUid(),topic.getBoardId()};
			count = baseDao.executeSQL(preparedSql, param);
			return count;
	}
    /*
     * 删除主题
     * 输入删除主题ID
     * return 影响行数
     */
	public int deleteTopic(int topicId) {
		int count = 0; // 接受返回值
		// SQL语句
		String preparedSql = "delete from TBL_TOPIC where topicId=? ";
		// 占位符号数组
		Object[] param = {topicId};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	
	/*
     * 删除主题
     * 输入发表用户ID
     * return 影响行数
     */
	public int deleteTopicById(int uID) {
		int count = 0; // 接受返回值
		// SQL语句
		String preparedSql = "delete from TBL_TOPIC where uId=? ";
		// 占位符号数组
		Object[] param = {uID};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
    /*
     * 查找所有主题list(做分页效果第3步)
     * @param page(当前页数号)
     * @return 主题list
     */
	int rows=10;   //每页显示的行数
	public List<Topic> findListTopic(int page, int boardId) {
		List<Topic> list =new ArrayList<Topic>();    //用来保存主题对象列表
		//调用(得到每页显示10行的页数)的方法
	    int pageCount=getCountRows(boardId);        //得到总的页数
 
	    //判断，不能让当前的页数（page）小于1或大于最大页面数
	    if(page<1){
	    	page=1;
	    }
	    if(page>pageCount){
	    	page=pageCount+1;
	    }
	    
	    //由当前页数*每页显示和行数的所有到当前页面数的行数的计算值
		int iRows=(page-1)*rows;
		
		//写分页sql语句保存到StringBuffer对象中
		StringBuffer sb=new StringBuffer();
		sb.append("select top"+" "+rows+" "+"*");
		sb.append(" "+"from TBL_TOPIC where boardId="+boardId);
		sb.append(" "+"and topicId  not in");
		sb.append("(select top "+iRows);
		sb.append(" "+"topicId from TBL_TOPIC");
		sb.append(" "+"where boardId="+boardId+"");
		sb.append(" "+"order by publishTime desc) order by publishTime desc");
		//打印以上写的sql语句，以验证
		//System.out.println("sql:-->"+sb.toString());
		try {
			conn=this.getConn();    //获取数据库连接
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();   //执行sql语句得到结果集
			
			//将结果集中的信息取出保存到list中
		    while (rs.next()) {
				Topic topic=new Topic();   //主题对象
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setPublisTime(rs.getTimestamp("publishTime"));
				topic.setModifyTime0(rs.getTimestamp("modifyTime"));
				topic.setUid(rs.getInt("uId"));
				topic.setBoardId(rs.getInt(7));
				topic.setTClickCount(rs.getInt("tClickCount"));
				list.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace();    //处理异常
		} finally{
			this.closeAll(conn, pstmt, rs);    //释放资源
		}
		return list;
	}
	/**
	 * 得到每页显示10行的页数  （做分页效果第1步)
	 * @param boardId版块Id
	 * @return 改版块下的主题每页显示10行的页数
	 */
	public int getCountRows(int boardId) {
		int pageSzie=0;   //主题个数
		int pageCount=0;  //总页数
		pageSzie=findCountTopic(boardId);
		//--通过计算，得到总页数（取每页显示10行）
		if(pageSzie%rows==0){
			pageCount=pageSzie/rows;
		}else{
			pageCount=pageSzie/rows+1;
		}
		return pageCount;
	}
	/*
	 * 根据板块ID查找主题数 （做分页效果第2步)
	 * 输入板块ID
	 * 得到该板块主题数量
	 */
	public int findCountTopic(int boardId) {
		int count = 0; // 接受返回值
		// SQL语句
		String preparedSql = "select * from TBL_TOPIC where boardId=? ";
		// 占位符号数组
		Object[] param = {boardId};
		rs = baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
				count=count+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("计算板块主题数量出错！");
		}
		return count;
	}
	
	
	
    /*
     *查找一个主题的详细信息
     *输入查找主题ID号
     * return 主题信息
     */
	public Topic findTopic(int topicId) {
		Topic topic=new Topic();   //主题对象
		//sql语句
		String preparedSql="select topicId,title,content ,publishTime,modifyTime,uId,boardId tClickCount from TBL_TOPIC where topicId=?";
	    // 占位符号数组
		Object[] param = {topicId};
		try {
			rs=	baseDao.executeQuerySQL(preparedSql, param);   //调用方法执行sql语句得到结果集
			//将结果集中的信息取出保存到实体类中
			
		    if(rs.next()){	
		    topic.setTopicId(rs.getInt("topicId"));
		    topic.setTitle(rs.getString("title"));
		    topic.setContent(rs.getString("content"));
		    topic.setPublisTime(rs.getTimestamp("publishTime"));
			topic.setModifyTime0(rs.getTimestamp("modifyTime"));
			topic.setUid(rs.getInt("uId"));
			topic.setBoardId(rs.getInt(7));
			topic.setTClickCount(rs.getInt("tClickCount"));
		    }
		} catch (Exception e) {
			e.printStackTrace();    //处理异常
		}
		return topic;
	}
	
	 /*
     *根据uID查找主题
     *输入查找用户ID号
     * return List
     */
	public List findTopicByUId(int uID) {
		
		 List list =new ArrayList();
		//sql语句
		String preparedSql="select topicId,title,content ,publishTime,modifyTime,uId,boardId tClickCount from TBL_TOPIC where uID=?";
	    // 占位符号数组
		Object[] param = {uID};
		try {
			rs=	baseDao.executeQuerySQL(preparedSql, param);   //调用方法执行sql语句得到结果集
			//将结果集中的信息取出保存到实体类中
			
		   while(rs.next()){	
			Topic topic=new Topic();   //主题对象
		    topic.setTopicId(rs.getInt("topicId"));
		    topic.setTitle(rs.getString("title"));
		    topic.setContent(rs.getString("content"));
		    topic.setPublisTime(rs.getTimestamp("publishTime"));
			topic.setModifyTime0(rs.getTimestamp("modifyTime"));
			topic.setUid(rs.getInt("uId"));
			topic.setBoardId(rs.getInt(7));
			topic.setTClickCount(rs.getInt("tClickCount"));
			list.add(topic);
		    }
		} catch (Exception e) {
			e.printStackTrace();    //处理异常
		}
		return list;
	}
	
     /*
      * 更新主题(主题ID不可以更改)
      * 输入主题实体类
      * return 更新条数
      */
	public int updateTopic(Topic topic) {
		
		int count = 0; // 接受返回值
		// SQL语句
		//System.out.println(topic.getTopicId());
		//System.out.println(topic.getTitle());
		//System.out.println(topic.getContent());
		//System.out.println(topic.getModifyTime());
		String preparedSql = "update TBL_TOPIC set title=?,content=? ,modifyTime=? where topicId=? ";
		// 占位符号数组
		// 时间(进行了格式化)
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // 取得日期时间
		Object[] param = {topic.getTitle(),topic.getContent(),time,topic.getTopicId()};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	
	
	
	/*
     *查找一个主题的详细信息（根据主题名）判断是该用户是否应经存在该用户
     *输入查找主题名
     * return int
     */
	public int getTileFindTopic(String title) {
		Topic topic=new Topic();   //主题对象
		int count=0;
		//sql语句
		String preparedSql="select topicId,title,content ,publishTime,modifyTime,uId,boardId,tClickCount from TBL_TOPIC where title=?";
	    // 占位符号数组
		Object[] param = {title};
		try {
			rs=	baseDao.executeQuerySQL(preparedSql, param);   //调用方法执行sql语句得到结果集
			//将结果集中的信息取出保存到实体类中
		    if(rs.next()){	
		    	count=1;
			}else{
				count=0;
			}
		} catch (Exception e) {
			e.printStackTrace();    //处理异常
		}
		return count;
	}
	
	/**
	 * 更新该主题点击次数
	 * @param topicId主题ID
	 * @return 影响行数
	 */
    public int updateClickCount(int topicId){
    	Topic topic=new Topic();
    	int count=0;
    	String preparedSql="update TBL_TOPIC set tClickCount=tClickCount+1 where topicId=?";
    	Object[] param={topicId};
    	try {
			count=baseDao.executeSQL(preparedSql, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
    }
	
	
	
	 /**
	  * 测试函数
	  * @param args
	  */
	public static void main(String[] args) {
		TopicDaoImpl top=new TopicDaoImpl();
		
		Topic topic=new Topic();
		topic.setTopicId(33);
		topic.setContent("修改好的！");
		
		int count=top.updateTopic(topic);
		//Topic topic=new Topic();
        System.out.println("---修改Id"+count+"---------");
        System.out.println(topic.getModifyTime());
        System.out.println(topic.getContent());
	}
	
}

