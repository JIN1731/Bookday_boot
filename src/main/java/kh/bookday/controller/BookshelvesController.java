package kh.bookday.controller;

import com.google.gson.Gson;
import kh.bookday.dto.MemberDTO;
import kh.bookday.dto.PostDTO;
import kh.bookday.dto.RentalDTO;
import kh.bookday.dto.WishlistDTO;
import kh.bookday.service.MemberService;
import kh.bookday.service.PostService;
import kh.bookday.service.RentalService;
import kh.bookday.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("bookshelves")
public class BookshelvesController {
	// 대여, 위시리스트, 책장

	@Autowired
	private MemberService mservice;

	@Autowired
	private RentalService rservice;
	
	@Autowired
	private WishlistService wservice;
	
	@Autowired
	private PostService pservice;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("selectBookshelvesListById")
	public String selectBookshelvesListById(Model model) throws Exception{

		String id = String.valueOf(session.getAttribute("loginID"));

		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		// 대여
		int rcount = rservice.selectRentalCountById(id);
		model.addAttribute("rcount", rcount);
		
		List<RentalDTO> rlist = rservice.selectRentalListById(id);
		model.addAttribute("rlist", rlist);

		// 위시리스트
		int wcount = wservice.selectWishlistCountById(id);
		model.addAttribute("wcount", wcount);
		
		List<WishlistDTO> wlist = wservice.selectWishlistListById(id);
		model.addAttribute("wlist", wlist);

		// 내 책장 첫 20개 출력
		int pcount = pservice.selectPostCountById(id);
		model.addAttribute("pcount", pcount);
		
		List<PostDTO> plist = pservice.select20PostListById(id);
		model.addAttribute("plist", plist);

		return "mybook/bookshelves";
	}
	
	// 내 책장 다음 20개씩 출력(무한 스크롤)
	@GetMapping("nextList")
	@ResponseBody
	public String nextList(int count) {
		
		String id = String.valueOf(session.getAttribute("loginID"));
		
		return new Gson().toJson(pservice.selectNextPostListById(id, count));
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

}

