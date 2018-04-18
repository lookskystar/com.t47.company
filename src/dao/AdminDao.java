package dao;
import entity.*;

import java.util.List;

public interface AdminDao {
	public List ListByFindAdmin();     //所有管理员
	public int addAdmin(Admin admin);  //增加管理员
	public int updateAdmin(Admin admin) throws Exception;  //更新管理员
	public User findAdmin(int adminId);   //根据Id查管理员
	public List getListByfindAdmin(String adminName);
	public Admin getAdminByfindId(int adminId);
	public int delAdmin(int adminId);
}
