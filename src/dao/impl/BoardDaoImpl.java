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
	private int parentId =  0;   // �����id��ʼֵΪ0��parentNo����Ϊmap��key
	private HashMap boardMap = new HashMap(); // ��������Ϣ��Map
	private List sonBoardList=null;  //��������ͬһ��������һ���Ӱ�飬����Ϊmap��value
	
	BaseDao baseDao=new BaseDao();
    /*
     * �ĵ����а����Ϣ��map��
     * ����map
     */
	public Map findBoard() {
		//Sql���
		String sql="select * from TBL_BOARD order by parentId,boardId";
		try {
			conn=this.getConn();    //��ȡ���ݿ�����
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();   //ִ��sql���õ������
			sonBoardList=new ArrayList();  // ʵ����
			//�������Ϣ��װ��Map
			while (rs.next()) {
	
				if(parentId!=rs.getInt("parentId")){   //�����ѯ������parentId�����ڳ�ʼֵ0
						boardMap.put(new Integer(parentId), sonBoardList);    // ����һ���Ӱ�鱣�浽map��
						sonBoardList=new ArrayList();                         //���²���һ����ArryList���϶������ڴ����һ���Ӱ��
						parentId=rs.getInt("parentId"); //ΪparentId������ֵ������map����keyֵ
				}
					
					//��������е���Ϣȡ�����浽list��
					Board board=new Board();   //������
					board.setBoardId(rs.getInt("boardId"));   //���ID
					//System.out.println(board.getBoardId());
					board.setBoardTitle(rs.getString("boardName"));   //�������
					//System.out.println(board.getBoardTitle());
					sonBoardList.add(board);                   //��������ͬһ�������Ӱ��
			}
			boardMap.put(new Integer(parentId), sonBoardList);
		} catch (Exception e) {
			e.printStackTrace();    //�����쳣
		} finally{
			this.closeAll(conn, pstmt, rs);    //�ͷ���Դ
		}
		return boardMap;
	}
   /*
    * ���ݰ��ID�õ����ʵ���ࣨ��Ϣ��
    * ������ID
    */
	public Board findBoard(int boardId) {
	    String preparedSql="select * from TBL_BOARD where boardId=?";
	    Board board=null;     //�½�һ��Board����
	    try {
	    	conn=this.getConn();    //��ȡ���ݿ�����
	    	Object[] param={boardId};
			rs=baseDao.executeQuerySQL(preparedSql, param);
				while(rs.next()){	
				    board = new Board();                               // ʵ����������
	                board.setBoardId( rs.getInt("boardId") );           // ���id
	                board.setBoardTitle( rs.getString("boardName") );    // �������
	                board.setParentId( rs.getInt("parentId") );         // �����id
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
	 * ������
	 * @param args
	 */
	public static void main(String[] args) {
		BoardDaoImpl bo=new BoardDaoImpl();
		Board b=new Board();
		b=bo.findBoard(1);
		System.out.println(b.getBoardTitle());
	}

}
