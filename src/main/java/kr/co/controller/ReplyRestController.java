package kr.co.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.AbstractExecutorService;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyRestController {
	
	@Inject 
	private ReplyService rService;
	
	@RequestMapping(value = "/reply", method = RequestMethod.PUT)
	public int update(@RequestBody Map<String, Object> map) {
		
		int rno = Integer.parseInt(map.get("rno").toString());
		
		String replyer = map.get("replyer").toString();
		String replytext = map.get("replytext").toString();
		
		ReplyVO vo = new ReplyVO(rno, -1, replytext, replyer, null, null);
		
		int result = rService.update(vo);
		
		return result;
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.DELETE)
	public int delete(@RequestBody Map<String, Object> map) {
		
		int rno = Integer.parseInt(map.get("rno").toString());
		
		int result = rService.delete(rno);
		
		return result;
	}
	
	@RequestMapping(value = "/reply/{bno}" , method = RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable("bno") int bno){
		
		return rService.list(bno);
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	public String insert(@RequestBody Map<String, Object> map) {
		
		int bno = Integer.parseInt(map.get("bno").toString());
		
		String replyer = map.get("replyer").toString();
		String replytext = map.get("replytext").toString();
		
		ReplyVO rvo = new ReplyVO(-1, bno, replytext, replyer, null, null);
		
		rService.insert(rvo);
		
		return "입력 완료";
	}

}
