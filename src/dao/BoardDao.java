package dao;
//BoardDao�ӿ�
import java.util.*;
import entity.*;



public interface BoardDao {
	//public int addBoard(Board board);  //����һ����̳���
	/*
	 * ��ѯ���map,key�Ǹ����ţ�value���Ӽ������󼯺�
	 * return ��װ�˰����Ϣ��map
	 */
	public Map findBoard();
	/**
     * ���ݰ��id���Ұ��
     * @param boardId
     * @return
     */
    public Board findBoard(int boardId);
}
