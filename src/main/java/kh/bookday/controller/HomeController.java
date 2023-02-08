package kh.bookday.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.bookday.dto.BookDTO;
import kh.bookday.dto.PostDTO;
import kh.bookday.service.BookService;
import kh.bookday.service.PostService;
import org.checkerframework.checker.units.qual.A;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class HomeController {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private PostService pservice;

	@RequestMapping("/")
	public String home(Model model) {
		
		//베스트셀러 도서 출력 
		List<BookDTO> b_list =service.selectBestSeller();
		model.addAttribute("b_list", b_list);
		
		//스테디셀러 도서 출력 
		List<BookDTO> s_list =service.selectSteadySeller();
		model.addAttribute("s_list", s_list);
		
		//신간 도서 출력
		List<BookDTO> n_list =service.selectNewBooks();
		model.addAttribute("n_list", n_list);
	
		//인기 포스트 출력
		List<PostDTO> plist=pservice.selectPopularPost();
		model.addAttribute("plist", plist);
	
		return "home";
	}

	// 책 데이터
	@GetMapping("getBookData")
	public String getBookData() throws Exception{

		service.setBookData();
		return "/";

	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
