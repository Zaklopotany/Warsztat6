package pl.coderslab.beans;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Component;

@Component
public class Encoding {

	public static String encodePassToString(String password) {
		MessageDigest md;
		byte passAsBytes[] = {};
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes(StandardCharsets.UTF_8));
			passAsBytes = md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception p) {
			p.getMessage();
		}
		return DatatypeConverter.printHexBinary(passAsBytes);
	}

	public static byte[] encodePassToByteArr(String password) {
		MessageDigest md;
		byte passAsBytes[] = { 0 };
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes(StandardCharsets.UTF_8));
			passAsBytes = md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception p) {
			p.getMessage();
		}
		return passAsBytes;
	}
	
}
