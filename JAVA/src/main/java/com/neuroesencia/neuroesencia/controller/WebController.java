package com.neuroesencia.neuroesencia.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String paginaInicio() {
        return "index";
    }

    @GetMapping("/servicios")
    public String servicios() {
        return "servicios"; 
    }

    @GetMapping("/portafolio") 
    public String portafolio() {
        return "portafolio"; 
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}