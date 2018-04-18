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
	
	// ����BaseDao����
	BaseDao baseDao = new BaseDao();
	//�����������Ա����ѯ��������
    private ResultSet rs=null;

	public List ListByFindAdmin() {
		List<Admin> list=new ArrayList<Admin>();
		//����sql���
		String preparedSql="select adminId,adminName,adminPass,adminStatus from TBL_ADMIN";
		Object[] param={};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
		    //�����û�ʵ�������
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
	 * ͨ��������Ա�������ҹ���Ա��Ϣ
	 * @param admin
	 * @return
	 */
	public List getListByfindAdmin(String adminName){
		//�����û��༯��
		List list=new ArrayList();
		//����sql���
		String preparedSql="select adminId,adminName,adminPass,adminStatus from TBL_ADMIN where adminName=?";
		Object[] param={adminName};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		try {
			while(rs.next()){
		    //�����û�ʵ�������
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
	 * ͨ��������Ա�������ҹ���Ա��Ϣ(�õ�ʵ����)
	 * @param admin
	 * @return
	 */
	public Admin getAdminByfindId(int adminId){
	
		//����sql���
		String preparedSql="select adminId,adminName,adminPass,adminStatus from TBL_ADMIN where adminID=?";
		Object[] param={adminId};
		rs=baseDao.executeQuerySQL(preparedSql, param);
		Admin admin=new Admin();
		try {
			if(rs.next()){
		    //�����û�ʵ�������
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
	 * ���ӹ���Ա
	 */
	public int addAdmin(Admin admin) {
		int count = 0; // ���ܷ���ֵ
		String idStr="";   //�������������Number
		//�ж��û��Ƿ����
		List list =new ArrayList();
		list=getListByfindAdmin(admin.getAdminName());
		if(list.size()==0){
			// SQL���
			String preparedSql = "insert into TBL_ADMIN (adminName,adminPass,adminStatus) values(?,?,?)";
			// ռλ��������
			Object[] param = {admin.getAdminName(),admin.getAdminPass(),admin.getAdminStatus()};
			count = baseDao.executeSQL(preparedSql, param);
			//return count;
		}else{
			count=0;
		}
		return count;
	}
     
/*
 * ɾ������Ա
 */
	public int delAdmin(int adminId){
		int count = 0; // ���ܷ���ֵ
		// SQL���
		String preparedSql = "delete from TBL_ADMIN where adminID=? ";
		// ռλ��������
		Object[] param = {adminId};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}
    
	/*
	 * �޸Ĺ���Ա
	 * @see dao.AdminDao#updateAdmin(entity.Admin)
	 */
	public int updateAdmin(Admin admin) throws Exception {
		int count = 0; // ���ܷ���ֵ
		// SQL���		
		String preparedSql = "update TBL_ADMIN set adminName=?,adminPass=?  where adminID=? ";
		// ռλ��������
		Object[] param = {admin.getAdminName(),admin.getAdminPass(),admin.getAdminId()};
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}

	
	//���Ժ���
	public static void main(String[] args) {
		AdminDaoImpl adimp=new AdminDaoImpl();
	
	}

	public User findAdmin(int adminId) {
		// TODO Auto-generated method stub
		return null;
	}
}
