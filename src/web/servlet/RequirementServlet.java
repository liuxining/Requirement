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
@WebServlet("/RequirementServlet")
public class RequirementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	}

	private void detail(HttpServletRequest req, HttpServletResponse resp) {
		int id = StringUtil.stringToInt(req.getParameter("id"));
		try {
			RequirementBean rBean = requirementDao.getById(id);
			req.setAttribute("requirementBean", rBean);
			req.getRequestDispatcher("detail.jsp").forward(req, resp);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("name");
		String statusStr = req.getParameter("status");
		int status = StringUtil.stringToInt(statusStr);
		int currentPage = StringUtil.stringToInt(req.getParameter("curentPage"));
		int count;
		try {
			count = requirementDao.getCount(name,status);
			PagingBean pagingBean = new PagingBean(count, currentPage, Constants.PAGE_SIZE);
			pagingBean.setPreUrl("");
			pagingBean.setAnd(true);
			List<RequirementBean> list = requirementDao.getAll(name,status,currentPage * Constants.PAGE_SIZE,Constants.PAGE_SIZE);
			req.setAttribute("reqList", list);
			req.getRequestDispatcher("list").forward(req, resp);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
	}

	private void add(HttpServletRequest req, HttpServletResponse resp) {
		RequirementBean rBean = new RequirementBean();
		String name = req.getParameter("name");
		String intro = req.getParameter("intro");
		String[] researchType = req.getParameterValues("researchType");
		String technicalRequirement = req.getParameter("technicalRequirement");
		String cooperationModel = req.getParameter("cooperationModel");
		String planAllInvest = req.getParameter("planAllInvest");
		String researchTypes = "";
		for (String item : researchType) {
			researchTypes += item + "#";
		}
		try {
			rBean.setName(name);
			rBean.setIntro(intro);
			rBean.setResearchType(researchTypes);
			rBean.setTechnicalRequirement(technicalRequirement);
			rBean.setCooperationModel(cooperationModel);
			rBean.setPlanAllInvest(Double.parseDouble(planAllInvest));
			rBean.setCraeteDate(DateUtil.getDate());
			requirementDao.add(rBean);
			resp.sendRedirect("addReq.jsp?status=1");
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

	
	
}
