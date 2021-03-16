package com.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.AttachVo;
import com.example.domain.GoodsVo;
import com.example.service.AttachService;
import com.example.service.GoodsService;
import com.google.gson.JsonObject;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/goods/*")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;

	@Autowired
	private AttachService attachService;

	@GetMapping("/newGoods")
	public String newGoods(Model model, String newGoods) {

		List<AttachVo> attachVos = goodsService.getNewGoods();

		model.addAttribute("attachVos", attachVos);
		model.addAttribute("newGoods", newGoods);

		return "goods/best/product";
	}

	@GetMapping("/bestGoods")
	public String getBestGoods(Model model, String newGoods) {

		List<AttachVo> attachVos = goodsService.getBestGoods();
		log.info("newGoods = " + newGoods);
		model.addAttribute("attachVos", attachVos);
		model.addAttribute("newGoods", newGoods);

		return "goods/best/product";
	}

	@GetMapping("/getRowPriceGoods")
	public String getRowPriceGoods(Model model, String newGoods) {

		List<AttachVo> attachVos = goodsService.getRowPriceGoods();

		model.addAttribute("attachVos", attachVos);
		model.addAttribute("newGoods", newGoods);

		return "goods/best/product";
	}

	@GetMapping("/getDiscountPriceGoods")
	public String getDiscountPriceGoods(Model model, String newGoods) {
		log.info("getDiscountPriceGoods 요청 ");
		List<AttachVo> attachVos = goodsService.getDiscountPriceGoods();
		log.info("attachVos = " + attachVos);
		model.addAttribute("attachVos", attachVos);
		model.addAttribute("newGoods", newGoods);

		return "goods/best/product";
	}

	@GetMapping("/goodsMainCategory")
	public String getMainCategory(Model model, String mainCategory) {
		log.info("mainCategory = " + mainCategory);
		List<AttachVo> attachVos = goodsService.getMainCategory(mainCategory);

		GoodsVo goodsVo = new GoodsVo();
		goodsVo.setMainCategory(mainCategory);

		model.addAttribute("attachVos", attachVos);
		model.addAttribute("goodsVo", goodsVo);

		return "goods/best/product";
	}

	@GetMapping("/goodsSubCategory")
	public String getSubCategory(Model model, String mainCategory, String subCategory) {
		log.info("mainCategory = " + mainCategory);
		log.info("subCategory = " + subCategory);
		List<AttachVo> attachVos = goodsService.getSubCategory(mainCategory, subCategory);

		GoodsVo goodsVo = new GoodsVo();
		goodsVo.setMainCategory(mainCategory);
		goodsVo.setSubCategory(" > " + subCategory);

		model.addAttribute("attachVos", attachVos);
		model.addAttribute("goodsVo", goodsVo);

		return "goods/best/product";
	}

	@GetMapping("/productDetail")
	public String productDetail(String goodsName, Model model) {

		GoodsVo goodsVo = goodsService.getJollygoodsAndAttaches(goodsName);

//		log.info("attachList : " + goodsVo.getAttachList().toString());

		model.addAttribute("goodsVo", goodsVo);
		model.addAttribute("attachList", goodsVo.getAttachList());

		return "goods/productDetail";
	}

	@GetMapping("/writer")
	public void goodsWriter() {
		log.info("GET - writer() 호출됨");
	}

	private String getFolder() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String strDate = sdf.format(date); // "2020/11/11"
		return strDate;
	}

	private boolean isImage(String filename) {
		boolean result = false;

		// aaaa.bbb.ccc.ddd
		int index = filename.lastIndexOf(".");
		String ext = filename.substring(index + 1);

		if (ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("gif")
				|| ext.equalsIgnoreCase("png")) {
			result = true;
		}
		return result;
	}

	// 주글쓰기
	@PostMapping("/writer")
	public String productWrite(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(name = "filename1", required = false) List<MultipartFile> multipartFiles, GoodsVo goodsVo)
			throws IOException {

		log.info("test discountRate = " + goodsVo.getDiscountRate());

		goodsVo.setUpload(new Timestamp(System.currentTimeMillis()));

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/"); // webapp 폴더의 실제경로
		log.info("realPath : " + realPath);

		log.info("fileUrl : " + goodsVo.getFileUrl());

		String strDate = this.getFolder();

		File dir = new File(realPath + "/upload", strDate);
		log.info("dir : " + dir.getPath());

		if (!dir.exists()) { // 디렉토리가 존재하지 않으면
			dir.mkdirs(); // 생성
		}

		List<AttachVo> attachList = new ArrayList<>();

		if (multipartFiles != null) {
			for (MultipartFile multipartFile : multipartFiles) {
				if (multipartFile.isEmpty()) {
					continue;
				}

				String filename = multipartFile.getOriginalFilename();
				log.info("filename1 : " + filename); // DDD.jpg
				int beginIndex = filename.lastIndexOf("\\") + 1;
				filename = filename.substring(beginIndex);

				UUID uuid = UUID.randomUUID();
				String strUuid = uuid.toString();

				String uploadFilename = strUuid + "_" + filename;

				File saveFile = new File(dir, uploadFilename);

				multipartFile.transferTo(saveFile);

				AttachVo attachVo = new AttachVo();

				attachVo.setUuid(strUuid);
				attachVo.setFilename1(filename);
				attachVo.setUploadpath(strDate);
				attachVo.setAttachName(goodsVo.getGoodsName());
				attachVo.setMain("O");

				if (isImage(filename)) {
					attachVo.setImage("I");

				} else {
					attachVo.setImage("O");
				}
				attachList.add(attachVo);

			}
		}

//	      log.info("productVo.getGoods_name() = " + productVo.getGoods_name());

		goodsService.addGoodsAndAttaches(goodsVo, attachList);

		// url 한글처리
		String goodsNameKor = URLEncoder.encode(goodsVo.getGoodsName(), "UTF-8");

		return "redirect:/goods/productDetail?goodsName=" + goodsNameKor;

	}

	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, AttachVo attachVo, String goodsName) throws Exception {

		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/"); // webapp 폴더의 실제경로
		log.info("realPath : " + realPath);
		log.info("goodsName: " + goodsName);

		String strDate = this.getFolder();

		File dir = new File(realPath + "/upload", strDate);
		log.info("dir : " + dir.getPath());

		if (!dir.exists()) { // 디렉토리가 존재하지 않으면
			dir.mkdirs(); // 생성
		}

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) { // getSize가 0보다 큰지, getName이 공백인지 검사
				if (file.getContentType().toLowerCase().startsWith("image/")) { // file.getContentType()을 소문자로 바꿔주고 시작하는
																				// 타입이 image/인지 검사

					try {
						String realName = file.getOriginalFilename();

						int beginIndex = realName.lastIndexOf("\\") + 1;
						realName = realName.substring(beginIndex);

						String fileName = file.getName();

						UUID uuid = UUID.randomUUID();
						String strUuid = uuid.toString();

						String uploadFilename = strUuid + "_" + realName;

						String realSaveFile = dir + "\\" + uploadFilename;

						String fileUrl = "/upload/" + strDate + "\\" + uploadFilename;
						log.info("fileUrl " + fileUrl);

						File saveFile = new File(realSaveFile);

						byte[] bytes = file.getBytes();

						out = new FileOutputStream(saveFile);
						out.write(bytes);

						printWriter = response.getWriter();
						response.setContentType("text/html");
						log.info("request.getContextPath() = " + request.getContextPath());

						// 한글파일명이 들어오면 DB 업로드 하지 않음
						if (fileUrl.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {

							log.info("디비 insert 안됨 XXX");

						} else {
//								log.info("goodsVo.getGoodsName() == " + goodsVo.getGoodsName());
							attachVo.setUuid(strUuid);
							attachVo.setFilename1(realName);
							attachVo.setUploadpath(strDate);
							attachVo.setAttachName(goodsName);
							attachVo.setMain("X");
							if (isImage(realName)) {
								attachVo.setImage("I");

							} else {
								attachVo.setImage("O");
							}

							goodsService.ckUpload(attachVo);
							log.info("디비 insert 됨 OOO");
						}

						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);

						printWriter.println(json);

					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}

		return null;
	}

	// 상품 삭제하기
	@GetMapping("/goodsDelete")
	public String delete(String goodsName, String attachName, String newGoods, HttpServletRequest request) {
		// 게시글번호에 첨부된 첨부파일 리스트 가져오기
		List<AttachVo> attachList = attachService.getAttachesByName(goodsName);
		log.info("attachName  == " + goodsName);
		log.info("attachList  == " + attachList);

//		// application 객체 참조 가져오기
		ServletContext application = request.getServletContext();
//		// 업로드 기준경로
		String realPath = application.getRealPath("/"); // webapp
		log.info("realPath  == " + realPath);
//		// 첨부파일 삭제하기
		for (AttachVo attachVo : attachList) {
			String dir = realPath + "/upload/" + attachVo.getUploadpath();
			String filename = attachVo.getUuid() + "_" + attachVo.getFilename1();

			File file = new File(dir, filename);

			if (file.exists()) {
				file.delete();
			}
		}

//		// notice 게시글 한개와 attach 첨부파일 여러개를 트랜잭션으로 삭제하기
		goodsService.deleteGoodsAndAttaches(goodsName);

		// 글목록으로 리다이렉트 이동
		return "redirect:/goods/newGoods?newGoods=" + newGoods;
	} // delete

	@GetMapping("/goodsModify")
	public String modify(String goodsName, Model model) {

		GoodsVo goodsVo = goodsService.getJollygoodsAndAttaches(goodsName);
		List<AttachVo> attachList = goodsVo.getAttachList();
		int fileCount = attachList.size();

		log.info("goodsVo  == " + goodsVo);

		model.addAttribute("goodsVo", goodsVo);
		model.addAttribute("attachList", attachList);
		model.addAttribute("fileCount", fileCount);

		return "goods/ModifyForm";
	} // GET - modify

	@PostMapping("/goodsModify")
	public String modify(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(name = "filename1", required = false) List<MultipartFile> multipartFiles, GoodsVo goodsVo)
			throws IOException {

		AttachVo attachVo = new AttachVo();
		log.info("POST - goodsModify() 호출됨");
		log.info("goodsVo" + goodsVo);
		log.info("attachVo.getAttachName() = " + attachVo.getAttachName());
		log.info("attachVo.getMain() = " + attachVo.getMain());

		goodsVo.setUpload(new Timestamp(System.currentTimeMillis()));

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/"); // webapp 폴더의 실제경로
		log.info("realPath : " + realPath);

		String strDate = this.getFolder();

		File dir = new File(realPath + "/upload", strDate);
		log.info("dir : " + dir.getPath());

		if (!dir.exists()) { // 디렉토리가 존재하지 않으면
			dir.mkdirs(); // 생성
		}

		List<AttachVo> attachList = new ArrayList<>();

		if (multipartFiles != null) {
			for (MultipartFile multipartFile : multipartFiles) {
				if (multipartFile.isEmpty()) {
					continue;
				}

				String filename = multipartFile.getOriginalFilename();
				log.info("filename1 : " + filename); // DDD.jpg
				int beginIndex = filename.lastIndexOf("\\") + 1;
				filename = filename.substring(beginIndex);

				UUID uuid = UUID.randomUUID();
				String strUuid = uuid.toString();

				String uploadFilename = strUuid + "_" + filename;

				File saveFile = new File(dir, uploadFilename);

				multipartFile.transferTo(saveFile);

				attachVo = new AttachVo();

				attachVo.setUuid(strUuid);
				attachVo.setFilename1(filename);
				attachVo.setUploadpath(strDate);
				attachVo.setAttachName(goodsVo.getGoodsName());
				attachVo.setMain("O");

				if (isImage(filename)) {
					attachVo.setImage("I");

				} else {
					attachVo.setImage("O");
				}
				attachList.add(attachVo);

			}
		}
		log.info("attachList = " + attachList);

		int result = goodsService.updateGoodsAndAddAttachesAndDeleteAttaches(goodsVo, attachList);
		log.info("result : " + result);

		if (result == 1) {
			log.info("result 1이니까 db 삭제");
			int num = attachService.getFileNum(goodsVo.getGoodsName(), "O");
			log.info("num = " + num);
			attachService.deleteAttachbyNum(num);
		}

		// url 한글처리
		String goodsNameKor = URLEncoder.encode(goodsVo.getGoodsName(), "UTF-8");

		return "redirect:/goods/productDetail?goodsName=" + goodsNameKor;

	}

	@GetMapping("/goodsSerch")
	public String goodsSerch(Model model, String serchGoods, String newGoods) {

		log.info("serchGoods = " + serchGoods);
		log.info("newGoods = " + newGoods);

		List<AttachVo> attachVos = goodsService.getGoodsSerch(serchGoods);

		model.addAttribute("attachVos", attachVos);
		model.addAttribute("serchGoods", serchGoods);
		model.addAttribute("newGoods", newGoods);

		return "goods/best/product";
	}

}
