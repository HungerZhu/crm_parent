package cn.itcast.crm.biz.impl;

import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import cn.itcast.crm.biz.ICustomerBiz;
import cn.itcast.crm.dao.ICustomerDao;
import cn.itcast.crm.dao.ILinkmanDao;
import cn.itcast.crm.entity.Customer;
import cn.itcast.crm.entity.Linkman;
import cn.itcast.crm.utils.Pagination;

public class CustomerBiz extends BaseBiz<Customer> implements ICustomerBiz {
	//真正的dao对象，应该在这里注入！！！
	private ICustomerDao customerDao;
	public void setCustomerDao(ICustomerDao customerDao) {
		this.customerDao = customerDao;
		//给BaseBiz注入dao对象，这个步骤不能少，否则在使用BaseBiz的所有方法时会抛出空指针异常
		this.setBaseDao(customerDao);
	}

	//注入linkmanDao对象
	private ILinkmanDao linkmanDao;
	public void setLinkmanDao(ILinkmanDao linkmanDao) {
		this.linkmanDao = linkmanDao;
	}

	/**
	 * 分页方法 作用：根据pagination的参数，到数据库查询 1.数据列表 2总记录数 3.总页数，并且把这些数据放入Pagination
	 */
	@Override
	public void findByPage(Pagination<Customer> pagination) {
		// 离线查询： DetachedCriter
		// 根据前台页面传递的查询条件，组建离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);

		// 取出前台页面的查询条件
		// 客户来源
		String custSource = retrieveParameter(pagination, "custSource");
		if (StringUtils.isNotEmpty(custSource)) {
			// eq: 等价于=
			dc.add(Restrictions.eq("custSource", custSource));
		}
		// 客户行业
		String custIndustry = retrieveParameter(pagination, "custIndustry");
		if (StringUtils.isNotEmpty(custIndustry)) {
			// eq: 等价于=
			dc.add(Restrictions.eq("custIndustry", custIndustry));
		}
		// 客户级别
		String custLevel = retrieveParameter(pagination, "custLevel");
		if (StringUtils.isNotEmpty(custLevel)) {
			// eq: 等价于=
			dc.add(Restrictions.eq("custLevel", custLevel));
		}
		// 关键词： 依次搜索 客户名称，客户电话，客户移动电话，只要任何一个符合关键词都查询出来
		String keyword = retrieveParameter(pagination, "keyword");
		if (StringUtils.isNotEmpty(keyword)) {
			dc.add(Restrictions.or(
					Restrictions.like("custName", "%" + keyword + "%"),
					Restrictions.like("custPhone", "%" + keyword + "%"),
					Restrictions.like("custMobile", "%" + keyword + "%")));
		}

		findListPage(pagination, dc);
	}

	/**
	 * 重写客户的删除方法
	 */
	@Override
	public void delete(Long id) {
		//1.判断该客户下是否有联系人，如果有，则删除所有联系人
		Customer customer = customerDao.get(id);
		Set<Linkman> linkmans = customer.getLinkmans();
		if(linkmans!=null && linkmans.size()>0){
			//删除联系人
			for(Linkman lkm : linkmans){
				linkmanDao.delete(lkm.getLkmId());
			}
		}
		
		//2.删除客户
		super.delete(id);
	}
	
}
