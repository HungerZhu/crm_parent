package cn.itcast.crm.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

/**
 * 分页对象，用于封装请求参数和回显的数据
 * @author APPle
 *
 */
public class Pagination<T> {
	/**第一部分：前台页面传递到后台的参数*/
	//当前页码
	private Integer page = 1;
	//页面大小（每页最大显示条数）
	private Integer pageSize =3;
	//查询条件
	private Map<String,String[]> parameters = new HashMap<String,String[]>();
	
	/**
	 * 设计一个get方法，用于给页面获取带条件的参数字符串
	 *   格式： &key1=value1&key2=value2
	 */
	public String getParameterStr(){
		String paramStr = "";
		Set<Entry<String, String[]>> entrySet = parameters.entrySet();
		for (Entry<String, String[]> entry : entrySet) {
			//参数名称
			String key = entry.getKey();
			//排除掉page参数不需要
			if(!key.equals("page")){
				paramStr+="&"+key+"="+entry.getValue()[0];
			}
		}
		//System.out.println("==="+paramStr);
		return paramStr;
	}
	
	
	/**第二部分：后台需要回显给前台页的数据*/
	//回显的数据列表
	private List<T> resultList;
	//总记录数
	private Long totalCount;
	//总页数
	private Integer totalPage;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Map<String, String[]> getParameters() {
		return parameters;
	}
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}
	public List<T> getResultList() {
		return resultList;
	}
	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		//计算总页数
		totalPage = (int) (totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1);
		
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
