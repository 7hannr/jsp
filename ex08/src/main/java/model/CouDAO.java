package model;

import java.util.*;

public interface CouDAO {
	//강좌목록
	public ArrayList<CouVO> list(QueryVO vo);
	//검색수
	public int total(QueryVO vo);
	//새로운강좌코드
	public String getCode();
	//강좌등록
	public void insert(CouVO vo);
	//강좌정보
	public CouVO read(String lcode);
	//강좌삭제
	public boolean delete(String lcode);
	//강좌정보수정
	public void update(CouVO vo);
}
