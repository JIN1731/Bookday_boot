package kh.bookday.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class PostCommentDTO {

	private int pc_seq;
	private String pc_writer_id;
	private String sysprofname;
	private String pc_writer_nn;
	private String pc_content;
	private Timestamp pc_write_date;
	private int p_seq;
	private String b_isbn;


	public PostCommentDTO() {
		super();
	}
	public PostCommentDTO(int pc_seq, String pc_writer_id, String sysprofname, String pc_writer_nn, String pc_content,
						  Timestamp pc_write_date, int p_seq, String b_isbn) {
		this.pc_seq = pc_seq;
		this.pc_writer_id = pc_writer_id;
		this.sysprofname = sysprofname;
		this.pc_writer_nn = pc_writer_nn;
		this.pc_content = pc_content;
		this.pc_write_date = pc_write_date;
		this.p_seq = p_seq;
		this.b_isbn = b_isbn;
	}


	public int getPc_seq() {
		return pc_seq;
	}
	public void setPc_seq(int pc_seq) {
		this.pc_seq = pc_seq;
	}
	public String getPc_writer_id() {
		return pc_writer_id;
	}
	public void setPc_writer_id(String pc_writer_id) {
		this.pc_writer_id = pc_writer_id;
	}
	public String getSysprofname() {
		return sysprofname;
	}
	public void setSysprofname(String sysprofname) {
		this.sysprofname = sysprofname;
	}
	public String getPc_writer_nn() {
		return pc_writer_nn;
	}
	public void setPc_writer_nn(String pc_writer_nn) {
		this.pc_writer_nn = pc_writer_nn;
	}
	public String getPc_content() {
		return pc_content;
	}
	public void setPc_content(String pc_content) {
		this.pc_content = pc_content;
	}
	public String getPc_write_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy, h:mm:ss aaa", new Locale("en", "US"));
		return sdf.format(pc_write_date);
	}
	public void setPc_write_date(Timestamp pc_write_date) {
		this.pc_write_date = pc_write_date;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getB_isbn() { return b_isbn; }
	public void setB_isbn(String b_isbn) { this.b_isbn = b_isbn; }

}
