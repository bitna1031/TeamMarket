package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.ReplyVO;
import kr.co.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO rDao;
	
	@Override
	public void insert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		rDao.insert(rvo);
	}

	@Override
	public List<ReplyVO> list(int bno) {
		// TODO Auto-generated method stub
		return rDao.list(bno);
	}

	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		return rDao.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return rDao.update(vo);
	}

	@Override
	public int getCount(int bno) {
		// TODO Auto-generated method stub
		return rDao.getCount(bno);
	}

}
