package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;
import com.neuroesencia.neuroesencia.entity.Paciente;
import java.util.List;

@RestController
@RequestMapping("/api/pacientes") 
public class PacienteController {

    @Autowired
    private PacienteRepository pacienteRepository;

    @GetMapping
    public List<Paciente> listarPacientes() {
        return pacienteRepository.findAll();
    }
    
    @PostMapping
    public Paciente guardarPaciente(@RequestBody Paciente paciente) {
        return pacienteRepository.save(paciente);
    }
}