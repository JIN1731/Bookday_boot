package kh.bookday.controller;

import com.google.gson.Gson;
import kh.bookday.dto.MemberDTO;
import kh.bookday.service.BookCalendarService;
import kh.bookday.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("bookcalendar")
public class BookCalendarController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MemberService mservice;

	@Autowired
	private BookCalendarService service;


	@RequestMapping("toCalendar")
	public String toCalendar(Model model) {
		
		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원정보 
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);
		
		return "mybook/bookcalendar";
	}

	@ResponseBody
	@RequestMapping("selectBookCalbyId")
	public String selectBookCalbyId() {
		String id = String.valueOf(session.getAttribute("loginID"));
		System.out.println(id);
		return new Gson().toJson(service.selectPostListById(id));
	}


	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
