package kh.bookday.dto;

import lombok.Data;

@Data
public class BookDTO {

	private String b_isbn;
	private int b_ranking;
	private String b_title;
	private String b_writer;
	private String b_genre;
	private String b_publisher;
	private String b_publication_date;
	private String b_img_url;
	private String b_description;

}
