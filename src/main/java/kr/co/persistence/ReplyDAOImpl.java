package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.reply";
	
	@Override
	public void insert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".insert", rvo);
	}

	@Override
	public List<ReplyVO> list(int bno) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".list", bno);
	}

	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		return session.delete(NAMESPACE+".delete", rno);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return session.update(NAMESPACE+".update", vo);
	}

	@Override
	public void deleteByBno(Integer bno) {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".deleteByBno", bno);
	}

	@Override
	public int getCount(int bno) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".getCount", bno);
	}

}
