package com.yi.persistence;

import java.util.List;

import com.yi.domain.CustomerVO;
import com.yi.domain.ResultTestVO;
import com.yi.domain.TestScroeDTO;

public interface ResultTestDao {
	
	public List<ResultTestVO> selectByAll();
	public ResultTestVO selectByNo(ResultTestVO resultTestVo);
	public List<ResultTestVO> selectByCustomerCode(CustomerVO customerVo);
	public void insertResultTest(ResultTestVO resultTestVo);
	public void deleteResultTest(ResultTestVO resultTestVo);
	public void updateResultTest(ResultTestVO resultTestVo);
	
	//°í°´º°, ¿¬µµº°, È¸Â÷º° Ç¬ ÃÑ¹®Á¦¼ö¿Í ¸ÂÃá °¹¼ö ±¸ÇÏ±â
	public TestScroeDTO selectScore(String customerCode, int year, int round);
	//maxNum±¸ÇÏ±â
	public int selectMaxCode();
}
