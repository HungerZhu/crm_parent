package cn.itcast.crm.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.crm.biz.ICustomerBiz;
import cn.itcast.crm.entity.Customer;


public class CustomerAction extends BaseAction<Customer>{
	//注入customerBiz对象
	private ICustomerBiz customerBiz;
	public void setCustomerBiz(ICustomerBiz customerBiz) {
		this.customerBiz = customerBiz;
		//把customerBiz传入给BaseAction使用
		this.setBaseBiz(customerBiz);
	}
	
	
	/**
	 * 加载所有客户信息，以JSON字符串格式返回
	 */
	public String loadCustomers(){
		List<Customer> cList = customerBiz.findAll();
		ActionContext ac = ActionContext.getContext();
		ac.put("result", cList);
		return "json";
	}
}
