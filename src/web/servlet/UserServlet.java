package web.servlet;

import java.io.IOException;
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
@WebServlet("/UserServlet")
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
	}

	private void modifyPassword(HttpServletRequest req, HttpServletResponse resp) {
		String password = req.getParameter("password");
		String newpassword = req.getParameter("newpassword");
		try {
			UserBean loginUserBean = (UserBean) req.getSession().getAttribute("loginUserBean");
			if(MD5Util.verifyPassword(password, loginUserBean.getSalt(), loginUserBean.getPassword())){
				//旧密码验证成功
				String salt = StringUtil.getRandomStr(8);
				loginUserBean.setSalt(salt);
				loginUserBean.setPassword(MD5Util.generalPasswordHash(newpassword, salt));
				userDao.update(loginUserBean);
				resp.sendRedirect("modifyPassword.jsp?status=1");
			}
			else{
				//旧密码验证失败
				resp.sendRedirect("modifyPassword.jsp?status=3");
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void login(HttpServletRequest req, HttpServletResponse resp) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UserBean userBean;
		try {
			userBean = userDao.getByUsername(username);
			if(userBean != null){
				if(MD5Util.verifyPassword(password,userBean.getSalt(),userBean.getPassword())){
					log.debug("账号 " + username + " 登录成功");
					req.getSession().setAttribute("loginUserBean", userBean);
					resp.sendRedirect("index.jsp");
				}
				else{
					log.debug("账号" + username + "密码错误");
					resp.sendRedirect("login.jsp?status=2");
					
				}
			}
			else{
				log.debug("账号" + username + "不存在");
				resp.sendRedirect("login.jsp?status=1");
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

	private void add(HttpServletRequest req, HttpServletResponse resp) {
		UserBean userBean = new UserBean();
		try {
			BeanUtils.populate(userBean, req.getParameterMap());
			if(userBean.getId() != 0){
				//更新
				userDao.update(userBean);
			}
			else{
				//添加
				String salt = StringUtil.getRandomStr(8);
				userBean.setSalt(salt);
				userBean.setPassword(MD5Util.generalPasswordHash(userBean.getPassword(),salt));
				userBean.setCreateDate(DateUtil.getDate());
				userDao.add(userBean);
				System.out.println(userBean);
				resp.sendRedirect("login.jsp?status=1");
			}
		} catch (IllegalAccessException | InvocationTargetException | SQLException | IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
