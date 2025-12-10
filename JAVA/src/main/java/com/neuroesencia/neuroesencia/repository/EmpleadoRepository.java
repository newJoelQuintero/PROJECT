package com.neuroesencia.neuroesencia.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.neuroesencia.neuroesencia.entity.Empleado;
import java.util.Optional;

@Repository
public interface EmpleadoRepository extends JpaRepository<Empleado, Integer> {
    
    
 
    Optional<Empleado> findByUsuario(String usuario);
}