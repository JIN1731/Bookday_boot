package kh.bookday.controller;

import kh.bookday.common.Pw_SHA256;
import kh.bookday.dto.MemberDTO;
import kh.bookday.dto.MonthSubMemberDTO;
import kh.bookday.dto.RentalDTO;
import kh.bookday.service.MemberService;
import kh.bookday.service.RentalService;
import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.UUID;

@Controller
@RequestMapping("/member/")
public class MemberController {


	@Autowired
	private MemberService service;
	
	@Autowired
	private RentalService rservice;

	@Autowired
	private HttpSession session;

	@RequestMapping("toSignup")
	public String toSignup() {
		return "member/signup";
	}

	@RequestMapping("toLogin")
	public String toLogin() {
		return "member/login";
	}

	//로그인
	@ResponseBody //에이작스로 보낼 때
	@RequestMapping("login")
	public boolean login(String phone, String pw){


		//비밀번호 암호화 후 db에 있는 암호화된 비번과 맞는지 확인
		String encryPassword = Pw_SHA256.getSHA256(pw);

		boolean result=service.isLoginOk(phone,encryPassword);

		if(result) {

			//로그인 성공하면 id 값 가져와서 session 만들기
			String id=service.selectIdByPhone(phone);
			session.setAttribute("loginID",id);

			MemberDTO dto=service.selectMemberById(id);
			session.setAttribute("nickname",dto.getNickname());

		}

		return result;
	}

	//로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}

	//회원가입 관련
	@RequestMapping(value="signUp")
	public String signUp(MemberDTO dto){


		//비밀번호 암호화
		String encryPassword = Pw_SHA256.getSHA256(dto.getPw());
		dto.setPw(encryPassword);

		//insert하기
		service.signUp(dto);

		return "redirect:/member/toLogin";
	}

	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping("checkByNickname")
	public String checkByNickname(String nickname){

		boolean result= service.checkByNickname(nickname);

		return String.valueOf(result); 
	}

	@ResponseBody //핸드폰 중복 체크 및 비번 찾기에서 회원 여부 체크
	@RequestMapping(value={"checkByPhone","findUser"})
	public boolean checkByPhone(String phone){

		boolean result= service.checkByPhone(phone);

		return result; 
	}


	@ResponseBody //인증번호 발급
	@RequestMapping("createAuthNum")
	public boolean createAuthNum(String phone){

		//번호에 따른 랜덤 인증번호 생성
		String code= service.createRandomMsg(phone);

		//세션으로 담아주기? (여러 방법이 있는데 생각해봐야함)
		session.setAttribute("rand", code);

		return true;
	}

	//인증 번호 일치 여부 확인 //한번에 여러 번 인증버튼을 누르면 여기서 인식을 못함
	@ResponseBody
	@GetMapping("doAuthNumMatch")
	public boolean doAuthNumMatch(String code) {

		//생성된 인증번호
		String rand=(String) session.getAttribute("rand");

		if (rand.equals(code)) {
			session.removeAttribute("rand");
			return false;
		} 
		return true;
	}


	//비밀번호 재설정 페이지로 이동
	@RequestMapping("toUpdatePw")
	public String toUpdatePw() {
		
		return "member/updatePw";
	}

	//비밀번호 재설정
	@ResponseBody
	@RequestMapping("updatePw")
	public String updatepw(String updatePw, String phone ) {

		//다른 에이작스 컨트롤러에서 중복 여부 체크 후 update 시도
		//System.out.println(updatePw);
		//다시 암호화
		String pw=Pw_SHA256.getSHA256(updatePw);

		
		//해당 회원 정보로 들어갈 update 구문(해당 회원의 아이디 및 번호 값으로 조건을 준 후 update
		service.updatePw(pw,phone);

		return "true";
	}

