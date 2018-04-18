package dao;
import entity.*;

import java.util.List;

public interface AdminDao {
	public List ListByFindAdmin();     //���й���Ա
	public int addAdmin(Admin admin);  //���ӹ���Ա
	public int updateAdmin(Admin admin) throws Exception;  //���¹���Ա
	public User findAdmin(int adminId);   //����Id�����Ա
	public List getListByfindAdmin(String adminName);
	public Admin getAdminByfindId(int adminId);
	public int delAdmin(int adminId);
}
