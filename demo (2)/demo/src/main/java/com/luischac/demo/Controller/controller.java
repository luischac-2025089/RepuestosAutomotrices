package com.luischac.demo.Controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class controller {
    @GetMapping ("/Controller")
    public String Controller() {return "Hola mundo";}
    
}
