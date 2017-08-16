package cn.itcast.crm.biz;

import cn.itcast.crm.entity.User;
import cn.itcast.crm.exceptions.LoginFailException;

public interface IUserBiz extends IBaseBiz<User>{
	public User login(User u) throws LoginFailException ;
}
