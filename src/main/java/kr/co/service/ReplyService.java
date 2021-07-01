package kr.co.service;

import java.util.List;

import kr.co.domain.ReplyVO;

public interface ReplyService {

	void insert(ReplyVO rvo);

	List<ReplyVO> list(int bno);

	int delete(int rno);

	int update(ReplyVO vo);

	int getCount(int bno);

}
