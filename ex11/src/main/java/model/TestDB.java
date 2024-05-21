package model;

import java.sql.*;

public class TestDB {

	public static void main(String[] args) {
		GoodsDAO dao=new GoodsDAO();
		
		//UserDAO dao=new UserDAO();
		//UserVO vo=dao.read("blue");
		//System.out.println(vo.toString());
		//Connection con=Database.CON;
		//EnrollDAO dao=new EnrollDAO();
		//CouDAOImpl dao=new CouDAOImpl();
		QueryVO vo=new QueryVO();
		vo.setKey("gid");
		vo.setWord("");
		vo.setPage(1);
		vo.setSize(3);
		dao.list(vo,"red");
		//System.out.println("검색수:" + dao.total(vo));
		//System.out.println("N223 삭제결과:" +dao.delete("N223"));
		//System.out.println("C421 삭제결과:" +dao.delete("C421"));
		//dao.read("N223");
		
	}

}
