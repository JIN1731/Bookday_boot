package kh.bookday.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MonthSubMemberDTO {

	private String id;
	private Timestamp start_date;
	private Timestamp end_date;
	private int delivery_count;
	private int rental_count;


	public MonthSubMemberDTO() {
		super();
	}
	public MonthSubMemberDTO(String id, Timestamp start_date, Timestamp end_date, int delivery_count, int rental_count) {
		this.id = id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.delivery_count = delivery_count;
		this.rental_count = rental_count;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public int getDelivery_count() {
		return delivery_count;
	}
	public void setDelivery_count(int delivery_count) {
		this.delivery_count = delivery_count;
	}
	public int getRental_count() {
		return rental_count;
	}
	public void setRental_count(int rental_count) {
		this.rental_count = rental_count;
	}
	
	// 날짜 변환 메소드
	public String getFormedStartDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.start_date);
	}
	public String getFormedEndDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.end_date);
	}

}
