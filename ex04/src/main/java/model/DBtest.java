package model;

public class DBtest {
	public static void main(String[] args) {
		//BBSDAOImpl dao=new BBSDAOImpl();
		//dao.list();
		//dao.read(2);
		//System.out.println("total...."+dao.total());
		//dao.list(1,3,"리액트");
		//System.out.println("리액트갯수:" + dao.total("red"));
		CommentDAOImpl dao=new 	CommentDAOImpl();
		//System.out.println("249의 댓글수:" + dao.total(249));
		CommentVO vo=new CommentVO();
		vo.setBid(249);
		vo.setWriter("red");
		vo.setContents("새로운댓글임둥");
		dao.insert(vo);
		
	}

}
