package com.demo.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/api/hello")
    public String hello() {
        return "Hello from CI/CD demo app!";
    }

    @GetMapping("/api/health")
    public String health() {
        return "UP";
    }
}
