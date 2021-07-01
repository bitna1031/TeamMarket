package kr.co.service;

import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> list();

	public void insert(MemberDTO dto);

	public MemberDTO read(String userId);
	
	public MemberDTO login(LoginDTO login);

}
