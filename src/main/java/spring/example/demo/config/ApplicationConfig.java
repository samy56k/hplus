package spring.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.format.FormatterRegistry;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ThemeResolver;
import org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.theme.CookieThemeResolver;
import org.springframework.web.servlet.theme.ThemeChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.ResourceBundleViewResolver;
import org.springframework.web.servlet.view.XmlViewResolver;
import spring.example.demo.convertors.StringToEnumConvertor;
import spring.example.demo.interceptors.LoggingInterceptor;

import java.util.Locale;
import java.util.concurrent.ThreadPoolExecutor;

@Configuration
@ComponentScan(basePackages = "spring.example.demo")
public class ApplicationConfig extends WebMvcConfigurationSupport {

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("css/**", "images/**", "js/**")
                .addResourceLocations("classpath:/static/css/", "classpath:/static/images/", "classpath:/static/js/");
    }

    @Bean
    public InternalResourceViewResolver jspViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setOrder(1);
        return viewResolver;
    }


    @Override
    protected void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new StringToEnumConvertor());
    }


    //*************** Async Thread in Spring *******************************888

    @Override
    protected void configureAsyncSupport(AsyncSupportConfigurer configurer) {
        configurer.setDefaultTimeout(5000);
        configurer.setTaskExecutor(mvcTaskExecuter());
    }

    @Bean
    public AsyncTaskExecutor mvcTaskExecuter() {
        ThreadPoolTaskExecutor threadPoolExecutor = new ThreadPoolTaskExecutor();
        threadPoolExecutor.setThreadNamePrefix("hplusapp-thread-");
        return threadPoolExecutor;
    }
//*************** Async Thread in Spring *******************************888

    //**************** View Resolver *************
    @Bean
    public XmlViewResolver xmlViewResolver() {
        XmlViewResolver viewResolver = new XmlViewResolver();
        viewResolver.setLocation(new ClassPathResource("views.xml"));
        viewResolver.setOrder(2);

        return viewResolver;
    }

    @Bean
    public ResourceBundleViewResolver resourceBundleViewResolver() {
        ResourceBundleViewResolver viewResolver = new ResourceBundleViewResolver();
        viewResolver.setBasename("view");
        viewResolver.setOrder(3);
        return viewResolver;
    }

//**************** View Resolver *************


    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        //if you want inceptor for a specific page
        //registry.addInterceptor(new LoggingInterceptor()).addPathPatterns("/login");

        //interceptor for all pages
        registry.addInterceptor(new LoggingInterceptor()).addPathPatterns("/*");

        //Class ThemeChangeIntercepter khodesh az vorodi queryparametr browser vorodi migire
        //exp ::::: ?theme=clent-theme2
        registry.addInterceptor(new ThemeChangeInterceptor());//'theme' is default query param name


        //customize local
        //  LocaleChangeInterceptor localeChangeInterceptor=new LocaleChangeInterceptor();
        //  localeChangeInterceptor.setParamName("somthing");
        registry.addInterceptor(new LocaleChangeInterceptor());//'locale' is default query parameter
        //example : ::: ?local=en    or  ?locale=fa
    }

    @Bean
    public ThemeResolver themeResolver() {
        CookieThemeResolver cookieThemeResolver = new CookieThemeResolver();
        cookieThemeResolver.setCookieName("theme");
        cookieThemeResolver.setDefaultThemeName("client-theme1");

        return cookieThemeResolver;
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
        cookieLocaleResolver.setDefaultLocale(Locale.US);
        cookieLocaleResolver.setCookieName("locale");
        return cookieLocaleResolver;
    }
}
