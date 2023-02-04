package kh.bookday.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReviewDTO {
	
	private int rv_seq;
	private String rv_writer_id;
	private String rv_writer_nn;
	private Timestamp rv_write_date;
	private String rv_content;
	private String b_isbn;
	private int r_count_like;

}
