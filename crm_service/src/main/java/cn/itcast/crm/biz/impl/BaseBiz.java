package cn.itcast.crm.biz.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.itcast.crm.biz.IBaseBiz;
import cn.itcast.crm.dao.IBaseDao;
import cn.itcast.crm.entity.Customer;
import cn.itcast.crm.utils.Pagination;

public class BaseBiz<T> implements IBaseBiz<T> {
	//使用BaseDao对象
	private IBaseDao baseDao;
	public void setBaseDao(IBaseDao baseDao) {
		//待会需要传入真正的dao对象
		this.baseDao = baseDao;
	}

	@Override
	public void save(T c) {
		baseDao.save(c);
	}

	@Override
	public List<T> findAll() {
		return baseDao.findAll();
	}

	@Override
	public void delete(Long id) {
		baseDao.delete(id);
	}

	@Override
	public T get(Long id) {
		return (T) baseDao.get(id);
	}

	@Override
	public void update(T c) {
		baseDao.update(c);
	}

	/**
	 * 分页方法 作用：根据pagination的参数，到数据库查询 1.数据列表 2总记录数 3.总页数，并且把这些数据放入Pagination
	 */
	@Override
	public void findByPage(Pagination<T> pagination) {
		//这里是空方法，为什么要预留这个空的方法？是为了给子类一个实现的标准，所以子类都必须按照我的方法去实现
	}

	/**
	 * 从Pagination获取指定key的参数值
	 * 
	 * @param pagination
	 * @param key
	 * @return
	 */
	protected String retrieveParameter(Pagination<T> pagination, String key) {
		return pagination.getParameters().get(key) != null ? pagination
				.getParameters().get(key)[0] : null;
	}
	
	protected void findListPage(Pagination<T> pagination,
			DetachedCriteria dc) {
		// 2.查询总记录数
		Long totalCount = baseDao.findByTotalCount(dc);
		pagination.setTotalCount(totalCount);

		// 3.查询数据列表
		// 把聚合查询设置为null
		dc.setProjection(null);
		List<T> list = baseDao.findByPage(dc, pagination.getPage(),
				pagination.getPageSize());
		pagination.setResultList(list);
	}
}
