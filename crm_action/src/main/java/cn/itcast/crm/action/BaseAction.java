package cn.itcast.crm.action;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.crm.biz.IBaseBiz;
import cn.itcast.crm.utils.Pagination;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {
	//使用baseBiz对象
	private IBaseBiz baseBiz;
	public void setBaseBiz(IBaseBiz baseBiz) {
		//需要传入真正的biz对象
		this.baseBiz = baseBiz;
	}

	/**
	 * 新增方法
	 * 
	 * @return
	 */
	// save()方法验证失败后，跳转到saveInput视图
	@InputConfig(resultName = "saveInput")
	public String save() {
		baseBiz.save(c);
		// 提示消息
		ActionContext ac = ActionContext.getContext();
		// getText(): 获取messages.propertes文件的key-value内容
		ac.put("msg", this.getText("save.succ"));
		return SUCCESS;
	}

	/**
	 * 查询列表
	 */
	public String list() {
		List<T> cList = baseBiz.findAll();
		// 把数据存入值栈的context中
		ActionContext ac = ActionContext.getContext();
		ac.put("cList", cList);
		return "list";
	}

	/**
	 * 删除方法
	 */
	public String delete() {
		baseBiz.delete(id);
		ActionContext ac = ActionContext.getContext();
		ac.put("msg", this.getText("delete.succ"));
		return SUCCESS;
	}

	/**
	 * 修改前的表单回显
	 */
	public String get() {
		T cust = (T) baseBiz.get(id);
		// 保存数据
		// 方案一：可以存入值栈root（推荐）
		ActionContext ac = ActionContext.getContext();
		ac.getValueStack().push(cust);

		// 方案二：可以存入值栈context
		// ActionContext ac = ActionContext.getContext();
		// ac.put("c", cust);
		return "update";
	}

	/**
	 * 保存更新
	 */
	// update()方法验证失败后，跳转到updateInput视图
	@InputConfig(resultName = "updateInput")
	public String update() {
		baseBiz.update(c);
		ActionContext ac = ActionContext.getContext();
		ac.put("msg", this.getText("update.succ"));
		return SUCCESS;
	}

	/**
	 * 分页查询
	 */
	public String listPage() {
		pagination = new Pagination<T>();
		// ******封装Pagination对象******//
		// 1.利用Pagination接收前台页面传递的参数
		if (page != null) {
			pagination.setPage(page);
		}
		if (pageSize != null) {
			pagination.setPageSize(pageSize);
		}
		// 接收到用户传递的查询参数： request.getParameterMap()
		pagination.setParameters(ServletActionContext.getRequest()
				.getParameterMap());

		// 2.到数据库查询，并且查询数据库的结果放入Pagination
		baseBiz.findByPage(pagination);

		return "list";
	}

	// 设计一个Pagination回显给前台页面
	private Pagination<T> pagination;

	public Pagination<T> getPagination() {
		return pagination;
	}

	// 利用普通属性驱动接收page和pageSize
	private Integer page;
	private Integer pageSize;
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	//传入ID值，用于修改和删除
	private Long id;
	public void setId(Long id) {
		this.id = id;
	}
	//模型驱动里面的模型对象
	protected T c;

	public BaseAction(){
		//创建模型对象
		try {
			//获取Customer类型
			Type t = this.getClass().getGenericSuperclass();
			ParameterizedType pt = (ParameterizedType)t;
			Class<T> modelClass = (Class)pt.getActualTypeArguments()[0];
			//创建实例对象
			c = (T)modelClass.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	@Override
	public T getModel() {
		return c;
	}
}
