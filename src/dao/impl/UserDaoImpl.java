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

//接口实现类
public class UserDaoImpl extends BaseDao implements UserDao {

	
	
	    private Connection        conn  = null;              // 保存数据库连接
	    private PreparedStatement pstmt = null;              // 用于执行SQL语句
	    private ResultSet rs=null;             // 用户保存查询结果集
	    
	    int rows=15;      //定义每页显示的行数（每页15行）
	
	
	
	public User[] users = new User[10];
	
	// 创建BaseDao对象
	BaseDao baseDao = new BaseDao();
	
   

	
	
    /*
     *  增加用户
     *  返回音响行数
     */
	public int addUser(User user) {

		/*
		 * 没有连数据库的实现 for(int i=0;i<10;i++){ if(users[i]==null){ users[i]=user;
		 * users[i].setUId(i); return 1; } }
		 * 
		 */
		int count = 0; // 接受返回值
		String idStr="";   //保存随机产生的Number
		//判断用户是否存在
		List list =new ArrayList();
		list=getListByfindUser(user.getUName());
		if(list.size()==0){
			
			//产生随机uNumber
			String   str1=String.valueOf(Math.random()*1000).substring(4, 7);   
			String   str2=String.valueOf(Math.random()*1000).substring(8, 12);
			String   str3=String.valueOf(Math.random()*1000).substring(4, 7);
			String uNumber=str1+str2+str3;

			// SQL语句
			String preparedSql = 
				"insert into TBL_USER (uNumber,uName,uIdentification,uPass," 
				+"head,regTime,uLink,uAaddress,uRemark,Email,gender) " +
				"values(?,?,?,?,?,?,?,?,?,?,"+ user.getUGender() + ")";
			// 时间(进行了格式化)
			String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()); // 取得日期时间

			// setDate:java.sql.Date
			// java.sql.Date date = new
			// java.sql.Date(first.getCreateTime().getTime());
			// Date time=new Date(user.getRegTime().getTime());

			// 占位符号数组
			Object[] param = {uNumber,user.getUName(), user.getUIdentification(),user.getUPass(),user.getHead(),time,user.getULink(),user.getUAaddress(),user.getURemark(),user.getEmail()};
			count = baseDao.executeSQL(preparedSql, param);
			//return count;
		}else{
			count=0;
		}
		return count;
	}

	/*
	 * 查找用户
	 * 根据用户姓名查找用户
	 * 返回用户实体类集合
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
		
		//创建用户类集合
		List<User> list=new ArrayList<User>();
		//查找sql语句
		String preparedSql=
			"select uId,uNumber,uName,uIdentification,uPass,head,regTime,gender,uLink,uAaddress,uTotalprices," +
			"uIntegration,uRemark,Email from TBL_USER where uName=?";
		Object[] param={uName};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
		    //创建用户实体类对象
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
	
	// 根据用户姓名查找用户,返回对象
	public User getUser(String uName) {
		/*
		for (int i = 0; i < 10; i++) {
			if (users[i] != null && users[i].getUName().equals(uName)) {
				return users[i];
			}
		}
		return null;
		*/
		
		//创建用户类集合
		
		//查找sql语句
		String preparedSql="select uId,uNumber,uName,uIdentification,uPass,head,regTime,gender,uLink,uAaddress,uTotalprices,uIntegration,uRemark,Email from TBL_USER where uName=?";
		Object[] param={uName};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		User user=null;
		try {
			if(rs.next()){
		    //创建用户实体类对象
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
	 * 删除用户
	 */
		public int deleteUser(int uID){
			int count = 0; // 接受返回值
			// SQL语句
			String preparedSql = "delete from TBL_USER where uID=? ";
			// 占位符号数组
			Object[] param = {uID};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
			return count;
		}
	
	

	/*
	 * 更新用户，用户ID不可以更改
	 * 输入用户实体类
	 * 得到跟新用户数量
	 */
	public int updateUser(User user) throws Exception {
		/*
		for (int i = 0; i < 10; i++) {
			if (users[i] != null && users[i].getUName().equals(user.getUName())) {
				// users[i]=user;
				if (user.getUId() != i) {
					throw new Exception("用户ID不能修改");
					// System.out.println("无法更新~~~~"); //不可到达的代码
				}
				users[i] = user;
				return 1;
			}
		}
		return 0;
		*/
		int count = 0; // 接受返回值
		// SQL语句		
		String preparedSql = "update TBL_USER set uName=?,uPass=? ,gender=?,uIdentification=?,head=?,uAaddress=?,uLink=?,Email=?,uRemark=? where uId=? ";
		// 占位符号数组
		Object[] param = {user.getUName(),user.getUPass(),user.getUGender(),user.getUIdentification(),user.getHead(),user.getUAaddress(),user.getULink(),user.getEmail(),user.getURemark(),user.getUId()};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
    /*
     * 根据用户ID查找用户
     * 输入用户ID(int)
     * 返回用户实体类（User）
     */
	public User findUser(int id) {
		//创建用户实体类对象
		User user =new User();
		//查找sql语句
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
     * 得到用户List，输入当前页数
     */
	public List findListUser(int page) {
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
	        
			//写分页sql语句保存到StringBuffer对象中
			StringBuffer sb=new StringBuffer();
			sb.append("select top"+" "+rows+" "+"*");
			sb.append(" "+"from TBL_USER");
			sb.append(" "+"where uId  not in");
			sb.append("(select top "+iRows);
			sb.append(" "+"uId from TBL_USER");
			sb.append(" "+"order by uId desc) order by uId desc");
			//打印以上写的sql语句，以验证
			//System.out.println("sql:-->"+sb.toString());
	        try {
	            conn = this.getConn();                     // 得到数据库连接
	            pstmt = conn.prepareStatement(sb.toString());         // 得到PreparedStatement对象
	            rs = pstmt.executeQuery();                  // 执行sql取得结果集

	            /*  循环将回复信息封装成List  */
	            while ( rs.next() ) {
	            	User user = new User();              // 回复对象
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
	            e.printStackTrace();                        // 处理异常
	        } finally {
	            this.closeAll(conn, pstmt, rs);             // 释放资源
	        }
	        return list;
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
    	pageSzie=findCountUser();
    	//通过计算得到总页数（每页显示10行）
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
	}

	
	/**
     * 商品总条数
     * @param 
     * @return 商品条数
     */
	public int findCountUser() {
		int              num = 0;                    // 产品条数
        String            sql   = "select count(*) as counts from TBL_USER";
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
	 * 测试类
	 * @param args
	 */
	public static void main(String[] args) {
		UserDaoImpl us=new  UserDaoImpl();
		//List list=new ArrayList();
		//list=us.getListByfindUser("accp");
		//System.out.println("----------->"+list.size());
		

			//产生随机Id
			//for   (int   i=0;i<10;i++){   
		         
				//String   str1=String.valueOf(Math.random()*1000).substring(4, 7);   
				//String   str2=String.valueOf(Math.random()*1000).substring(8, 12);
				//String str=str1+str2;
		  //}   
				
		//System.out.println(str);
		
	}
}
