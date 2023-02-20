package com.ezen.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.biz.dto.FavoriteVO;
import com.ezen.biz.dto.OttVO;
import com.ezen.biz.dto.UserVO;
import com.ezen.biz.ott.OttService;

@Controller
@SessionAttributes("ott")
public class OttController {
	
	@Autowired
	private OttService OttService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new LinkedHashMap<>();
		
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	@RequestMapping("getOtt.do")
	public String getBoard(FavoriteVO fav, Model model, HttpServletRequest request) {
		OttVO ott = new OttVO();
		ott.setId(fav.getOtt_id());
		OttVO otts = OttService.getOtt(ott);
		// 응답 화면구성
		int result = OttService.getFav(fav);
		// @SessionAttributes 사용 시, 
		// model 객체에 저장됨과 공시에 session 내장객체에도 저장됨.
		model.addAttribute("fav", fav);
		model.addAttribute("ott", otts);
		model.addAttribute("Fav", result);
		return "getOtt.jsp";
	}
	
	
	@RequestMapping(value="fav.do",method=RequestMethod.POST)
	public @ResponseBody int favorite(@ModelAttribute FavoriteVO favVo) {
		int result = OttService.setFav(favVo);
		return result;
	}
	// 유저 메인 화면
	@RequestMapping(value="/main.do")
	public String getOttList(FavoriteVO fav,Model model) {
		OttVO vo = new OttVO();
		vo.setId(fav.getOtt_id());
		// 게시글을 DB에서 조회
		List<OttVO> ottFavoriteList = OttService.getFavoriteList(fav);
		List<OttVO> ottDramaList = OttService.getOttDramaList(vo);
		List<OttVO> ottActionList = OttService.getOttActionList(vo);
		List<OttVO> ottRomanceList = OttService.getOttRomanceList(vo);
		System.out.println(ottRomanceList);
		// 검색결과를 request 객체에 저장하고 jsp 화면 호출
		model.addAttribute("user_id",fav.getUser_id());
		model.addAttribute("ottFavoriteList",ottFavoriteList);
		model.addAttribute("ottDramaList",ottDramaList);
		model.addAttribute("ottActionList",ottActionList);
		model.addAttribute("ottRomanceList",ottRomanceList);
		
		return "main.jsp";
	}
	
	@RequestMapping(value="/search.do")
	public String getOttList(
			OttVO vo,HttpServletRequest request,	
			Model model) {
		if (vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if (vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		System.out.println(vo);
		
		
		String user_id=request.getParameter("user_id");
		System.out.println("검색 조건: " + vo.getSearchCondition());
		System.out.println("검색 키워드: " + vo.getSearchKeyword());
		
		// 게시글을 DB에서 조회
		List<OttVO> ottList = OttService.getOttList(vo);		
		
		// 검색결과를 request 객체에 저장하고 jsp 화면 호출
    	model.addAttribute("ottList",ottList);
		model.addAttribute("user_id",user_id);
		
		return "search.jsp";
	}

	// 회원등록
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) throws IOException{
		System.out.println("회원 등록 처리");
		OttService.insertUser(vo);
		return "redirect:/login.do";
		
	}
	
	//아이디중복확인
	
	@RequestMapping(value="/id_check_form.do")
	public String idCheckFormView(@RequestParam(value = "user_id", defaultValue = "", required = false) String user_id, Model model)
	{	
		System.out.println("/id_check_form");
		model.addAttribute("user_id", user_id);
		return "idcheck.jsp";
	}
	@RequestMapping(value="/id_check_form.do", method = RequestMethod.POST)
	public String idCheck(HttpServletRequest request, Model model, UserVO user) {
		System.out.println("idcheck");
		String user_id=request.getParameter("user_id");
		UserVO vo=OttService.idCheck(user_id);
	
		if(vo == null) {
			model.addAttribute("check", 0);
		}else {
			model.addAttribute("check", 1);
		}
		model.addAttribute("user_id", user_id);
		return "idcheck.jsp";
	}	
	

	// 로그인 화면 출력
	@RequestMapping(value = "/login.do")
	public String loginView() {
		System.out.println("로그인 화면 출력");
		return "LoginForm.jsp";
	}

	// 로그인
	@RequestMapping(value = "/getUser.do")
	public String login(UserVO vo, HttpSession session) {
		UserVO user = null;
		user = OttService.getUser(vo);
		if (user != null) {
			System.out.println("로그인을 시도합니다.");
			if (user.getRole().equals("admin")) {
				System.out.println("관리자 정보로 로그인 합니다.");
				return "getOttList.do";
			} else if (user.getRole().equals(null)) {
				System.out.println("role이 null입니다.");
				return "login.do";
			} else {
				System.out.println("회원 정보로 로그인 합니다");
				return "redirect:main.do?user_id="+user.getUser_id();
			}
		} else
			return "LoginForm.jsp";

	}

	// 로그아웃

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		// 1. 브라우저와 연결된 세션 객체를 강제 종료한다.
		session.invalidate();
		return "LoginForm.jsp";
	}
	
