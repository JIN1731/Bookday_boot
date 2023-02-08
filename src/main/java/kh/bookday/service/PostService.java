package kh.bookday.service;

import com.google.gson.JsonObject;
import kh.bookday.dao.PostCommentDAO;
import kh.bookday.dao.PostDAO;
import kh.bookday.dao.PostLikeDAO;
import kh.bookday.dto.PostCommentDTO;
import kh.bookday.dto.PostDTO;
import kh.bookday.dto.PostLikeDTO;
import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class PostService {

	@Autowired
	private PostDAO dao;

	@Autowired
	private PostLikeDAO ldao;

	@Autowired
	private PostCommentDAO cdao;
	
	

// 수진
	// 포스트 개수 출력
	public int selectPostCountById(String id) {
		return dao.selectPostCountById(id);
	}
	
	// 포스트 리스트 먼저 출력(jstl)
	public List<PostDTO> select20PostListById(String id){

		return dao.select20PostListById(id);
	}
	
	// 책장 페이지) 포스트 올린 책 20개씩 출력(무한 스크롤)
	public List<PostDTO> selectNextPostListById(String id, int count) {

		if (dao.selectPostCountById(id) < (count * 20) + 1) {
			return null;
		}

		HashMap<String, Object> data = new HashMap<>();
		data.put("min", (count * 20) + 1);
		data.put("max", (count * 20) + 20);
		data.put("id", id);

		return dao.selectNextPostListById(data);
	}

	// 포스트 페이지) 포스트 리스트 출력
	public List<PostDTO> selectPostListRev(String id){
		List<PostDTO> plist = dao.selectPostListRev(id);
		for(PostDTO post: plist) {
			post.setP_content(Jsoup.parse(post.getP_content()).text());
		}
		return plist;
	}

	// 포스트 페이지) 포스트 리스트 좋아요 출력
	public List<PostLikeDTO> selectPostLikeListById(String id){
		List<PostLikeDTO> llist = ldao.selectPostLikeListById(id);
		return llist;
	}


	// 포스트 페이지) 포스트 입력
	public int insertPost(PostDTO dto) { // p_seq받아오는 걸로 바꾸기
		dao.insertPost(dto);
		return dto.getP_seq();
	}
	
	// 포스트 페이지) 포스트 수정
	public int updatePost(PostDTO dto) {
		return dao.updatePost(dto);
	}
	
	// 포스트 페이지) 포스트 조회수
	public void upViewCount(int p_seq) {
		dao.upViewCount(p_seq);
	}
	
	// 포스트 페이지) 포스트 디테일 출력
	public PostDTO selectPostByPseq(int p_seq) {
		return dao.selectPostByPseq(p_seq);
	}

	// 포스트 페이지) 포스트 디테일 좋아요 출력
	public boolean selectPostLike(PostLikeDTO ldto) {
		return ldao.selectPostLike(ldto);
	}

	// 포스트 페이지) 포스트 좋아요 입력
	@Transactional
	public String insertPostLike(PostLikeDTO dto) {
		int result = 0;
		if(!ldao.selectPostLike(dto)) {
			result = ldao.insertPostLike(dto);
			dao.updatePLCUp(dto.getP_seq());
			dao.downViewCount(dto.getP_seq());
		}
		return String.valueOf(result);
	}
	
	// 포스트 페이지)  포스트 좋아요 삭제
	@Transactional
	public String deletePostLike(PostLikeDTO dto) {
		int result = 0;
		if(ldao.selectPostLike(dto)) {
			result = ldao.deletePostLike(dto);
			dao.updatePLCDown(dto.getP_seq());
			dao.downViewCount(dto.getP_seq());
		}
		return String.valueOf(result);
	}

	// 포스트 페이지) 포스트 댓글 출력
	public List<PostCommentDTO> selectPostCListByPseq(int p_seq){
		return cdao.selectPostCListByPseq(p_seq);
	}

	// 포스트 페이지) 댓글 리스트 출력
	public List<PostCommentDTO> selectPCListByPseq(PostCommentDTO dto){
		return cdao.selectPCListByPseq(dto);
	}

	// 포스트 페이지) 댓글 입력
	@Transactional
	public void insertPostComment(PostCommentDTO dto) {
		cdao.insertPostComment(dto);
		dao.updatePCCUp(dto.getP_seq());

	}
	// 포스트 페이지) 댓글 삭제
	@Transactional
	public void deletePostComment(int pc_seq, int p_seq) {
		cdao.deletePostComment(pc_seq);
		dao.updatePCCDown(p_seq);
	}
	
	// 포스트 검색
	public List<PostDTO> selectSearchPostList(String id, String searchWord){
		HashMap<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("searchWord", searchWord);

		return dao.selectSearchPostList(param);
	}
	// 포스트 삭제
	public void deletePostByPseq(int p_seq) {
		dao.deletePostByPseq(p_seq);
		cdao.deletePostCommentByPseq(p_seq);
		ldao.deletePostLikeByPseq(p_seq);
	}
	
	// 섬머노트 이미지
	public String uploadSummernoteImageFile(MultipartFile multipartFile, String realPath) {
		JsonObject jsonObject = new JsonObject();
		
		File filePath = new File(realPath);
		if(!filePath.exists()) {filePath.mkdir();}
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		System.out.println(originalFileName);
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		System.out.println(filePath);
		File targetFile = new File(filePath + "/" +savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/upload/"+savedFileName); 
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
// 수진

	// 해당 도서에 대한 포스트 출력
	public List<PostDTO> selectPostByIsbn(String b_isbn) {
		return dao.selectPostByIsbn(b_isbn);
	}

	//인기 포스트 출력
	public List<PostDTO> selectPopularPost() {
		return dao.selectPopularPost();
	}
		
// 지민	
	// 검색 시 포스트 출력
	public List<PostDTO> selectPostListBySw(String searchWord){
		return dao.selectPostListBySw(searchWord);
	}
// 지민





}
