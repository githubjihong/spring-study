package com.ohot.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ohot.vo.SysConfigInfoVO;

@Mapper
public interface SysConfigInfoMapper {
	
	public SysConfigInfoVO getConfigKey(String ConfigKey);
	
}
