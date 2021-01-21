package ino.jpa.hongik;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class HongikApplication {

	public static void main(String[] args) {
		SpringApplication.run(HongikApplication.class, args);
	}

}
