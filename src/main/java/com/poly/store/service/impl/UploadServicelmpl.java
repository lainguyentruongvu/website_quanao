package com.poly.store.service.impl;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.AccountService;
import com.poly.service.UploadService;

@Service
public class UploadServicelmpl implements UploadService {
	@Autowired
	ServletContext app;

	@Override
	public File save(MultipartFile file, String folder) {
		File dir = new File(app.getRealPath("/img/" + folder));
		if (!dir.exists()) {
			dir.mkdir();
		}
		String s = System.currentTimeMillis() + file.getOriginalFilename();
		String name = Integer.toHexString(s.hashCode()) + s.substring(s.lastIndexOf("."));
		try {
			File savedFile = new File(dir, name);
			file.transferTo(savedFile);
			System.out.print(savedFile.getAbsolutePath());
			return savedFile;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

}
