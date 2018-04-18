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
 * ����ʵ����
 * @author Administrator
 *
 */
public class NewsDaoImpl extends BaseDao implements NewsDao {
	
	    private Connection        conn  = null;              // �������ݿ�����
	    private PreparedStatement pstmt = null;              // ����ִ��SQL���
	    private ResultSet         rs    = null ;             // �û������ѯ�����
	    
	    int rows=10;      //����ÿҳ��ʾ�ظ���������ÿҳ10�У�
	    String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // ȡ������ʱ��
/*
 * ��������
 * @see dao.NewsDao#addNews(entity.News)
 */
	public int addNews(News news) {
		int count = 0; // ���ܷ���ֵ
		String idStr="";   //�������������Number
			// SQL���
			String preparedSql = "insert into TBL_NEWS (title,content,publishTime) values(?,?,?)";
			 String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // ȡ������ʱ��
			// ռλ��������
			Object[] param = {news.getTitle(),news.getContent(),time};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
		
		return count;
	}
   /*
    * ɾ������
    * @see dao.NewsDao#deleteNews(int)
    */
	public int deleteNews(int newsId) {
		int count = 0; // ���ܷ���ֵ
		// SQL���
		String preparedSql = "delete from TBL_NEWS where newsID=? ";
		// ռλ��������
		Object[] param = {newsId};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	

    
	/**
     * ����������
     * @param 
     * @return ��������
     */
	public int findCountNews() {
		
		int              num = 0;                    // �ظ�����
        String            sql   = "select count(*) as counts from TBL_NEWS";
        try {
            conn  = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            while( rs.next() ) {
            	num = rs.getInt("counts"); 
            }
        } catch ( Exception e) {
            e.printStackTrace();                        // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);             // �ͷ���Դ
            
        }
        //System.out.println("num:"+num);
        return num;
	}

	/**
	 * �õ�����List�����뵱ǰҳ��
	 */
	public List findListNews(int page) {
		 List list  = new ArrayList();                  // �����������Ŷ����б�
	        conn  = null;                                  // ���ڱ������ݿ�����
	        pstmt = null;                                  // ����ִ��SQL���
	        rs    = null;                                  // �û������ѯ�����
	        
	      //����(�õ�ÿҳ��ʾ10�е�ҳ��)�ķ���
	       int pageCount=getCountRows();            //�õ��ܵ�ҳ��
	        
	        if( page < 1 ) {
	            page=1;                                     // ��ǰҳ�����С��1�͵���1
	        }
	        
	        if(page>pageCount){
	        	page=pageCount;                            //��ǰҳ������������ҳ��͵������ҳ��
	        }
	        
	        //�ɵ�ǰҳ��*ÿҳ��ʾ�����������е���ǰҳ�����������ļ���ֵ
			int iRows=(page-1)*rows;
	        System.out.println("-------------------------->:"+iRows);
			//д��ҳsql��䱣�浽StringBuffer������
			StringBuffer sb=new StringBuffer();
			sb.append("select top"+" "+rows+" "+"*");
			sb.append(" "+"from TBL_NEWS");
			sb.append(" "+"where newsId  not in");
			sb.append("(select top "+iRows);
			sb.append(" "+"newsId from TBL_NEWS");
			//sb.append(" "+"where topicId="+topicId+"");
			sb.append(" "+"order by publishTime desc) order by publishTime desc");
			//��ӡ����д��sql��䣬����֤
			//System.out.println("sql:-->"+sb.toString());
	        try {
	            conn = this.getConn();                     // �õ����ݿ�����
	            System.out.println(sb.toString());
	            pstmt = conn.prepareStatement(sb.toString());         // �õ�PreparedStatement����
	            rs = pstmt.executeQuery();                  // ִ��sqlȡ�ý����

	            /*  ѭ�����ظ���Ϣ��װ��List  */
	            while ( rs.next() ) {
	                News news = new News();              // �ظ�����
	                news.setNewsId(rs.getInt("newsId"));
	                news.setTitle(rs.getString("title"));
	                news.setContent(rs.getString("content"));
	                news.setPublishTime(rs.getTimestamp("publishTime"));
	                list.add(news);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();                        // �����쳣
	        } finally {
	            this.closeAll(conn, pstmt, rs);             // �ͷ���Դ
	        }
	        return list;
	}

	public News findNews(int newsId) {
		String sql  = "select * from TBL_NEWS where newsId=?";
        News news = null;
        try {
            conn  = this.getConn();                // ������ݿ�����
            pstmt = conn.prepareStatement(sql);    // �õ�һ��PreparedStatement����
            pstmt.setInt(1, newsId);              // ����newsIdΪ����ֵ
            rs    = pstmt.executeQuery();          // ִ��sql��ȡ�ò�ѯ�����

            /*  ��������е���Ϣȡ�����浽news�����У�ѭ�����ֻ��ִ��һ��  */
            while ( rs.next() ) {
            	news = new News();              // �ظ�����
            	news.setNewsId(rs.getInt("newsId"));
            	news.setTitle(rs.getString("title"));
            	news.setContent(rs.getString("content"));
            	news.setPublishTime(rs.getDate("publishTime"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);       // �ͷ���Դ
        }
        return news;
	}
	
	
	 /**
     * ��ҳ1��
     * ͨ����ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param 
     * @return
     */ 
	public int getCountRows() {
		int pageSzie=0;   //�����Ÿ���
    	int pageCount=0;  //��ҳ��
    	pageSzie=findCountNews();
    	//ͨ������õ���ҳ����ÿҳ��ʾ10�У�
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
	}

	 /**
	  * �޸�����
	  */
	public int updateNews(News news) {
		int count = 0; // ���ܷ���ֵ
		// SQL���		
		String preparedSql = "update TBL_NEWS set title=?,content=?,publishTime=?  where newsID=? ";
		 String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // ȡ������ʱ��
		// ռλ��������
		Object[] param = {news.getTitle(),news.getContent(),time,news.getNewsId()};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	
	
	/**
	 * ������
	 * @param args
	 */
	public static void main(String[] args) {
		NewsDaoImpl newsDaoImpl=new NewsDaoImpl();
		News news=new News();
		//int a=newsDaoImpl.findCountNews();
		//System.out.println("������������"+a);
		news.setTitle("22222222");
		news.setContent("111111111");
		//news.setPublishTime("2009-06-09");
		int count=newsDaoImpl.updateNews(news);
		
	}

}
