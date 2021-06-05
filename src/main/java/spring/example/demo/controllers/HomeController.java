package spring.example.demo.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import spring.example.demo.beans.Gender;
import spring.example.demo.beans.Login;
import spring.example.demo.beans.User;

import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String getHome() {
        System.out.println("you are in Home Directory");
        return "index";
    }


    @GetMapping("/GoToSearch")
    public String goToSearch() {
        System.out.println("you are in GoToSearch Controller");
        return "search";
    }


    @GetMapping("/goTologin")
    public String goToLogin(){
        System.out.println("You Are in Login Page");
        return "login";
    }


    @GetMapping("/goToRegister")
    public String goToRegister(){
        System.out.println("You Are in Register Page");
        return "register";
    }

  /*  @ModelAttribute("newuser")
    public User getDefaultUser(){
        return new User();
    }

    @ModelAttribute("genderItems")
    public List<String> getGenderItem(){
      // return Gender.values();
        return Arrays.asList(new String[]{"Male","Fmale","Other"});
    }

    @ModelAttribute("login")
    public Login getDefaultLogin(){
        return new Login();
    }
*/

}
