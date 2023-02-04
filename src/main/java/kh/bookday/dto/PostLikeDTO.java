package kh.bookday.dto;

import lombok.Data;

@Data
public class PostLikeDTO {
	
	private int pl_seq;
	private String id;
	private int p_seq;
	private String p_writer_id;
	private String b_isbn;

}
