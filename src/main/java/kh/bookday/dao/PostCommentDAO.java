package kh.bookday.dao;

import kh.bookday.dto.PostCommentDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostCommentDAO {
	
	@Autowired
	private SqlSession db;
	
	public List<PostCommentDTO> selectPostCListByPseq(int p_seq){
		return db.selectList("PostComment.selectPostCListByPseq", p_seq);
	}
	
	public List<PostCommentDTO> selectPCListByPseq(PostCommentDTO dto){
		return db.selectList("PostComment.selectPCListByPseq", dto);
	}
	
	public void insertPostComment(PostCommentDTO dto) {
		db.insert("PostComment.insertPostComment", dto);
	}

	public void deletePostComment(int pc_seq) {
		db.delete("PostComment.deletePostComment", pc_seq);
	}
	
	public void deletePostCommentByPseq(int p_seq) {
		db.delete("PostComment.deletePostCommentByPseq", p_seq);
	}

}
