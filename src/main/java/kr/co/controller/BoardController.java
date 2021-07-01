package kr.co.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;
import kr.co.service.BoardService;
import kr.co.service.ReplyService;
import kr.co.utils.utils;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	private BoardService bService;
	
	@Inject
	private ServletContext sc;
	private String uploadPath = "resources" + File.separator + "uploads";
	
	@ResponseBody
	@RequestMapping(value = "/getAttach/{bno}", method = RequestMethod.GET)
	public List<String> getAttch(@PathVariable("bno") int bno){
		return bService.getAttach(bno);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String deleteFile(String filename) {
		bService.deleteFilename(filename);
		
		filename = filename.replace('/', File.separatorChar);
		
		String uploadPath = sc.getRealPath(this.uploadPath);
		
		String extendName = utils.getExtendName(filename);
		MediaType mType = utils.getMediaType(extendName);
		
		if (mType != null) {
			String getSystemFileName = utils.getSystemFileName(filename);
			File f0 = new File(uploadPath, getSystemFileName);
			f0.delete();
		}
		
		File f = new File(uploadPath, filename);
		f.delete();
		
		return filename;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST,produces = "text/plain;charset=utf-8")
	public String uploadfile(MultipartHttpServletRequest request) throws Exception {
		MultipartFile file = request.getFile("file");
		String oriName = file.getOriginalFilename();
		String uploadPath = sc.getRealPath(this.uploadPath);
		String filename = utils.uploadFile(oriName, uploadPath, file);
		
		return filename;
	}
	
	
	
	@RequestMapping(value = "/delete/{bno}",method = RequestMethod.POST)
	public String delete(@PathVariable("bno") Integer bno, int curPage) {
		bService.delete(bno);
		
		return "redirect:/board/list/"+curPage;
	}
	
	@RequestMapping(value = "/update/{bno}", method = RequestMethod.POST)
	public String update(@PathVariable("bno") Integer bno, BoardVO vo, int curPage) {
		
		vo.setBno(bno);
		
		bService.update(vo);
		
		return "redirect:/board/read/"+bno+"?curPage="+curPage;
	}
	
	@RequestMapping(value = "/update/{bno}" , method = RequestMethod.GET)
	public String update(@PathVariable("bno") Integer bno, @ModelAttribute("curPage") int curPage , Model model) {
		BoardVO vo = bService.update(bno);
		model.addAttribute("vo",vo);
		
		return "/board/update";
	}
	
	
	@RequestMapping(value = "/read/{bno}" , method = RequestMethod.GET)
	public String read(@PathVariable("bno") Integer bno, @ModelAttribute("curPage") int curPage, Model model) {
		
			BoardVO vo = bService.read(bno);
			
			model.addAttribute("vo", vo);
			
		return "/board/read";
	}
	
	@RequestMapping(value = "/list/{curPage}" , method = RequestMethod.GET)
	public String list(@PathVariable("curPage") int curPage, Model model) {
		
		int amount = bService.getAmount();
		PageTO<BoardVO> to = new PageTO<BoardVO>(curPage);
		to.setAmount(amount);
		
		List<BoardVO> list = bService.list(to.getStartNum());
		to.setList(list);
		//List<BoardVO> list = bService.list();
		//model.addAttribute("list", list);
		model.addAttribute("to", to);
		/*
		 * for(int i = 0; i<list.size();i++) { int bno = list.get(i).getBno(); int recnt
		 * = rService.getCount(bno); list.get(i).setRecnt(recnt); }
		 */
		return "/board/list";
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public void list(Model model) {
		int curPage = 1;
		int amount = bService.getAmount();
		PageTO<BoardVO> to = new PageTO<BoardVO>(curPage);
		to.setAmount(amount);
		
		List<BoardVO> list = bService.list(to.getStartNum());
		to.setList(list);
		//List<BoardVO> list = bService.list();
		//model.addAttribute("list", list);
		model.addAttribute("to", to);
	}
	
	
	@RequestMapping(value = "/insert" ,method = RequestMethod.POST)
	public String insert(BoardVO vo) {
		
		String[] files = vo.getFiles();
		if(files != null) {
		
	      for(String x : files) {
	         System.out.println(x);
	      }
	      }
	      
			bService.insert(vo);
			
		return "redirect:/board/read/"+vo.getBno()+"/?curPage=1";
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		
		
	}
	

}
