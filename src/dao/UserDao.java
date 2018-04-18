package dao;
import entity.*;

import java.util.List;
//UserDao接口
public interface UserDao {
	public List getListByfindUser(String uName);  //根据用户名查找论坛用户
	public int addUser(User user);  //增加论坛用户，返回增加个数
	public int updateUser(User user) throws Exception;;  //修改论坛用户信息，返回修改个数
	//接口常量
	public static final int FEMALE=1;  //代表女性
	public static final int MALE=2;    //代表男性
	
	public User findUser(int uId);   //根据用户Id查找论坛用户
	 /**
     * 得到用户List，输入当前页数
     */
	public List findListUser(int page);
	/**
     * 分页1步
     * 通过总每页行数（取10）的计算得到总页数
     * @param 
     * @return
     */ 
	public int getCountRows();
	/**
     * 商品总条数
     * @param 
     * @return 商品条数
     */
	public int findCountUser();
	/*
	 * 删除用户
	 */
	public int deleteUser(int uID);
	
	//// 根据用户姓名查找用户,返回对象
	public User getUser(String uName);
}
