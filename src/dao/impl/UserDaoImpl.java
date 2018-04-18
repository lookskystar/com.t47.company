package dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date; //import java.sql.Date;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.lang.*;
import java.lang.Character.Subset;

import entity.Product;
import entity.User;
import dao.UserDao;
import dao.BaseDao;

//�ӿ�ʵ����
public class UserDaoImpl extends BaseDao implements UserDao {

	
	
	    private Connection        conn  = null;              // �������ݿ�����
	    private PreparedStatement pstmt = null;              // ����ִ��SQL���
	    private ResultSet rs=null;             // �û������ѯ�����
	    
	    int rows=15;      //����ÿҳ��ʾ��������ÿҳ15�У�
	
	
	
	public User[] users = new User[10];
	
	// ����BaseDao����
	BaseDao baseDao = new BaseDao();
	
   

	
	
    /*
     *  �����û�
     *  ������������
     */
	public int addUser(User user) {

		/*
		 * û�������ݿ��ʵ�� for(int i=0;i<10;i++){ if(users[i]==null){ users[i]=user;
		 * users[i].setUId(i); return 1; } }
		 * 
		 */
		int count = 0; // ���ܷ���ֵ
		String idStr="";   //�������������Number
		//�ж��û��Ƿ����
		List list =new ArrayList();
		list=getListByfindUser(user.getUName());
		if(list.size()==0){
			
			//�������uNumber
			String   str1=String.valueOf(Math.random()*1000).substring(4, 7);   
			String   str2=String.valueOf(Math.random()*1000).substring(8, 12);
			String   str3=String.valueOf(Math.random()*1000).substring(4, 7);
			String uNumber=str1+str2+str3;

			// SQL���
			String preparedSql = 
				"insert into TBL_USER (uNumber,uName,uIdentification,uPass," 
				+"head,regTime,uLink,uAaddress,uRemark,Email,gender) " +
				"values(?,?,?,?,?,?,?,?,?,?,"+ user.getUGender() + ")";
			// ʱ��(�����˸�ʽ��)
			String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()); // ȡ������ʱ��

			// setDate:java.sql.Date
			// java.sql.Date date = new
			// java.sql.Date(first.getCreateTime().getTime());
			// Date time=new Date(user.getRegTime().getTime());

			// ռλ��������
			Object[] param = {uNumber,user.getUName(), user.getUIdentification(),user.getUPass(),user.getHead(),time,user.getULink(),user.getUAaddress(),user.getURemark(),user.getEmail()};
			count = baseDao.executeSQL(preparedSql, param);
			//return count;
		}else{
			count=0;
		}
		return count;
	}

	/*
	 * �����û�
	 * �����û����������û�
	 * �����û�ʵ���༯��
	 */ 
	public List<User> getListByfindUser(String uName) {
		/*
		for (int i = 0; i < 10; i++) {
			if (users[i] != null && users[i].getUName().equals(uName)) {
				return users[i];
			}
		}
		return null;
		*/
		
		//�����û��༯��
		List<User> list=new ArrayList<User>();
		//����sql���
		String preparedSql=
			"select uId,uNumber,uName,uIdentification,uPass,head,regTime,gender,uLink,uAaddress,uTotalprices," +
			"uIntegration,uRemark,Email from TBL_USER where uName=?";
		Object[] param={uName};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
		    //�����û�ʵ�������
			User user=new User();
			user.setUId(rs.getInt(1));
			user.setUNumber(rs.getString(2));
			user.setUName(rs.getString(3));
			user.setUIdentification(rs.getString(4));
			user.setUPass(rs.getString(5));
			user.setHead(rs.getString(6));
			user.setRegTime(rs.getTimestamp(7));
			user.setUGender(rs.getInt(8));
			user.setULink(rs.getString(9));
			user.setUAaddress(rs.getString(10));
			user.setUTotalprices(rs.getFloat(11));
			user.setUIntegration(rs.getInt(12));
			user.setURemark(rs.getString(13));
			user.setEmail(rs.getString(14));
			list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	// �����û����������û�,���ض���
	public User getUser(String uName) {
		/*
		for (int i = 0; i < 10; i++) {
			if (users[i] != null && users[i].getUName().equals(uName)) {
				return users[i];
			}
		}
		return null;
		*/
		
		//�����û��༯��
		
		//����sql���
		String preparedSql="select uId,uNumber,uName,uIdentification,uPass,head,regTime,gender,uLink,uAaddress,uTotalprices,uIntegration,uRemark,Email from TBL_USER where uName=?";
		Object[] param={uName};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		User user=null;
		try {
			if(rs.next()){
		    //�����û�ʵ�������
			user=new User();
			user.setUId(rs.getInt(1));
			user.setUNumber(rs.getString(2));
			user.setUName(rs.getString(3));
			user.setUIdentification(rs.getString(4));
			user.setUPass(rs.getString(5));
			user.setHead(rs.getString(6));
			user.setRegTime(rs.getTimestamp(7));
			user.setUGender(rs.getInt(8));
			user.setULink(rs.getString(9));
			user.setUAaddress(rs.getString(10));
			user.setUTotalprices(rs.getFloat(11));
			user.setUIntegration(rs.getInt(12));
			user.setURemark(rs.getString(13));
			user.setEmail(rs.getString(14));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	/*
	 * ɾ���û�
	 */
		public int deleteUser(int uID){
			int count = 0; // ���ܷ���ֵ
			// SQL���
			String preparedSql = "delete from TBL_USER where uID=? ";
			// ռλ��������
			Object[] param = {uID};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
			return count;
		}
	
	

	/*
	 * �����û����û�ID�����Ը���
	 * �����û�ʵ����
	 * �õ������û�����
	 */
	public int updateUser(User user) throws Exception {
		/*
		for (int i = 0; i < 10; i++) {
			if (users[i] != null && users[i].getUName().equals(user.getUName())) {
				// users[i]=user;
				if (user.getUId() != i) {
					throw new Exception("�û�ID�����޸�");
					// System.out.println("�޷�����~~~~"); //���ɵ���Ĵ���
				}
				users[i] = user;
				return 1;
			}
		}
		return 0;
		*/
		int count = 0; // ���ܷ���ֵ
		// SQL���		
		String preparedSql = "update TBL_USER set uName=?,uPass=? ,gender=?,uIdentification=?,head=?,uAaddress=?,uLink=?,Email=?,uRemark=? where uId=? ";
		// ռλ��������
		Object[] param = {user.getUName(),user.getUPass(),user.getUGender(),user.getUIdentification(),user.getHead(),user.getUAaddress(),user.getULink(),user.getEmail(),user.getURemark(),user.getUId()};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
    /*
     * �����û�ID�����û�
     * �����û�ID(int)
     * �����û�ʵ���ࣨUser��
     */
	public User findUser(int id) {
		//�����û�ʵ�������
		User user =new User();
		//����sql���
		String preparedSql="select uId,uNumber,uName,uIdentification,uPass,head,regTime,gender,uLink,uAaddress,uTotalprices,uIntegration,uRemark,Email from TBL_USER where uId=?";
		Object[] param={id};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			rs.next();
			user.setUId(rs.getInt(1));
			user.setUNumber(rs.getString(2));
			user.setUName(rs.getString(3));
			user.setUIdentification(rs.getString(4));
			user.setUPass(rs.getString(5));
			user.setHead(rs.getString(6));
			user.setRegTime(rs.getTimestamp(7));
			user.setUGender(rs.getInt(8));
			user.setULink(rs.getString(9));
			user.setUAaddress(rs.getString(10));
			user.setUTotalprices(rs.getFloat(11));
			user.setUIntegration(rs.getInt(12));
			user.setURemark(rs.getString(13));
			user.setEmail(rs.getString(14));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	 /**
     * �õ��û�List�����뵱ǰҳ��
     */
	public List findListUser(int page) {
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
	        
			//д��ҳsql��䱣�浽StringBuffer������
			StringBuffer sb=new StringBuffer();
			sb.append("select top"+" "+rows+" "+"*");
			sb.append(" "+"from TBL_USER");
			sb.append(" "+"where uId  not in");
			sb.append("(select top "+iRows);
			sb.append(" "+"uId from TBL_USER");
			sb.append(" "+"order by uId desc) order by uId desc");
			//��ӡ����д��sql��䣬����֤
			//System.out.println("sql:-->"+sb.toString());
	        try {
	            conn = this.getConn();                     // �õ����ݿ�����
	            pstmt = conn.prepareStatement(sb.toString());         // �õ�PreparedStatement����
	            rs = pstmt.executeQuery();                  // ִ��sqlȡ�ý����

	            /*  ѭ�����ظ���Ϣ��װ��List  */
	            while ( rs.next() ) {
	            	User user = new User();              // �ظ�����
	            	user.setUId(rs.getInt(1));
	    			user.setUNumber(rs.getString(2));
	    			user.setUName(rs.getString(3));
	    			user.setUIdentification(rs.getString(4));
	    			user.setUPass(rs.getString(5));
	    			user.setHead(rs.getString(6));
	    			user.setRegTime(rs.getTimestamp(7));
	    			user.setUGender(rs.getInt(8));
	    			user.setULink(rs.getString(9));
	    			user.setUAaddress(rs.getString(10));
	    			user.setUTotalprices(rs.getFloat(11));
	    			user.setUIntegration(rs.getInt(12));
	    			user.setURemark(rs.getString(13));
	    			user.setEmail(rs.getString(14));
	                list.add(user);
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
     * ͨ����ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param 
     * @return
     */ 
	public int getCountRows() {
		int pageSzie=0;   //�����Ÿ���
    	int pageCount=0;  //��ҳ��
    	pageSzie=findCountUser();
    	//ͨ������õ���ҳ����ÿҳ��ʾ10�У�
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
	}

	
	/**
     * ��Ʒ������
     * @param 
     * @return ��Ʒ����
     */
	public int findCountUser() {
		int              num = 0;                    // ��Ʒ����
        String            sql   = "select count(*) as counts from TBL_USER";
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
	 * ������
	 * @param args
	 */
	public static void main(String[] args) {
		UserDaoImpl us=new  UserDaoImpl();
		//List list=new ArrayList();
		//list=us.getListByfindUser("accp");
		//System.out.println("----------->"+list.size());
		

			//�������Id
			//for   (int   i=0;i<10;i++){   
		         
				//String   str1=String.valueOf(Math.random()*1000).substring(4, 7);   
				//String   str2=String.valueOf(Math.random()*1000).substring(8, 12);
				//String str=str1+str2;
		  //}   
				
		//System.out.println(str);
		
	}
}
