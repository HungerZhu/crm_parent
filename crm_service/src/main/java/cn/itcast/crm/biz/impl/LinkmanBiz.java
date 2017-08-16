package cn.itcast.crm.biz.impl;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.crm.biz.ILinkmanBiz;
import cn.itcast.crm.dao.ILinkmanDao;
import cn.itcast.crm.entity.Linkman;
import cn.itcast.crm.utils.Pagination;

public class LinkmanBiz extends BaseBiz<Linkman> implements ILinkmanBiz {
	//真正的dao对象，应该在这里注入！！！
	private ILinkmanDao linkmanDao;
	public void setLinkmanDao(ILinkmanDao linkmanDao) {
		this.linkmanDao = linkmanDao;
		//给BaseBiz注入dao对象，这个步骤不能少，否则在使用BaseBiz的所有方法时会抛出空指针异常
		this.setBaseDao(linkmanDao);
	}


	/**
	 * 分页方法 作用：根据pagination的参数，到数据库查询 1.数据列表 2总记录数 3.总页数，并且把这些数据放入Pagination
	 */
	@Override
	public void findByPage(Pagination<Linkman> pagination) {
		// 离线查询： DetachedCriter
		// 根据前台页面传递的查询条件，组建离线查询
		DetachedCriteria dc = DetachedCriteria.forClass(Linkman.class);

		// 取出前台页面的查询条件
		//TODO 可以后续添加联系人的查询条件

		findListPage(pagination, dc);
	}


	
}
