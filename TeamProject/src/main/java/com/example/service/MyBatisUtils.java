package com.example.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtils {

	private static SqlSessionFactory sqlSessionFactory;

	static {
		try (InputStream is = Resources.getResourceAsStream("mybatis-config.xml")) {
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // static

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
