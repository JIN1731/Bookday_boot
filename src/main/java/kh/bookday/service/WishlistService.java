package kh.bookday.service;

import kh.bookday.dao.WishlistDAO;
import kh.bookday.dto.WishlistDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WishlistService {
	
	@Autowired
	private WishlistDAO dao;
	
	// 수진
	// 위시리스트 수 출력
	public int selectWishlistCountById(String id) {
		return dao.selectWishlistCountById(id);
	}
	
	// 위시리스트 출력
	public List<WishlistDTO> selectWishlistListById(String id){
		return dao.selectWishlistListById(id);
	}
	// 수진
	
	// 위시리스트 체크
	public WishlistDTO selectWishlistByIdBisbn(String id, String b_isbn) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("b_isbn", b_isbn);
		return dao.selectWishlistByIdBisbn(param);
	}
	
	// 위시리스트 추가 
	public void insertWishlist(WishlistDTO dto) {
		dao.insertWishlist(dto);
	}
}
