package kh.bookday.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class PostDTO {
	
	private int p_seq;
	private String p_writer_id;
	private String sysprofname;
	private String b_isbn;
	private String b_img_url;
	private String b_title;
	private String b_writer;
	private String b_genre;
	private String b_publisher;
	private String b_publication_date;
	private String dyst_read;
	private String dyfn_read;
	private String p_writer_nn;
	private Timestamp p_write_date;
	private String p_title;
	private String p_content;
	private int p_view_count;
	private int p_comment_count;
	private int p_like_count;
	
}
