package kh.bookday.controller;

import kh.bookday.dto.BookDTO;
import kh.bookday.dto.PostDTO;
import kh.bookday.service.BookService;
import kh.bookday.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/search/")
public class SearchController {

	@Autowired
	private BookService service;

	@Autowired
	private PostService pservice;

	// 검색페이지로 이동 
	@RequestMapping("toSearch")
	public String toSearch(String searchWord, Model model) {

		model.addAttribute("searchWord", searchWord);

		// 책 출력
		List<BookDTO> blist = service.selectBookListBySw(searchWord);
		model.addAttribute("blist", blist);

		// 포스트 출력
		List<PostDTO> plist = pservice.selectPostListBySw(searchWord);
		model.addAttribute("plist", plist);

		return "search";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

	@RequestMapping("error")
	public String error() {
		return "error";
	}

}
