package com.example;

import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin // 依然需要这个魔法注解，允许 React (5173端口) 访问
public class AuthController {

    /**
     * 接收前端 React 发来的登录请求
     */
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String, String> payload) {
        // 1. 从前端发来的 JSON 包裹里，取出账号和密码
        String username = payload.get("username");
        String password = payload.get("password");

        System.out.println("大堂经理收到登录请求，呼叫底层数据库... 账号: " + username);

        // 2. 【核心动作】直接调用你写好的 JDBC_study 里的静态 login 方法！
        boolean isSuccess = JDBC_study.login(username, password);

        // 3. 准备返回给前端的结果
        Map<String, Object> response = new HashMap<>();
        if (isSuccess) {
            response.put("success", true);
            response.put("message", "登录成功！欢迎来到全栈世界！");
        } else {
            response.put("success", false);
            response.put("message", "登录失败：用户名或密码错误哦");
        }

        return response; // SpringBoot 会自动把这个 Map 转成 JSON 发给 React
    }

    /**
     * 接收前端 React 发来的注册请求
     */
    @PostMapping("/register")
    public Map<String, Object> register(@RequestBody Map<String, String> payload) {
        String username = payload.get("username");
        String password = payload.get("password");
        // 假设前端表单里没有单独填邮箱，我们先给个默认邮箱格式防止报错
        String email = payload.containsKey("email") ? payload.get("email") : username + "@test.com";

        System.out.println("大堂经理收到注册请求，开始入库... 账号: " + username);

        // 2. 调用你的 JDBC_study 进行注册
        boolean isSuccess = JDBC_study.register(username, password, email);

        Map<String, Object> response = new HashMap<>();
        if (isSuccess) {
            response.put("success", true);
            response.put("message", "注册成功！快去登录吧！");
        } else {
            response.put("success", false);
            response.put("message", "注册失败：用户名可能已经被占用了");
        }

        return response;
    }
}