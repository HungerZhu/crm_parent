package cn.itcast.crm.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 请求编码的过滤器
 * @author APPle
 *
 */
public class EncodingFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		//1.处理POST提交
		req.setCharacterEncoding("utf-8");
		//2.GET:手动解码
		//采用装饰者模式：对request进行装饰， 重写getParameter()等方法
		MyRequest myRequest = new MyRequest((HttpServletRequest) req);
		
		//3.放行: 一定放装饰后的request对象
		chain.doFilter(myRequest,resp);
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}

//1.对HttpServletRequest进行装饰，继承它的实现类（非final）
class MyRequest extends HttpServletRequestWrapper{
	//2.声明一个变量，用于接收被装饰类对象
	private HttpServletRequest request;
	
	//确保一次请求只需要转换一次
	private boolean hadEncode=false;
	
	public MyRequest(HttpServletRequest request) {
		super(request);
		//3.接收被装饰类对象
		this.request = request;
	}
	
	@Override
	public Map<String,String[]> getParameterMap() {
		try {
			Map<String,String[]> map = super.getParameterMap();
			if(!hadEncode){
				Set<Entry<String, String[]>> entrySet = map.entrySet();
				for (Entry<String, String[]> entry : entrySet) {
					String[] values = entry.getValue();
					if(values!=null  && "GET".equals(request.getMethod())){
						for(int i=0;i<values.length;i++){
							values[i] = new String(values[i].getBytes("iso-8859-1"),"utf-8");
						}
					}
				}
				hadEncode = true;
			}
			return map;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	//4.重写方法
	//一个参数值的
	@Override
	public String getParameter(String name) {
		Map<String,String[]> parameterMap = getParameterMap();
		String[] value = parameterMap.get(name);
		if(value==null){
			return null;
		}
		return value[0];
	}
	//多个参数值的
	@Override
	public String[] getParameterValues(String name) {
		Map<String,String[]> parameterMap = getParameterMap();
		String[] value = parameterMap.get(name);
		if(value==null){
			return null;
		}
		return value;
	}
} 