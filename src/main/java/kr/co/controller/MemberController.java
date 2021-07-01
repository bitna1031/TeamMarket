package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService mService;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void login(LoginDTO login, Model model) {
		MemberDTO dto = mService.login(login);
		model.addAttribute("login", dto);
		
	}
	
	@RequestMapping(value = "/loginGet", method = RequestMethod.GET)
	public void login() {
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String list(Model model) {
		
		List<MemberDTO> list = mService.list();
		model.addAttribute("list", list);
		
		return "/member/list";
	}
	
	@RequestMapping(value = "/insert" , method = RequestMethod.GET)
	public void insert() {
		
	}
	
	@RequestMapping(value = "/insert" , method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		mService.insert(dto);
		
		return "redirect:/member/list";
	}
	
	@RequestMapping(value = "/read/{userId}", method = RequestMethod.GET)
	public String read(@PathVariable("userId") String userId , Model model) {
		
		MemberDTO dto = mService.read(userId);
		model.addAttribute("dto", dto);
		
		return "/member/read";
	}
	
	

}
