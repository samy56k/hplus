package spring.example.demo.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import spring.example.demo.beans.Gender;
import spring.example.demo.beans.Login;
import spring.example.demo.beans.User;

import java.util.Arrays;
import java.util.List;

@ControllerAdvice
public class DefaultModelAttributeController {

    @ModelAttribute("newuser")
    public User getDefaultUser(){
        return new User();
    }

    @ModelAttribute("genderItems")
    public List<String> getGenderItem(){
        // return Gender.values();
        return Arrays.asList(new String[]{Gender.MALE.toString(),
                                            Gender.FEMALE.toString(),
                                                Gender.OTHER.toString()});
    }

    @ModelAttribute("login")
    public Login getDefaultLogin(){
        return new Login();
    }


}
