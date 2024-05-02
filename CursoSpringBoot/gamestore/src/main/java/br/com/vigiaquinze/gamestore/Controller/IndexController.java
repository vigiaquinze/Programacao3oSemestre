package br.com.vigiaquinze.gamestore.Controller;

import org.springframework.web.bind.annotation.GetMapping;

public class IndexController {
    @GetMapping("/")
    public String getIndex() {
        return "index";
    }
    
    @GetMapping("/home")
    public String getHome() {
        return "index";
    }

}
