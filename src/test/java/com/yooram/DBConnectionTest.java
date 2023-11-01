package com.yooram;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionTest {

	public void ConnectionTest() throws Exception{
		Class.forName("org.mariadb.jdbc.Driver"); //MariaDB
		String url = "jdbc:mariadb://localhost:3306";
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		//String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = DriverManager.getConnection(url, "scott", "1111");
		conn.close();
	}
}
