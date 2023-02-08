package kh.bookday.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.bookday.dto.BookbagDTO;
import kh.bookday.dto.MemberDTO;
import kh.bookday.dto.MonthSubMemberDTO;
import kh.bookday.dto.RentalDTO;
import kh.bookday.dto.WishlistDTO;
import kh.bookday.service.BookbagService;
import kh.bookday.service.MemberService;
import kh.bookday.service.RentalService;
import kh.bookday.service.WishlistService;

@Controller
@RequestMapping("/delivery/")
public class BookbagController {

	@Autowired
	private BookbagService service;

	@Autowired
	private MemberService mservice;

	@Autowired
	private WishlistService wservice;

	@Autowired
	private RentalService rservice;

	@Autowired
	private HttpSession session;

	// 체크된 체크박스의 값 담을 배열
	String[] checkBoxArr = null;


	// 책가방페이지 출력
	@RequestMapping("selectBookbagListById")
	public String selectBookbagListById(Model model) {

		String id = (String)session.getAttribute("loginID");

		// 책가방 리스트 출력
		List<BookbagDTO> list = service.selectBookbagListById(id);
		model.addAttribute("list", list);
		System.out.println("책가방 리스트 사이즈 확인 : " + list.size());

		// 회원 정보 조회 (구독 여부 확인 & 배송지 정보 출력)
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		// 월 구독 회원 정보 조회 (남은 배송 횟수, 남은 대여 권수 출력)
		MonthSubMemberDTO sdto = mservice.selectMonthSubMemberById(id);
		model.addAttribute("sdto", sdto);

		return "delivery/bookbag";

	}

	// 책 삭제
	@ResponseBody
	@RequestMapping("deleteBookbagBySeq")
	public void deleteBookbagBySeq(int bookbag_seq) {
		service.deleteBookbagBySeq(bookbag_seq);
	}

	// 선택한 책 전체 삭제
	@ResponseBody
	@RequestMapping("deleteAllBookbagBySeq")
	public void deleteAllBookbagBySeq(HttpServletRequest request) {

		checkBoxArr = request.getParameterValues("checkBoxArr");
		System.out.println("삭제할 책 수 : " +checkBoxArr.length);

		for (int i = 0; i<checkBoxArr.length; i++) {
			service.deleteBookbagBySeq(Integer.parseInt(checkBoxArr[i]));
		}
		System.out.println("선택삭제 성공");

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


		return "redirect:/delivery/selectBookbagListById";
	}

	// 배송지 페이지로 이동
	@RequestMapping("toAddressInput")
	public String toAddressInput(Model model) {

		String id = (String)session.getAttribute("loginID");

		// 회원 정보 조회 (구독 여부 확인 & 배송지 정보 출력)
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		return "delivery/addressinput";
	}

	// 회원 배송지 정보 입력
	@ResponseBody
	@RequestMapping("updateMemberAddressById")
	public void updateMemberAddressById(MemberDTO dto) {
		mservice.updateMemberAddressById(dto);
		System.out.println("배송지 정보 입력 완료");
	}

	// 결제 페이지로 이동
	@RequestMapping("toPayment")
	public String toPayment(Model model) {

		String id = (String)session.getAttribute("loginID");

		// 회원 정보 조회 (구독 여부 확인)
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		return "delivery/payment";

	}

	// 결제완료 페이지로 이동
	@RequestMapping("toPaymentCompleted")
	public String toPaymentCompleted(String id, Model model) {

		// 회원 등급 변경
		mservice.updateMemberGradeById(id);

		// 월 구독 회원 등록
		mservice.insertMonthSubMemberById(id);

		System.out.println(id + "-> 월 구독 회원 등록 완료");

		// 월 구독 회원 정보 조회 (구독기간 출력) 
		MonthSubMemberDTO dto = mservice.selectMonthSubMemberById(id);
		model.addAttribute("dto", dto);

		return "delivery/paymentCompleted";

	}

	// 대여한 책 대여테이블에 입력 후 책가방테이블에서 삭제 
	@ResponseBody
	@RequestMapping("insertRentalAfterdeleteBookbagBySeq")
	public void insertRentalAfterdeleteBookbagBySeq(HttpServletRequest request, RentalDTO rdto, Model model) {

		checkBoxArr = request.getParameterValues("checkBoxArr");

		for (int i = 0; i<checkBoxArr.length; i++) {
			BookbagDTO bdto = service.selectBookbagBySeq(Integer.parseInt(checkBoxArr[i]));

			rdto.setId(bdto.getId());
			rdto.setB_isbn(bdto.getB_isbn());
			rdto.setB_img_url(bdto.getB_img_url());
			rdto.setB_title(bdto.getB_title());
			rdto.setB_writer(bdto.getB_writer());
			rdto.setB_genre(bdto.getB_genre());

			rservice.insertRental(rdto);
			service.deleteBookbagBySeq(Integer.parseInt(checkBoxArr[i]));
		}
		System.out.println("대여테이블 입력 성공");

	}

	// 월 구독 회원 남은 배송 횟수, 남은 대여 권수 계산
	@ResponseBody
	@RequestMapping("updateMonthSubMemberById")
	public void updateMonthSubMemberById(MonthSubMemberDTO dto) {
		mservice.updateMonthSubMemberById(dto);
		System.out.println("남은 대여 권수 : " + dto.getRental_count());
	}

	// 대여완료 페이지로 이동
	@RequestMapping("toRentalCompleted")
	public String toRentalCompleted(Model model) {

		String id = (String)session.getAttribute("loginID");

		// 회원 정보 조회 (배송지 정보 출력)
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		// 방금 대여한 책 리스트 출력
		// 가장 최근 rownum 조회할건데 방금 대여한 갯수 (체크된 체크박스 갯수) 만큼의 rownum 만 조회할 것임
		int rownum = checkBoxArr.length;
		List<RentalDTO> list = rservice.selectRentalListByIdRownum(id, rownum);
		model.addAttribute("list", list);

		return "delivery/rentalcompleted";
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
