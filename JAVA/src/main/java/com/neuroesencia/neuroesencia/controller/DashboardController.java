package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.neuroesencia.neuroesencia.repository.CitaRepository;
import com.neuroesencia.neuroesencia.repository.EmpleadoRepository;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;
import com.neuroesencia.neuroesencia.repository.FacturaVentaRepository;

@Controller
public class DashboardController {

    @Autowired private PacienteRepository pacienteRepository;
    @Autowired private EmpleadoRepository empleadoRepository;
    
    
    @Autowired private CitaRepository citaRepository;
    @Autowired private FacturaVentaRepository facturaRepository;

    @GetMapping({"/dashboard", "/inicio"})
    public String mostrarDashboardAdmin(Model model) {
        
        
        model.addAttribute("totalPacientes", pacienteRepository.count());
        model.addAttribute("totalEmpleados", empleadoRepository.count());
        
        model.addAttribute("totalCitas", citaRepository.count());
        model.addAttribute("totalFacturas", facturaRepository.count());
        
        return "dashboard"; 
    }

    @GetMapping("/home/empleado")
    public String mostrarHomeEmpleado(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("nombreUsuario", auth.getName());
        
        return "home_empleado"; 
    }

    @GetMapping("/home/paciente")
    public String mostrarHomePaciente(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("nombrePaciente", auth.getName());
        
        return "home_paciente"; 
    }
}