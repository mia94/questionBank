package com.yi.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;


public class ImportService {
	@Autowired
	private DataSource ds;
	
	public void service() {	
		try (Connection con = ds.getConnection();	
				Statement stmt = con.createStatement()) {
			String tableName = "question"; 
			String filePath = "C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/question201901_5.csv";
			String sql = String.format("LOAD DATA LOCAL INFILE '%s' IGNORE INTO TABLE %s "
					+ "character set 'UTF8' "
					+ "fields TERMINATED by ',' ENCLOSED BY '\"' "
					+ "LINES TERMINATED BY '\\r\\n' "
					+ "IGNORE 1 lines "
					+ "(question_code, question_title, choice1, choice2, choice3, choice4, correct, state, correct_rate, picture,`year`,round, subject)",filePath, tableName);
			
			stmt.executeQuery(sql);
			System.out.println(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
