package dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

import javax.swing.border.Border;

import dao.*;
import entity.*;

public class BoardDaoImpl extends  BaseDao implements BoardDao  {

    private	Connection conn=null;
    private PreparedStatement pstmt=null;
    private ResultSet rs=null;
	private int parentId =  0;   // 父版块id初始值为0，parentNo将作为map的key
	private HashMap boardMap = new HashMap(); // 保存版块信息的Map
	private List sonBoardList=null;  //保存属于同一个父版块的一组子版块，将作为map的value
	
	BaseDao baseDao=new BaseDao();
    /*
     * 的到所有板块信息（map）
     * 返回map
     */
	public Map findBoard() {
		//Sql语句
		String sql="select * from TBL_BOARD order by parentId,boardId";
		try {
			conn=this.getConn();    //获取数据库连接
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();   //执行sql语句得到结果集
			sonBoardList=new ArrayList();  // 实例化
			//将板块信息封装成Map
			while (rs.next()) {
	
				if(parentId!=rs.getInt("parentId")){   //如果查询出来的parentId不等于初始值0
						boardMap.put(new Integer(parentId), sonBoardList);    // 将上一组子版块保存到map中
						sonBoardList=new ArrayList();                         //重新产生一个新ArryList集合对象，用于存放下一组子板块
						parentId=rs.getInt("parentId"); //为parentId重新设值，用于map的新key值
				}
					
					//将结果集中的信息取出保存到list中
					Board board=new Board();   //板块对象
					board.setBoardId(rs.getInt("boardId"));   //板块ID
					//System.out.println(board.getBoardId());
					board.setBoardTitle(rs.getString("boardName"));   //板块名称
					//System.out.println(board.getBoardTitle());
					sonBoardList.add(board);                   //保存属于同一父板块的子板块
			}
			boardMap.put(new Integer(parentId), sonBoardList);
		} catch (Exception e) {
			e.printStackTrace();    //处理异常
		} finally{
			this.closeAll(conn, pstmt, rs);    //释放资源
		}
		return boardMap;
	}
   /*
    * 根据板块ID得到板块实体类（信息）
    * 输入板块ID
    */
	public Board findBoard(int boardId) {
	    String preparedSql="select * from TBL_BOARD where boardId=?";
	    Board board=null;     //新建一个Board对象
	    try {
	    	conn=this.getConn();    //获取数据库连接
	    	Object[] param={boardId};
			rs=baseDao.executeQuerySQL(preparedSql, param);
				while(rs.next()){	
				    board = new Board();                               // 实例化版块对象
	                board.setBoardId( rs.getInt("boardId") );           // 版块id
	                board.setBoardTitle( rs.getString("boardName") );    // 版块名称
	                board.setParentId( rs.getInt("parentId") );         // 父版块id
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
		    
			closeAll(conn, pstmt, rs);
			
		}	
		return board;
	}
	
	/**
	 * 测试类
	 * @param args
	 */
	public static void main(String[] args) {
		BoardDaoImpl bo=new BoardDaoImpl();
		Board b=new Board();
		b=bo.findBoard(1);
		System.out.println(b.getBoardTitle());
	}

}
