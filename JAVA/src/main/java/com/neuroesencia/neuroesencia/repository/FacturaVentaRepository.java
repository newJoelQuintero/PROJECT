package com.neuroesencia.neuroesencia.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.neuroesencia.neuroesencia.entity.FacturaVenta;


import java.util.List; 

@Repository

public interface FacturaVentaRepository extends JpaRepository<FacturaVenta, Long> {
   
    List<FacturaVenta> findByPacienteUsuario(String usuario);
    
}