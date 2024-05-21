package model;

import java.sql.*;

public class TestDB {

	public static void main(String[] args) {
		UserDAO dao=new UserDAO();
		UserVO vo=dao.read("blue");
		System.out.println(vo.toString());
		//Connection con=Database.CON;
		//EnrollDAO dao=new EnrollDAO();
		//CouDAOImpl dao=new CouDAOImpl();
		//QueryVO vo=new QueryVO();
		//vo.setPage(1);
		//vo.setSize(2);
		//vo.setKey("lname");
		//vo.setWord("리");
		//dao.slist("C301");
		//System.out.println("검색수:" + dao.total(vo));
		//System.out.println("N223 삭제결과:" +dao.delete("N223"));
		//System.out.println("C421 삭제결과:" +dao.delete("C421"));
		//dao.read("N223");
		
	}

}
