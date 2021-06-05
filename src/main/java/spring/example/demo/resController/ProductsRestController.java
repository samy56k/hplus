package spring.example.demo.resController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import spring.example.demo.beans.Product;
import spring.example.demo.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ProductsRestController {

    @Autowired
    private ProductRepository productRepository;

    /*@GetMapping("/hplus/res/products")
    @ResponseBody
    public List<Product> getProducts(){
        List<Product> products=new ArrayList<>();
        productRepository.findAll().forEach(product -> products.add(product));
        return products;
    }*/


    @GetMapping("/hplus/res/products")
    public ResponseEntity getProductsByReqeustParam(@RequestParam("name") String name) {
        List<Product> products = productRepository.searchByName(name);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @GetMapping("/hplus/res/products/{name}")
    public ResponseEntity getProductByPathVariable(@PathVariable("name")String name){
        List<Product> products=productRepository.searchByName(name);
        return new ResponseEntity<>(products,HttpStatus.OK);

    }

}
