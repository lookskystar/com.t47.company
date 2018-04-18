package dao;

import java.util.List;

import entity.News;

/**
 * 新闻接口
 * @author Administrator
 *
 */
public interface NewsDao {
		 /**
	     * 添加新闻
	     * @param news
	     * @return 影响条数
	     */
	    public int addNews(News news);
	    /**
	     * 删除新闻
	     * @param replyId 
	     * @return 删除条数
	     */
	    public int deleteNews(int newsId);
	    /**
	     * 更新新闻
	     * @param news
	     * @return 更新条数
	     */
	    public int updateNews(News news);
	    /**
	     * 查找新闻List
	     * @param page页数
	     * @return 查询结果
	     */
	    public List findListNews(int page);
	    /**
	     * 新闻总条数
	     * @param 
	     * @return 新闻条数
	     */
	    public int findCountNews();
	    /**
	     * 根据新闻id，查找新闻的信息
	     * @param newsId
	     * @return 新闻
	     */
	    public News findNews(int newsId);
	    /**
	     * 分页1步
	     * 通过总新闻个数和每页行数（取10）的计算得到总页数
	     * @param topicId
	     * @return
	     */ 
	    public int getCountRows();

}
