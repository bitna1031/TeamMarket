package kr.co.utils;


import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class utils {
	
	public static String rename(String oriName) {
		String newName = null;
		
		UUID uid = UUID.randomUUID();
		newName = uid.toString()+"_"+oriName;
		
		return newName;
	}

	public static String makeDir(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();

		// 절대 좌표 서블릿콘텍트 필 ServletContext sc;
		

		int year = cal.get(Calendar.YEAR);

		File f = new File(uploadPath, year+"");

		if (!f.exists()) {
			f.mkdir();
		}

		int mon = cal.get(Calendar.MONTH) + 1;

		File f2 = new File(f, mon < 10 ? "0" + mon : "" + mon);

		if (!f2.exists()) {
			f2.mkdir();

		}

		int date = cal.get(Calendar.DATE);

		File f3 = new File(f2, date < 10 ? "0" + date : "" + date);

		if (!f3.exists()) {
			f3.mkdir();
		}
		return  f3.getAbsolutePath();

	}
	
	public static String getExtendName(String oriName) {
		
		int idx = oriName.lastIndexOf(".");
		 
		return oriName.substring(idx+1);
	}
	
	public static String getSystemFileName(String filename) {
		String name = null;
		int idx = filename.indexOf("_");
		String prefix = filename.substring(0, idx);
		String suffix = filename.substring(idx+2);
		
		name = prefix+suffix;
		
		return name;
	}
	

	public static String getPathFileName(String aPath, String newName) {
		int idx = aPath.indexOf("uploads") + "uploads".length(); 
		
		String pathFileName = aPath.substring(idx)+File.separator+newName;
		pathFileName = pathFileName.replace(File.separatorChar, '/');
		
		//TODO Auto-generated method stub
		return pathFileName;
	}

	public static MediaType getMediaType(String extendName) {
		// TODO Auto-generated method stub
		Map<String, MediaType> map = new HashMap<String, MediaType>();
		map.put("JPG", MediaType.IMAGE_JPEG);
		map.put("JPEG", MediaType.IMAGE_JPEG);
		map.put("PNG", MediaType.IMAGE_PNG);
		map.put("GIF", MediaType.IMAGE_GIF);
		
		
		return map.get(extendName.toUpperCase());
	}

	public static String makeThumbnamil(String aPath, String newName) throws Exception {
		
		int idx = newName.indexOf("_");
		String thumbnamilName = newName.substring(0,idx)+"_s"+newName.substring(idx);
		
		BufferedImage sourceImg = ImageIO.read(new File(aPath, newName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC,	Scalr.Mode.FIT_EXACT, 100);
		File f = new File(aPath, thumbnamilName);
		
		String extendName = utils.getExtendName(newName).toUpperCase();
		
		ImageIO.write(destImg, extendName, f);
		
		return getPathFileName(aPath, thumbnamilName);
	}

	public static String uploadFile(String oriName, String uploadPath, MultipartFile file) throws Exception {
		  String path = utils.makeDir(uploadPath);
		  String newName= utils.rename(oriName);
		  
		  File target = new File(path, newName);
		  FileCopyUtils.copy(file.getBytes(), target);
		  
		  String extendName = utils.getExtendName(oriName);
		  
	      MediaType mType = utils.getMediaType(extendName);
	      
	      if (mType != null) {
	    	
	    	 return utils.makeThumbnamil(path, newName);
	      }else {
			return utils.getPathFileName(path, newName);
		}
	      
	      
	   }
		
//		String aPath = f3.getAbsolutePath();
//		
//		int idx = aPath.indexOf("uploads") + "uploads".length(); 
//		
//		System.out.println(aPath.substring(idx));
		
	}

