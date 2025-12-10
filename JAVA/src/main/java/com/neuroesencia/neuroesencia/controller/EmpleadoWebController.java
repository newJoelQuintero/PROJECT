package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException; // Importar Excepción
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; // Importar RedirectAttributes

import com.neuroesencia.neuroesencia.entity.Empleado;
import com.neuroesencia.neuroesencia.repository.EmpleadoRepository;
import com.neuroesencia.neuroesencia.repository.RolRepository;

@Controller
public class EmpleadoWebController {

    @Autowired
    private EmpleadoRepository empleadoRepository;

    @Autowired
    private RolRepository rolRepository; 

    // LISTAR
    @GetMapping("/empleados")
    public String listarEmpleados(Model model) {
        model.addAttribute("listaEmpleados", empleadoRepository.findAll());
        return "empleados";
    }

    // NUEVO
    @GetMapping("/empleados/nuevo")
    public String mostrarFormulario(Model model) {
        model.addAttribute("empleado", new Empleado()); 
        model.addAttribute("listaRoles", rolRepository.findAll()); 
        return "formulario_empleado"; 
    }

    // GUARDAR
    @PostMapping("/empleados/guardar")
    public String guardarEmpleado(@ModelAttribute("empleado") Empleado empleado, RedirectAttributes redirectAttributes) {
        try {
            empleadoRepository.save(empleado);
            redirectAttributes.addFlashAttribute("mensaje", "Empleado guardado exitosamente.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al guardar el empleado.");
        }
        return "redirect:/empleados"; 
    }
    
    // EDITAR
    @GetMapping("/empleados/editar/{id}")
    public String editarEmpleado(@PathVariable Integer id, Model model) {
        Empleado empleadoExistente = empleadoRepository.findById(id).orElse(null);
        model.addAttribute("listaRoles", rolRepository.findAll());
        model.addAttribute("empleado", empleadoExistente);
        return "formulario_empleado"; 
    }

    // ELIMINAR (MEJORADO)
    @GetMapping("/empleados/eliminar/{id}")
    public String eliminarEmpleado(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        try {
            empleadoRepository.deleteById(id);
            // Mensaje Éxito (Verde)
            redirectAttributes.addFlashAttribute("mensaje", "El empleado ha sido eliminado correctamente.");
        } catch (DataIntegrityViolationException e) {
            // Mensaje Error Específico (Rojo)
            redirectAttributes.addFlashAttribute("error", "No se puede eliminar a este empleado porque tiene FACTURAS o CITAS registradas a su nombre. Debe reasignar esos registros primero.");
        } catch (Exception e) {
            // Mensaje Error Genérico
            redirectAttributes.addFlashAttribute("error", "Ocurrió un error inesperado al intentar eliminar.");
        }
        
        return "redirect:/empleados";
    }
}