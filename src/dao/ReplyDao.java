package dao;

import entity.Reply;
import java.util.*;
/*
 * 回复接口
 */
public interface ReplyDao {
	 /**
     * 添加回复
     * @param reply
     * @return 增加条数
     */
    public int addReply(Reply reply);
    /**
     * 删除回复
     * @param replyId 
     * @return 删除条数
     */
    public int deleteReply(int replyId);
    /**
     * 更新回复
     * @param reply
     * @return 更新条数
     */
    public int updateReply(Reply reply);
    /**
     * 查找回复List
     * @param page
     * @return 查询结果
     */
    public List findListReply(int page, int topicId);
    /**
     * 根据主题id查询出该主题的回复条数
     * @param topicId 主题id
     * @return 回复条数
     */
    public int findCountReply(int topicId);
    /**
     * 根据主题id，查找回复的信息
     * @param replyId
     * @return 回复
     */
    public Reply findReply(int replyId);
    /**
     * 根据主题ID得到该主题最后一次回复的帖子
     * @param topicId
     * @return
     */
    public Reply getReplyByTopicId(int topicId);
    /**
     * 分页1步
     * 通过总回复个数和每页行数（取10）的计算得到总页数
     * @param topicId
     * @return
     */ 
    public int getCountRows(int topicId);
    /**
     * 删除回复
     * @param 输入用户Id
     * @return 删除条数
     */
    public int deleteReplyById(int uID);
    /**
     * 根据用户id，查找回复的信息
     * @param replyId
     * @return 回复
     */
    public List findReplyByUId(int uID);
    /**
     * 删除回复
     * @param 输入主贴Id
     * @return 删除条数
     */
    public int deleteReplyByTopicId(int topicId);
}
