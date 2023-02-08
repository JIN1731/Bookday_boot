package kh.bookday.controller;

import com.google.gson.Gson;
import kh.bookday.dto.BookmarkDTO;
import kh.bookday.dto.MemberDTO;
import kh.bookday.service.BookmarkService;
import kh.bookday.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.List;

@Controller
@RequestMapping("bookmark")
public class BookmarkController {
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private BookmarkService service;
	
	@Autowired
	private HttpSession session;
	
	
	@ResponseBody
	@RequestMapping("insertBookmark")
	public void insertBookmark(BookmarkDTO dto) {
		
		String id = String.valueOf(session.getAttribute("loginID"));
		dto.setBm_writer_id(id);
		
		dto.setBm_content(dto.getBm_content().replace("<script>", "&lt;"));

		service.insertBookmark(dto);
	}
	
	
	@RequestMapping("selectBookmarkListById")
	public String selectBookmarListkById(Model model) {
		
		String id = String.valueOf(session.getAttribute("loginID"));
		
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);
		
		List<BookmarkDTO> list = service.selectBookmarkListById(id);
		model.addAttribute("list", list);
		
		return "mybook/bookmark";
	}
	
	@ResponseBody
	@RequestMapping("selectBmListByBmseq")
	public String selectBmListByBmseq(BookmarkDTO dto) {
		
		String id = String.valueOf(session.getAttribute("loginID"));
		dto.setBm_writer_id(id);
		
		return new Gson().toJson(service.selectBmListByBmseq(dto));
	}
	
	@GetMapping("selectBookmarkListBySw")
	public String selectBookmarkListBySw(String searchWord, Model model) {
		
		String id = String.valueOf(session.getAttribute("loginID"));
		
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);
		
		model.addAttribute("searchWord", searchWord);
		
		List<BookmarkDTO> list = service.selectBookmarkListBySw(id, searchWord);
		model.addAttribute("list", list);
		
		return "mybook/bookmark";
		
	}

	
	@RequestMapping("deleteBookmark")
	@ResponseBody
	public int deleteBookmark(int bm_seq) {
		
		String id = String.valueOf(session.getAttribute("loginID"));

		return service.deleteBookmark(bm_seq, id);
	}

	@RequestMapping("selectBookmark")
	@ResponseBody
	public int selectBookmark(){
		String id = String.valueOf(session.getAttribute("loginID"));

		List<BookmarkDTO> list = service.selectBookmarkListById(id);

		return list.size();
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
