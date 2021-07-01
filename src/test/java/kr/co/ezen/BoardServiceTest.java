package kr.co.ezen;



import javax.inject.Inject;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import kr.co.domain.BoardVO;
import kr.co.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardServiceTest {
	
	@Inject
	private BoardDAO bDao;
	
	@Test
	public void testGetAmount() {
		int amount = bDao.getAmount();
		
		System.out.println(amount);
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO(-1, "title1", "content1", "m001", 0, null, null);
		bDao.insert(vo);
	}
	

	}