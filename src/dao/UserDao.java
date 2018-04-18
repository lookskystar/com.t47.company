package dao;
import entity.*;

import java.util.List;
//UserDao�ӿ�
public interface UserDao {
	public List getListByfindUser(String uName);  //�����û���������̳�û�
	public int addUser(User user);  //������̳�û����������Ӹ���
	public int updateUser(User user) throws Exception;;  //�޸���̳�û���Ϣ�������޸ĸ���
	//�ӿڳ���
	public static final int FEMALE=1;  //����Ů��
	public static final int MALE=2;    //��������
	
	public User findUser(int uId);   //�����û�Id������̳�û�
	 /**
     * �õ��û�List�����뵱ǰҳ��
     */
	public List findListUser(int page);
	/**
     * ��ҳ1��
     * ͨ����ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param 
     * @return
     */ 
	public int getCountRows();
	/**
     * ��Ʒ������
     * @param 
     * @return ��Ʒ����
     */
	public int findCountUser();
	/*
	 * ɾ���û�
	 */
	public int deleteUser(int uID);
	
	//// �����û����������û�,���ض���
	public User getUser(String uName);
}
