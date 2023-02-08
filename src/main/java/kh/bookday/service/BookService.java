package kh.bookday.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kh.bookday.dao.BookDAO;
import kh.bookday.dao.WishlistDAO;
import kh.bookday.dto.BookDTO;
import kh.bookday.dto.WishlistDTO;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class BookService {
	
	@Autowired
	private BookDAO dao;

	@Autowired
	private WishlistDAO wdao;
	
	// 도서 검색
	public List<BookDTO> selectBookListBySw(String searchWord){
		return dao.selectBookListBySw(searchWord);
	}

	
	//해당 도서 정보 출력
		public BookDTO selectBookByIsbn(String b_isbn) {
			return dao.selectBookByIsbn(b_isbn);
		}
		
		
	//위시리스트로 도서 정보 이동
//		public WishlistDTO selectForWishlist(String b_isbn) {
//
//			WishlistDTO dto=new WishlistDTO();
//
//			dto.setB_title(dao.selectBookByIsbn(b_isbn).getB_title());
//			dto.setB_img_url(dao.selectBookByIsbn(b_isbn).getB_img_url());
//			dto.setB_isbn(b_isbn);
//			dto.setB_writer(dao.selectBookByIsbn(b_isbn).getB_writer());
//			dto.setB_genre(dao.selectBookByIsbn(b_isbn).getB_genre());
//
//			return dto;
//		}
		
		//책가방으로 도서 정보 이동	
//	public BookbagDTO selectForBookbag(String b_isbn) {
//
//			BookbagDTO dto=new BookbagDTO();
//
//			dto.setB_isbn(b_isbn);
//			dto.setB_img_url(dao.selectBookByIsbn(b_isbn).getB_img_url());
//			dto.setB_title(dao.selectBookByIsbn(b_isbn).getB_title());
//			dto.setB_writer(dao.selectBookByIsbn(b_isbn).getB_writer());
//			dto.setB_genre(dao.selectBookByIsbn(b_isbn).getB_genre());
//
//			return dto;
//		}
	
		//베스트셀러 도서 출력 
		public List<BookDTO> selectBestSeller() {
				return dao.selectBestSeller();
			}
			
		//스테디셀러 도서 출력 
		public List<BookDTO> selectSteadySeller() {
				return dao.selectSteadySeller();
			}
			

		//신간 도서 출력 
		public List<BookDTO> selectNewBooks() {
				return dao.selectNewBooks();
			}

		//함께 담은 책 출력
		public List<WishlistDTO> selectWithBooks(String b_isbn, String id) {
			WishlistDTO dto = new WishlistDTO();
			dto.setId(id);
			dto.setB_isbn(b_isbn);
			return wdao.selectWithBooks(dto);
		}

    public void setBookData() throws IOException {

		String bookList = Jsoup.connect("http://data4library.kr/api/loanItemSrch?" +
				"authKey=c3961a3562330baad3bc05913f5ffc62a973821fd682747cb582763296f3f9c3&pageNo=1&" +
				"age=20&startDt=2022-01-01&format=json&pageSize=100").ignoreContentType(true).get().text();

		System.out.println(bookList);

		Gson g = new Gson();

		HashMap<Object, HashMap<Object, Object>> res = g.fromJson(bookList, new TypeToken<HashMap<Object,HashMap<Object, Object>>>(){}.getType());
		System.out.println(res.get("response").get("docs"));

		ArrayList<HashMap<Object, HashMap<String,String>>> docs
				= g.fromJson(g.toJson(res.get("response").get("docs")), new TypeToken<ArrayList<HashMap<Object,HashMap<String,String>>>>(){}.getType());

		System.out.println(docs.get(0).get("doc").get("bookname"));
		for(HashMap<Object, HashMap<String,String>> item : docs){

			String bookDetail = Jsoup.connect("http://data4library.kr/api/srchDtlList?authKey=c3961a3562330baad3bc05913f5ffc62a973821fd682747cb582763296f3f9c3&isbn13="+item.get("doc").get("isbn13")+"&format=json").ignoreContentType(true).get().text();

			res = g.fromJson(bookDetail, new TypeToken<HashMap<Object,HashMap<Object, Object>>>(){}.getType());
			ArrayList<HashMap<Object, HashMap<String,String>>> detail
					= g.fromJson(g.toJson(res.get("response").get("detail")), new TypeToken<ArrayList<HashMap<Object,HashMap<String,String>>>>(){}.getType());

			try {
				BookDTO dto = new BookDTO();

				dto.setB_isbn(item.get("doc").get("isbn13"));
				dto.setB_ranking(Integer.parseInt(item.get("doc").get("ranking")));
				dto.setB_title(item.get("doc").get("bookname"));
				dto.setB_writer(item.get("doc").get("authors"));
				dto.setB_genre(item.get("doc").get("class_nm"));
				dto.setB_publisher(item.get("doc").get("publisher"));
				dto.setB_publication_date(item.get("doc").get("publication_year"));
				dto.setB_img_url(item.get("doc").get("bookImageURL"));
				dto.setB_description(detail.get(0).get("book").get("description"));

				dao.insertBook(dto);
				System.out.println();
			} catch (Exception e) {

				System.out.println("isbn 중복");
			}
		}
    }
}
