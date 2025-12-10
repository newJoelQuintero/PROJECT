package com.neuroesencia.neuroesencia.security; 

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;

import java.io.IOException;
import java.util.Collection;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private final RequestCache requestCache = new HttpSessionRequestCache();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        
    
        requestCache.removeRequest(request, response);

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        String redirectUrl = "/login?error"; 

        for (GrantedAuthority authority : authorities) {
            String role = authority.getAuthority();
            
           
            if (role.contains("ADMINISTRADOR")) {
                redirectUrl = "/home/empleado"; 
                break; 
            }
            if (role.contains("PSICOLOGO") || role.contains("SECRETARIA")) {
                redirectUrl = "/home/empleado";
                break; 
            }
            if (role.contains("PACIENTE")) {
                redirectUrl = "/home/paciente";
                break;
            }
        }
        
        response.sendRedirect(request.getContextPath() + redirectUrl);
    }
}