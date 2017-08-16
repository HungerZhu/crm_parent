package cn.itcast.crm.action;

import java.util.HashMap;
import java.util.Map;

import cn.itcast.crm.biz.IUserBiz;
import cn.itcast.crm.entity.User;
import cn.itcast.crm.exceptions.LoginFailException;

import com.opensymphony.xwork2.ActionContext;


public class UserAction extends BaseAction<User>{
	//注入userBiz对象
	private IUserBiz userBiz;
	public void setUserBiz(IUserBiz userBiz) {
		this.userBiz = userBiz;
		//把userBiz传入给BaseAction使用
		this.setBaseBiz(userBiz);
	}
	
	/**
	 * 登录方法
	 */
	public String login(){
		Map result = new HashMap();
		ActionContext ac = ActionContext.getContext();
		try {
			User loginUser = userBiz.login(c);
			//正常
			//保存标记，sesssion
			
			ac.getSession().put("LOGIN_USER", loginUser);
			
			result.put("success", 1);
		} catch (LoginFailException e) {
			//失败
			//异常标记
			String tag = e.getMessage();
			//获取异常信息
			String msg = this.getText(tag);
			
			result.put("success", 0);
			result.put("msg", msg);
		}
		ac.put("result", result);
		return "json";
	}
	
}
