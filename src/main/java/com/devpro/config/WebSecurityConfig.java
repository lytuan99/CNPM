package com.devpro.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
 
	
	// hàm này sẽ set cái passwordEncoder cho cái đối tượng user được trả về từ cái serviceUser
    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
          .withUser("user1").password(passwordEncoder().encode("1234")).roles("USER")
          .and()
          .withUser("user2").password(passwordEncoder().encode("1234")).roles("USER")
          .and()
          .withUser("lytuan").password(passwordEncoder().encode("lytuan99")).roles("ADMIN"); 
    }
 
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.csrf().disable();           // disable bỏ cái đăng nhập khi vừa mới truy cập vào localhost
        // Các trang không yêu cầu login
        http.authorizeRequests().antMatchers("/**").permitAll();
        
        // Trang "..." yêu cầu phải login với vai trò ROLE_USER hoặc ROLE_ADMIN
        // Nếu chưa login, nó sẽ redirect tới trang /login

        
        //Trang chỉ dành cho ADMIN
        http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
        
        // Khi người dùng đã login, với vai trò ROLE_USER
        // Nhưng truy cập vào trang vai trò ROLE_ADMIN,
        // Ngoại lệ AccessDeniedException sẽ ném ra.
        
//        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
        
        // Cấu hình cho login form.
        http.authorizeRequests().and().formLogin()
        	//Submit URL của trang login
        .loginPage("/login")
        .loginProcessingUrl("/perform_login")
        .defaultSuccessUrl("/admin/list-user",true)  // đường dẫn tới trang đăng nhập thành công
        .failureUrl("/login?error=true")  // đường dẫn tới trang đăng nhập thất bại
        .usernameParameter("uname")
        .passwordParameter("psw")
        //Cấu hình cho Logout Page
        .and()
        .logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful")
        .deleteCookies("JSESSIONID");
        
        
 
    }
     
    @Bean
    public PasswordEncoder passwordEncoder() {  // mã hóa password thành các chuỗi ký tự lằng nhằng
        return new BCryptPasswordEncoder();
    }
}
