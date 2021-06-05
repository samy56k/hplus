package spring.example.demo.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RedirectionController {

    @GetMapping("/redirectToLinkedIn")
    public String redirectOut(){
        System.out.println("in Redirection Controller ... ");
        return "redirect:https://www.linkedin.com";
    }

}
