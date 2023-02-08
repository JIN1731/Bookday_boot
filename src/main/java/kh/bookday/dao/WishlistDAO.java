package kh.bookday.dao;

import kh.bookday.dto.BookDTO;
import kh.bookday.dto.WishlistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class WishlistDAO {

	@Autowired
	private SqlSession db;
	
	// 수진
	// 위시리스트 출력
	public List<WishlistDTO> selectWishlistListById(String id){
		return db.selectList("Wishlist.selectWishlistListById", id);
	}
	
	public int selectWishlistCountById(String id) {
		return db.selectOne("Wishlist.selectWishlistCountById", id);
	}
	
	// 위시리스트 체크
	public WishlistDTO selectWishlistByIdBisbn(Map<String, String> param) {
		return db.selectOne("Wishlist.selectWishlistByIdBisbn", param);
	}
	
	// 위시리스트 추가
	public void insertWishlist(WishlistDTO dto) {
		db.insert("Wishlist.insertWishlist", dto);
	}

	//해당 도서와 함께 담은 책 출력
	public List<WishlistDTO> selectWithBooks(WishlistDTO dto) {
		return db.selectList("Wishlist.selectWithBooks", dto);
	}
}
