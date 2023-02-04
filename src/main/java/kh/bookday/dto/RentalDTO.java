package kh.bookday.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
public class RentalDTO {

	private int rt_seq;
	private String id;
	private String b_isbn;
	private String b_img_url;
	private String b_title;
	private String b_writer;
	private String b_genre;
	private Timestamp rt_rental_date;
	private Timestamp rt_return_date;


	public RentalDTO() {
		super();
	}
	public RentalDTO(int rt_seq, String id, String b_isbn, String b_img_url, String b_title, String b_writer,
			String b_genre, Timestamp rt_rental_date, Timestamp rt_return_date) {
		this.rt_seq = rt_seq;
		this.id = id;
		this.b_isbn = b_isbn;
		this.b_img_url = b_img_url;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_genre = b_genre;
		this.rt_rental_date = rt_rental_date;
		this.rt_return_date = rt_return_date;
	}


	public int getRt_seq() {
		return rt_seq;
	}
	public void setRt_seq(int rt_seq) {
		this.rt_seq = rt_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getB_isbn() {
		return b_isbn;
	}
	public void setB_isbn(String b_isbn) {
		this.b_isbn = b_isbn;
	}
	public String getB_img_url() {
		return b_img_url;
	}
	public void setB_img_url(String b_img_url) {
		this.b_img_url = b_img_url;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_genre() {
		return b_genre;
	}
	public void setB_genre(String b_genre) {
		this.b_genre = b_genre;
	}
	public Timestamp getRt_rental_date() {
		return rt_rental_date;
	}
	public void setRt_rental_date(Timestamp rt_rental_date) {
		this.rt_rental_date = rt_rental_date;
	}
	public Timestamp getRt_return_date() {
		return rt_return_date;
	}
	public void setRt_return_date(Timestamp rt_return_date) {
		this.rt_return_date = rt_return_date;
	}

	// 날짜 변환 메소드
	public String getFormedRt_rental_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.rt_rental_date);
	}
	public String getFormedRt_return_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.rt_return_date);
	}

}
