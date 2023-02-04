package kh.bookday.common;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Pw_SHA256 {
	
	//비밀번호 암호화
			public static String getSHA256(String input){

			      String toReturn = null;

			      try {

			         MessageDigest digest = MessageDigest.getInstance("SHA-256");
			         digest.reset();
			         digest.update(input.getBytes("utf8"));
			         toReturn = String.format("%064x", new BigInteger(1, digest.digest()));

			      } catch (Exception e) {
			         e.printStackTrace();

			      }
			      return toReturn;

			   }
			
}
