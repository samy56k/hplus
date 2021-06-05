package spring.example.demo.resController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import spring.example.demo.beans.Login;
import spring.example.demo.beans.User;
import spring.example.demo.repository.UserRepository;

import javax.security.auth.login.LoginException;

@RestController
public class LoginRestController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/hplus/rest/loginuser")
    public ResponseEntity loginUser(@RequestBody Login login) throws LoginException {

        System.out.println("Request for RestController Login ....");
        System.out.println(login.getUsername()+ " "+login.getPassword());
        User user=userRepository.searchByName(login.getUsername());

        if(user==null){
           // return ResponseEntity.status(404).build();
            return new ResponseEntity("user not found", HttpStatus.NOT_FOUND);
        }
        if(user.getUsername().equals(login.getUsername())&&
                user.getPassword().equals(login.getPassword()))
        {
            return new ResponseEntity("Welcome "+user.getUsername(),HttpStatus.OK);
        }
        else{
            //throw new Exception
            throw new LoginException("Invalid Username Or Password");
        }



    }

}
