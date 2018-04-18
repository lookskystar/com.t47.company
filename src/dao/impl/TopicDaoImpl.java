package dao.impl;

import dao.*;
import entity.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.*;

//ʵ��TopicDao��
public class TopicDaoImpl extends BaseDao implements TopicDao {
	private Connection conn=null;    //���ڱ������ݿ�����
	private PreparedStatement pstmt=null;   //����ִ��SQL���
	private ResultSet rs=null;   //�û������ѯ�����
	
	BaseDao baseDao=new BaseDao();
	Topic topic=new Topic();
    /*
     * �������
     * topic
     * return��������
     */
	public int addTopic(Topic topic) {
		int count = 0; // ���ܷ���ֵ
			// SQL���
			String preparedSql = "insert into TBL_TOPIC (title,content,publishTime,modifyTime,uId,boardId) values(?,?,?,?,?,?)";
			// ʱ��(�����˸�ʽ��)
			String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // ȡ������ʱ��
			// ռλ��������
			Object[] param = {topic.getTitle(),topic.getContent(),time,time,topic.getUid(),topic.getBoardId()};
			count = baseDao.executeSQL(preparedSql, param);
			return count;
	}
    /*
     * ɾ������
     * ����ɾ������ID
     * return Ӱ������
     */
	public int deleteTopic(int topicId) {
		int count = 0; // ���ܷ���ֵ
		// SQL���
		String preparedSql = "delete from TBL_TOPIC where topicId=? ";
		// ռλ��������
		Object[] param = {topicId};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	
	/*
     * ɾ������
     * ���뷢���û�ID
     * return Ӱ������
     */
	public int deleteTopicById(int uID) {
		int count = 0; // ���ܷ���ֵ
		// SQL���
		String preparedSql = "delete from TBL_TOPIC where uId=? ";
		// ռλ��������
		Object[] param = {uID};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
    /*
     * ������������list(����ҳЧ����3��)
     * @param page(��ǰҳ����)
     * @return ����list
     */
	int rows=10;   //ÿҳ��ʾ������
	public List<Topic> findListTopic(int page, int boardId) {
		List<Topic> list =new ArrayList<Topic>();    //����������������б�
		//����(�õ�ÿҳ��ʾ10�е�ҳ��)�ķ���
	    int pageCount=getCountRows(boardId);        //�õ��ܵ�ҳ��
 
	    //�жϣ������õ�ǰ��ҳ����page��С��1��������ҳ����
	    if(page<1){
	    	page=1;
	    }
	    if(page>pageCount){
	    	page=pageCount+1;
	    }
	    
	    //�ɵ�ǰҳ��*ÿҳ��ʾ�����������е���ǰҳ�����������ļ���ֵ
		int iRows=(page-1)*rows;
		
		//д��ҳsql��䱣�浽StringBuffer������
		StringBuffer sb=new StringBuffer();
		sb.append("select top"+" "+rows+" "+"*");
		sb.append(" "+"from TBL_TOPIC where boardId="+boardId);
		sb.append(" "+"and topicId  not in");
		sb.append("(select top "+iRows);
		sb.append(" "+"topicId from TBL_TOPIC");
		sb.append(" "+"where boardId="+boardId+"");
		sb.append(" "+"order by publishTime desc) order by publishTime desc");
		//��ӡ����д��sql��䣬����֤
		//System.out.println("sql:-->"+sb.toString());
		try {
			conn=this.getConn();    //��ȡ���ݿ�����
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();   //ִ��sql���õ������
			
			//��������е���Ϣȡ�����浽list��
		    while (rs.next()) {
				Topic topic=new Topic();   //�������
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
			e.printStackTrace();    //�����쳣
		} finally{
			this.closeAll(conn, pstmt, rs);    //�ͷ���Դ
		}
		return list;
	}
	/**
	 * �õ�ÿҳ��ʾ10�е�ҳ��  ������ҳЧ����1��)
	 * @param boardId���Id
	 * @return �İ���µ�����ÿҳ��ʾ10�е�ҳ��
	 */
	public int getCountRows(int boardId) {
		int pageSzie=0;   //�������
		int pageCount=0;  //��ҳ��
		pageSzie=findCountTopic(boardId);
		//--ͨ�����㣬�õ���ҳ����ȡÿҳ��ʾ10�У�
		if(pageSzie%rows==0){
			pageCount=pageSzie/rows;
		}else{
			pageCount=pageSzie/rows+1;
		}
		return pageCount;
	}
	/*
	 * ���ݰ��ID���������� ������ҳЧ����2��)
	 * ������ID
	 * �õ��ð����������
	 */
	public int findCountTopic(int boardId) {
		int count = 0; // ���ܷ���ֵ
		// SQL���
		String preparedSql = "select * from TBL_TOPIC where boardId=? ";
		// ռλ��������
		Object[] param = {boardId};
		rs = baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
				count=count+1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("������������������");
		}
		return count;
	}
	
	
	
    /*
     *����һ���������ϸ��Ϣ
     *�����������ID��
     * return ������Ϣ
     */
	public Topic findTopic(int topicId) {
		Topic topic=new Topic();   //�������
		//sql���
		String preparedSql="select topicId,title,content ,publishTime,modifyTime,uId,boardId tClickCount from TBL_TOPIC where topicId=?";
	    // ռλ��������
		Object[] param = {topicId};
		try {
			rs=	baseDao.executeQuerySQL(preparedSql, param);   //���÷���ִ��sql���õ������
			//��������е���Ϣȡ�����浽ʵ������
			
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
			e.printStackTrace();    //�����쳣
		}
		return topic;
	}
	
	 /*
     *����uID��������
     *��������û�ID��
     * return List
     */
	public List findTopicByUId(int uID) {
		
		 List list =new ArrayList();
		//sql���
		String preparedSql="select topicId,title,content ,publishTime,modifyTime,uId,boardId tClickCount from TBL_TOPIC where uID=?";
	    // ռλ��������
		Object[] param = {uID};
		try {
			rs=	baseDao.executeQuerySQL(preparedSql, param);   //���÷���ִ��sql���õ������
			//��������е���Ϣȡ�����浽ʵ������
			
		   while(rs.next()){	
			Topic topic=new Topic();   //�������
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
			e.printStackTrace();    //�����쳣
		}
		return list;
	}
	
     /*
      * ��������(����ID�����Ը���)
      * ��������ʵ����
      * return ��������
      */
	public int updateTopic(Topic topic) {
		
		int count = 0; // ���ܷ���ֵ
		// SQL���
		//System.out.println(topic.getTopicId());
		//System.out.println(topic.getTitle());
		//System.out.println(topic.getContent());
		//System.out.println(topic.getModifyTime());
		String preparedSql = "update TBL_TOPIC set title=?,content=? ,modifyTime=? where topicId=? ";
		// ռλ��������
		// ʱ��(�����˸�ʽ��)
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // ȡ������ʱ��
		Object[] param = {topic.getTitle(),topic.getContent(),time,topic.getTopicId()};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
	
	
	
	
	/*
     *����һ���������ϸ��Ϣ���������������ж��Ǹ��û��Ƿ�Ӧ�����ڸ��û�
     *�������������
     * return int
     */
	public int getTileFindTopic(String title) {
		Topic topic=new Topic();   //�������
		int count=0;
		//sql���
		String preparedSql="select topicId,title,content ,publishTime,modifyTime,uId,boardId,tClickCount from TBL_TOPIC where title=?";
	    // ռλ��������
		Object[] param = {title};
		try {
			rs=	baseDao.executeQuerySQL(preparedSql, param);   //���÷���ִ��sql���õ������
			//��������е���Ϣȡ�����浽ʵ������
		    if(rs.next()){	
		    	count=1;
			}else{
				count=0;
			}
		} catch (Exception e) {
			e.printStackTrace();    //�����쳣
		}
		return count;
	}
	
	/**
	 * ���¸�����������
	 * @param topicId����ID
	 * @return Ӱ������
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
	  * ���Ժ���
	  * @param args
	  */
	public static void main(String[] args) {
		TopicDaoImpl top=new TopicDaoImpl();
		
		Topic topic=new Topic();
		topic.setTopicId(33);
		topic.setContent("�޸ĺõģ�");
		
		int count=top.updateTopic(topic);
		//Topic topic=new Topic();
        System.out.println("---�޸�Id"+count+"---------");
        System.out.println(topic.getModifyTime());
        System.out.println(topic.getContent());
	}
	
}

