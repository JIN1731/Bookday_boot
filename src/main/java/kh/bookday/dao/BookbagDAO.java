package kh.bookday.dao;

import kh.bookday.dto.BookbagDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookbagDAO {

	@Autowired
	private SqlSession db;

	// 지민
	// 책가방 리스트 출력 
	public List<BookbagDTO> selectBookbagListById(String id) {
		return db.selectList("Bookbag.selectBookbagListById", id);
	}

	// 책 삭제 
	public void deleteBookbagBySeq(int bookbag_seq) {
		db.delete("Bookbag.deleteBookbagBySeq", bookbag_seq);
	}

	// 책 출력 
	public  BookbagDTO selectBookbagBySeq(int bookbag_seq) {
		return db.selectOne("Bookbag.selectBookbagBySeq", bookbag_seq);

	}
	// 지민

	//shu
	// 책가방 체크
	public BookbagDTO selectBookbagByIdBisbn(Map<String, String> param) {
		return db.selectOne("Bookbag.selectBookbagByIdBisbn", param);
	}

	// 책 추가 
	public void insertBookbag(BookbagDTO dto) {
		db.insert("Bookbag.insertBookbag", dto);
	}
	// shu
}
