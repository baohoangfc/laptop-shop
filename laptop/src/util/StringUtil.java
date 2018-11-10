package util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.ui.ModelMap;

public class StringUtil {
	
	public String md5(String str){
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());
			
			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static String renameFile(String fileName) {
		String[] arrImg = fileName.split("\\.");
		String duoiFileImg = arrImg[arrImg.length - 1];
		String nameFile = "";
		for (int i = 0; i < (arrImg.length - 1); i++) {
			if (i == 0) {
				nameFile = arrImg[i];
			} else {
				nameFile += "-" + arrImg[i];
			}
		}
		nameFile = nameFile + "_" + System.nanoTime() + "." + duoiFileImg;
		return nameFile;
	}
	
	public static String editChuoiMota(String str){
		int size = str.length();
		String moi = "";
		int end = 50;
		char charr = str.charAt(end);
		char kt = ' ';
			if (charr == kt) { 
				moi = str.substring(0, end);
			}else {
				if (str.charAt(end+1) == kt) {
					moi = str.substring(0, end+1);
				} else if (charr != kt) {
					
					for (int i = end; i < size; i++) {
						if (str.charAt(i) == kt) {
							moi = str.substring(0, i);
							break;
						}
					}
				}
			}
		return moi;
	}

	public static void pagination(Integer page, int sumContact, int sumPage, Integer luotNhay, ModelMap modelMap) {
		// Tính số lượt nhảy:
				int soLuotNhay = (int) Math.ceil((float) sumPage / 2);
				int oStart = (luotNhay - 1) * 2 + 1;
				int oEnd = (luotNhay - 1) * 2 + 2;
				
				System.out.println("Page hien tai: " + page);
				System.out.println("sumPage: " + sumPage);
				System.out.println("soLuotNhay: " + soLuotNhay);
				System.out.println("luotNhay: " + luotNhay);
				System.out.println("oStart: " + oStart);
				System.out.println("oEnd: " + oEnd + "\n");

				modelMap.addAttribute("soLuotNhay", soLuotNhay);
				modelMap.addAttribute("luotNhay", luotNhay);
				modelMap.addAttribute("oStart", oStart);
				modelMap.addAttribute("oEnd", oEnd);

				modelMap.addAttribute("sumPage", sumPage);
				modelMap.addAttribute("page", page);

		
	}

}
