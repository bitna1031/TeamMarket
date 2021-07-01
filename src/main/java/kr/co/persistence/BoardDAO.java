package kr.co.persistence;

import java.util.List;

import kr.co.domain.BoardVO;

public interface BoardDAO {
	public void insert(BoardVO vo);

	public List<BoardVO> list();

	public BoardVO read(Integer bno);

	public BoardVO update(Integer bno);

	public void update(BoardVO vo);

	public void delete(Integer bno);

	public int getAmount();

	public List<BoardVO> list(int startNum);

	public void increaseReadcnt(Integer bno);

	public void addAttach(String filename, int bno);

	public List<String> getAttach(Integer bno);

	public void deleteFilename(String filename);

	public void deleteAllFilenameByBno(int bno);
	
	
}
