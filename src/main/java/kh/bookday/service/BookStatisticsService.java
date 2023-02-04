package kh.bookday.service;

import kh.bookday.dao.PostDAO;
import kh.bookday.dto.PostDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BookStatisticsService {

	@Autowired
	private PostDAO dao;
	

	public List<PostDTO> selectPostListById(String id) {
		return dao.selectPostListById(id);
	}
	
	public List<HashMap<String, String>> selectFvrBookById(String id) {
		return dao.selectFvrBookById(id);
	}
	
	public List<String> selectFvrWriterById(String id) {
		return dao.selectFvrWriterById(id);
	}

	public List<String> selectFvrGenreById(String id) {
		return dao.selectFvrGenreById(id);
	}


}
