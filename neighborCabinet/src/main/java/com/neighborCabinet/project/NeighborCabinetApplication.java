package com.neighborCabinet.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.neighborCabinet.project"})
@MapperScan(basePackages = {"com.neighborCabinet.project"})
public class NeighborCabinetApplication {

	public static void main(String[] args) {
		SpringApplication.run(NeighborCabinetApplication.class, args);
	}

}
