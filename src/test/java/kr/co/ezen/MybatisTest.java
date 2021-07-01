package kr.co.ezen;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MybatisTest {
	
	@Inject
	private SqlSessionFactory sqlFatory;
	
	@Test
	   public void testFatory() {
	    System.out.println(sqlFatory);
	    
		
	   }
	@Test
	public void testSession() {
		SqlSession session = null;
		
		try {
			session = sqlFatory.openSession();
			System.out.println(session);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) {
				session.close();
			}
		}
	}

	}