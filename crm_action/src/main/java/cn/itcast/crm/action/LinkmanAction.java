package cn.itcast.crm.action;

import cn.itcast.crm.biz.ILinkmanBiz;
import cn.itcast.crm.entity.Linkman;


public class LinkmanAction extends BaseAction<Linkman>{
	//注入linkmanBiz对象
	private ILinkmanBiz linkmanBiz;
	public void setLinkmanBiz(ILinkmanBiz linkmanBiz) {
		this.linkmanBiz = linkmanBiz;
		//把linkmanBiz传入给BaseAction使用
		this.setBaseBiz(linkmanBiz);
	}
	
}
