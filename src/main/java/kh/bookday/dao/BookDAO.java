package kh.bookday.dao;

import kh.bookday.dto.BookDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAO {

	@Autowired
	private SqlSession db;

	// 책 검색
	public List<BookDTO> selectBookListBySw(String searchWord) {
		return db.selectList("Book.selectBookListBySw", searchWord);
	}

	//통계
	// 가장 좋아하는 책
	public List<BookDTO> selectFvrBookById(String id) {
		return db.selectList("Book.selectFvrBookById", id);
	}

	// 가장 좋아하는 작가
	public List<BookDTO> selectFvrWriterById(String id) {
		return db.selectList("Book.selectFvrWriterById", id);
	}

	// 가장 좋아하는 장르
	public List<BookDTO> selectFvrGenreById(String id) {
		return db.selectList("Book.selectFvrGenreById", id);
	}

	//해당 도서 정보 출력
	public BookDTO selectBookByIsbn(String b_isbn) {
		return db.selectOne("Book.selectBookByIsbn", b_isbn);
	}

	//위시리스트로 이동
	public BookDTO selectForWishlist(String b_isbn) {
		return db.selectOne("Book.selectBookByIsbn", b_isbn);
	}

	//책가방으로 이동
	public BookDTO selectForBookbag(String b_isbn) {
		return db.selectOne("Book.selectBookByIsbn", b_isbn);
	}

	//베스트셀러 도서 출력 (랭킹 높은 순)
	public List<BookDTO> selectBestSeller() {
		return db.selectList("Book.selectBestSeller");
	}

	//스테디셀러 도서 출력 (출판일 오래된 순 + 랭킹 높은 순)
	public List<BookDTO> selectSteadySeller() {
		return db.selectList("Book.selectSteadySeller");
	}

	//신간 도서 출력 (출판일 최신 순)
	public List<BookDTO> selectNewBooks() {
		return db.selectList("Book.selectNewBooks");
	}


	// 책 정보 입력
	public void insertBook(BookDTO dto) {
		db.insert("Book.insertBook", dto);
	}
}

