package cn.itcast.crm.biz.impl;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.crm.biz.IUserBiz;
import cn.itcast.crm.dao.IUserDao;
import cn.itcast.crm.entity.User;
import cn.itcast.crm.exceptions.LoginFailException;
import cn.itcast.crm.utils.Pagination;

public class UserBiz extends BaseBiz<User> implements IUserBiz {
	//真正的dao对象，应该在这里注入！！！
	private IUserDao userDao;
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
		//给BaseBiz注入dao对象，这个步骤不能少，否则在使用BaseBiz的所有方法时会抛出空指针异常
		this.setBaseDao(userDao);
	}


	/**
	 * 分页方法 作用：根据pagination的参数，到数据库查询 1.数据列表 2总记录数 3.总页数，并且把这些数据放入Pagination
	 */
	@Override
	public void findByPage(Pagination<User> pagination) {
		// 离线查询： DetachedCriter
		// 根据前台页面传递的查询条件，组建离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);

		// 取出前台页面的查询条件
		//TODO 可以后续添加联系人的查询条件

		findListPage(pagination, dc);
	}


	public User login(User u) throws LoginFailException {
		//1.先判断账户是否存在
		User loginUser = userDao.findByCode(u.getUserCode());
		if(loginUser==null){
			//不存在
			throw new LoginFailException("code.error");
		}
		//2.判断密码是否正确
		String dbPassword = loginUser.getUserPassword();
		if(!u.getUserPassword().equals(dbPassword)){
			//密码输入有误
			throw new LoginFailException("password.error");
		}
		//3.判断账户是否启用
		if(loginUser.getUserState().equals("0")){
			//账户已经停用
			throw new LoginFailException("state.error");
		}
		return loginUser;
	}


	
}
