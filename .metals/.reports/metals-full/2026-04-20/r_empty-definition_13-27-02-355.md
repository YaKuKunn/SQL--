error id: file:///X:/SQL学习/demo/src/main/java/com/example/HelloController.java:org/springframework/web/bind/annotation/RestController#
file:///X:/SQL学习/demo/src/main/java/com/example/HelloController.java
empty definition using pc, found symbol in pc: org/springframework/web/bind/annotation/RestController#
empty definition using semanticdb
empty definition using fallback
non-local guesses:

offset: 188
uri: file:///X:/SQL学习/demo/src/main/java/com/example/HelloController.java
text:
```scala
package com.example;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.@@RestController;

@RestController
@CrossOrigin // 加上这个，是为了允许你的 React 前端（5173端口）来拜访你的 Java 后端（8080端口）
public class HelloController {

    // 设定一个暗号（网址）
    @GetMapping("/api/hello")
    public String sayHello() {
        return "丫堀困你好！我是你的 Spring Boot 后端服务器，我已经成功复活啦！";
    }
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: org/springframework/web/bind/annotation/RestController#