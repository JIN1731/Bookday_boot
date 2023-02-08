package kh.bookday.service;

import kh.bookday.dao.ReviewDAO;
import kh.bookday.dao.ReviewLikeDAO;
import kh.bookday.dto.ReviewDTO;
import kh.bookday.dto.ReviewLikeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO dao;
	
	@Autowired
	private ReviewLikeDAO rldao;
	
	//해당 도서 리뷰 출력
		public List<ReviewDTO> selectReviewByIsbn(String b_isbn) {
			
			return dao.selectReviewByIsbn(b_isbn);
		}
		
		//해당 도서 리뷰 작성
			public void insertReview(ReviewDTO dto) {
				
				dao.insertReview(dto);
			}
		
		//해당 도서 리뷰 삭제 //String b_isbn, String rv_writer_id
		public void deleteReview(String b_isbn, String rv_seq) {
			
			Map<String,String> param = new HashMap<>();
			param.put("b_isbn", b_isbn);
			param.put("rv_seq", rv_seq);
			
			dao.deleteReview(param);
		}
		
		//해당 도서 리뷰 수정 
		public int updateReview(ReviewDTO dto) {

			return dao.updateReview(dto);
		}

		//로그인 유저에 대한 해당 도서 리뷰들 좋아요 여부 파악
			public List<ReviewLikeDTO> findReviewLike(String id, String b_isbn) {
				Map<String, String> param=new HashMap<>();
				param.put("b_isbn", b_isbn);
				param.put("id", id);
				
			return rldao.findReviewLike(param);
			}
		
		//해당 도서 리뷰 좋아요 추가
		public void insertReviewLike (ReviewLikeDTO dto) {
			rldao.insertReviewLike(dto);
		}
		
		//해당 도서 리뷰 좋아요 삭제
		public void deleteReviewLike (String rv_seq, String id) {
				Map<String, String> param=new HashMap<>();
				param.put("rv_seq", rv_seq);
				param.put("id", id);
				
				rldao.deleteReviewLike(param);
			}
		
		//리뷰 총 갯수
		public int countReview() {
			return dao.countReview();
		}

//		public List<PagingDTO> selectReview(PagingDTO page){
//			 List<PagingDTO> result = dao.selectReview(page);
//			return result;
//			 
//		}

		
}
