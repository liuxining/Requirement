package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import dao.RequirementDao;
import domain.RequirementBean;
import utils.DataSourceUtil;

public class RequirementDaoImpl implements RequirementDao {

	/*
	 * private String name;
	private String intro;
	private String researchType;
	private String technicalRequirement;
	private String cooperationModel;
	private double planAllInvest;
	private String craeteDate;

	 */
	
	
	@Override
	public void add(RequirementBean rBean) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into technicalRequirement(name,intro,researchType,technicalRequirement,cooperationModel,planAllInvest,createDate) "
				+ "values(?,?,?,?,?,?,?)";
		qr.update(sql,rBean.getName(),rBean.getIntro(),rBean.getResearchType(),rBean.getTechnicalRequirement(),rBean.getCooperationModel(),rBean.getPlanAllInvest(),rBean.getCraeteDate());
	}

	@Override
	public int getCount(String name, int status) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from technicalRequirement where 1=1";
		if(name != null && name.length() > 0){
			sql += " and name='" + name + "'";
		}
		if(status != 0){
			sql += " and status=" + status;
		}
		int count = ((Long)qr.query(sql, new ScalarHandler<Long>())).intValue();
		return count;
		
	}

	@Override
	public List<RequirementBean> getAll(String name, int status, int start, int size) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from technicalRequirement where 1=1";
		if(name != null && name.length() > 0){
			sql += " and name='" + name + "'";
		}
		if(status != 0){
			sql += " and status=" + status;
		}
		sql += " limit " + start + "," + size;
		List<RequirementBean> list = qr.query(sql, new BeanListHandler<RequirementBean>(RequirementBean.class));
		return list;
		
	}

	@Override
	public RequirementBean getById(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from technicalRequirement where id=?";
		RequirementBean rBean = qr.query(sql, new BeanHandler<RequirementBean>(RequirementBean.class));
		return rBean;
	}

}
