package dao;
/*
 * ����������
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class BaseDao  {
	//���峣���������ݿ����������һ���ַ������������������ݿ��������һ���ַ��������ݿ��û��������һ���ַ��������ݿ����붨���һ���ַ���
    private final static	String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";   //���ݿ�����
    private final static	String URL="jdbc:sqlserver://127.0.0.1;databaseName=DBCOMPANY";       //
    private final static String DBNAME="sa";    //���ݿ��û���
    private final static String DBPASS="123456";      //���ݿ�����
    
    ResultSet rs=null;            //��������
    
    /*
     * �õ����ݿ�����
     * @throws classNotFoundException
     * @throws SQLException
     * @return ���ݿ�����
     */
    public Connection getConn() throws ClassNotFoundException, SQLException{
    		Class.forName(DRIVER);    //ע������
    		Connection conn=DriverManager.getConnection(URL,DBNAME,DBPASS);
    		return conn;    //��������	
    }
    
    
    
    /*
     * �ͷ���Դ
     * @param conn ���ݿ�����
     * @param pstmt PreparedStatement����
     * @param rs �����
     */
    public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs){
    	//�ر���ԴӦ�ôӺ���ǰ��
    	/*���rs���գ��ر�rs*/
    	if(rs!=null){
    		try{
    			rs.close();
    		}
    		catch(SQLException e){
    				//����쳣
    				e.printStackTrace();
    			}
    		/*���pstmt���գ��ر�pstmt*/
    		if(pstmt!=null){
    			try {
					pstmt.close();
				} catch (Exception e) {
					//����쳣
					e.printStackTrace();
				}
    		}
    		/*���conn���գ��ر�conn*/
    		if(conn!=null){
    			try {
					conn.close();
				} catch (Exception e) {
					//����쳣
					e.printStackTrace();
				}
    		}
    		}
    	}
	
    /**
     * ִ��SQL��䣬���Խ�������ɾ���ĵĲ��������ܽ��в�ѯ
     * @param sql Ԥ�����sql���
     * @param param Ԥ�����sql����еġ��������������ַ�������
     * @return Ӱ�������
     */
    public int executeSQL(String preparedSql,Object[] param){
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	int num=0;
    	/*����SQL,ִ��SQL*/
    	try {
			conn=getConn();       //�õ����ݿ�����
			pstmt=conn.prepareStatement(preparedSql);
			if(pstmt!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1, param[i]);  //���ò���   ����Object����Ϊ�����int���;Ͳ��������Ͳ�ͬ�Ĵ���
				}
			}
			num=pstmt.executeUpdate();     //ִ��SQL���
		} catch (ClassNotFoundException e) {
			e.printStackTrace();   //����ClassNotFoundException�쳣
		} catch (SQLException e){
			e.printStackTrace();    //����SQLException�쳣
		}finally{
			closeAll(conn, pstmt, null);      //�ͷ���Դ
		}
		return num;
    }
    
    /**
     * ִ��SQL��䣬���в�ѯ
     * @param sql Ԥ�����sql���
     * @param param Ԥ�����sql����еġ��������������ַ�������
     * @return ResultSet�����
     */
    public ResultSet executeQuerySQL(String preparedSql,Object[] param){
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	/*����SQL,ִ��SQL*/
    	try {
			conn=getConn();       //�õ����ݿ�����
			pstmt=conn.prepareStatement(preparedSql);
			if(pstmt!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1, param[i]);  //���ò���   ����Object����Ϊ�����int���;Ͳ��������Ͳ�ͬ�Ĵ���	
				}
			}
			rs=pstmt.executeQuery();     //ִ��SQL���
		} catch (ClassNotFoundException e) {
			e.printStackTrace();   //����ClassNotFoundException�쳣
		} catch (SQLException e){
			e.printStackTrace();    //����SQLException�쳣
		}finally{
			closeAll(conn, pstmt, null);      //�ͷ���Դ
		}
		
		return rs;
    }
}
    