	//카카오 로그인
	//인가 코드 받기 + 토큰 발급 + 유저 정보 조회 
	@RequestMapping(value="kakaoLogin", produces="application/json;charset=UTF-8")
	public String kakaoLogin(@RequestParam("code") String code, Model model) {

		String access_Token=service.getAccessToken(code);

		MemberDTO userInfo =service.getUserInfo(access_Token);

		model.addAttribute("code", code);
		model.addAttribute("access_Token", access_Token);
		model.addAttribute("userInfo", userInfo);

		;
		//카카오 최초 로그인인지 확인-> 디비에서 카카오에서 부여한 아이디 정보 확인
		boolean result=service.selectByKid(userInfo.getId());

		if(result) {
			session.setAttribute("loginID", userInfo.getId());
			session.setAttribute("nickname",userInfo.getNickname());
		}else {
			service.kakaoSignUp(userInfo);


			session.setAttribute("loginID", userInfo.getId());
			session.setAttribute("nickname",userInfo.getNickname());
		}

		return "redirect:/";
	}
	
	// 지민
	// 마이페이지 이동
	@RequestMapping("toMypage")
	public String toMypage(Model model) {

		String id = (String)session.getAttribute("loginID");

		// 회원 정보 조회 (구독 여부 확인 & 배송지 정보 출력) 
		MemberDTO dto = service.selectMemberById(id);
		model.addAttribute("dto", dto);

		// 월 구독 회원 정보 조회 (남은 배송 횟수, 남은 대여 권수 출력) 
		MonthSubMemberDTO sdto = service.selectMonthSubMemberById(id);
		model.addAttribute("sdto", sdto);

		// 가장 최근 대여 내역 조회
		RentalDTO rdto = rservice.selectRentalById(id);
		model.addAttribute("rdto", rdto);

		return "member/mypage";
	}
	// 지민

	// 수아
	//마이페이지 회원정보수정 페이지로 이동
	@RequestMapping(value="toUpdateMemInfo")
	public String toUpdateMemInfo(Model model) {
		
		String id = (String)session.getAttribute("loginID");
		
		// 회원 정보 조회 (구독 여부 확인 & 배송지 정보 출력) 
		MemberDTO dto = service.selectMemberById(id);
		model.addAttribute("dto", dto);
		
		return "member/updateMemInfo";
	}

	//마이페이지 회원정보수정
	@RequestMapping(value="updateMemInfo")
	public String updateMemInfo(MemberDTO dto, MultipartFile prof_img, @RequestParam("sys") String sys, @RequestParam("ori") String ori) {

		String id = String.valueOf(session.getAttribute("loginID"));

		dto.setId(id);

		//비밀번호 암호화
		System.out.println("디티오에 들어간 비밀번호: "+dto.getPw()+dto.getEmail()+dto.getName()+dto.getNickname()+dto.getPw());

		String updatedPw=Pw_SHA256.getSHA256(dto.getPw());
		dto.setPw(updatedPw);

		System.out.println(ori);
		System.out.println(sys);



		//파일이 수정되었을 때
		if(!prof_img.getOriginalFilename().equals("")) {

				//파일 관련 업데이트 업로드 참고
				String realPath= session.getServletContext().getRealPath("/resources/profile");

				if(realPath == null){
					realPath = "resources/profile";
				}

				File filePath= new File(realPath);

				if(!filePath.exists()) {filePath.mkdir();}

				String oriprofname= prof_img.getOriginalFilename();
				String sysprofname= UUID.randomUUID()+"_"+oriprofname;


				//파일 입력
				dto.setOriprofname(oriprofname);
				dto.setSysprofname(sysprofname);

				File targetFile = new File(filePath + "/" +sysprofname);
				try {
					InputStream fileStream = prof_img.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile);
					service.updateMemInfo(dto);//파일 저장

				} catch (IOException e) {
					FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
					e.printStackTrace();
				}


		}else{

			//기존 파일이 변화가 없을 때
			dto.setOriprofname(ori);
			dto.setSysprofname(sys);

			service.updateMemInfo(dto);

		}

		//기존 세션 제거 후 새로운 세션 발급
		session.invalidate();

		session.setAttribute("loginID",id);
		session.setAttribute("nickname",dto.getNickname());

		return "redirect:toMypage";
	}
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}


}
