package dao;

import java.sql.SQLException;
import java.util.List;

import domain.RequirementBean;

public interface RequirementDao {

	void add(RequirementBean rBean) throws SQLException;

	int getCount(String name, int status) throws SQLException;

	List<RequirementBean> getAll(String name, int status, int i, int pageSize) throws SQLException;

	RequirementBean getById(int id) throws SQLException;

	void shenHe(int id,String suggest, int status) throws SQLException;


}
