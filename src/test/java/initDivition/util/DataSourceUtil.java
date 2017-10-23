package initDivition.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;


public class DataSourceUtil {

	public static Connection getConnection(String dataSourceId) {
		ApplicationContext ct = new ClassPathXmlApplicationContext("applicationContext_test.xml");
		DriverManagerDataSource datasource = (DriverManagerDataSource) ct.getBean(dataSourceId);
		Connection con = null;
		try {
			con = datasource.getConnection();
			return con;
		} catch (SQLException e) {
			e.printStackTrace();
			return con;
		}
	}

	public static void closeConn(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeStmt(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeRs(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
