package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; // Importante para las alertas

import com.neuroesencia.neuroesencia.entity.HistorialClinico;
import com.neuroesencia.neuroesencia.repository.HistorialClinicoRepository;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;
import com.neuroesencia.neuroesencia.repository.EmpleadoRepository;

@Controller
public class HistorialWebController {

    @Autowired
    private HistorialClinicoRepository historialRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    @Autowired
    private EmpleadoRepository empleadoRepository;

    // 1. LISTAR HISTORIALES
    @GetMapping("/historiales")
    public String listarHistoriales(Model model) {
        model.addAttribute("listaHistoriales", historialRepository.findAll());
        return "historiales";
    }

    // 2. MOSTRAR FORMULARIO (NUEVO)
    @GetMapping("/historiales/nuevo")
    public String mostrarFormulario(Model model) {
        model.addAttribute("historial", new HistorialClinico());
        // Cargar listas para los selectores (dropdowns)
        model.addAttribute("listaPacientes", pacienteRepository.findAll());
        model.addAttribute("listaEmpleados", empleadoRepository.findAll());
        return "formulario_historial";
    }

    // 3. GUARDAR (CON ALERTAS)
    @PostMapping("/historiales/guardar")
    public String guardarHistorial(@ModelAttribute("historial") HistorialClinico historial, RedirectAttributes redirectAttributes) {
        try {
            historialRepository.save(historial);
            redirectAttributes.addFlashAttribute("mensaje", "Historial clínico guardado exitosamente.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Ocurrió un error al guardar el registro. Verifique los datos.");
        }
        return "redirect:/historiales";
    }

    // 4. EDITAR (FALTABA ESTE MÉTODO)
    @GetMapping("/historiales/editar/{id}")
    public String editarHistorial(@PathVariable Long id, Model model) {
        HistorialClinico historial = historialRepository.findById(id).orElse(null);
        
        model.addAttribute("historial", historial);
        model.addAttribute("listaPacientes", pacienteRepository.findAll());
        model.addAttribute("listaEmpleados", empleadoRepository.findAll());
        
        return "formulario_historial";
    }

    // 5. ELIMINAR (CON PROTECCIÓN)
    @GetMapping("/historiales/eliminar/{id}")
    public String eliminarHistorial(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            historialRepository.deleteById(id);
            redirectAttributes.addFlashAttribute("mensaje", "Registro clínico eliminado correctamente.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "No se puede eliminar este registro. Puede estar vinculado a otros datos.");
        }
        return "redirect:/historiales";
    }
}