package kh.bookday.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.bookday.dao.RentalDAO;
import kh.bookday.dto.RentalDTO;

@Service
public class RentalService {

	@Autowired
	private RentalDAO dao;

	// 수진
	// 대여 중인 책 출력
	public List<RentalDTO> selectRentalListById(String id){
		return dao.selectRentalListById(id);
	}

	// 대여 중인 책 수 출력
	public int selectRentalCountById(String id) {
		return dao.selectRentalCountById(id);
	}
	// 수진

	// 대여 테이블 입력
	public void insertRental(RentalDTO dto) {
		dao.insertRental(dto);
	}

	// 방금 대여한 책 리스트 출력
	public List<RentalDTO> selectRentalListByIdRownum(String id, int rownum){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("rownum", rownum);
		return dao.selectRentalListByIdRownum(param);
	}

	// 가장 최근 대여 내역 출력
	public RentalDTO selectRentalById(String id) {
		return dao.selectRentalById(id);
	}

}
