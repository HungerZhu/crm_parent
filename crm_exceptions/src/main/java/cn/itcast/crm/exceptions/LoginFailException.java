package cn.itcast.crm.exceptions;
/*
 * 登录失败异常
 */
public class LoginFailException extends Exception {

	public LoginFailException(String msg){
		super(msg);
	}
}
