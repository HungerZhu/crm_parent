package cn.itcast.crm.biz;

import java.util.List;

import cn.itcast.crm.utils.Pagination;

public interface IBaseBiz<T> {
	public void save(T c);
	public List<T> findAll();
	public void delete(Long id);
	public T get(Long id);
	public void update(T c);
	public void findByPage(Pagination<T> pagination);
}
