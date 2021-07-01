package kr.co.persistence;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO login(LoginDTO login);
	
	public List<MemberDTO> list();

	public void insert(MemberDTO dto);

	public MemberDTO read(String userId);


}
