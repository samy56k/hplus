package spring.example.demo.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ApplicationExceptionHandler {


    @ExceptionHandler(ApplicationException.class)
    public String handelException() {
        System.out.println("you are in Global exception handler...");
        return "error";
    }

    @ExceptionHandler(LoginFailaureException.class)
    public ResponseEntity handleLoginfailure(LoginFailaureException ex) {
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(ex.getMessage());
    }

}
