package dao;

import java.util.List;

import entity.Product;;

/**
 * 商品接口
 * @author Administrator
 *
 */
public interface ProuctDao {
	/**
     * 添加商品
     * @param news
     * @return 影响条数
     */
    public int addProduct(Product product);
    /**
     * 删除商品
     * @param productId 
     * @return 删除条数
     */
    public int deleteProduct(int productId );
    /**
     * 更新商品
     * @param news
     * @return 更新条数
     */
    public int updateProduct(Product product);
    /**
     * 查找商品List
     * @param page页数
     * @return 查询结果
     */
    public List findListProduct(int page);
    /**
     * 商品总条数
     * @param 
     * @return 商品条数
     */
    public int findCountProduct();
    /**
     * 根据商品id，查找商品的信息
     * @param productId
     * @return 商品
     */
    public Product findProduct(int productId);
    /**
     * 分页1步
     * 通过总商品个数和每页行数（取10）的计算得到总页数
     * @param topicId
     * @return
     */ 
    public int getCountRows();


}
