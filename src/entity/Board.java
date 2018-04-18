package entity;

public class Board {
	private int boardId=0;
	private String boardTitle=null;
	private int parentId=0;
	
	public Board() {
		super();
	}
	
	
	
	public Board(int boardId, String boardTitle, int parentId) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.parentId = parentId;
	}



	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	public String getBoardInfo() {
	  	return "==°å¿éÐÅÏ¢==\n°å¿éÃû³Æ£º"+boardTitle;
	}
    

}
