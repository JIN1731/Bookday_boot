package kh.bookday.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class WishlistDTO {
	
	private int wishlist_seq;
	private String id;
	private String b_isbn;
	private String b_img_url;
	private String b_title;
	private String b_writer;
	private String b_genre;
	private Timestamp w_add_date;

}
