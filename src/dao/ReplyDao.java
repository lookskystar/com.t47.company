package dao;

import entity.Reply;
import java.util.*;
/*
 * �ظ��ӿ�
 */
public interface ReplyDao {
	 /**
     * ��ӻظ�
     * @param reply
     * @return ��������
     */
    public int addReply(Reply reply);
    /**
     * ɾ���ظ�
     * @param replyId 
     * @return ɾ������
     */
    public int deleteReply(int replyId);
    /**
     * ���»ظ�
     * @param reply
     * @return ��������
     */
    public int updateReply(Reply reply);
    /**
     * ���һظ�List
     * @param page
     * @return ��ѯ���
     */
    public List findListReply(int page, int topicId);
    /**
     * ��������id��ѯ��������Ļظ�����
     * @param topicId ����id
     * @return �ظ�����
     */
    public int findCountReply(int topicId);
    /**
     * ��������id�����һظ�����Ϣ
     * @param replyId
     * @return �ظ�
     */
    public Reply findReply(int replyId);
    /**
     * ��������ID�õ����������һ�λظ�������
     * @param topicId
     * @return
     */
    public Reply getReplyByTopicId(int topicId);
    /**
     * ��ҳ1��
     * ͨ���ܻظ�������ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param topicId
     * @return
     */ 
    public int getCountRows(int topicId);
    /**
     * ɾ���ظ�
     * @param �����û�Id
     * @return ɾ������
     */
    public int deleteReplyById(int uID);
    /**
     * �����û�id�����һظ�����Ϣ
     * @param replyId
     * @return �ظ�
     */
    public List findReplyByUId(int uID);
    /**
     * ɾ���ظ�
     * @param ��������Id
     * @return ɾ������
     */
    public int deleteReplyByTopicId(int topicId);
}
