package spring.example.demo.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import spring.example.demo.beans.Login;
import spring.example.demo.beans.User;
import spring.example.demo.exceptions.ApplicationException;
import spring.example.demo.repository.UserRepository;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("login")
public class LoginController {
    @Autowired
    private UserRepository userRepository;

    @PostMapping("/Login")
    public String login(@ModelAttribute("login") Login login, HttpSession session) {

        //full session managment
        //with session object
        //session.setAttribute("key","value");
        //session.setAttribute();


        System.out.println("Send Login Form .....");
        User user = userRepository.searchByName(login.getUsername());
        if (user == null) {
            throw new ApplicationException("User not found");
        }
        return "forward:/userprofile";
    }

    @ExceptionHandler(ApplicationException.class)
    public String handelException(){
        System.out.println("you are in exception handler Login");
        return "error";
    }


}