	// 목록 조회
		@RequestMapping("/getOttList.do")
		public String getOttList(OttVO vo,Model model){
		// 게시글을 DB에서 조회
			List<OttVO> ottList =OttService.ad_getOttList(vo);

			// 검색 결과를 request 내장객체에 저장하고 jsp 화면 호출
			model.addAttribute("ottList", ottList);
			
			return "ad_getOttList.jsp";
		}
		//글 등록 기능
		@RequestMapping("/insertOtt.do")
		public String insertOtt(OttVO vo) throws IOException{
			System.out.println("작품 등록 처리");
			//파일 업로드 처리
			MultipartFile pUploadFile = vo.getpUploadFile();
			MultipartFile iUploadFile = vo.getiUploadFile();
			System.out.println("파일 업로드 처리");
			//메인화면 포스터 insert
			if (!pUploadFile.isEmpty()) {
				String FileName = pUploadFile.getOriginalFilename();
				System.out.println("fileName = "+FileName);
				vo.setPoster(FileName);
				//특정 디렉토리로 이동 and  import java.io.File;
				pUploadFile.transferTo(new File("C:\\Workspace\\SpringWorkspace\\OTT\\src\\main\\webapp\\poster\\"+FileName));
			}else {
				vo.setPoster("noimage.gif");
			}
			//상세 화면 이미지 insert
			if (!iUploadFile.isEmpty()) {
				String FileName = iUploadFile.getOriginalFilename();
				System.out.println("fileName = "+FileName);
				vo.setImage(FileName);
				//특정 디렉토리로 이동 and  import java.io.File;
				iUploadFile.transferTo(new File("C:\\Workspace\\SpringWorkspace\\OTT\\src\\main\\webapp\\images\\"+FileName));
			}else {
				vo.setImage("noimage.gif");
			}
			OttService.insertOtt(vo);
			return "redirect:/getOttList.do";
		}
		
		
		// 게시글 수정
		@RequestMapping("/updateOtt.do")
		public String updateOtt(OttVO vo, HttpServletRequest request) throws IOException{
			MultipartFile pUploadFile = vo.getpUploadFile();
			MultipartFile iUploadFile = vo.getiUploadFile();
			
			//메인화면 포스터 insert
			if (!pUploadFile.isEmpty()) {
				String fileName = pUploadFile.getOriginalFilename();
				System.out.println("fileName = "+fileName);
				vo.setPoster(fileName);
				//특정 디렉토리로 이동 and  import java.io.File;
				pUploadFile.transferTo(new File("C:\\Workspace\\SpringWorkspace\\OTT\\src\\main\\webapp\\poster\\"+fileName));
			} else {
				vo.setPoster(request.getParameter("noposter"));
			} 
			//상세 화면 이미지 insert
			if (!iUploadFile.isEmpty()) {
				String fileName = iUploadFile.getOriginalFilename();
				System.out.println("fileName = "+fileName);
				vo.setImage(fileName);
				//특정 디렉토리로 이동 and  import java.io.File;
				iUploadFile.transferTo(new File("C:\\Workspace\\SpringWorkspace\\OTT\\src\\main\\webapp\\images\\"+fileName));
			} else {
				vo.setImage(request.getParameter("noimage"));
			}
			OttService.updateOtt(vo);
			System.out.println(vo.getTitle() + vo.getPoster() + vo.getImage());
			return "redirect:getOttList.do";
			
		}
		
		// 게시글 상세조회
		@RequestMapping("/ad_getOtt.do")
		public String getOtt(OttVO vo, Model model) {
			OttVO ott = OttService.getOtt(vo);
			model.addAttribute("ott",ott);
			return "ad_getOtt.jsp";
		}
		
		
		// 게시글 삭제
		@RequestMapping("/deleteOtt.do")
		public String deleteOtt(OttVO vo) {
			OttService.deleteOtt(vo);
			return "redirect:getOttList.do";
		}
		
		
	
}






