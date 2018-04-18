package dao;

//����ӿ�
import java.util.List;
import entity.*;


public interface TopicDao {
	public Topic findTopic(int topicId);  //���ݱ���ID�������������Ϣ
	public int addTopic(Topic topic);  //�������⣬�������Ӹ���
	public int deleteTopic(int topicId);  //��������IDɾ������
	public int updateTopic(Topic topic);  //�����������Ϣ
	public List findListTopic(int page,int boardId);  //������
	
	public int findCountTopic(int boardId);      //��ѯ����������
	
	/*
     *����һ���������ϸ��Ϣ��������������
     *�������������
     * return int
     */
	public int getTileFindTopic(String title);
	/**
	 * �õ�ÿҳ��ʾ10�е�ҳ��
	 * @param boardId���Id
	 * @return �İ���µ�����ÿҳ��ʾ10�е�ҳ��
	 */
	public int getCountRows(int boardId);
	/**
	 * ���¸�����������
	 * @param topicId����ID
	 * @return Ӱ������
	 */
    public int updateClickCount(int topicId);
    
    /*
     * ɾ������
     * ���뷢���û�ID
     * return Ӱ������
     */
	public int deleteTopicById(int uID);
	
	 /*
     *����uID��������
     *��������û�ID��
     * return List
     */
	public List findTopicByUId(int uID);

}
