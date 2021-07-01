package kr.co.service;

import java.util.List;

import kr.co.domain.BoardVO;


public interface BoardService {
	
	public void insert(BoardVO vo);

	public List<BoardVO> list();

	public BoardVO read(Integer bno);

	public BoardVO update(Integer bno);

	public void update(BoardVO vo);

	public void delete(Integer bno);

	public int getAmount();

	public List<BoardVO> list(int startNum);

	public List<String> getAttach(int bno);

	public void deleteFilename(String filename);
	

}
