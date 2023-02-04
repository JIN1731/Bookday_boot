package kh.bookday.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BookmarkDTO {
	
	private int bm_seq;
	private String bm_writer_id;
	private String b_isbn;
	private String b_img_url;
	private String b_title;
	private String b_writer;
	private String b_genre;
	private Timestamp bm_write_date;
	private String bm_content;

}
