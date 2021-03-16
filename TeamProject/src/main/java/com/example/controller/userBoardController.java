package com.example.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.JAttachVo;
import com.example.domain.JNoticeVo;
import com.example.domain.JQuestionVo;
import com.example.domain.MemberVo;
import com.example.domain.OneNoticeVo;
import com.example.domain.PageDto;
import com.example.service.JNoticeService;
import com.example.service.JQuestionService;
import com.example.service.MemberService;
import com.example.service.MySqlService;
import com.example.service.OneNoticeService;

import lombok.extern.java.Log;
import net.coobird.thumbnailator.Thumbnailator;

@Log
@Controller
@RequestMapping("/userBoard/*")
public class userBoardController {

   @Autowired
   private JNoticeService jnoticeService;
   @Autowired
   private JQuestionService jquestionService;
   @Autowired
   private MySqlService mySqlService;
   @Autowired
   private MemberService memberService;
   @Autowired
   private OneNoticeService oneNoticeService;
   
   // 공지사항 화면
   @GetMapping("/jnotice")
   public String jnotice(
         @RequestParam(defaultValue = "1") int pageNum,
         @RequestParam(defaultValue = "") String category,
         @RequestParam(defaultValue = "") String search,
         Model model) {
      
      //int count = jnoticeService.getCountAll();
      int count = jnoticeService.getCountBySearch(category, search);
      
      // 공지사항에 노출되는 게시물 10개로 제한
      int pageSize = 10;
      
      int startRow = (pageNum - 1) * pageSize;      
      
      List<JNoticeVo> jnoticeList = null;
      if (count > 0) {
         //noticeList = noticeService.getNotices(startRow, pageSize);
         jnoticeList = jnoticeService.getJNoticesBySearch(startRow, pageSize, category, search);
      }
      
      
      PageDto pageDto = new PageDto();
      
      if (count > 0) {
         int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
         //int pageCount = (int) Math.ceil((double) count / pageSize);
         
         int pageBlock = 5;
         
         // 1~5          6~10          11~15          16~20       ...
         // 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
         int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
         
         int endPage = startPage + pageBlock - 1;
         if (endPage > pageCount) {
            endPage = pageCount;
         }
         
         pageDto.setCategory(category);
         pageDto.setSearch(search);
         pageDto.setCount(count);
         pageDto.setPageCount(pageCount);
         pageDto.setPageBlock(pageBlock);
         pageDto.setStartPage(startPage);
         pageDto.setEndPage(endPage);
      } // if
      
      
      model.addAttribute("jnoticeList", jnoticeList);
      System.out.println("jnoticeList :" + jnoticeList);
      model.addAttribute("pageDto", pageDto);
      model.addAttribute("pageNum", pageNum);
      System.out.println("pageNum :" + pageNum);
      
      return "userBoard/jnotice";
   }
   
   // 공지사항 작성
   @GetMapping("/jnoticeWrite")
   public String jnoticeWrite(@ModelAttribute("pageNum") String pageNum, JNoticeVo jnoticeVo,HttpSession session, Model model) {
      System.out.println("jnoticeVo :" + jnoticeVo);
      return "userBoard/jnoticeWrite";
   }
   
   @PostMapping("/jnoticeWrite")
   public String jnoticeWrite(String pageNum, JNoticeVo jnoticeVo, HttpSession sesstion, HttpServletRequest request) {
      log.info("jnoticeWrite() 호출됨");
      jnoticeVo.setRegDate(new Timestamp(System.currentTimeMillis()));
      jnoticeVo.setReadcount(0);
      
      
      int num = jnoticeService.getNextNum("jnotice");
      jnoticeVo.setReRef(num);
      System.out.println("num :" +num);
      System.out.println("jnoticeVo :" + jnoticeVo);
      jnoticeVo.setReLev(0);
      jnoticeVo.setReSeq(0);
      
      // 공지 글쓰기.
      jnoticeService.addJNotice(jnoticeVo);
      
      return "redirect:/userBoard/jcontent?num=" + num + "&pageNum=" + pageNum;
   }

