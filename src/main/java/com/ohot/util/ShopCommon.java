package com.ohot.util;

import com.ohot.vo.CustomUser;
import com.ohot.vo.UsersVO;

public class ShopCommon {

	private UsersVO LoginCheck(CustomUser customUser) {
		
		UsersVO usersVO = null;
		
		if(customUser != null) {
			usersVO= customUser.getUsersVO();
		}
		
		return usersVO;
	}
}
