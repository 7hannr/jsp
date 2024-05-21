package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	Connection con=Database.CON;
	//사용자정보
	public UserVO read(String uid) {
		UserVO vo=new UserVO();
		try {
			String sql=" select * from users where uid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				vo.setUid(rs.getString("uid"));
				vo.setUpass(rs.getString("upass"));
				vo.setUname(rs.getString("uname"));
				
			}
		}catch(Exception e) {
			System.out.println("사용자정보:" + e.toString());
		}
		return vo;
	}
}
