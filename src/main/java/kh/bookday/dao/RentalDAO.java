package kh.bookday.dao;

import kh.bookday.dto.RentalDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class RentalDAO {

	@Autowired
	private SqlSession db;
	
	// 수진
	// 대여 책 출력
	public List<RentalDTO> selectRentalListById(String id){
		return db.selectList("Rental.selectRentalListById", id);
	}
	
	// 대여 책 수 출력
	public int selectRentalCountById(String id) {
		return db.selectOne("Rental.selectRentalCountById", id);
	}
	// 수진
	
	// 대여 테이블 입력
	public void insertRental(RentalDTO dto) {
		db.insert("Rental.insertRental", dto);
	}
	
	// 방금 대여한 책 리스트 출력
	public List<RentalDTO> selectRentalListByIdRownum (Map<String, Object> param) {
		return db.selectList("Rental.selectRentalListByIdRownum", param);
	}
	
	// 가장 최근 대여 내역 출력
	public RentalDTO selectRentalById(String id) {
		return db.selectOne("Rental.selectRentalById",id);
	}

}
