package spring.example.demo.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import spring.example.demo.beans.Login;

@Controller
public class UserProfileController {

    @PostMapping("/userprofile")
    public String getUserProfile(@SessionAttribute("login") Login login, Model model ){
        System.out.println("In user Profile Controller....");
        System.out.println("user from session : "+login.getUsername());

        model.addAttribute("username",login.getUsername());

        return "profile";
    }

}
