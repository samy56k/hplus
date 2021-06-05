package spring.example.demo.convertors;

import org.springframework.core.convert.converter.Converter;
import spring.example.demo.beans.Gender;

public class StringToEnumConvertor implements Converter<String, Gender> {
    @Override
    public Gender convert(String s) {
       //s=s.toUpperCase();
        System.out.println("convertor is : "+s.toString());
        if (s.equals("MALE")) {
            System.out.println("convertor ......."+s.toString());
            return Gender.MALE;
        } else if (s.equals("FEMALE")) {
            System.out.println("convertor ......."+s.toString());
            return Gender.FEMALE;
        } else if (s.equals("OTHER")) {
            System.out.println("convertor ......."+s.toString());
            return Gender.OTHER;
        }
        return null;
    }

}
