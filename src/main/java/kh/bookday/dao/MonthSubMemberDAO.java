package kh.bookday.dao;

import kh.bookday.dto.MonthSubMemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MonthSubMemberDAO {

    @Autowired
    private SqlSession db;

    // 월 구독 회원 등록
    public void insertMonthSubMemberById(String id) {
        db.insert("MonthSubMember.insertMonthSubMemberById", id);
    }

    // 월 구독 회원 정보 조회
    public MonthSubMemberDTO selectMonthSubMemberById(String id) {
        return db.selectOne("MonthSubMember.selectMonthSubMemberById", id);
    }

    // 월 구독 회원 남은 배송 횟수, 남은 대여 권수 계산
    public void updateMonthSubMemberById(MonthSubMemberDTO dto) {
        db.update("MonthSubMember.updateMonthSubMemberById", dto);
    }
}
