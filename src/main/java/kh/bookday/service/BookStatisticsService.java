package kh.bookday.service;

import kh.bookday.dao.BookDAO;
import kh.bookday.dao.PostDAO;
import kh.bookday.dto.BookDTO;
import kh.bookday.dto.PostDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BookStatisticsService {

	@Autowired
	private PostDAO dao;

	@Autowired
	private BookDAO bdao;
	

	public List<PostDTO> selectPostListById(String id) {
		return dao.selectPostListById(id);
	}
	
	public List<BookDTO> selectFvrBookById(String id) {
		return bdao.selectFvrBookById(id);
	}

	public List<BookDTO> selectFvrWriterById(String id) {
		return bdao.selectFvrWriterById(id);
	}

	public List<BookDTO> selectFvrGenreById(String id) {
		return bdao.selectFvrGenreById(id);
	}
}
