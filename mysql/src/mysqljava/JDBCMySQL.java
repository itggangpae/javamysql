package mysqljava;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCMySQL {
	static final String sid = "sample";
	static final String id = "root";
	static final String pass = "wnddkd";

	public static void main(String[] args) {

		// 1. MySql 데이타베이스 드라이버 로딩
		System.out.println("MySql JDBC 드라이버 로딩중...");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("MySql JDBC 드라이버 로딩 성공...");

		} catch (ClassNotFoundException e) {
			System.out.println("MySql JDBC 드라이버 로딩 실패...");
			System.out.println(e.getMessage());
			System.exit(0);
		}
		// 2. MySql 데이타베이스 서버 접속
		Connection connection = null;
		try {
			// 접속할 데이타베이스의 URL을 만든다.
			String url = "jdbc:mysql://localhost:3306/" + sid;
			// 접속한다(Login)
			connection = DriverManager.getConnection(url, id, pass);
			System.out.println("접속 / 로그인 성공");
		} catch (Exception e) {
			System.out.println("접속 / 로그인 실패");
			System.out.println(e.getMessage());
		}

		// 3. 연결을 종료한다.
		try {
			connection.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
