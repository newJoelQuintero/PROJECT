package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.neuroesencia.neuroesencia.repository.EmpleadoRepository;
import com.neuroesencia.neuroesencia.entity.Empleado;
import java.util.List;

@RestController 
@RequestMapping("/api/empleados")
public class EmpleadoController {

    @Autowired 
    private EmpleadoRepository empleadoRepository;

    @GetMapping 
    public List<Empleado> listarTodos() {
        return empleadoRepository.findAll();
    }
}