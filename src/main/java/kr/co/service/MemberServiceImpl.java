package kr.co.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	private MemberDAO mDao;

	@Override
	public List<MemberDTO> list() {
		
		return mDao.list();
	}

	@Override
	public void insert(MemberDTO dto) {
		mDao.insert(dto);
		
	}

	@Override
	public MemberDTO read(String userId) {
		
		return mDao.read(userId);
	}

	@Override
	public MemberDTO login(LoginDTO login) {
		// TODO Auto-generated method stub
		return mDao.login(login);
	}

	
}
