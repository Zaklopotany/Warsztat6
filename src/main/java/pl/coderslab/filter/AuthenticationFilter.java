package pl.coderslab.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pl.coderslab.entity.User;
@WebFilter(urlPatterns = {"/message/*", "/tweet/*","/comment/*"}, description = "authentication filter")
public class AuthenticationFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req; 
		HttpServletResponse response = (HttpServletResponse) res; 
		HttpSession ses = request.getSession();
		User tempUser =(User) ses.getAttribute("user");
		
		if(tempUser != null) {
			chain.doFilter(req, res);
		} else {
			response.sendRedirect(request.getContextPath() + "/user/login");
		}		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
