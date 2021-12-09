package com.site.ex.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
public class DB_config {

	@Bean  //DataSource를 가져와서 MyBatis와 연결
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);

		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/**/*.xml");
		sessionFactory.setMapperLocations(res);

		return sessionFactory.getObject();
	}

	@Bean //session정보 제공
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		System.out.println("sqlSessionFactory : " + sqlSessionFactory);
		return new SqlSessionTemplate(sqlSessionFactory);
	}

}
