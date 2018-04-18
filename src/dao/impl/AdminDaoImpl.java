package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.AdminDao;
import dao.BaseDao;
import entity.Admin;
import entity.User;


public class AdminDaoImpl extends BaseDao implements AdminDao {
	
	// 创建BaseDao对象
	BaseDao baseDao = new BaseDao();
	//定义结果集，以保存查询来的数据
    private ResultSet rs=null;

	public List ListByFindAdmin() {
		List<Admin> list=new ArrayList<Admin>();
		//查找sql语句
		String preparedSql="select adminId,adminName,adminPass,adminStatus from TBL_ADMIN";
		Object[] param={};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
		    //创建用户实体类对象
			Admin admin=new Admin();
			admin.setAdminId(rs.getInt(1));
			admin.setAdminName(rs.getString(2));
			admin.setAdminPass(rs.getString(3));
			admin.setAdminStatus(rs.getInt(4));
			list.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
    
	/**
	 * 通过管理人员姓名查找管理员信息
	 * @param admin
	 * @return
	 */
	public List getListByfindAdmin(String adminName){
		//创建用户类集合
		List list=new ArrayList();
		//查找sql语句
		String preparedSql="select adminId,adminName,adminPass,adminStatus from TBL_ADMIN where adminName=?";
		Object[] param={adminName};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
		    //创建用户实体类对象
				Admin admin=new Admin();
				admin.setAdminId(rs.getInt(1));
				admin.setAdminName(rs.getString(2));
				admin.setAdminPass(rs.getString(3));
				admin.setAdminStatus(rs.getInt(4));
				list.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/**
	 * 通过管理人员姓名查找管理员信息(得到实体类)
	 * @param admin
	 * @return
	 */
	public Admin getAdminByfindId(int adminId){
	
		//查找sql语句
		String preparedSql="select adminId,adminName,adminPass,adminStatus from TBL_ADMIN where adminID=?";
		Object[] param={adminId};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		Admin admin=new Admin();
		try {
			if(rs.next()){
		    //创建用户实体类对象
				admin.setAdminId(rs.getInt(1));
				admin.setAdminName(rs.getString(2));
				admin.setAdminPass(rs.getString(3));
				admin.setAdminStatus(rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return admin;
	}
	
	
	
	/**
	 * 增加管理员
	 */
	public int addAdmin(Admin admin) {
		int count = 0; // 接受返回值
		String idStr="";   //保存随机产生的Number
		//判断用户是否存在
		List list =new ArrayList();
		list=getListByfindAdmin(admin.getAdminName());
		if(list.size()==0){
			// SQL语句
			String preparedSql = "insert into TBL_ADMIN (adminName,adminPass,adminStatus) values(?,?,?)";
			// 占位符号数组
			Object[] param = {admin.getAdminName(),admin.getAdminPass(),admin.getAdminStatus()};
			count = baseDao.executeSQL(preparedSql, param);
			//return count;
		}else{
			count=0;
		}
		return count;
	}
     
/*
 * 删除管理员
 */
	public int delAdmin(int adminId){
		int count = 0; // 接受返回值
		// SQL语句
		String preparedSql = "delete from TBL_ADMIN where adminID=? ";
		// 占位符号数组
		Object[] param = {adminId};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
    
	/*
	 * 修改管理员
	 * @see dao.AdminDao#updateAdmin(entity.Admin)
	 */
	public int updateAdmin(Admin admin) throws Exception {
		int count = 0; // 接受返回值
		// SQL语句		
		String preparedSql = "update TBL_ADMIN set adminName=?,adminPass=?  where adminID=? ";
		// 占位符号数组
		Object[] param = {admin.getAdminName(),admin.getAdminPass(),admin.getAdminId()};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}

	
	//测试函数
	public static void main(String[] args) {
		AdminDaoImpl adimp=new AdminDaoImpl();
	
	}

	public User findAdmin(int adminId) {
		// TODO Auto-generated method stub
		return null;
	}
}
