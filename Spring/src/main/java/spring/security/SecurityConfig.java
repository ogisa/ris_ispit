package spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
 	UserDetailsService userDetailsService;
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}


	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	   auth.userDetailsService(userDetailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

	   http.authorizeRequests().
	   antMatchers("/","/loginPage").permitAll().
	   antMatchers("/admin/**","/controllerS/admin/**").hasRole("1").
	   antMatchers("/users/**","/controllerS/users/**").hasAnyRole("2","1").
	   and().formLogin().
	   loginPage("/login.jsp").
	   loginProcessingUrl("/login").
	   defaultSuccessUrl("/controllerS/users/login").failureForwardUrl("/error.jsp").and().
	   logout().invalidateHttpSession(true).logoutSuccessUrl("/login.jsp").and().
	   exceptionHandling().accessDeniedPage("/access_denied.jsp").
	   and().rememberMe().
	   and().csrf().disable();
	}



	

	
	

}