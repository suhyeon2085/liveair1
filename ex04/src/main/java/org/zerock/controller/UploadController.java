package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm()
	{
		log.info("upload form");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model)
	{
		String uploadFolder = "D:\\01-STUDY\\suhyeon\\upload";
		
		for (MultipartFile m : uploadFile) 
		{
			log.info("==============================================");
			log.info("upload file name : " + m.getOriginalFilename());
			log.info("upload file size : " + m.getSize()); 
			
			File saveFile = new File(uploadFolder, m.getOriginalFilename());
			
			try {
				m.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax()
	{
		log.info("upload Ajax");
	}
	
	/*
	 * @PostMapping("/uploadAjaxAction") public void
	 * uploadAjaxAction(MultipartFile[] uploadFile) {
	 * log.info("update ajax post......................."); String uploadFolder =
	 * "D:\\01-STUDY\\suhyeon\\upload";
	 * 
	 * File uploadPath = new File(uploadFolder, getFolder()); log.info(uploadPath);
	 * 
	 * if (uploadPath.exists() == false) { uploadPath.mkdirs(); }
	 * 
	 * for (MultipartFile m : uploadFile) {
	 * log.info("----------------------------------");
	 * log.info("upload file name : " + m.getOriginalFilename());
	 * log.info("upload file size : " + m.getSize());
	 * 
	 * String uploadFileName = m.getOriginalFilename();
	 * 
	 * UUID uuid = UUID.randomUUID();
	 * 
	 * uploadFileName = uuid + "_" + uploadFileName;
	 * 
	 * File saveFile = new File(uploadPath, uploadFileName);
	 * 
	 * try { m.transferTo(saveFile);
	 * 
	 * if (checkImageType(saveFile)) { FileOutputStream thumbnail = new
	 * FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
	 * Thumbnailator.createThumbnail(m.getInputStream(), thumbnail, 100, 100);
	 * thumbnail.close(); } } catch (Exception e) { log.error(e.getMessage()); } } }
	 */
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile)
	{
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "D:\\01-STUDY\\suhyeon\\upload";
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if (uploadPath.exists() == false)
		{
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile)
		{
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				if (checkImageType(saveFile))
				{
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
					log.info(attachDTO.getFileName());
				}
				list.add(attachDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName)
	{
		log.info("저거 : " + fileName);
		
		File file = new File("D:\\01-STUDY\\suhyeon\\upload\\" + fileName);
		
		log.info("이거 : " +file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName)
	{
		Resource resource = new FileSystemResource("D:\\01-STUDY\\suhyeon\\upload\\" + fileName);
		
		if (resource.exists() == false)
		{
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders header = new HttpHeaders();
		
		try {
			String downloadName = null;
			
			if (userAgent.contains("Trident"))
			{
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\", " ");
			} else if (userAgent.contains("Edge")) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			header.add("Content-Disposition", "attachment; fileName=" + downloadName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
}
