package kh.bookday.controller;

import com.google.gson.Gson;
import kh.bookday.dto.MemberDTO;
import kh.bookday.dto.PostCommentDTO;
import kh.bookday.dto.PostDTO;
import kh.bookday.dto.PostLikeDTO;
import kh.bookday.service.MemberService;
import kh.bookday.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("booknote")
public class BooknoteController {

	@Autowired
	private MemberService mservice;

	@Autowired
	private PostService service;

	@Autowired
	private HttpSession session;

	// 포스트 리스트 출력
	@RequestMapping("selectPostListRev")
	public String selectPostListRev(Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원정보 
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		// 포스트 리스트
		List<PostDTO> list = service.selectPostListRev(id);
		model.addAttribute("list", list);

		// 포스트 좋아요 리스트
		List<PostLikeDTO> llist = service.selectPostLikeListById(id);
		model.addAttribute("llist", llist);

		return "mybook/booknote/selectpostlist";
	}	

	// 포스트 좋아요 입력, +1
	@ResponseBody
	@RequestMapping("insertPostLike")
	public String insertPostLike(PostLikeDTO dto) {

		String id = String.valueOf(session.getAttribute("loginID"));

		dto.setId(id);
		dto.setP_writer_id(id);
		String result = service.insertPostLike(dto);
		return result;
	}

	// 포스트 좋아요 삭제, -1
	@ResponseBody
	@RequestMapping("deletePostLike")
	public String deletePostLike(PostLikeDTO dto) {

		String id = String.valueOf(session.getAttribute("loginID"));

		dto.setId(id);
		dto.setP_writer_id(id);
		String result = service.deletePostLike(dto);
		return result;
	}

	// 포스트 입력 페이지로
	@RequestMapping("toInsertPost")
	public String toInsertPost(Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		return "mybook/booknote/insertpost";
	}

	// 포스트 입력
	@ResponseBody
	@RequestMapping("insertPost")
	public int insertPost(PostDTO dto, Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원 정보
		MemberDTO mdto = mservice.selectMemberById(id);

		dto.setP_writer_id(id);
		dto.setSysprofname(mdto.getSysprofname());
		dto.setP_writer_nn(mdto.getNickname());
		dto.setP_title(dto.getP_title().replace("<", "&lt;"));
		dto.setP_content(dto.getP_content().replace("<script>", "&lt;"));
		
		return service.insertPost(dto);

	}

	// 포스트 디테일 출력
	@RequestMapping("selectPostByPseq")
	public String selectPostByPseq(int p_seq, Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원 정보
		MemberDTO mdto = mservice.selectMemberById(id);
		model.addAttribute("mdto", mdto);
		
		service.upViewCount(p_seq);
		
		// 포스트 디테일
		PostDTO dto = service.selectPostByPseq(p_seq);
		model.addAttribute("dto", dto);

		// 포스트 디테일에서 좋아요
		PostLikeDTO ldto = new PostLikeDTO();
		ldto.setP_seq(p_seq);
		ldto.setId(id);
		boolean result = service.selectPostLike(ldto);
		model.addAttribute("result", result);

		// 포스트 댓글 출력 foreach
		List<PostCommentDTO> list = service.selectPostCListByPseq(p_seq);
		model.addAttribute("list", list);

		return "mybook/booknote/selectpost";
	}

	// 포스트 수정 페이지로
	@GetMapping("toUpdatePost")
	public String toUpdatePost(int p_seq, Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원 정보
		MemberDTO mdto = mservice.selectMemberById(id);
		model.addAttribute("mdto", mdto);
		
		service.upViewCount(p_seq);
		
		// 포스트 디테일
		PostDTO dto = service.selectPostByPseq(p_seq);
		model.addAttribute("dto", dto);

		return "mybook/booknote/updatepost";
	}
	
	// 포스트 수정
	@ResponseBody
	@RequestMapping("updatePost")
	public int updatePost(PostDTO dto, Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원 정보
		MemberDTO mdto = mservice.selectMemberById(id);
		
		dto.setP_seq(dto.getP_seq());
		dto.setP_writer_id(id);
		dto.setP_title(dto.getP_title().replace("<", "&lt;"));
		dto.setP_content(dto.getP_content().replace("<script>", "&lt;"));
		service.updatePost(dto);
		
		return dto.getP_seq();

	}
	
	// 포스트 삭제
	@RequestMapping("deletePostByPseq")
	public String deletePostByPseq(int p_seq) {

		service.deletePostByPseq(p_seq);
			
		return "redirect:/booknote/selectPostListRev";

	}
	
	// 포스트 댓글 출력 ajax
	@ResponseBody
	@RequestMapping("selectPCListByPseq")
	public String selectPCListByPseq(PostCommentDTO dto) {

		String id = String.valueOf(session.getAttribute("loginID"));
		// 버튼 뜨는지 꼭 다시 확인
		return new Gson().toJson(service.selectPCListByPseq(dto));
	}

	// 포스트 댓글 입력
	@ResponseBody
	@RequestMapping("insertPostComment")
	public String insertPostComment(PostCommentDTO cdto) {

		String id = String.valueOf(session.getAttribute("loginID"));
		System.out.println(id);
		
		cdto.setPc_content(cdto.getPc_content().replace("<script>", "&lt;")); 
		
		MemberDTO mdto = mservice.selectMemberById(id);
		System.out.println(mdto.getId());
		cdto.setPc_writer_id(mdto.getId());
		cdto.setPc_writer_nn(mdto.getNickname());
		cdto.setSysprofname(mdto.getSysprofname());
		service.insertPostComment(cdto);
		
		PostDTO dto = service.selectPostByPseq(cdto.getP_seq());
		
		return new Gson().toJson(dto.getP_comment_count());
	}

	// 포스트 댓글 삭제
	@ResponseBody
	@RequestMapping("deletePostComment")
	public void deletePostComment(int pc_seq, int p_seq) {

		String id = String.valueOf(session.getAttribute("loginID"));
		// session이랑 지우려는 댓글 아이디가 같을 때 는 프론트에서

		service.deletePostComment(pc_seq, p_seq);
	}

	@GetMapping("selectSearchPostList")
	public String selectSearchPostList(String searchWord, Model model) {

		String id = String.valueOf(session.getAttribute("loginID"));

		// 회원정보 
		MemberDTO dto = mservice.selectMemberById(id);
		model.addAttribute("dto", dto);

		// 포스트 리스트
		List<PostDTO> list = service.selectSearchPostList(id, searchWord);
		model.addAttribute("list", list);

		// 포스트 좋아요 리스트
		List<PostLikeDTO> llist = service.selectPostLikeListById(id);
		model.addAttribute("llist", llist);
		System.out.println(llist.size());

		return "mybook/booknote/selectpostlist";

	}

	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
				
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		String data = service.uploadSummernoteImageFile(multipartFile, realPath);
		
		return data;
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
