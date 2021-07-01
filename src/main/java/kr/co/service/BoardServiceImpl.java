package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.BoardVO;
import kr.co.persistence.BoardDAO;
import kr.co.persistence.ReplyDAO;

@Service

public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bDao;
	
	@Inject
	private ReplyDAO rDao;
	
	@Transactional
	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub
		bDao.insert(vo);
		
		String[] files = vo.getFiles();
		if (files == null) {
			return;
		}
		
		for(String filename : files) {
			bDao.addAttach(filename, vo.getBno());
		}
		
	}

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return bDao.list();
	}
	
	
	@Override
	@Transactional
	public BoardVO read(Integer bno) {
		// TODO Auto-generated method stub
		bDao.increaseReadcnt(bno);
		BoardVO vo = bDao.read(bno);
		
		
		return vo;
	}
	
	@Override
	public List<String> getAttach(int bno){
		
		return bDao.getAttach(bno);
	}

	@Override
	public BoardVO update(Integer bno) {
		// TODO Auto-generated method stub
		return bDao.update(bno);
	}
	
	@Transactional
	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		bDao.update(vo);
		
		bDao.deleteAllFilenameByBno(vo.getBno());
		if (vo.getFiles() == null) {
			return;
		}
		
		for(String filename : vo.getFiles()) {
			bDao.addAttach(filename, vo.getBno());
		}
	}
	
	@Transactional
	@Override
	public void delete(Integer bno) {
		rDao.deleteByBno(bno);
		bDao.deleteAllFilenameByBno(bno);
		
		// TODO Auto-generated method stub
		bDao.delete(bno);
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return bDao.getAmount();
	}

	@Override
	public List<BoardVO> list(int startNum) {
		// TODO Auto-generated method stub
		return bDao.list(startNum);
	}

	@Override
	public void deleteFilename(String filename) {
		// TODO Auto-generated method stub
		bDao.deleteFilename(filename);
	}


	

}
