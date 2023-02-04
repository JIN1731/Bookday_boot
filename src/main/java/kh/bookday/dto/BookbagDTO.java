package kh.bookday.dto;

import lombok.Data;

@Data
public class BookbagDTO {
	
	private int bookbag_seq;
	private String id;
	private String b_isbn;
	private String b_img_url;
	private String b_title;
	private String b_writer;
	private String b_genre;

}
