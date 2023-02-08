package kh.bookday.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.bookday.dto.*;
import kh.bookday.service.*;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/book/")
public class BookController {

	@Autowired
	private BookService service;

	@Autowired
	private PostService pservice;

	@Autowired
	private ReviewService rservice;

	@Autowired
	private HttpSession session;

	@Autowired
	private WishlistService wservice;

	@Autowired
	private BookbagService bservice;

	// 수진


	// 책 검색 팝업
	@GetMapping("toBookSearchPop")
	public String toBookSearchPop(String searchWord, Model model) {

		searchWord = searchWord.replace("<script>", "&lt;");

		model.addAttribute("searchWord", searchWord);
		List<BookDTO> blist = service.selectBookListBySw(searchWord);
		model.addAttribute("blist", blist);

		return "mybook/booksearchpop";
	}
	// 수진

	//도서 정보 출력
	@RequestMapping("selectBookinfo") //@RequestParam("rv_seq") String rv_seq  @RequestParam(value="nowPage", required=false)String nowPage @RequestParam(value="cntPerPage", required=false)String cntPerPage
	public String selectBookByIsbn(Model model, String b_isbn) {

		String id = String.valueOf(session.getAttribute("loginID"));
		//아마 상세 페이지로 가는 이동이 완성되면 포스트로 값을 받아서

		//도서 정보 출력
		BookDTO dto=service.selectBookByIsbn(b_isbn);
		model.addAttribute("dto",dto);

		//리뷰 리스트 출력
		List<ReviewDTO> rlist=rservice.selectReviewByIsbn(b_isbn);
		model.addAttribute("rlist",rlist);

		//유저에 따른 리뷰 좋아요 list
		List<ReviewLikeDTO> rl_list=rservice.findReviewLike(id,b_isbn);
		model.addAttribute("rl_list",rl_list);

		//포스트 리스트 출력
		List<PostDTO> plist=pservice.selectPostByIsbn(b_isbn);
		model.addAttribute("plist",plist);
		
		//함께 담은 책 리스트 출력
		List<WishlistDTO> wlist=service.selectWithBooks(b_isbn, id);
		model.addAttribute("wlist",wlist);
		
		return "book/bookinfo";
	}

	//리뷰 작성
	@RequestMapping("insertReview")
	public String insertReview(ReviewDTO dto, @RequestParam("b_isbn")String b_isbn) {

		dto.setRv_writer_id(String.valueOf(session.getAttribute("loginID")));
		dto.setRv_writer_nn(String.valueOf(session.getAttribute("nickname")));

		rservice.insertReview(dto);

		return "redirect:/book/selectBookinfo?b_isbn="+dto.getB_isbn();
	}

	//리뷰 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(String b_isbn, String rv_seq, String rv_writer_id) {

		rv_writer_id=String.valueOf(session.getAttribute("loginID"));

		System.out.println(rv_seq);
		rservice.deleteReview(b_isbn,rv_seq);

		return "redirect:/book/selectBookinfo?b_isbn="+b_isbn;
	}

	//리뷰 수정
	@ResponseBody
	@RequestMapping("updateReview")
	public int updateReview(ReviewDTO dto) {

		dto.setRv_writer_id(String.valueOf(session.getAttribute("loginID")));

		return rservice.updateReview(dto);
	}	

	//리뷰 좋아요 누름
	@ResponseBody
	@RequestMapping("insertReviewLike")
	public String insertReviewLike(ReviewLikeDTO dto) {

		dto.setId(String.valueOf(session.getAttribute("loginID")));

		System.out.println(dto.getId());
		rservice.insertReviewLike(dto);
		System.out.println(dto);

		return "true";
	}

	//리뷰 좋아요 삭제
	@ResponseBody
	@RequestMapping("deleteReviewLike")
	public String deleteReviewLike(String rv_seq, String id) {

		id = String.valueOf(session.getAttribute("loginID"));

		rservice.deleteReviewLike(rv_seq,id);

		return "book/bookinfo";
	}

	//해당 도서에 대한 포스트 출력
	@RequestMapping("selectPostByIsbn")
	public String selectPostByIsbn(Model model,String b_isbn) {

		List<PostDTO> plist=pservice.selectPostByIsbn(b_isbn);
		model.addAttribute("plist",plist);

		return "book/bookinfo";
	}

	// 위시리스트 체크 
	@ResponseBody
	@RequestMapping("selectWishlistByIdBisbn")
	public String selectWishlistByIdBisbn(String id, String b_isbn) {

		WishlistDTO dto = wservice.selectWishlistByIdBisbn(id, b_isbn);
		System.out.println("위시리스트 체크 결과 : " + dto);

		if(dto == null) { // 위시리스트에 담을 수 있는 상태
			return String.valueOf("true");
		}else { // 위시리스트에 이미 존재해서 담을 수 없는 상태
			return String.valueOf("false");
		}

	}

	// 위시리스트 추가 
	@ResponseBody
	@RequestMapping("insertWishlist")
	public String insertWishlist(WishlistDTO dto) {

		wservice.insertWishlist(dto);
		System.out.println("위시리스트 추가 완료");


		return "redirect:/book/selectBookinfo";
	}

	// 책가방 체크 
	@ResponseBody
	@RequestMapping("selectBookbagByIdBisbn")
	public String selectBookbagByIdBisbn(String id, String b_isbn) {

		BookbagDTO dto = bservice.selectBookbagByIdBisbn(id, b_isbn);
		System.out.println("책가방 체크 결과 : " + dto);

		if(dto == null) { // 위시리스트에 담을 수 있는 상태
			return String.valueOf("true");
		}else { // 위시리스트에 이미 존재해서 담을 수 없는 상태
			return String.valueOf("false");
		}

	}

	// 책가방 추가 
	@ResponseBody
	@RequestMapping("insertBookbag")
	public String insertBookbag(BookbagDTO dto) {

		bservice.insertBookbag(dto);
		System.out.println("위시리스트 추가 완료");


		return "redirect:/book/selectBookinfo";
	}

	//위시리스트로 도서 정보 이동
	//		@RequestMapping("selectForWishlist")
	//		public String selectForWishlist(String b_isbn) {
	//	
	//			WishlistDTO dto=service.selectForWishlist(b_isbn);
	//	
	//			dto.setId(String.valueOf(session.getAttribute("loginID")));
	//	
	//			//위시리스트에 insert
	//			wservice.insertWishlist(dto);
	//	
	//			System.out.println(dto);
	//	
	//			return "redirect:/bookshelves/selectBookshelvesListById";
	//	
	//		}


	//책가방으로 이동
	//	@RequestMapping("selectForBookbag")
	//	public String selectForBookbag(String b_isbn) {
	//
	//		BookbagDTO bdto=service.selectForBookbag(b_isbn);
	//
	//		bdto.setId(String.valueOf(session.getAttribute("loginID")));
	//
	//		//책가방으로 insert
	//		bservice.insertBookbag(bdto);
	//
	//		System.out.println(bdto);
	//
	//		return "redirect:/delivery/selectBookbagListById";
	//	}


	//포스트 작성으로 이동
	//	@RequestMapping("selectToWritePost")
	//	public String selectToWritePost(Model model, String b_isbn) {
	//		
	//		System.out.println("확인");
	//		
	//		Map <String,Object> ToPost = service.selectToWritePost(b_isbn);
	//		String p_writer_id=String.valueOf(session.getAttribute("loginID"));
	//		ToPost.put("p_writer_id", p_writer_id);
	//		model.addAttribute("ToPost",ToPost);
	//		
	//		return "redirect:/booknote/selectPostListById?"+p_writer_id;
	//	}


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
