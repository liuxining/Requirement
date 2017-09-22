package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	
	public static void main(String[] args) {
		String s = "cat";
		String salt = "dog";
		String str = generalPasswordHash(s, salt);
		
		System.out.println(verifyPassword(s, salt, str));
	}
	
	private static String getMD5(String str){
		byte[] bytes = str.getBytes();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] digest = md.digest(bytes);
			BASE64Encoder encoder = new BASE64Encoder();
			return encoder.encode(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String generalPasswordHash(String password,String salt) {
		String str = getMD5(password) + salt;
		return getMD5(str);
		
	}

	public static boolean verifyPassword(String password,String salt, String md5) {
		String str = generalPasswordHash(password, salt);
		return str.equals(md5);
	}
	
}