   // 공지사항 상세화면
   @GetMapping("/jcontent")
   public String jcontent(int num, Model model,
         @RequestParam(defaultValue = "1") int pageNum,
         @RequestParam(defaultValue = "") String category,
         @RequestParam(defaultValue = "") String search) {
      log.info("/jcontent() 호출됨");
      jnoticeService.updateReadcount(num);
      
      JNoticeVo jnoticeVo = jnoticeService.getJNoticeByNum(num);
      
      String content = "";
      if (jnoticeVo.getContent() != null) {
         content = jnoticeVo.getContent().replace("\n", "<br>");
         jnoticeVo.setContent(content);
      }
      
      int count = jnoticeService.getCountBySearch(category, search);
      
      // 공지사항에 노출되는 게시물 10개로 제한
      int pageSize = 10;
      
      int startRow = (pageNum - 1) * pageSize;      
      
         PageDto pageDto = new PageDto();
      
      if (count > 0) {
         int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
         //int pageCount = (int) Math.ceil((double) count / pageSize);
         
         int pageBlock = 5;
         
         // 1~5          6~10          11~15          16~20       ...
         // 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
         int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
         
         int endPage = startPage + pageBlock - 1;
         if (endPage > pageCount) {
            endPage = pageCount;
         }
         
         pageDto.setCategory(category);
         pageDto.setSearch(search);
         pageDto.setCount(count);
         pageDto.setPageCount(pageCount);
         pageDto.setPageBlock(pageBlock);
         pageDto.setStartPage(startPage);
         pageDto.setEndPage(endPage);
      } // if
      
      model.addAttribute("jnoticeVo", jnoticeVo);
      model.addAttribute("pageNum", pageNum);
      
      return "userBoard/jcontent";
   }
   
   // 공지 삭제
   @GetMapping("/delete")
   public String delete(int num, String pageNum, RedirectAttributes rttr) {
      // 글번호에 해당하는 글 한개 삭제하기
      jnoticeService.deleteJNoticeByNum(num);
      
      // 글목록 페이지로 리다이렉트 이동시키기
      rttr.addAttribute("pageNum", pageNum);
      
      return "redirect:/userBoard/jnotice";
      //return "redirect:/notice/list?pageNum=" + pageNum;
   } // delete
   
   @GetMapping("/jnoticeModifyForm")
   public String jnoticeModifyForm(int num, @ModelAttribute("pageNum") String pageNum, Model model) {
      
      JNoticeVo jnoticeVo = jnoticeService.getJNoticeByNum(num);
      
      model.addAttribute("jnoticeVo", jnoticeVo);
      
      return "userBoard/jnoticeModifyForm";
   }
   
