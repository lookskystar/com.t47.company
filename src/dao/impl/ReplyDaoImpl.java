/*
 * ReplyDao的实现类
 */
package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.*;
import entity.Reply;
import entity.Topic;

public class ReplyDaoImpl extends BaseDao implements ReplyDao {
    private Connection        conn  = null;              // 保存数据库连接
    private PreparedStatement pstmt = null;              // 用于执行SQL语句
    private ResultSet         rs    = null ;             // 用户保存查询结果集

    /**
     * 添加回复
     * @param reply
     * @return 增加条数
     */
    public int addReply(Reply reply) {
        String   sql  = "insert into TBL_REPLY(title,content,publishTime,modifyTime,uId,topicId) values(?,?,?,?," + reply.getUid() + "," + reply.getTopicId() + ")";
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 取得日期时间
        String[] parm = { reply.getTitle(), reply.getContent(), time, time };        
        return this.executeSQL(sql, parm);               // 执行sql，并返回影响行数
    }

    /**
     * 删除回复
     * @param replyId 
     * @return 删除条数
     */
    public int deleteReply(int replyId) {
    	int count=0;
        String preparedSql = "delete from TBL_REPLY where replyId=?";
        Object[] param = {replyId};
        count= this.executeSQL(preparedSql, param);               // 执行sql，并返回影响行数
        return count;
    }
    
    
    /**
     * 删除回复
     * @param 输入用户Id
     * @return 删除条数
     */
    public int deleteReplyById(int uId) {
    	int count=0;
        String preparedSql = "delete from TBL_REPLY where uId=?";
        Object[] param = {uId};
        count= this.executeSQL(preparedSql, param);               // 执行sql，并返回影响行数
        return count;
    }
    
    
    /**
     * 删除回复
     * @param 输入主贴Id
     * @return 删除条数
     */
    public int deleteReplyByTopicId(int topicId) {
    	int count=0;
        String preparedSql = "delete from TBL_REPLY where topicId=?";
        Object[] param = {topicId};
        count= this.executeSQL(preparedSql, param);               // 执行sql，并返回影响行数
        return count;
    }
    

    /**
     * 更新回复
     * @param reply
     * @return 更新条数
     */
    public int updateReply(Reply reply) {
        String   sql  = "update TBL_REPLY set title=?, content=?, modifyTime=? where replyId="+reply.getReplyId();
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 取得日期时间
        String[] parm = { reply.getTitle(), reply.getContent(), time };
        return this.executeSQL(sql, parm);               // 执行sql，并返回影响行数
    }


