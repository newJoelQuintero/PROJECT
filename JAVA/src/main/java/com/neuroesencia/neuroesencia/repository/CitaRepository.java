package com.neuroesencia.neuroesencia.repository;

import com.neuroesencia.neuroesencia.entity.Cita;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List; 

public interface CitaRepository extends JpaRepository<Cita, Long> {
    
    Optional<Cita> findByHoraCita(LocalDateTime horaCita);

    
    
    List<Cita> findByPacienteUsuario(String usuario);
    
}