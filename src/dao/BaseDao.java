package dao;
/*
 * 连接数据类
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class BaseDao  {
	//定义常量，把数据库驱动定义成一个字符串，服务器名和数据库名定义成一个字符串，数据库用户名定义成一个字符串，数据库密码定义成一个字符串
    private final static	String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";   //数据库驱动
    private final static	String URL="jdbc:sqlserver://127.0.0.1;databaseName=DBCOMPANY";       //
    private final static String DBNAME="sa";    //数据库用户名
    private final static String DBPASS="123456";      //数据库密码
    
    ResultSet rs=null;            //定义结果集
    
    /*
     * 得到数据库连接
     * @throws classNotFoundException
     * @throws SQLException
     * @return 数据库连接
     */
    public Connection getConn() throws ClassNotFoundException, SQLException{
    		Class.forName(DRIVER);    //注册驱动
    		Connection conn=DriverManager.getConnection(URL,DBNAME,DBPASS);
    		return conn;    //返回连接	
    }
    
    
    
    /*
     * 释放资源
     * @param conn 数据库连接
     * @param pstmt PreparedStatement对象
     * @param rs 结果集
     */
    public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs){
    	//关闭资源应该从后望前关
    	/*如果rs不空，关闭rs*/
    	if(rs!=null){
    		try{
    			rs.close();
    		}
    		catch(SQLException e){
    				//输出异常
    				e.printStackTrace();
    			}
    		/*如果pstmt不空，关闭pstmt*/
    		if(pstmt!=null){
    			try {
					pstmt.close();
				} catch (Exception e) {
					//输出异常
					e.printStackTrace();
				}
    		}
    		/*如果conn不空，关闭conn*/
    		if(conn!=null){
    			try {
					conn.close();
				} catch (Exception e) {
					//输出异常
					e.printStackTrace();
				}
    		}
    		}
    	}
	
    /**
     * 执行SQL语句，可以进行增，删，改的操作，不能进行查询
     * @param sql 预编译的sql语句
     * @param param 预编译的sql语句中的‘？’，参数的字符串数组
     * @return 影响的条数
     */
    public int executeSQL(String preparedSql,Object[] param){
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	int num=0;
    	/*处理SQL,执行SQL*/
    	try {
			conn=getConn();       //得到数据库连接
			pstmt=conn.prepareStatement(preparedSql);
			if(pstmt!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1, param[i]);  //设置参数   设置Object是因为如果是int类型就不出现类型不同的错误
				}
			}
			num=pstmt.executeUpdate();     //执行SQL语句
		} catch (ClassNotFoundException e) {
			e.printStackTrace();   //处理ClassNotFoundException异常
		} catch (SQLException e){
			e.printStackTrace();    //处理SQLException异常
		}finally{
			closeAll(conn, pstmt, null);      //释放资源
		}
		return num;
    }
    
    /**
     * 执行SQL语句，进行查询
     * @param sql 预编译的sql语句
     * @param param 预编译的sql语句中的‘？’，参数的字符串数组
     * @return ResultSet结果集
     */
    public ResultSet executeQuerySQL(String preparedSql,Object[] param){
    	Connection conn=null;
    	PreparedStatement pstmt=null;
    	/*处理SQL,执行SQL*/
    	try {
			conn=getConn();       //得到数据库连接
			pstmt=conn.prepareStatement(preparedSql);
			if(pstmt!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setObject(i+1, param[i]);  //设置参数   设置Object是因为如果是int类型就不出现类型不同的错误	
				}
			}
			rs=pstmt.executeQuery();     //执行SQL语句
		} catch (ClassNotFoundException e) {
			e.printStackTrace();   //处理ClassNotFoundException异常
		} catch (SQLException e){
			e.printStackTrace();    //处理SQLException异常
		}finally{
			closeAll(conn, pstmt, null);      //释放资源
		}
		
		return rs;
    }
}
    

