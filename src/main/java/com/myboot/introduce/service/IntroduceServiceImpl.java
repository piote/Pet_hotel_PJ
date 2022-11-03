package com.myboot.introduce.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myboot.introduce.dao.IntroduceDAO;
import com.myboot.introduce.vo.IntroduceVO;

@Service("introduceService")
@Transactional(propagation = Propagation.REQUIRED)
public class IntroduceServiceImpl implements IntroduceService {
	@Autowired	
	IntroduceDAO introduceDAO;
	
	@Override
	public IntroduceVO listintroduce() throws Exception {
		IntroduceVO introduceList =  introduceDAO.selectAllintroduceList();
        return introduceList;
	}
	@Override
	public int modIntroduce(Map introduceMap) throws DataAccessException {
		int i_Num = introduceDAO.selectNewINTRO_NUM();
		// 가장 높은 숫자+1을 i_Num에 저장
		introduceMap.put("intro_num", i_Num);
		introduceDAO.insertIntroduce(introduceMap);
		return i_Num;
	}
}