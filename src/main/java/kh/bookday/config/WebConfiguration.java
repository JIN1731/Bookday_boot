package kh.bookday.config;

import kh.bookday.interceptor.LoginValidator;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfiguration implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginValidator())
                .excludePathPatterns("/")
                .excludePathPatterns("/member/toSignup")
                .excludePathPatterns("/member/toLogin")
                .excludePathPatterns("/member/login")
                .excludePathPatterns("/member/signUp")
                .excludePathPatterns("/member/checkByNickname")
                .excludePathPatterns("/member/checkByPhone")
                .excludePathPatterns("/member/findUser")
                .excludePathPatterns("/member/createAuthNum")
                .excludePathPatterns("/member/doAuthNumMatch")
                .excludePathPatterns("/member/toUpdatePw")
                .excludePathPatterns("/member/updatePw")
                .excludePathPatterns("/member/kakaoLogin")
                .excludePathPatterns("/search/toSearch")
                .excludePathPatterns("/book/selectBookinfo")
                .excludePathPatterns("/error")
                .excludePathPatterns("/resources/**");

	}
}
