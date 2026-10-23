package com.kosta.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.board.dto.Article;
import com.kosta.board.dto.Member;
import com.kosta.board.service.ArticleService;
import com.kosta.board.util.PageInfo;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	HttpSession session;

	@GetMapping("/article/write")
	public String writeArticle(HttpSession session) {

		Member user = (Member) session.getAttribute("user");

		if (user == null) {
			return "redirect:/member/login";
		}

		return "article/writeform";
	}

	@PostMapping("/article/write")
	public String writeArticle(Article article, @RequestParam(name = "ifile", required = false) MultipartFile ifile,
			@RequestParam(name = "dfile", required = false) MultipartFile dfile, HttpSession session, Model model) {

		try {
			// 현재 로그인한 회원 가져오기
			Member user = (Member) session.getAttribute("user");

			// 로그인 여부 확인
			if (user == null) {
				System.out.println("로그인 정보 없음");
				return "redirect:/member/login";
			}

			// 작성자 ID 설정
			article.setWriter(user.getId());

			System.out.println("작성자: " + article.getWriter());
			System.out.println("제목: " + article.getTitle());
			System.out.println("내용: " + article.getContent());

			// 게시글 저장
			Integer num = articleService.writeArticle(article, ifile, dfile);

			System.out.println("저장된 게시글 번호: " + num);

			// 상세페이지로 이동
			return "redirect:/article/detail?num=" + num;

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.toString());
			return "common/error";
		}
	}

	@GetMapping("/article/detail")
	// @RequestMapping(value="/article/write",Method=RequestMethod=GET)
	public ModelAndView detailArticle(@RequestParam("num") Integer num) {
		ModelAndView mav = new ModelAndView();
		try {
			Map<String, Object> article = articleService.detailArticle(num);
			mav.addObject("article", article);
			mav.setViewName("article/boarddetail");

		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("err", "寃뚯떆湲� �긽�꽭 議고쉶 �삤瑜�");
			mav.setViewName("error");

		}
		return mav;

	}

	@GetMapping("/article/list")
	public ModelAndView articleList(@RequestParam(name = "page", defaultValue = "1") Integer page,
			@RequestParam(name = "type", required = false) String type,
			@RequestParam(name = "keyword", required = false) String keyword) {

		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo(page);
		try {
			mav.addObject("articleList", articleService.articleList(pageInfo, keyword, type));
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("type", type);
			mav.addObject("keyword", keyword);
			mav.setViewName("article/boardlist");
		} catch (Exception e) {
			mav.addObject("err", "게시글 목록 조회 오류");
			mav.setViewName("common/error");
		}

		return mav;
	}

	@GetMapping("/article/delete/{num}/{page}")
	public String deleteArticle(@PathVariable("num") Integer num, @PathVariable("page") Integer page, Model model) {
		try {
			articleService.deleteArticle(num);
			return "redirect:/article/list?page=" + page;
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			return "common/errors";
		}
	}

	@GetMapping("/article/modify")
	public String modifyArticleForm(@RequestParam("num") Integer num, HttpSession session, Model model)
			throws Exception {

		Member user = (Member) session.getAttribute("user");

		if (user == null) {
			return "redirect:/member/login";
		}

		// 기존 게시글 조회
		Map<String, Object> article = articleService.detailArticle(num);

		if (article == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "게시글이 없습니다.");
		}

		// 작성자 본인만 수정 가능
		if (!user.getId().equals(article.get("writer"))) {
			throw new ResponseStatusException(HttpStatus.FORBIDDEN, "수정 권한이 없습니다.");
		}

		model.addAttribute("article", article);

		return "article/modifyform";
	}

	@PostMapping("/article/modify")
	public String modifyArticle(Article article, @RequestParam(name = "ifile", required = false) MultipartFile ifile,
			@RequestParam(name = "dfile", required = false) MultipartFile dfile, HttpSession session) throws Exception {

		Member user = (Member) session.getAttribute("user");

		if (user == null) {
			return "redirect:/member/login";
		}

		// 화면에서 넘어온 writer를 신뢰하지 않고
		// 로그인한 회원의 ID를 사용
		article.setWriter(user.getId());

		try {
			articleService.modifyArticle(article, ifile, dfile);
		} catch (SecurityException e) {
			throw new ResponseStatusException(HttpStatus.FORBIDDEN, "수정 권한이 없습니다.");
		}

		return "redirect:/article/detail?num=" + article.getNum();
	}

}