    /**
     * 查找回复List   （分页效果第3步）
     * @param page当前页数，topicId主题Id
     * @return 查询结果
     */
    int rows=6;      //定义每页显示回复的行数（每页10行）
    public List findListReply(int page, int topicId) {
        List list  = new ArrayList();                  // 用来保存回复对象列表
        conn  = null;                                  // 用于保存数据库连接
        pstmt = null;                                  // 用于执行SQL语句
        rs    = null;                                  // 用户保存查询结果集
        
      //调用(得到每页显示10行的页数)的方法
       int pageCount=getCountRows(topicId);            //得到总的页数
       //System.out.println("pageCount:"+pageCount);
        if( page < 1 ) {
            page=1;                                     // 当前页数如果小于1就等于1
        }
        
        if(page>pageCount){
        	page=pageCount+1;                            //当前页面如果大于最大页面就等于最大页面
        }
        
        //由当前页数*每页显示和行数的所有到当前页面数的行数的计算值
        //System.out.println("page:"+page);
		int iRows=(page-1)*rows;
		
        //System.out.println("iRows:"+iRows);
		//写分页sql语句保存到StringBuffer对象中
		StringBuffer sb=new StringBuffer();
		sb.append("select top"+" "+rows+" "+"*");
		sb.append(" "+"from TBL_REPLY where topicId="+topicId);
		sb.append(" "+"and replyId  not in");
		sb.append("(select top "+iRows);
		sb.append(" "+"replyId from TBL_REPLY");
		sb.append(" "+"where topicId="+topicId+"");
		sb.append(" "+"order by publishTime desc) order by publishTime desc");
		//打印以上写的sql语句，以验证
		//System.out.println("sql:-->"+sb.toString());
        try {
            conn = this.getConn();                     // 得到数据库连接
            pstmt = conn.prepareStatement(sb.toString());         // 得到PreparedStatement对象
            rs = pstmt.executeQuery();                  // 执行sql取得结果集

            /*  循环将回复信息封装成List  */
            while ( rs.next() ) {
                Reply reply = new Reply();              // 回复对象
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublisTime(rs.getTimestamp("publishTime"));
                reply.setModifyTime0(rs.getTimestamp("modifyTime"));
                reply.setTopicId(rs.getInt("topicId"));
                reply.setUid(rs.getInt("uId"));
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();                        // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);             // 释放资源
        }
        return list;
    }
    /**
     * 分页1步
     * 通过总回复个数和每页行数（取10）的计算得到总页数
     * @param topicId
     * @return
     */ 
    public int getCountRows(int topicId){
    	int pageSzie=0;   //总回复个数
    	int pageCount=0;  //总页数
    	pageSzie=findCountReply(topicId);
    	//通过计算得到总页数（每页显示10行）
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
    }
    
    /**
     * 分页2步
     * 根据主题id查询出该主题的回复条数
     * @param topicId 主题id
     * @return 回复条数
     */
    public int findCountReply(int topicId){
        int              num = 0;                    // 回复条数
        String            sql   = "select count(*) as counts from TBL_REPLY where topicId=" + topicId;
        try {
            conn  = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            while( rs.next() ) {
            	num = rs.getInt("counts"); 
            }
        } catch ( Exception e) {
            e.printStackTrace();                        // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);             // 释放资源
            
        }
        //System.out.println("num:"+num);
        return num;
    }

   
    /**
     * 根据主题id，查找回复的信息
     * @param replyId
     * @return 回复
     */
    public Reply findReply(int replyId) {
        String sql  = "select * from TBL_REPLY where replyId=?";
        Reply reply = null;
        try {
            conn  = this.getConn();                // 获得数据库连接
            pstmt = conn.prepareStatement(sql);    // 得到一个PreparedStatement对象
            pstmt.setInt(1, replyId);              // 设置topicId为参数值
            rs    = pstmt.executeQuery();          // 执行sql，取得查询结果集

            /*  将结果集中的信息取出保存到reply对象中，循环最多只会执行一次  */
            while ( rs.next() ) {
                reply = new Reply();              // 回复对象
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublisTime(rs.getTimestamp("publishTime"));
                reply.setModifyTime0(rs.getTimestamp("modifyTime"));
                reply.setUid(rs.getInt("uId"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);       // 释放资源
        }
        return reply;
    }
    
   
    /**
     * 根据用户id，查找回复的信息
     * @param replyId
     * @return 回复
     */
    public List findReplyByUId(int uID) {
        String sql  = "select * from TBL_REPLY where uID=?";
        Reply reply = null;
        List list =new ArrayList();
        try {
            conn  = this.getConn();                // 获得数据库连接
            pstmt = conn.prepareStatement(sql);    // 得到一个PreparedStatement对象
            pstmt.setInt(1, uID);              // 设置topicId为参数值
            rs    = pstmt.executeQuery();          // 执行sql，取得查询结果集

            while ( rs.next() ) {
                reply = new Reply();              // 回复对象
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublisTime(rs.getTimestamp("publishTime"));
                reply.setModifyTime0(rs.getTimestamp("modifyTime"));
                reply.setUid(rs.getInt("uId"));
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();                   // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);       // 释放资源
        }
        return list;
    }
    
    
    /**
     * 查找最后一次回复
     * @param page
     * @return 实体类
     */
    public Reply getReplyByTopicId(int topicId) {
        conn  = null;                                  // 用于保存数据库连接
        pstmt = null;                                  // 用于执行SQL语句
        rs    = null;                                  // 用户保存查询结果集
        Reply reply = new Reply();                     // 回复对象
        try {
            conn = this.getConn();                     // 得到数据库连接
            String sql = "select top 1 * from TBL_REPLY where topicId=" + topicId + " order by publishTime desc";
            pstmt = conn.prepareStatement(sql);         // 得到PreparedStatement对象
            rs = pstmt.executeQuery();                  // 执行sql取得结果集 
            /*  循环将回复信息封装成List  */
            if( rs.next() ) {               
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublisTime(rs.getTimestamp("publishTime"));
                reply.setModifyTime0(rs.getTimestamp("modifyTime"));
                reply.setTopicId(rs.getInt("topicId"));
                reply.setUid(rs.getInt("uId"));   
            }
        } catch (Exception e) {
            e.printStackTrace();                        // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);             // 释放资源
        }
        return reply;
    }
    
    /**
     * 测试主函数
     * @param args
     */
    public static void main(String[] args) {
    	ReplyDaoImpl re=new ReplyDaoImpl();
    	List list=new ArrayList();
    	Reply rep=new Reply();
      /*
    	list=re.findListReply(2, 48);
    	for(int i=0;i<list.size();i++){
    		Reply reply=(Reply)list.get(i);
    		System.out.println(reply.getTitle());
    	}
    	*/
    	//int ss=re.getCountRows(48);
    	//System.out.println(ss);
    	//System.out.println(rep.getTitle());
    	//int count=re.deleteReply(52);
    	//System.out.println("删除："+count);
    }
}


