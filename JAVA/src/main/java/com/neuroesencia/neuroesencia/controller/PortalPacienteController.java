package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.neuroesencia.neuroesencia.entity.Cita;
import com.neuroesencia.neuroesencia.entity.FacturaVenta;

import com.neuroesencia.neuroesencia.entity.HistorialClinico; 

import com.neuroesencia.neuroesencia.repository.CitaRepository;
import com.neuroesencia.neuroesencia.repository.FacturaVentaRepository;

import com.neuroesencia.neuroesencia.repository.HistorialClinicoRepository;

import java.util.List;
import java.util.Optional;

@Controller
public class PortalPacienteController {

    @Autowired private CitaRepository citaRepository;
    @Autowired private FacturaVentaRepository facturaRepository;
    
    
    @Autowired private HistorialClinicoRepository historialRepository;

    
    @GetMapping("/citas/proxima")
    public String verMisCitas(Model model) {
        String usuarioLogueado = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Cita> misCitas = citaRepository.findByPacienteUsuario(usuarioLogueado);
        
        model.addAttribute("listaCitas", misCitas);
        return "paciente/mis_citas";
    }


    @GetMapping("/facturas/mis-pagos")
    public String verMisPagos(Model model) {
        String usuarioLogueado = SecurityContextHolder.getContext().getAuthentication().getName();
        List<FacturaVenta> misFacturas = facturaRepository.findByPacienteUsuario(usuarioLogueado);
        
        model.addAttribute("listaFacturas", misFacturas);
        return "paciente/mis_facturas";
    }

    @GetMapping("/historial/ver")
    public String verMiHistorial(Model model) {
        String usuarioLogueado = SecurityContextHolder.getContext().getAuthentication().getName();
        
        Optional<HistorialClinico> historialOpt = historialRepository.findByPacienteUsuario(usuarioLogueado);
        
        if (historialOpt.isPresent()) {
            model.addAttribute("historial", historialOpt.get());
            return "paciente/mi_historial";
        } else {
            return "redirect:/home/paciente?error=no-historial";
        }
    }
}