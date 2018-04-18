/*
 * ReplyDao��ʵ����
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
    private Connection        conn  = null;              // �������ݿ�����
    private PreparedStatement pstmt = null;              // ����ִ��SQL���
    private ResultSet         rs    = null ;             // �û������ѯ�����

    /**
     * ��ӻظ�
     * @param reply
     * @return ��������
     */
    public int addReply(Reply reply) {
        String   sql  = "insert into TBL_REPLY(title,content,publishTime,modifyTime,uId,topicId) values(?,?,?,?," + reply.getUid() + "," + reply.getTopicId() + ")";
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // ȡ������ʱ��
        String[] parm = { reply.getTitle(), reply.getContent(), time, time };        
        return this.executeSQL(sql, parm);               // ִ��sql��������Ӱ������
    }

    /**
     * ɾ���ظ�
     * @param replyId 
     * @return ɾ������
     */
    public int deleteReply(int replyId) {
    	int count=0;
        String preparedSql = "delete from TBL_REPLY where replyId=?";
        Object[] param = {replyId};
        count= this.executeSQL(preparedSql, param);               // ִ��sql��������Ӱ������
        return count;
    }
    
    
    /**
     * ɾ���ظ�
     * @param �����û�Id
     * @return ɾ������
     */
    public int deleteReplyById(int uId) {
    	int count=0;
        String preparedSql = "delete from TBL_REPLY where uId=?";
        Object[] param = {uId};
        count= this.executeSQL(preparedSql, param);               // ִ��sql��������Ӱ������
        return count;
    }
    
    
    /**
     * ɾ���ظ�
     * @param ��������Id
     * @return ɾ������
     */
    public int deleteReplyByTopicId(int topicId) {
    	int count=0;
        String preparedSql = "delete from TBL_REPLY where topicId=?";
        Object[] param = {topicId};
        count= this.executeSQL(preparedSql, param);               // ִ��sql��������Ӱ������
        return count;
    }
    

    /**
     * ���»ظ�
     * @param reply
     * @return ��������
     */
    public int updateReply(Reply reply) {
        String   sql  = "update TBL_REPLY set title=?, content=?, modifyTime=? where replyId="+reply.getReplyId();
        String   time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  // ȡ������ʱ��
        String[] parm = { reply.getTitle(), reply.getContent(), time };
        return this.executeSQL(sql, parm);               // ִ��sql��������Ӱ������
    }


    /**
     * ���һظ�List   ����ҳЧ����3����
     * @param page��ǰҳ����topicId����Id
     * @return ��ѯ���
     */
    int rows=6;      //����ÿҳ��ʾ�ظ���������ÿҳ10�У�
    public List findListReply(int page, int topicId) {
        List list  = new ArrayList();                  // ��������ظ������б�
        conn  = null;                                  // ���ڱ������ݿ�����
        pstmt = null;                                  // ����ִ��SQL���
        rs    = null;                                  // �û������ѯ�����
        
      //����(�õ�ÿҳ��ʾ10�е�ҳ��)�ķ���
       int pageCount=getCountRows(topicId);            //�õ��ܵ�ҳ��
       //System.out.println("pageCount:"+pageCount);
        if( page < 1 ) {
            page=1;                                     // ��ǰҳ�����С��1�͵���1
        }
        
        if(page>pageCount){
        	page=pageCount+1;                            //��ǰҳ������������ҳ��͵������ҳ��
        }
        
        //�ɵ�ǰҳ��*ÿҳ��ʾ�����������е���ǰҳ�����������ļ���ֵ
        //System.out.println("page:"+page);
		int iRows=(page-1)*rows;
		
        //System.out.println("iRows:"+iRows);
		//д��ҳsql��䱣�浽StringBuffer������
		StringBuffer sb=new StringBuffer();
		sb.append("select top"+" "+rows+" "+"*");
		sb.append(" "+"from TBL_REPLY where topicId="+topicId);
		sb.append(" "+"and replyId  not in");
		sb.append("(select top "+iRows);
		sb.append(" "+"replyId from TBL_REPLY");
		sb.append(" "+"where topicId="+topicId+"");
		sb.append(" "+"order by publishTime desc) order by publishTime desc");
		//��ӡ����д��sql��䣬����֤
		//System.out.println("sql:-->"+sb.toString());
        try {
            conn = this.getConn();                     // �õ����ݿ�����
            pstmt = conn.prepareStatement(sb.toString());         // �õ�PreparedStatement����
            rs = pstmt.executeQuery();                  // ִ��sqlȡ�ý����

            /*  ѭ�����ظ���Ϣ��װ��List  */
            while ( rs.next() ) {
                Reply reply = new Reply();              // �ظ�����
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
            e.printStackTrace();                        // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);             // �ͷ���Դ
        }
        return list;
    }
    /**
     * ��ҳ1��
     * ͨ���ܻظ�������ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param topicId
     * @return
     */ 
    public int getCountRows(int topicId){
    	int pageSzie=0;   //�ܻظ�����
    	int pageCount=0;  //��ҳ��
    	pageSzie=findCountReply(topicId);
    	//ͨ������õ���ҳ����ÿҳ��ʾ10�У�
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
    }
    
    /**
     * ��ҳ2��
     * ��������id��ѯ��������Ļظ�����
     * @param topicId ����id
     * @return �ظ�����
     */
    public int findCountReply(int topicId){
        int              num = 0;                    // �ظ�����
        String            sql   = "select count(*) as counts from TBL_REPLY where topicId=" + topicId;
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
     * ��������id�����һظ�����Ϣ
     * @param replyId
     * @return �ظ�
     */
    public Reply findReply(int replyId) {
        String sql  = "select * from TBL_REPLY where replyId=?";
        Reply reply = null;
        try {
            conn  = this.getConn();                // ������ݿ�����
            pstmt = conn.prepareStatement(sql);    // �õ�һ��PreparedStatement����
            pstmt.setInt(1, replyId);              // ����topicIdΪ����ֵ
            rs    = pstmt.executeQuery();          // ִ��sql��ȡ�ò�ѯ�����

            /*  ��������е���Ϣȡ�����浽reply�����У�ѭ�����ֻ��ִ��һ��  */
            while ( rs.next() ) {
                reply = new Reply();              // �ظ�����
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublisTime(rs.getTimestamp("publishTime"));
                reply.setModifyTime0(rs.getTimestamp("modifyTime"));
                reply.setUid(rs.getInt("uId"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);       // �ͷ���Դ
        }
        return reply;
    }
    
   
    /**
     * �����û�id�����һظ�����Ϣ
     * @param replyId
     * @return �ظ�
     */
    public List findReplyByUId(int uID) {
        String sql  = "select * from TBL_REPLY where uID=?";
        Reply reply = null;
        List list =new ArrayList();
        try {
            conn  = this.getConn();                // ������ݿ�����
            pstmt = conn.prepareStatement(sql);    // �õ�һ��PreparedStatement����
            pstmt.setInt(1, uID);              // ����topicIdΪ����ֵ
            rs    = pstmt.executeQuery();          // ִ��sql��ȡ�ò�ѯ�����

            while ( rs.next() ) {
                reply = new Reply();              // �ظ�����
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublisTime(rs.getTimestamp("publishTime"));
                reply.setModifyTime0(rs.getTimestamp("modifyTime"));
                reply.setUid(rs.getInt("uId"));
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();                   // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);       // �ͷ���Դ
        }
        return list;
    }
    
    
    /**
     * �������һ�λظ�
     * @param page
     * @return ʵ����
     */
    public Reply getReplyByTopicId(int topicId) {
        conn  = null;                                  // ���ڱ������ݿ�����
        pstmt = null;                                  // ����ִ��SQL���
        rs    = null;                                  // �û������ѯ�����
        Reply reply = new Reply();                     // �ظ�����
        try {
            conn = this.getConn();                     // �õ����ݿ�����
            String sql = "select top 1 * from TBL_REPLY where topicId=" + topicId + " order by publishTime desc";
            pstmt = conn.prepareStatement(sql);         // �õ�PreparedStatement����
            rs = pstmt.executeQuery();                  // ִ��sqlȡ�ý���� 
            /*  ѭ�����ظ���Ϣ��װ��List  */
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
            e.printStackTrace();                        // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);             // �ͷ���Դ
        }
        return reply;
    }
    
    /**
     * ����������
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
    	//System.out.println("ɾ����"+count);
    }
}


