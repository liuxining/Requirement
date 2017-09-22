package web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import dao.RequirementDao;
import dao.impl.RequirementDaoImpl;
import domain.PagingBean;
import domain.RequirementBean;
import utils.Constants;
import utils.DateUtil;
import utils.StringUtil;

/**
 * Servlet implementation class RequirementServlet
 */
@WebServlet("/requirementServlet")
public class RequirementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger(RequirementServlet.class.getName());
	private RequirementDao requirementDao = new RequirementDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequirementServlet() {
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
		else if("list".equals(method)){
			list(req,resp);
		}
		else if("detail".equals(method)){
			detail(req,resp);
		}
		else if("shenHe".equals(method)){
			shenHe(req,resp);
		}
	}

	private void shenHe(HttpServletRequest req, HttpServletResponse resp) {
		int id = StringUtil.stringToInt(req.getParameter("id"));
		int status2 = StringUtil.stringToInt(req.getParameter("status2"));
		String suggest = req.getParameter("suggest");
		String currentPage = req.getParameter("currentPage");
		String name = req.getParameter("name");
		RequirementBean rBean;
		try {
			rBean = requirementDao.getById(id);
			rBean.setStatus(status2);
			rBean.setSuggest(suggest);
			log.info(rBean);
			requirementDao.shenHe(id,suggest,status2);
			resp.sendRedirect("requirementServlet?method=list&to=index_list1Requirement&status2=1&currentPage=" + currentPage + "&name=" + name);
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		
	}


	private void detail(HttpServletRequest req, HttpServletResponse resp) {
		int id = StringUtil.stringToInt(req.getParameter("id"));
		String to = req.getParameter("to");
		String currentPage = req.getParameter("currentPage");
		String name = req.getParameter("name");
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("name", name);
		try {
			RequirementBean rBean = requirementDao.getById(id);
			req.setAttribute("reqBean", rBean);
			to = to.replace("_", "/") + ".jsp";
			req.getRequestDispatcher(to).forward(req, resp);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("name");
		String status2Str = req.getParameter("status2");
		String to = req.getParameter("to");
		int status2 = StringUtil.stringToInt(status2Str);
		int currentPage = StringUtil.stringToInt(req.getParameter("currentPage"));
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("name", name);
		log.info("获取到的参数为：currentPage=" + currentPage);
		int count;
		if(name != null){
			log.info("name:" + name);
		}
		try {
			count = requirementDao.getCount(name,status2);
			log.info("count:" + count);
			PagingBean pagingBean = new PagingBean(count, currentPage, Constants.PAGE_SIZE);
			pagingBean.setPreUrl(req.getContextPath() + "/requirementServlet?method=list&status2=" + status2 + "&to=" + to + (name == null ? "" : ("&name=" + name)));
			pagingBean.setAnd(true);
			List<RequirementBean> list = requirementDao.getAll(name,status2,currentPage * Constants.PAGE_SIZE,Constants.PAGE_SIZE);
			req.setAttribute("requirementList", list);
			req.setAttribute("pagingMsg", pagingBean.getHtmlMsg());
			log.info("list:" + list);
			log.info("pagingMsg:" + pagingBean.getHtmlMsg());
			to = to.replace("_", "/") + ".jsp" + (name != null ? ("?name=" + name) : "");
			req.getRequestDispatcher(to).forward(req, resp);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
	}

	private void add(HttpServletRequest req, HttpServletResponse resp) {
		RequirementBean rBean = new RequirementBean();
		String name = req.getParameter("name");
		String intro = req.getParameter("intro");
		String[] researchType = req.getParameterValues("researchType");
		String cooperationModel = req.getParameter("cooperationModel");
		String planAllInvest = req.getParameter("planAllInvest");
		String researchTypes = "";
		for (String item : researchType) {
			researchTypes += item + "_";
		}
		try {
			rBean.setName(name);
			rBean.setIntro(intro);
			rBean.setResearchType(researchTypes);
			rBean.setCooperationModel(StringUtil.stringToInt(cooperationModel));
			rBean.setPlanAllInvest(Double.parseDouble(planAllInvest));
			rBean.setCreateDate(DateUtil.getDate());
			rBean.setStatus(1);
			
			requirementDao.add(rBean);
			resp.sendRedirect("index/addRequirement.jsp?status=1");
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

	
	
}
