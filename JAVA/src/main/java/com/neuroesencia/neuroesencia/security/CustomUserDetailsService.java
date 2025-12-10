package com.neuroesencia.neuroesencia.security;

import com.neuroesencia.neuroesencia.entity.Empleado;
import com.neuroesencia.neuroesencia.entity.Paciente;
import com.neuroesencia.neuroesencia.repository.EmpleadoRepository;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Optional;


@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private EmpleadoRepository empleadoRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
        
        Optional<Empleado> empleadoOpt = empleadoRepository.findByUsuario(username);

        if (empleadoOpt.isPresent()) {
            Empleado empleado = empleadoOpt.get();
            String roleName = empleado.getRol() != null ? empleado.getRol().getNombreRol().toUpperCase() : "EMPLEADO_SIN_ROL";

           
            return org.springframework.security.core.userdetails.User.builder()
                .username(empleado.getUsuario())
                .password(empleado.getContrasena()) 
                .authorities(roleName)
                .build();
        }

        
        Optional<Paciente> pacienteOpt = pacienteRepository.findByUsuario(username);

        if (pacienteOpt.isPresent()) {
            Paciente paciente = pacienteOpt.get();
            
      
            return org.springframework.security.core.userdetails.User.builder()
                .username(paciente.getUsuario())
                .password(paciente.getContrasena())
                .authorities("PACIENTE")
                .build();
        }

        throw new UsernameNotFoundException("Usuario no encontrado: " + username);
    }
}