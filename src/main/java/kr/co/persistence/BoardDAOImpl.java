package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.board";
	

	@Override
	public void insert(BoardVO vo) {
		session.insert(NAMESPACE+".insert", vo);
		
	}


	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".list");
	}


	@Override
	public BoardVO read(Integer bno) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".read", bno);
	}


	@Override
	public BoardVO update(Integer bno) {
		// TODO Auto-generated method stub
		return read(bno);   //uri 가져오는 메서드
	}


	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update",vo);
	}


	@Override
	public void delete(Integer bno) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".delete", bno);
	}


	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".getAmount");
	}


	@Override
	public List<BoardVO> list(int startNum) {
		// TODO Auto-generated method stub
		
		RowBounds rb = new RowBounds(startNum-1, 15);
		
		return session.selectList(NAMESPACE+".list", null, rb);
	}


	@Override
	public void increaseReadcnt(Integer bno) {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".increaseReadcnt", bno);
	}


	@Override
	public void addAttach(String filename, int bno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("bno", bno);
		session.insert(NAMESPACE+".addAttach", map);
	}


	@Override
	public List<String> getAttach(Integer bno) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".getAttach", bno);
	}


	@Override
	public void deleteFilename(String filename) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".deleteFilename", filename);
	}


	@Override
	public void deleteAllFilenameByBno(int bno) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".deleteAllFilenameByBno", bno);
	}

}
