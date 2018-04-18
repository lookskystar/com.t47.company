package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.*;
import entity.*;

/**
 * 新闻实现类
 * @author Administrator
 *
 */
public class NewsDaoImpl extends BaseDao implements NewsDao {
	
	    private Connection        conn  = null;              // 保存数据库连接
	    private PreparedStatement pstmt = null;              // 用于执行SQL语句
	    private ResultSet         rs    = null ;             // 用户保存查询结果集
	    
	    int rows=10;      //定义每页显示回复的行数（每页10行）
	    String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 取得日期时间
/*
 * 增加新闻
 * @see dao.NewsDao#addNews(entity.News)
 */
	public int addNews(News news) {
		int count = 0; // 接受返回值
		String idStr="";   //保存随机产生的Number
			// SQL语句
			String preparedSql = "insert into TBL_NEWS (title,content,publishTime) values(?,?,?)";
			 String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 取得日期时间
			// 占位符号数组
			Object[] param = {news.getTitle(),news.getContent(),time};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
		
		return count;
	}
   /*
    * 删除新闻
    * @see dao.NewsDao#deleteNews(int)
    */
	public int deleteNews(int newsId) {
		int count = 0; // 接受返回值
		// SQL语句
		String preparedSql = "delete from TBL_NEWS where newsID=? ";
		// 占位符号数组
		Object[] param = {newsId};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	

    
	/**
     * 新闻总条数
     * @param 
     * @return 新闻条数
     */
	public int findCountNews() {
		
		int              num = 0;                    // 回复条数
        String            sql   = "select count(*) as counts from TBL_NEWS";
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
	 * 得到新闻List，输入当前页数
	 */
	public List findListNews(int page) {
		 List list  = new ArrayList();                  // 用来保存新闻对象列表
	        conn  = null;                                  // 用于保存数据库连接
	        pstmt = null;                                  // 用于执行SQL语句
	        rs    = null;                                  // 用户保存查询结果集
	        
	      //调用(得到每页显示10行的页数)的方法
	       int pageCount=getCountRows();            //得到总的页数
	        
	        if( page < 1 ) {
	            page=1;                                     // 当前页数如果小于1就等于1
	        }
	        
	        if(page>pageCount){
	        	page=pageCount;                            //当前页面如果大于最大页面就等于最大页面
	        }
	        
	        //由当前页数*每页显示和行数的所有到当前页面数的行数的计算值
			int iRows=(page-1)*rows;
	        System.out.println("-------------------------->:"+iRows);
			//写分页sql语句保存到StringBuffer对象中
			StringBuffer sb=new StringBuffer();
			sb.append("select top"+" "+rows+" "+"*");
			sb.append(" "+"from TBL_NEWS");
			sb.append(" "+"where newsId  not in");
			sb.append("(select top "+iRows);
			sb.append(" "+"newsId from TBL_NEWS");
			//sb.append(" "+"where topicId="+topicId+"");
			sb.append(" "+"order by publishTime desc) order by publishTime desc");
			//打印以上写的sql语句，以验证
			//System.out.println("sql:-->"+sb.toString());
	        try {
	            conn = this.getConn();                     // 得到数据库连接
	            System.out.println(sb.toString());
	            pstmt = conn.prepareStatement(sb.toString());         // 得到PreparedStatement对象
	            rs = pstmt.executeQuery();                  // 执行sql取得结果集

	            /*  循环将回复信息封装成List  */
	            while ( rs.next() ) {
	                News news = new News();              // 回复对象
	                news.setNewsId(rs.getInt("newsId"));
	                news.setTitle(rs.getString("title"));
	                news.setContent(rs.getString("content"));
	                news.setPublishTime(rs.getTimestamp("publishTime"));
	                list.add(news);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();                        // 处理异常
	        } finally {
	            this.closeAll(conn, pstmt, rs);             // 释放资源
	        }
	        return list;
	}

	public News findNews(int newsId) {
		String sql  = "select * from TBL_NEWS where newsId=?";
        News news = null;
        try {
            conn  = this.getConn();                // 获得数据库连接
            pstmt = conn.prepareStatement(sql);    // 得到一个PreparedStatement对象
            pstmt.setInt(1, newsId);              // 设置newsId为参数值
            rs    = pstmt.executeQuery();          // 执行sql，取得查询结果集

            /*  将结果集中的信息取出保存到news对象中，循环最多只会执行一次  */
            while ( rs.next() ) {
            	news = new News();              // 回复对象
            	news.setNewsId(rs.getInt("newsId"));
            	news.setTitle(rs.getString("title"));
            	news.setContent(rs.getString("content"));
            	news.setPublishTime(rs.getDate("publishTime"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);       // 释放资源
        }
        return news;
	}
	
	
	 /**
     * 分页1步
     * 通过总每页行数（取10）的计算得到总页数
     * @param 
     * @return
     */ 
	public int getCountRows() {
		int pageSzie=0;   //总新闻个数
    	int pageCount=0;  //总页数
    	pageSzie=findCountNews();
    	//通过计算得到总页数（每页显示10行）
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
	}

	 /**
	  * 修改新闻
	  */
	public int updateNews(News news) {
		int count = 0; // 接受返回值
		// SQL语句		
		String preparedSql = "update TBL_NEWS set title=?,content=?,publishTime=?  where newsID=? ";
		 String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // 取得日期时间
		// 占位符号数组
		Object[] param = {news.getTitle(),news.getContent(),time,news.getNewsId()};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	
	
	/**
	 * 测试类
	 * @param args
	 */
	public static void main(String[] args) {
		NewsDaoImpl newsDaoImpl=new NewsDaoImpl();
		News news=new News();
		//int a=newsDaoImpl.findCountNews();
		//System.out.println("新闻总条数："+a);
		news.setTitle("22222222");
		news.setContent("111111111");
		//news.setPublishTime("2009-06-09");
		int count=newsDaoImpl.updateNews(news);
		
	}

}
