package spring.example.demo.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import spring.example.demo.beans.User;
import spring.example.demo.repository.UserRepository;

import javax.validation.Valid;

@Controller
public class RegisterationController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/registeruser")
    public String registerUser(@Valid @ModelAttribute("newuser")User user,BindingResult result,Model model){
        System.out.println("in registration Page");

        if(result.hasErrors()){
            return "register";
        }
        userRepository.save(user);
        model.addAttribute("dataSaved","User Registereg Successfully!!!");
        return "login";
    }




}
