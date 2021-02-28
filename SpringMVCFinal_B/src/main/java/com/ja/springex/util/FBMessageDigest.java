package com.ja.springex.util;

import java.security.*;

public class FBMessageDigest {

	public static String messageDigest(String message) {
		//스태틱을 붙인다. static을 붙이면 인스턴스를 생성하지않고 전역적으로 어디서든 사용할수있다. 
		String hashCode = null;
		
		message = message + "@FB";		
		
		StringBuilder sb = new StringBuilder();
		
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");

			messageDigest.reset();
			messageDigest.update(message.getBytes("UTF-8"));

			byte[] chars = messageDigest.digest();

			for (int i = 0; i < chars.length; i++) {
				String tmp = Integer.toHexString(0xff & chars[i]);
				if (tmp.length() == 1)
					sb.append("0");
				sb.append(tmp);
			}

			hashCode = sb.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		

		
		return hashCode;
	}
	
	
}
