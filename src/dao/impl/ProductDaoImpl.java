package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.*;
import entity.*;

/**
 * 商品接口实现
 * @author Administrator
 *
 */
public class ProductDaoImpl extends BaseDao implements ProuctDao {
	
    private Connection        conn  = null;              // 保存数据库连接
    private PreparedStatement pstmt = null;              // 用于执行SQL语句
    private ResultSet         rs    = null ;             // 用户保存查询结果集
    
    int rows=9;      //定义每页显示的行数（每页6行）
    
	public int addProduct(Product product) {
		int count = 0; // 接受返回值
		String idStr="";   //保存随机产生的Number
			// SQL语句
			String preparedSql = "insert into TBL_PRODUCT (serialNumber,proName,brand,model,picture,descriptions,price) values(?,?,?,?,?,?,?)";
			// 占位符号数组
			Object[] param = {product.getSerialNumber(),product.getNames(),product.getBrand(),product.getModel(),product.getPicture(),product.getDescriptions(),product.getPrice()};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
		
		return count;
	}

	 /*
	  * 删除产品
	  * @see dao.ProuctDao#deleteProduct(int)
	  */
	public int deleteProduct(int productId){
		int count = 0; // 接受返回值
		// SQL语句
		String preparedSql = "delete from TBL_PRODUCT where productId=? ";
		// 占位符号数组
		Object[] param = {productId};
		BaseDao baseDao=new BaseDao();
		count = baseDao.executeSQL(preparedSql, param);
		return count;
	}

	/**
     * 商品总条数
     * @param 
     * @return 商品条数
     */
	public int findCountProduct() {
		int              num = 0;                    // 产品条数
        String            sql   = "select count(*) as counts from TBL_PRODUCT";
        try {
            conn  = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs    = pstmt.executeQuery();
            while( rs.next() ) {
            	num = rs.getInt("counts"); 
            }
        } catch ( Exception e) {
            e.printStackTrace();                        // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);             // 释放资源
            
        }
        //System.out.println("num:"+num);
        return num;
	}
    
     /**
      * 得到商品List，输入当前页数
      */
	public List findListProduct(int page) {
		 List list  = new ArrayList();                  // 用来保存新闻对象列表
	        conn  = null;                                  // 用于保存数据库连接
	        pstmt = null;                                  // 用于执行SQL语句
	        rs    = null;                                  // 用户保存查询结果集
	        
	      //调用(得到每页显示10行的页数)的方法
	       int pageCount=getCountRows();            //得到总的页数
	        
	        if( page < 1 ) {
	            page=1;                                     // 当前页数如果小于1就等于1
	        }
	        
	        if(page>pageCount){
	        	page=pageCount;                            //当前页面如果大于最大页面就等于最大页面
	        }
	        
	        //由当前页数*每页显示和行数的所有到当前页面数的行数的计算值
			int iRows=(page-1)*rows;
	        
			//写分页sql语句保存到StringBuffer对象中
			StringBuffer sb=new StringBuffer();
			sb.append("select top"+" "+rows+" "+"*");
			sb.append(" "+"from TBL_PRODUCT");
			sb.append(" "+"where productId  not in");
			sb.append("(select top "+iRows);
			sb.append(" "+"productId from TBL_PRODUCT");
			sb.append(" "+"order by productId desc) order by productId desc");
			//打印以上写的sql语句，以验证
			//System.out.println("sql:-->"+sb.toString());
	        try {
	            conn = this.getConn();                     // 得到数据库连接
	            pstmt = conn.prepareStatement(sb.toString());         // 得到PreparedStatement对象
	            rs = pstmt.executeQuery();                  // 执行sql取得结果集

	            /*  循环将回复信息封装成List  */
	            while ( rs.next() ) {
	            	Product product = new Product();              // 回复对象
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
	            e.printStackTrace();                        // 处理异常
	        } finally {
	            this.closeAll(conn, pstmt, rs);             // 释放资源
	        }
	        return list;
	}
    
	/**
	 * 根据商品Id查找商品信息
	 */
	public Product findProduct(int productId) {
		String sql  = "select * from TBL_PRODUCT where productId=?";
        Product product = null;
        try {
            conn  = this.getConn();                // 获得数据库连接
            pstmt = conn.prepareStatement(sql);    // 得到一个PreparedStatement对象
            pstmt.setInt(1, productId);              // 设置productId为参数值
            rs    = pstmt.executeQuery();          // 执行sql，取得查询结果集

            /*  将结果集中的信息取出保存到product对象中，循环最多只会执行一次  */
            while ( rs.next() ) {
            	product = new Product();              // 回复对象
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
            e.printStackTrace();                   // 处理异常
        } finally {
            this.closeAll(conn, pstmt, rs);       // 释放资源
        }
        return product;
	}

	/**
     * 分页1步
     * 通过总每页行数（取10）的计算得到总页数
     * @param 
     * @return
     */ 
	public int getCountRows() {
		int pageSzie=0;   //总新闻个数
    	int pageCount=0;  //总页数
    	pageSzie=findCountProduct();
    	//通过计算得到总页数（每页显示10行）
    	if(pageSzie%rows==0){
    		pageCount=pageSzie/rows;
    	}else{
    		pageCount=pageSzie/rows+1;
    	}
    	return pageCount;
	}

   /**
    * 修改产品
    */
	public int updateProduct(Product product) {
		int count = 0; // 接受返回值
		String idStr="";   //保存随机产生的Number
			// SQL语句
			String preparedSql = "update TBL_PRODUCT set proName=?,brand=?,model=?,picture=?,descriptions=?,price=? where productId=? ";
			// 占位符号数组
			Object[] param = {product.getNames(),product.getBrand(),product.getModel(),product.getPicture(),product.getDescriptions(),product.getPrice(),product.getProductId()};
			BaseDao baseDao=new BaseDao();
			count = baseDao.executeSQL(preparedSql, param);
		
		return count;
	}

	
	
	
	
	/**
	 * 测试函数
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
