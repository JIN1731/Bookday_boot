package kh.bookday.dao;

import kh.bookday.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession db;
	
	//해당 도서 리뷰 출력
		public List<ReviewDTO> selectReviewByIsbn(String b_isbn) {
			return db.selectList("Review.selectReviewByIsbn", b_isbn);
		}
		
		//해당 도서 리뷰 작성
		public void insertReview(ReviewDTO dto) {
			db.insert("Review.insertReview", dto);
		}
		
		
		//해당 도서 리뷰 삭제 //String b_isbn, String rv_writer_id
		public void deleteReview(Map<String, String> param) {
			db.delete("Review.deleteReview", param);
		}
		
		//해당 도서 리뷰 수정
		public int updateReview(ReviewDTO dto) {
			return db.update("Review.updateReview", dto);
		}
		
		//리뷰 페이징
		public int countReview() {
			
			return db.selectOne("Review.countReview");
		}
		
		//페이징 작업을해서 해당 페이지의 게시글을 보는 기능.
//		public List<PagingDTO> selectReview(PagingDTO page) {
//			 List<PagingDTO> result = db.selectList("Review.selectReview", page);
//			return result;
//		}

}
