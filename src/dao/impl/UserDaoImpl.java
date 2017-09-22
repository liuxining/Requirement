package dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import dao.UserDao;
import domain.UserBean;
import utils.DataSourceUtil;

public class UserDaoImpl implements UserDao {

	@Override
	public UserBean getByUsername(String username) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from users where username=?";
		UserBean u = qr.query(sql, new BeanHandler<UserBean>(UserBean.class),username);
		return u;
	}

	@Override
	public void update(UserBean userBean) {
		
	}

	@Override
	public void add(UserBean userBean) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into users(username,password,salt,phone,department,createDate) values(?,?,?,?,?,?)";
		qr.update(sql, userBean.getUsername(),userBean.getPassword(),userBean.getSalt(),userBean.getPhone(),userBean.getDepartment(),userBean.getCreateDate());
	}

}
