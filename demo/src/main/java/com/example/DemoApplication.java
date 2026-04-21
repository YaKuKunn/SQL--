package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication // 这是一个超级魔法注解，告诉 Java：“我是 Spring Boot 的总闸！”
public class DemoApplication {

    public static void main(String[] args) {
        // 这行代码的作用是通电，正式启动整个服务器
        SpringApplication.run(DemoApplication.class, args);
    }
}