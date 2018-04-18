package dao;

//标题接口
import java.util.List;
import entity.*;


public interface TopicDao {
	public Topic findTopic(int topicId);  //根据标题ID，查找主题的信息
	public int addTopic(Topic topic);  //增加主题，返回增加个数
	public int deleteTopic(int topicId);  //根据主题ID删除主题
	public int updateTopic(Topic topic);  //更新主题的信息
	public List findListTopic(int page,int boardId);  //查帖子
	
	public int findCountTopic(int boardId);      //查询返回主题数
	
	/*
     *查找一个主题的详细信息（根据主题名）
     *输入查找主题名
     * return int
     */
	public int getTileFindTopic(String title);
	/**
	 * 得到每页显示10行的页数
	 * @param boardId版块Id
	 * @return 改版块下的主题每页显示10行的页数
	 */
	public int getCountRows(int boardId);
	/**
	 * 更新该主题点击次数
	 * @param topicId主题ID
	 * @return 影响行数
	 */
    public int updateClickCount(int topicId);
    
    /*
     * 删除主题
     * 输入发表用户ID
     * return 影响行数
     */
	public int deleteTopicById(int uID);
	
	 /*
     *根据uID查找主题
     *输入查找用户ID号
     * return List
     */
	public List findTopicByUId(int uID);

}
