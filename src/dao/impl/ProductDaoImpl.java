package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.*;
import entity.*;

/**
 * ��Ʒ�ӿ�ʵ��
 * @author Administrator
 *
 */
public class ProductDaoImpl extends BaseDao implements ProuctDao {
	
    private Connection        conn  = null;              // �������ݿ�����
    private PreparedStatement pstmt = null;              // ����ִ��SQL���
    private ResultSet         rs    = null ;             // �û������ѯ�����
    
    int rows=9;      //����ÿҳ��ʾ��������ÿҳ6�У�
    
	public int addProduct(Product product) {
		int count = 0; // ���ܷ���ֵ
		String idStr="";   //�������������Number
			// SQL���
			String preparedSql = "insert into TBL_PRODUCT (serialNumber,proName,brand,model,picture,descriptions,price) values(?,?,?,?,?,?,?)";
			// ռλ��������
			Object[] param = {product.getSerialNumber(),product.getNames(),product.getBrand(),product.getModel(),product.getPicture(),product.getDescriptions(),product.getPrice()};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
		
		return count;
	}

	 /*
	  * ɾ����Ʒ
	  * @see dao.ProuctDao#deleteProduct(int)
	  */
	public int deleteProduct(int productId){
		int count = 0; // ���ܷ���ֵ
		// SQL���
		String preparedSql = "delete from TBL_PRODUCT where productId=? ";
		// ռλ��������
		Object[] param = {productId};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}

	/**
     * ��Ʒ������
     * @param 
     * @return ��Ʒ����
     */
	public int findCountProduct() {
		int              num = 0;                    // ��Ʒ����
        String            sql   = "select count(*) as counts from TBL_PRODUCT";
        try {
            conn  = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            while( rs.next() ) {
            	num = rs.getInt("counts"); 
            }
        } catch ( Exception e) {
            e.printStackTrace();                        // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);             // �ͷ���Դ
            
        }
        //System.out.println("num:"+num);
        return num;
	}
    
     /**
      * �õ���ƷList�����뵱ǰҳ��
      */
	public List findListProduct(int page) {
		 List list  = new ArrayList();                  // �����������Ŷ����б�
	        conn  = null;                                  // ���ڱ������ݿ�����
	        pstmt = null;                                  // ����ִ��SQL���
	        rs    = null;                                  // �û������ѯ�����
	        
	      //����(�õ�ÿҳ��ʾ10�е�ҳ��)�ķ���
	       int pageCount=getCountRows();            //�õ��ܵ�ҳ��
	        
	        if( page < 1 ) {
	            page=1;                                     // ��ǰҳ�����С��1�͵���1
	        }
	        
	        if(page>pageCount){
	        	page=pageCount;                            //��ǰҳ������������ҳ��͵������ҳ��
	        }
	        
	        //�ɵ�ǰҳ��*ÿҳ��ʾ�����������е���ǰҳ�����������ļ���ֵ
			int iRows=(page-1)*rows;
	        
			//д��ҳsql��䱣�浽StringBuffer������
			StringBuffer sb=new StringBuffer();
			sb.append("select top"+" "+rows+" "+"*");
			sb.append(" "+"from TBL_PRODUCT");
			sb.append(" "+"where productId  not in");
			sb.append("(select top "+iRows);
			sb.append(" "+"productId from TBL_PRODUCT");
			sb.append(" "+"order by productId desc) order by productId desc");
			//��ӡ����д��sql��䣬����֤
			//System.out.println("sql:-->"+sb.toString());
	        try {
	            conn = this.getConn();                     // �õ����ݿ�����
	            pstmt = conn.prepareStatement(sb.toString());         // �õ�PreparedStatement����
	            rs = pstmt.executeQuery();                  // ִ��sqlȡ�ý����

	            /*  ѭ�����ظ���Ϣ��װ��List  */
	            while ( rs.next() ) {
	            	Product product = new Product();              // �ظ�����
	            	product.setProductId(rs.getInt("productId"));
	            	product.setSerialNumber(rs.getString("serialNumber"));
	            	product.setNames(rs.getString("proName"));
	            	product.setBrand(rs.getString("brand"));
	            	product.setModel(rs.getString("model"));
	            	product.setPicture(rs.getString("picture"));
	            	product.setDescriptions(rs.getString("descriptions"));
	            	product.setPrice(rs.getFloat("price"));
	                list.add(product);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();                        // �����쳣
	        } finally {
	            this.closeAll(conn, pstmt, rs);             // �ͷ���Դ
	        }
	        return list;
	}
    
	/**
	 * ������ƷId������Ʒ��Ϣ
	 */
	public Product findProduct(int productId) {
		String sql  = "select * from TBL_PRODUCT where productId=?";
        Product product = null;
        try {
            conn  = this.getConn();                // ������ݿ�����
            pstmt = conn.prepareStatement(sql);    // �õ�һ��PreparedStatement����
            pstmt.setInt(1, productId);              // ����productIdΪ����ֵ
            rs    = pstmt.executeQuery();          // ִ��sql��ȡ�ò�ѯ�����

            /*  ��������е���Ϣȡ�����浽product�����У�ѭ�����ֻ��ִ��һ��  */
            while ( rs.next() ) {
            	product = new Product();              // �ظ�����
            	product.setProductId(rs.getInt("productId"));
            	product.setSerialNumber(rs.getString("serialNumber"));
            	product.setNames(rs.getString("proName"));
            	product.setBrand(rs.getString("brand"));
            	product.setModel(rs.getString("model"));
            	product.setPicture(rs.getString("picture"));
            	product.setDescriptions(rs.getString("descriptions"));
            	product.setPrice(rs.getFloat("price"));
            }
        } catch (Exception e) {
            e.printStackTrace();                   // �����쳣
        } finally {
            this.closeAll(conn, pstmt, rs);       // �ͷ���Դ
        }
        return product;
	}

	/**
     * ��ҳ1��
     * ͨ����ÿҳ������ȡ10���ļ���õ���ҳ��
     * @param 
     * @return
     */ 
	public int getCountRows() {
		int pageSzie=0;   //�����Ÿ���
    	int pageCount=0;  //��ҳ��
    	pageSzie=findCountProduct();
    	//ͨ������õ���ҳ����ÿҳ��ʾ10�У�
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
	}

   /**
    * �޸Ĳ�Ʒ
    */
	public int updateProduct(Product product) {
		int count = 0; // ���ܷ���ֵ
		String idStr="";   //�������������Number
			// SQL���
			String preparedSql = "update TBL_PRODUCT set proName=?,brand=?,model=?,picture=?,descriptions=?,price=? where productId=? ";
			// ռλ��������
			Object[] param = {product.getNames(),product.getBrand(),product.getModel(),product.getPicture(),product.getDescriptions(),product.getPrice(),product.getProductId()};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
		
		return count;
	}

	
	
	
	
	/**
	 * ���Ժ���
	 * @param args
	 */
	public static void main(String[] args) {
		ProductDaoImpl proImpl=new ProductDaoImpl();
		Product pro=new Product();
		List list=new ArrayList();
		list=proImpl.findListProduct(2);
		for(int i =0;i<list.size();i++){
		     Product pro1=(Product)list.get(i);
		     System.out.println(pro1.getNames());
		}
	}

}
