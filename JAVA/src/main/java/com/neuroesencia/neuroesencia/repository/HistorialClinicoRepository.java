package com.neuroesencia.neuroesencia.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.neuroesencia.neuroesencia.entity.HistorialClinico;


import java.util.Optional;

@Repository
public interface HistorialClinicoRepository extends JpaRepository<HistorialClinico, Long> {

    Optional<HistorialClinico> findByPacienteUsuario(String usuario);
    
}