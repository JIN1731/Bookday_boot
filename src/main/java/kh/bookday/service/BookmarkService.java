package kh.bookday.service;

import kh.bookday.dao.BookmarkDAO;
import kh.bookday.dto.BookmarkDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkDAO dao;

	public void insertBookmark(BookmarkDTO dto) {
		dao.insertBookmark(dto);
	}

	public List<BookmarkDTO> selectBookmarkListById(String id) {
		return dao.selectBookmarkListById(id);
	}

	public List<BookmarkDTO> selectBmListByBmseq(BookmarkDTO dto) {
		return dao.selectBmListByBmseq(dto);
	}

	public List<BookmarkDTO> selectBookmarkListBySw(String id, String searchWord) {
		HashMap<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("searchWord", searchWord);

		return dao.selectBookmarkListBySw(param);
	}

	public int deleteBookmark(int bm_seq, String id) {

		BookmarkDTO dto = new BookmarkDTO();

		dto.setBm_seq(bm_seq);
		dto.setBm_writer_id(id);

		return dao.deleteBookmark(dto);
	}


	public void updateBookmark(BookmarkDTO dto) {
		dao.updateBookmark(dto);
	}

}