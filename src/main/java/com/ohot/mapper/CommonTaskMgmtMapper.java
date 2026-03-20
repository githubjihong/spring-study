package com.ohot.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ohot.vo.CommonTaskMemtVO;

@Mapper
public interface CommonTaskMgmtMapper {

	//URL매칭을 통해 업무구분명 반환
	public CommonTaskMemtVO getCommonTaskMemt(String requestURI); 
	
}
