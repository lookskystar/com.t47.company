package dao;

import java.util.List;

import entity.Product;;

/**
 * ��Ʒ�ӿ�
 * @author Administrator
 *
 */
public interface ProuctDao {
	/**
     * �����Ʒ
     * @param news
     * @return Ӱ������
     */
    public int addProduct(Product product);
    /**
     * ɾ����Ʒ
     * @param productId 
     * @return ɾ������
     */
    public int deleteProduct(int productId );
    /**
     * ������Ʒ
     * @param news
     * @return ��������
     */
    public int updateProduct(Product product);
    /**
     * ������ƷList
     * @param pageҳ��
     * @return ��ѯ���
     */
    public List findListProduct(int page);
    /**
     * ��Ʒ������
     * @param 
     * @return ��Ʒ����
     */
    public int findCountProduct();
    /**
     * ������Ʒid��������Ʒ����Ϣ
     * @param productId
     * @return ��Ʒ
     */
    public Product findProduct(int productId);
    /**
     * ��ҳ1��
     * ͨ������Ʒ������ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param topicId
     * @return
     */ 
    public int getCountRows();


}
