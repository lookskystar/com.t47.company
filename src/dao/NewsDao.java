package dao;

import java.util.List;

import entity.News;

/**
 * ���Žӿ�
 * @author Administrator
 *
 */
public interface NewsDao {
		 /**
	     * �������
	     * @param news
	     * @return Ӱ������
	     */
	    public int addNews(News news);
	    /**
	     * ɾ������
	     * @param replyId 
	     * @return ɾ������
	     */
	    public int deleteNews(int newsId);
	    /**
	     * ��������
	     * @param news
	     * @return ��������
	     */
	    public int updateNews(News news);
	    /**
	     * ��������List
	     * @param pageҳ��
	     * @return ��ѯ���
	     */
	    public List findListNews(int page);
	    /**
	     * ����������
	     * @param 
	     * @return ��������
	     */
	    public int findCountNews();
	    /**
	     * ��������id���������ŵ���Ϣ
	     * @param newsId
	     * @return ����
	     */
	    public News findNews(int newsId);
	    /**
	     * ��ҳ1��
	     * ͨ�������Ÿ�����ÿҳ������ȡ10���ļ���õ���ҳ��
	     * @param topicId
	     * @return
	     */ 
	    public int getCountRows();

}
