package kh.bookday.dao;

import kh.bookday.dto.ReviewLikeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ReviewLikeDAO {
	
	@Autowired
	private SqlSession db;
	
	//유저가 좋아요를 눌렀는지 안 눌렀는지 확인
		public List <ReviewLikeDTO> findReviewLike(Map<String, String> param) {
			return db.selectList("Review.findReviewLike",param);
		}

	//해당 도서 리뷰 좋아요 추가
		public void insertReviewLike(ReviewLikeDTO dto) {
			db.selectOne("Review.insertReviewLike", dto);
		}
			
	//해당 도서 리뷰 좋아요 삭제
		public void deleteReviewLike(Map<String, String> param) {
			db.selectOne("Review.deleteReviewLike", param);
		}

}
