package model;

import java.sql.*;

public class TestDB {

	public static void main(String[] args) {
		//Connection con=Database.CON;
		CouDAOImpl dao=new CouDAOImpl();
		QueryVO vo=new QueryVO();
		
		vo.setPage(1);
		vo.setSize(2);
		vo.setKey("lname");
		vo.setWord("리");
		dao.list(vo);
		System.out.println("검색수:" + dao.total(vo));
		//System.out.println("새로운학번:" +dao.getCode());
		
		
	}

}
