package com.neuroesencia.neuroesencia.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                
                .requestMatchers(
                    "/",              
                    "/login",        
                    "/error",         
                    
                    
                    "/registro", 
                    "/registro/**", 

                  
                    "/servicios", 
                    "/portafolio",

                   
                    "/css/**", "/CSS/**", 
                    "/js/**", "/SCRIPT/**",
                    "/images/**", "/IMG/**",
                    "/PORTAFOLIO/**",    
                    "/PAGINAS ERROR/**",   
                    "/CITAS/**",           
                    "/FORMULARIO/**"       
                ).permitAll()

                .requestMatchers("/home/paciente/**").hasAuthority("PACIENTE")
                .requestMatchers("/citas/proxima", "/facturas/mis-pagos", "/historial/ver").hasAuthority("PACIENTE")

                .requestMatchers("/home/empleado/**").hasAnyAuthority("ADMINISTRADOR", "PSICOLOGO", "SECRETARIA")
                .requestMatchers("/facturas/**", "/citas/**", "/historial/**", "/empleados/**", "/pacientes/**", "/dashboard/**").hasAnyAuthority("ADMINISTRADOR", "PSICOLOGO", "SECRETARIA")

                .anyRequest().authenticated()
            )
            .formLogin(login -> login
                .loginPage("/login")
                .successHandler(customAuthenticationSuccessHandler())
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            );
        
        return http.build();
    }

    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return new CustomAuthenticationSuccessHandler();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
      
        return NoOpPasswordEncoder.getInstance();
    }
}