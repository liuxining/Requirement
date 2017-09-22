package web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import domain.UserBean;
import utils.DateUtil;
import utils.MD5Util;
import utils.StringUtil;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(UserServlet.class.getName());
	UserDao userDao = new UserDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String method = req.getParameter("method");
		if("add".equals(method)){
			add(req,resp);
		}
		else if("login".equals(method)){
			login(req,resp);
		}
		else if("modifyPassword".equals(method)){
			modifyPassword(req,resp);
		}
		else if("logout".equals(method)){
			logout(req,resp);
		}
	}

	private void logout(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		try {
			resp.sendRedirect(req.getContextPath() + "/login/login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void modifyPassword(HttpServletRequest req, HttpServletResponse resp) {
		
		String oldpassword = req.getParameter("oldpassword");
		String password = req.getParameter("password");
		String password2 = req.getParameter("password2");
		try {
			if(!password.equals(password2)){
				resp.sendRedirect("index/modifyPassword.jsp?status=3");
			}
			else{
				UserBean loginUserBean = (UserBean) req.getSession().getAttribute("loginUserBean");
				if(MD5Util.verifyPassword(oldpassword, loginUserBean.getSalt(), loginUserBean.getPassword())){
					//旧密码验证成功
					String salt = StringUtil.getRandomStr(8);
					loginUserBean.setSalt(salt);
					loginUserBean.setPassword(MD5Util.generalPasswordHash(password, salt));
					userDao.update(loginUserBean);
					resp.sendRedirect("index/modifyPassword.jsp?status=1");
				}
				else{
					//旧密码验证失败
					resp.sendRedirect("index/modifyPassword.jsp?status=2");
					
				}
			}
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
		
	}

	private void login(HttpServletRequest req, HttpServletResponse resp) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String checkCodeInput = req.getParameter("checkCodeInput");
		String checkCode = (String) req.getSession().getAttribute("checkCode");
		log.info("username:" + username);
		log.info("password:" + password);
		log.info("checkCodeInput:" + checkCodeInput);
		log.info("checkCode:" + checkCode);
		try {
			PrintWriter out = resp.getWriter();
			if(!checkCodeInput.equals(checkCode)){
				out.println("3");
			}
			else{
				UserBean userBean;
				userBean = userDao.getByUsername(username);
				if(userBean != null){
					if(MD5Util.verifyPassword(password,userBean.getSalt(),userBean.getPassword())){
						log.debug("账号 " + username + " 登录成功");
						req.getSession().setAttribute("loginUserBean", userBean);
						req.getSession().setAttribute("nowDate", DateUtil.getDate());
						
						out.print("4");
						
					}
					else{
						log.debug("账号" + username + "密码错误");
						out.println("2");
					}
				}
				else{
					log.debug("账号" + username + "不存在");
					out.println("1");
				}
			}
			out.flush();
			out.close();
		} catch (IOException | SQLException e1) {
			e1.printStackTrace();
		}
	}

	private void add(HttpServletRequest req, HttpServletResponse resp) {
		String checkCodeInput = req.getParameter("checkCodeInput");
		String checkCode = (String) req.getSession().getAttribute("checkCode");
		try {
			PrintWriter out = resp.getWriter();
			if(!checkCode.equals(checkCodeInput)){
				out.println("2");
				
			}
			else{
				
				UserBean userBean = new UserBean();
				
				BeanUtils.populate(userBean, req.getParameterMap());
				if(userDao.getByUsername(userBean.getUsername()) != null){
					out.println("1");
				}
				else{
					String salt = StringUtil.getRandomStr(8);
					userBean.setSalt(salt);
					userBean.setPassword(MD5Util.generalPasswordHash(userBean.getPassword(),salt));
					userBean.setCreateDate(DateUtil.getDate());
					userDao.add(userBean);
					System.out.println(userBean);
					out.println("3");
					
				}
			}
			out.flush();
			out.close();
		} catch (IOException | IllegalAccessException | InvocationTargetException | SQLException e1) {
			e1.printStackTrace();
		}
		
	}
	
	

}
