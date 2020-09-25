package com.zdh.web.filter;

import com.zdh.domain.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class UserLoginPrivilegeFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

//		设置编码
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//校验用户是否登录----校验session是否存在user对象
		HttpSession session = req.getSession();

		//判断用户是否已经登录 未登录下面代码不执行
		User user = (User) session.getAttribute("user");
		if(user==null){
			//没有登录
			PrintWriter out = resp.getWriter();
			out.print("<script>alert('登录超时，请重新登录！');window.location='"+req.getContextPath()+"/login.jsp';</script>");

			return;
		}else {
			if(user.getPower()==0){
				//root 用户
				PrintWriter out = resp.getWriter();
				out.print("<script>alert('您无权访问！');window.location='"+req.getContextPath()+"/root/signup.jsp';</script>");
				return;
			}
		}
		chain.doFilter(req, resp);
	}
	

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
