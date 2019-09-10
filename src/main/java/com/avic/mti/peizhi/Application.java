package com.avic.mti.peizhi;

import java.util.TimeZone;
import javax.annotation.PostConstruct;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class Application {

  private static final String PEIZHI_TIME_ZONE = "Asia/Shanghai";

  public static void main(String[] args) {
    TimeZone.setDefault(TimeZone.getTimeZone(PEIZHI_TIME_ZONE));
    SpringApplication.run(Application.class, args);
  }

  @PostConstruct
  public void setDefaultTimezone() {
    TimeZone.setDefault(TimeZone.getTimeZone(PEIZHI_TIME_ZONE));
  }
}
