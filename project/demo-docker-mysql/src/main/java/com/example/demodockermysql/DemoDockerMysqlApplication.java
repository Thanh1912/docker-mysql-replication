package com.example.demodockermysql;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.example.demodockermysql")
@Configuration
public class DemoDockerMysqlApplication {
	public static void main(String[] args) {
		SpringApplication.run(DemoDockerMysqlApplication.class, args);
	}
}
