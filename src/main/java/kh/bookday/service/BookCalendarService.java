package kh.bookday.service;

import kh.bookday.dao.PostDAO;
import kh.bookday.dto.PostDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookCalendarService {

	@Autowired
	private PostDAO dao;

	public List<PostDTO> selectPostListById(String id) {
		List<PostDTO> list = dao.selectPostListById(id);
		return list;
	}
}
