package spring.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LogoutController {

    @GetMapping("/logout")
    public String logout(HttpSession session){
        System.out.println("Ending user session in logout Controller");
        session.invalidate();
        return "login";
    }
}
