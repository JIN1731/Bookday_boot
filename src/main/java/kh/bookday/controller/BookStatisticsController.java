package kh.bookday.controller;

import com.google.gson.Gson;
import kh.bookday.dto.BookDTO;
import kh.bookday.dto.MemberDTO;
import kh.bookday.service.BookStatisticsService;
import kh.bookday.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("bookstatistics")
public class BookStatisticsController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MemberService mservice;

	@Autowired
	private BookStatisticsService service;


	@RequestMapping("toStatistics")
	public String toStatistics(Model model) {
		
		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원정보 
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);
		
		// 가장 좋아하는
		List<BookDTO> blist = service.selectFvrBookById(id);
		model.addAttribute("blist", blist);

		List<BookDTO> wlist = service.selectFvrWriterById(id);
		model.addAttribute("wlist", wlist);

		List<BookDTO> glist = service.selectFvrGenreById(id);
		model.addAttribute("glist", glist);

		return "mybook/bookstatistics";
	}

	@ResponseBody
	@RequestMapping("selectBookCalbyId")
	public String selectBookCalbyId() {
		String id = String.valueOf(session.getAttribute("loginID"));

		return new Gson().toJson(service.selectPostListById(id));
	}


	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

}
