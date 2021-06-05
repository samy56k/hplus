package spring.example.demo.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.example.demo.beans.Product;
import spring.example.demo.repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;

@Controller
public class SearchController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/search")
    public Callable<String> search(
            @RequestParam("search") String search, Model model, HttpServletRequest request) {
        System.out.println("you are in Serach Controller");
        System.out.println("Search key is : " + search);
        System.out.println("request.isAsyncSupported() : " + request.isAsyncSupported());
        System.out.println("Thread from the Servlet Container :" + Thread.currentThread().getName());

        return () -> {
            Thread.sleep(3000);
            System.out.println("Thread from the Spring mvc task executar "+Thread.currentThread().getName());
            List<Product> productsList;//=new ArrayList<>();
            productsList = productRepository.searchByName(search);
            model.addAttribute("Products", productsList);
            return "search";
        };

/*        System.out.println("productsList.isEmpty() ::::::: "+productsList.isEmpty());
        System.out.println(productsList);
        if(!productsList.isEmpty()){
            System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
         Iterator iterator=productsList.iterator();
            System.out.println(iterator.next().toString());
        }*/

    }

}
