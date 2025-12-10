package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.neuroesencia.neuroesencia.entity.Paciente;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;

@Controller
public class RegistroController {

    @Autowired
    private PacienteRepository pacienteRepository;

    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("paciente", new Paciente());
        return "registro"; 
    }

    @PostMapping("/registro/guardar")
    public String registrarPaciente(@ModelAttribute("paciente") Paciente paciente) {
  
   
        
        try {
            pacienteRepository.save(paciente);
            
            
            return "redirect:/login?registrado";
        } catch (Exception e) {
          
            
            return "redirect:/registro?error";
        }
    }
}