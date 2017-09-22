package utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mysql.jdbc.Statement;

/**
 * 2017年09月06日11:04:20 数据库连接池工具类
 * 
 * @author liuxining
 *
 */
public class DataSourceUtil {
	// 创建连接池
	private static DataSource dataSource = new ComboPooledDataSource();
	// 创建线程连接
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

	// 获取连接池对象
	public static DataSource getDataSource() {
		return dataSource;
	}

	// 从连接池获取连接
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	// 获取当前线程的连接
	public static Connection getCurrentConnection() throws SQLException {
		Connection conn = tl.get();
		if (conn == null) {
			conn = dataSource.getConnection();
			tl.set(conn);
		}
		return conn;
	}

	// 开启事务
	public static void startTransaction() throws SQLException {
		Connection conn = getCurrentConnection();
		if (conn != null) {
			// 设置为不自动提交
			conn.setAutoCommit(false);
		}
	}

	// 提交事务并释放连接
	public static void commitAndRelease() throws SQLException {
		Connection conn = getCurrentConnection();
		if (conn != null) {
			conn.commit();// 提交事务
			conn.close();// 释放连接
			tl.remove();
		}
	}

	// 关闭数据库操作对象
	public static void closeStatement(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 回滚事务
	public static void rollback() throws SQLException {
		Connection conn = getCurrentConnection();
		if (conn != null) {
			conn.rollback();// 回滚事务
		}
	}

	// 关闭结果集对象
	public static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 关闭数据库操作对象和结果集
	public static void closeStatementAndResultSet(Statement stmt, ResultSet rs) {
		closeResultSet(rs);
		closeStatement(stmt);
	}

	// 关闭连接对象
	public static void closeConnection() throws SQLException {
		Connection conn = getCurrentConnection();
		if (conn != null) {
			conn.close();
		}
	}
}
