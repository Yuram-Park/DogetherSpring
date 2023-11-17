package com.yooram.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.yooram.domain.FileDto;
import com.yooram.domain.PostDto;

@Component("fileUtils")
public class FileUtils {
	public List<FileDto> insertFileInfo(PostDto postDto, MultipartFile[] postFiles) throws Exception{
		
		List<FileDto> postFileDtoList = new ArrayList<>();
		
		if(postFiles !=null) {
			for(MultipartFile postFile : postFiles) {
				
				// 이미지가 존재하지 않을 때
				if(postFile.isEmpty()) {
					continue;
				}
				
				// 이미지 저장 경로
				String rootFolder = "C:/uploadFiles/";
				
				// 날짜별 폴더 생성
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String today = sdf.format(new Date());
				File targetFolder = new File(rootFolder + today);
				
				if(!targetFolder.exists())
					targetFolder.mkdirs();
				
				// 저장 파일명 만들기(중복방지)
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + System.currentTimeMillis();
				String originalFileName = postFile.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				String saveFileName = rootFolder + today + "/" + fileName + ext;
				
				try {
					postFile.transferTo(new File(saveFileName));
				} catch (Exception e) {
					System.out.println("insertFileInfo: " + e);
				}
				
				saveFileName = today + "/" + fileName + ext;
				FileDto fileDto = new FileDto();
				fileDto.setFile_oriname(originalFileName);
				fileDto.setFile_link(saveFileName);
				
				postFileDtoList.add(fileDto);
			}
		}
		
		
		
		
		return null;
		
	}
}
