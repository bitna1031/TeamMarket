package kr.co.service;

import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService{

	@Override //point cuts
	public void test1() {
		// TODO Auto-generated method stub
		long t1 = System.currentTimeMillis();
		System.out.println("TestServiceImpl 클래스의 테스트원 메서드");
		long t2 = System.currentTimeMillis();
		
		System.out.println(t2-t1);
	}

	@Override  //advice  join points
	public void test2() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void test3() {
		// TODO Auto-generated method stub
		
	}

}
