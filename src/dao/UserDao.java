package dao;

import java.sql.SQLException;

import domain.UserBean;

public interface UserDao {

	UserBean getByUsername(String username) throws SQLException;

	void update(UserBean userBean);

	void add(UserBean userBean) throws SQLException;

}