   @PostMapping("/jnoticeModifyForm")
   public String jnoticeModifyForm(JNoticeVo jnoticeVo, String pageNum, RedirectAttributes rttr) {
      
      jnoticeService.updateBoard(jnoticeVo);
      
      rttr.addAttribute("num", jnoticeVo.getNum());
      rttr.addAttribute("pageNum", pageNum);
      
      return "redirect:/userBoard/jcontent";
   }
   // 자주하는 질문 화면
   @GetMapping("/jservice")
   public String jservice(@RequestParam(defaultValue = "1") int pageNum,
                     @RequestParam(defaultValue = "") String category,
                      @RequestParam(defaultValue = "") String search,
                     Model model) {
      log.info("jservice() 호출됨");
      
      int count = jquestionService.getCountBySearch(category, search);
      
      int pageSize = 10;
      
      int startRow = (pageNum -1) * pageSize;
      
      List<JQuestionVo> jquestionList = null;
      
      if (count > 0) {
         jquestionList = jquestionService.getJQuestionBySearch(startRow, pageSize, category, search);
      }
      
      PageDto pageDto = new PageDto();
      
      if (count > 0) {
         int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
         //int pageCount = (int) Math.ceil((double) count / pageSize);
         
         int pageBlock = 5;
         
         // 1~5          6~10          11~15          16~20       ...
         // 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
         int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
         
         int endPage = startPage + pageBlock - 1;
         if (endPage > pageCount) {
            endPage = pageCount;
         }
         
         pageDto.setCategory(category);
         pageDto.setSearch(search);
         pageDto.setCount(count);
         pageDto.setPageCount(pageCount);
         pageDto.setPageBlock(pageBlock);
         pageDto.setStartPage(startPage);
         pageDto.setEndPage(endPage);
      }
      
      // 자주하는 질문 content 줄바꿈
//      JQuestionVo jquestionVo = jquestionService.getJQuestionByNum(num);
//      
//      String content = "";
//      if (jquestionVo.getContent() != null) {
//         content = jquestionVo.getContent().replace("\n", "<br>");
//         jquestionVo.setContent(content);
//      }
//      
//      model.addAttribute("jquestionVo", jquestionVo);
      model.addAttribute("jquestionList", jquestionList);
      model.addAttribute("pageDto", pageDto);
      model.addAttribute("pageNum", pageNum);
      return "userBoard/jservice";
   }
   
   // 자주하는 질문 작성화면
   @GetMapping("/jserviceWriteForm")
   public String jserviceWriteForm(@ModelAttribute("pageNum") String pageNum, HttpSession session, Model model) {
      
         
      return "userBoard/jserviceWriteForm";
   }
   
   @PostMapping("/jserviceWriteForm")
   public String jserviceWriteForm(String pageNum, JQuestionVo jquestionVo, Model model, HttpSession sesstion, HttpServletRequest request) {
      log.info("/jserviceWriteForm() 호출됨");
      
      // 자주하는 질문 글쓰기.
      jquestionService.addJQuestion(jquestionVo);
      
      int num = mySqlService.getNextNum("jquestion");
      jquestionVo.setNum(num);
      
      
      return "redirect:/userBoard/jservice?num=" + num + "&pageNum=" + pageNum;
   }
   
   // 자주하는 질문 수정
   @GetMapping("/jserviceModifyForm")
   public String jserviceModifyForm(int num, @ModelAttribute("pageNum") String pageNum, Model model) {
      
      JQuestionVo jquestionVo = jquestionService.getJQuestionByNum(num);
      
      model.addAttribute("jquestionVo", jquestionVo);
      
      return "userBoard/jserviceModifyForm";
   }
   
   @PostMapping("/jserviceModifyForm")
   public String jserviceModifyForm(JQuestionVo jquestionVo, String pageNum, RedirectAttributes rttr) {
//      jnoticeService.updateBoard(jquestionVo);
      
      
      rttr.addAttribute("num", jquestionVo.getNum());
      rttr.addAttribute("pageNum", pageNum);
      
      return "redirect:/userBoard/jsevice";
   }
   
