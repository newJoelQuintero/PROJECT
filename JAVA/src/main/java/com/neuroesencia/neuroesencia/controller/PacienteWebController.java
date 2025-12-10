package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException; // Para capturar error de llave foránea
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; // Para enviar mensajes de alerta

import com.neuroesencia.neuroesencia.entity.Paciente;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;

@Controller
public class PacienteWebController {

    @Autowired
    private PacienteRepository pacienteRepository;

    // 1. LISTAR PACIENTES
    @GetMapping("/pacientes")
    public String listarPacientes(Model model) {
        model.addAttribute("listaPacientes", pacienteRepository.findAll());
        return "pacientes"; 
    }

    // 2. MOSTRAR FORMULARIO NUEVO
    @GetMapping("/pacientes/nuevo")
    public String mostrarFormulario(Model model) {
        model.addAttribute("paciente", new Paciente());
        return "formulario_paciente"; 
    }

    // 3. GUARDAR PACIENTE
    @PostMapping("/pacientes/guardar")
    public String guardarPaciente(@ModelAttribute("paciente") Paciente paciente, RedirectAttributes redirectAttributes) {
        try {
            pacienteRepository.save(paciente);
            redirectAttributes.addFlashAttribute("mensaje", "Paciente guardado correctamente.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al guardar el paciente. Verifique los datos.");
        }
        return "redirect:/pacientes";
    }

    // 4. EDITAR PACIENTE
    @GetMapping("/pacientes/editar/{id}")
    public String editarPaciente(@PathVariable Long id, Model model) {
        Paciente paciente = pacienteRepository.findById(id).orElse(null);
        model.addAttribute("paciente", paciente);
        return "formulario_paciente"; 
    }

    // 5. ELIMINAR PACIENTE (MEJORADO CON PROTECCIÓN)
    @GetMapping("/pacientes/eliminar/{id}")
    public String eliminarPaciente(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            pacienteRepository.deleteById(id);
            // Si sale bien, enviamos mensaje de éxito (verde)
            redirectAttributes.addFlashAttribute("mensaje", "El paciente ha sido eliminado correctamente.");
        } catch (DataIntegrityViolationException e) {
            // Si falla por tener facturas/citas, enviamos mensaje de error específico (rojo)
            redirectAttributes.addFlashAttribute("error", "No se puede eliminar este paciente porque tiene HISTORIALES, CITAS o FACTURAS asociadas. Debes eliminar esos registros primero.");
        } catch (Exception e) {
            // Cualquier otro error inesperado
            redirectAttributes.addFlashAttribute("error", "Ocurrió un error inesperado al intentar eliminar.");
        }
        
        return "redirect:/pacientes";
    }
}