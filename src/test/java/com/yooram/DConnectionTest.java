package com.yooram;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

public class DConnectionTest {

	@Test
	public void test() throws ClassNotFoundException, SQLException {
		Class.forName("org.mariadb.jdbc.Driver"); //MariaDB
		String url = "jdbc:mariadb://172.30.1.48:3306/scott";
		Connection conn = DriverManager.getConnection(url, "scott", "1111");
		System.out.println("완");
		conn.close();
	}

}