   // 자주하는 질문 삭제
   @GetMapping("/jserviceDelete")
   public String jserviceDelete(int num, String pageNum, RedirectAttributes rttr) {
      // 글번호에 해당하는 글 한개 삭제하기
      jquestionService.deleteJNoticeByNum(num);
      
      // 글목록 페이지로 리다이렉트 이동시키기
      rttr.addAttribute("pageNum", pageNum);
      
      return "redirect:/userBoard/jservice";
      //return "redirect:/notice/list?pageNum=" + pageNum;
   } // delete
   
   
   // 1:1 질문 list
   @GetMapping("/OneByOne")
   public String OneByOne(
      @RequestParam(defaultValue = "1") int pageNum,
      @RequestParam(defaultValue = "") String category,
      @RequestParam(defaultValue = "") String search,
      HttpSession session, Model model) {
      int count = oneNoticeService.getCountBySearch(category, search);
      
      int pageSize = 10;
      
      int startRow = (pageNum - 1) * pageSize;      
      
      List<OneNoticeVo> oneNoticeList = null;
      if (count > 0) {
         //noticeList = noticeService.getNotices(startRow, pageSize);
         oneNoticeList = oneNoticeService.getOneNoticesBySearch(startRow, pageSize, category, search);
      }
      
      
      PageDto pageDto = new PageDto();
      
      if (count > 0) {
         int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
         //int pageCount = (int) Math.ceil((double) count / pageSize);
         
         int pageBlock = 5;
         
         // 1~5          6~10          11~15          16~20       ...
         // 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
         int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
         
         int endPage = startPage + pageBlock - 1;
         if (endPage > pageCount) {
            endPage = pageCount;
         }
         
         pageDto.setCategory(category);
         pageDto.setSearch(search);
         pageDto.setCount(count);
         pageDto.setPageCount(pageCount);
         pageDto.setPageBlock(pageBlock);
         pageDto.setStartPage(startPage);
         pageDto.setEndPage(endPage);
      } // if
      
      
      model.addAttribute("oneNoticeList", oneNoticeList);
      model.addAttribute("pageDto", pageDto);
      model.addAttribute("pageNum", pageNum);
      
      
      return "userBoard/OneByOne";
   }
   
   @GetMapping("/OneByOneWriteForm")
   public String OneByOneWriteForm (@ModelAttribute("pageNum") String pageNum,OneNoticeVo oneNoticeVo, HttpSession sesstion, Model model) {
      
      String id = (String) sesstion.getAttribute("id");
      
      MemberVo memberVo = memberService.getJQuestionById(id);
      
      model.addAttribute("memberVo", memberVo);
      log.info("id =" +id);
      return "userBoard/OneByOneWriteForm";
   }
   
   // 오늘 날짜 형식의 폴더 문자열 가져오기 
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
      
