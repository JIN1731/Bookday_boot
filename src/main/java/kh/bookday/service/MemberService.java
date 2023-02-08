package kh.bookday.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import kh.bookday.common.NCP_sms;
import kh.bookday.dao.MemberDAO;
import kh.bookday.dao.MonthSubMemberDAO;
import kh.bookday.dto.MemberDTO;
import kh.bookday.dto.MonthSubMemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	private MonthSubMemberDAO mdao;

	public MemberDTO selectMemberById(String id) {
		return dao.selectMemberById(id);
	}

	public boolean checkByPhone(String phone){
		boolean result=dao.checkByPhone(phone);

		return result;
	}

	public boolean checkByNickname(String nickname){
		boolean result=dao.checkByNickname(nickname);

		return result;

	}

	public boolean isLoginOk(String phone, String pw){
		Map<String ,String> param = new HashMap<>();
		param.put("phone", phone);
		param.put("pw", pw);

		boolean result=dao.isLoginOk(param);

		return result;			
	}

	public void signUp(MemberDTO dto) {

		//uuid 생성
		String id =UUID.randomUUID().toString();
		dto.setId(id);

		dao.signUp(dto);
	}

	public void kakaoSignUp(MemberDTO dto) {

		//uuid 생성 X
		dao.signUp(dto);
	}

	public String selectIdByPhone(String phone) {
		return dao.selectIdByPhone(phone);
	}


	public boolean selectByEmail(String email) {
		return dao.selectByEmail(email);
	}

	public void updatePw(String pw,String phone) {
		Map<String ,String> param = new HashMap<>();
		param.put("pw", pw);
		param.put("phone", phone);
		
		dao.updatePw(param);
	}


	//NCP_sms 관련 서비스 로직 //인증번호 난수 생성 후 발송
	public String createRandomMsg(String phone){
		NCP_sms sms = new NCP_sms();
		Random rand=new Random();
		String msg="";

		for(int i=0; i<6; i++) {
			//0~10자 이내의 숫자 1개가 6번 나오도록 반복 ex)023855
			String rnum=Integer.toString(rand.nextInt(10));
			msg +=rnum;
		}
		System.out.println("회원가입 문자 인증: "+msg);

		//메세지를 보내는 로직에 핸드폰 번호와 인증번호를 전달
		sms.send_msg(phone, msg);

		return msg;
	}

	//카카오 로그인 토큰 발급 요청
	@SuppressWarnings("deprecation") //경고 제외 기능: deprecation-권장되지 않는 기능과 관련된 경고를 억제
	public String getAccessToken(String code) {
		String access_Token="";
		String refresh_Token="";
		//String content_type="application/x-www-form-urlencoded";
		String grant_type="grant_type=authorization_code";
		String client_id="&client_id=5d39c4a90d2cd9ef1649a8e6108ba988";

		//상황에 따라 바꿔서 사용
//		String redirect_uri_test="&redirect_uri=http://localhost/member/kakaoLogin";
		//http://3.34.217.163/
//		String redirect_uri= "&redirect_uri=http://13.125.80.112/member/kakaoLogin";
		String redirect_uri= "&redirect_uri=http://3.34.217.163/member/kakaoLogin";
		String reqURL ="https://kauth.kakao.com/oauth/token";

		try {
			//카카오 서버랑 연결하기 위한 url 선언
			URL url = new URL(reqURL);
			 URLEncoder.encode(reqURL, "UTF-8");

			//http 연결
			HttpURLConnection conn= (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			//System.out.println();과 유사한 기능으로 스트림에 문자열을 출력하는 기능
			//outputstreamWriter에 출력 스트림 연결 후 버퍼라이터에 인스턴스 생성  //이미 아웃풋 스트림이 있는데 버퍼를 쓰는 이유는?
			BufferedWriter bw= new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			//sb.append(content_type);
			sb.append(grant_type);
			sb.append(client_id);
			sb.append(redirect_uri);
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();

			//결과 코드 받아오기
			int responseCode=conn.getResponseCode();
			System.out.println("카카오 로그인 응답 코드: "+responseCode);

			//response로 받은 json 코드 읽어오기
			//BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			//refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			//System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}


	//카카오 로그인 유저 정보 조회
	@SuppressWarnings("deprecation")
	public MemberDTO getUserInfo(String access_Token){

		MemberDTO userInfo = new MemberDTO();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		String Authorization="bearer "+ access_Token;

		System.out.println(Authorization);

		try {

			URL url=new URL(reqURL);

			HttpURLConnection conn=(HttpURLConnection) url.openConnection();

			//카카오 서버에 연결되기 위해 필요한 정보들(요청을 쏘는 방식 및 헤더 설정)
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", Authorization);
			conn.addRequestProperty("charset", "utf-8");

			int responsecode= conn.getResponseCode();
			System.out.println("유저 정보 조회 요청 코드:"+responsecode);

			//값 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));

			String line="";
			String result ="";

			while((line=br.readLine()) != null){
				result += line;
			}
			System.out.println("response body: "+result);

			//json으로 값 파싱
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();

			JsonObject kakao_account=element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String id =  element.getAsJsonObject().get("id").getAsString();

			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			System.err.println(email);

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();


			userInfo.setId(id);
			userInfo.setPw(UUID.randomUUID().toString()); //비밀번호 겹치지 않게 자동값 생성(보안에 매우 취약)
			userInfo.setPhone(""); //휴대폰 번호
			userInfo.setEmail(email); //이메일
			userInfo.setName(nickname); //이름(닉네임과 동일)
			userInfo.setNickname(nickname);//닉네임(세션)


		}catch(IOException e){
			e.printStackTrace();
		}
		return userInfo;
	}
	
	//회원정보수정
	public void updateMemInfo(MemberDTO dto) {
		dao.updateMemInfo(dto);
	}

	// 회원 배송지 정보 입력
	public void updateMemberAddressById(MemberDTO dto) {
		dao.updateMemberAddressById(dto);
	}

	// 월 구독 회원 정보 조회
	public MonthSubMemberDTO selectMonthSubMemberById(String id) {
		return mdao.selectMonthSubMemberById(id);
	}

	// 월 구독 회원 등록
	public void insertMonthSubMemberById(String id) {
		mdao.insertMonthSubMemberById(id);
	}

	// 회원 등급 변경
	public void updateMemberGradeById(String id) {
		dao.updateMemberGradeById(id);
	}

	// 월 구독 회원 남은 배송 횟수, 남은 대여 권수 계산
	public void updateMonthSubMemberById(MonthSubMemberDTO dto) {
		mdao.updateMonthSubMemberById(dto);
	}
	// 지민
}
