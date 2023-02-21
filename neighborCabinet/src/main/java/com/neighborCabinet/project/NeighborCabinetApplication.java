package com.neighborCabinet.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.apache.catalina.connector.Connector;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@PropertySources({
		@PropertySource(value="file:c:/springWorkspace/configure.properties", ignoreResourceNotFound=true),
		@PropertySource(value="file:/usr/local/project/properties/configure.properties", ignoreResourceNotFound=true)
})

@MapperScan(basePackages = {"com.neighborCabinet.project"})
public class NeighborCabinetApplication {

	public static void main(String[] args) {
		SpringApplication.run(NeighborCabinetApplication.class, args);
	}
	
	@Bean    
	public ServletWebServerFactory serveltContainer(){       
		TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();        
		tomcat.addAdditionalTomcatConnectors(createStandardConnector());       
		return tomcat;    
	}    
	
	private Connector createStandardConnector(){        
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");        
		connector.setPort(8080);        
		return connector;  
	}

}
