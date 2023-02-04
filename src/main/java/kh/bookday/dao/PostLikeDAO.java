package kh.bookday.dao;

import kh.bookday.dto.PostLikeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostLikeDAO {

	@Autowired
	private SqlSession db;
	
	public List<PostLikeDTO> selectPostLikeListById(String id) {
		return db.selectList("PostLike.selectPostLikeListById", id);
	}
	
	public boolean selectPostLike(PostLikeDTO ldto) {
		return db.selectOne("PostLike.selectPostLike", ldto);
	}
	
	public int insertPostLike(PostLikeDTO dto) {
		return db.insert("PostLike.insertPostLike", dto);
	}

	public int deletePostLike(PostLikeDTO dto) {
		return db.delete("PostLike.deletePostLike", dto);
	}
	
	public void deletePostLikeByPseq(int p_seq) {
		db.delete("PostLike.deletePostLikeByPseq", p_seq);
	}

}