      if (ext.equalsIgnoreCase("jpg") 
            || ext.equalsIgnoreCase("jpeg")
            || ext.equalsIgnoreCase("gif")
            || ext.equalsIgnoreCase("png")) {
         result = true;
      }
      return result;
   }
   
   
   // 1:1 질문 쓰기
   @PostMapping("/OneByOneWriteForm")
   public String OneByOneWriteForm(String pageNum, HttpSession sesstion,OneNoticeVo oneNoticeVo, HttpServletRequest request, Model model
         , @RequestParam(name = "filename", required = false) List<MultipartFile> multipartFiles) throws IOException {
      
//      oneNoticeService.addOneNotice(oneNoticeVo);
      
      //== 1:1질문 게시글 준비
      int num = mySqlService.getNextNum("oneNotice");
      oneNoticeVo.setNum(num);
      log.info("num =" +num);
      
      oneNoticeVo.setRegDate(new Timestamp(System.currentTimeMillis()));
      //== 1:1질문 게시글 준비
      
      //============ 파일 업로드를 위한 폴더 준비 ==============
      ServletContext application = request.getServletContext();
      String realPath = application.getRealPath("/");  // webapp 폴더의 실제경로
      log.info("realPath : " + realPath);
      
      String strDate = this.getFolder();
      
      File dir = new File(realPath + "/upload", strDate);
      log.info("dir : " + dir.getPath());

      if (!dir.exists()) {
         dir.mkdirs();
      }
      
      // JAttachVo 첨부파일 정보 담을 리스트 준비
      List<JAttachVo> jattachList = new ArrayList<>();
      
      if (multipartFiles != null) {
         for (MultipartFile multipartFile : multipartFiles) {
            // 파일입력상자에서 선택하지않은 요소는 건너뛰기
            if (multipartFile.isEmpty()) {
               continue;
            }
            
            // 실제 업로드한 파일이름 구하기
            String filename = multipartFile.getOriginalFilename();
            
            // 익스플로러는 파일이름에 경로가 포함되어 있으므로
            // 순수 파일이름만 부분문자열로 가져오기
            int beginIndex = filename.lastIndexOf("\\") + 1;
            filename = filename.substring(beginIndex);
            
            // 파일명 중복을 피하기 위해서 파일이름 앞에 붙일 UUID 문자열 구하기
            UUID uuid = UUID.randomUUID();
            String strUuid = uuid.toString();
            
            // 업로드(생성)할 파일이름
            String uploadFilename = strUuid + "_" + filename;
            
            // 생성할 파일정보를 File 객체로 준비
            File saveFile = new File(dir, uploadFilename);
            
            // 임시업로드된 파일을 지정경로의 파일명으로 생성(복사)
            multipartFile.transferTo(saveFile);
            
            
            //============ 첨부파일 AttachVo 준비하기 ==============
            JAttachVo jattachVo = new JAttachVo();
            // 게시판 글번호 설정
            jattachVo.setNoNum(oneNoticeVo.getNum());
            
            jattachVo.setUuid(strUuid);
            jattachVo.setFilename(filename);
            jattachVo.setUploadpath(strDate);
            
            if (isImage(filename)) {
               jattachVo.setImage("I");
               
               // 생성할 썸네일 이미지 파일 경로와 이름을 준비
               File thumbnailFile = new File(dir, "s_" + uploadFilename);
               
               // 썸네일 이미지 파일 생성하기
               try (FileOutputStream fos = new FileOutputStream(thumbnailFile)) {
                  Thumbnailator.createThumbnail(multipartFile.getInputStream(), fos, 100, 100);
               }
            } else {
               jattachVo.setImage("O");
            }
            
            // AttachVo 를 DB에 insert하기
            //attachService.insertAttach(attachVo);
            
            jattachList.add(jattachVo);
         } // for
      } // if
      
      oneNoticeService.addOneNoticeAndJAttaches(oneNoticeVo, jattachList);
      
      return "redirect:/userBoard/OneByOne";
   }
   
   @GetMapping("/OneByOneContent")
   public String OneByOneContent(int num, @ModelAttribute("pageNum") String pageNum, Model model) {
         
      OneNoticeVo oneNoticeVo = oneNoticeService.getOneNoticeAndJAttaches(num);
      
      String content = "";
      if (oneNoticeVo.getContent() != null) {
         content = oneNoticeVo.getContent().replace("\n", "<br>");
         oneNoticeVo.setContent(content);
      }
      
      model.addAttribute("oneNoticeVo", oneNoticeVo);
      model.addAttribute("jattachList", oneNoticeVo.getJattachList());
      
      return "userBoard/OneByOneContent";
   } // OneByOneContent
   
//   // 대량주문
//   @GetMapping("/BigOrder")
//   public String BigOrder(@ModelAttribute("pageNum") String pageNum, HttpSession session, Model model) {
//      return "userBoard/BigOrder";
//   }
   // 상품제안
//   @GetMapping("/ProductProposal")
//   public String ProductProposal(@ModelAttribute("pageNum") String pageNum, HttpSession session, Model model) {
//      return "userBoard/ProductProposal";
//   }
//   
//   
//   @GetMapping("/ProductProposalWriteForm")
//   public String ProductProposalWriteForm (@ModelAttribute("pageNum") String pageNum, HttpSession session, Model model) {
//      return "userBoard/ProductProposalWriteForm";
//   }
//   
//   @PostMapping("/ProductProposalWriteForm")
//   public String ProductProposalWriteForm(String pageNum, JQuestionVo jquestionVo, HttpSession sesstion, HttpServletRequest request) {
//      log.info("/ProductProposalWriteForm() 호출됨");
//      
//      
//      return "userBoard/ProductProposalWriteForm";
//   }
   
   
   
}