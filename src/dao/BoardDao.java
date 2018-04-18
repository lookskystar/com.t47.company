package dao;
//BoardDao接口
import java.util.*;
import entity.*;



public interface BoardDao {
	//public int addBoard(Board board);  //增加一个论坛板块
	/*
	 * 查询板块map,key是父板块号，value是子级板块对象集合
	 * return 封装了板块信息的map
	 */
	public Map findBoard();
	/**
     * 根据版块id查找版块
     * @param boardId
     * @return
     */
    public Board findBoard(int boardId);
}
