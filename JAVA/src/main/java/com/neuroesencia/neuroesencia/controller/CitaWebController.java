package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException; // Importante para el error de llave foránea
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; 

import com.neuroesencia.neuroesencia.entity.Cita;
import com.neuroesencia.neuroesencia.repository.CitaRepository;
import com.neuroesencia.neuroesencia.repository.PacienteRepository;
import com.neuroesencia.neuroesencia.repository.ServicioRepository;

import java.time.LocalDateTime;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.Optional;

@Controller
public class CitaWebController {

    @Autowired
    private CitaRepository citaRepository;

    @Autowired
    private PacienteRepository pacienteRepository;  

    @Autowired
    private ServicioRepository servicioRepository;  

    // LISTAR CITAS
    @GetMapping("/citas")
    public String listarCitas(Model model) {
        model.addAttribute("listaCitas", citaRepository.findAll());
        return "citas";
    }

    // MOSTRAR FORMULARIO
    @GetMapping("/citas/nueva")
    public String mostrarFormulario(Model model) {
        model.addAttribute("cita", new Cita());
        model.addAttribute("listaPacientes", pacienteRepository.findAll());
        model.addAttribute("listaServicios", servicioRepository.findAll());
        return "formulario_cita";
    }

    // GUARDAR CITA (CON TUS VALIDACIONES)
    @PostMapping("/citas/guardar")
    public String guardarCita(@ModelAttribute("cita") Cita cita, RedirectAttributes redirectAttributes) {
        
        LocalDateTime horaCita = cita.getHoraCita();
    
        DayOfWeek dia = horaCita.getDayOfWeek();
        LocalTime hora = horaCita.toLocalTime();
        LocalTime HORA_INICIO = LocalTime.of(7, 0);
        LocalTime HORA_FIN = LocalTime.of(18, 30);
        
        // Validación 1: Horario laboral
        if (dia == DayOfWeek.SUNDAY || hora.isBefore(HORA_INICIO) || hora.isAfter(HORA_FIN)) {
            redirectAttributes.addFlashAttribute("error", 
                "Error: La hora de atención es de Lunes a Sábado, de 7:00 AM a 6:30 PM.");
            return "redirect:/citas/nueva";
        }
        
        // Validación 2: Cita duplicada
        Optional<Cita> citaExistente = citaRepository.findByHoraCita(horaCita);
        
        if (citaExistente.isPresent() && !citaExistente.get().getIdCita().equals(cita.getIdCita())) {
            redirectAttributes.addFlashAttribute("error", 
                "⚠️ Alerta: Ya existe una cita agendada para el " + horaCita.toLocalDate() + " a las " + horaCita.toLocalTime() + ". Por favor, elija otra hora.");
            return "redirect:/citas/nueva";
        }
        
        try {
            citaRepository.save(cita);
            redirectAttributes.addFlashAttribute("mensaje", 
                "¡Cita confirmada! La reserva fue exitosa para el " + horaCita.toLocalDate() + ".");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Ocurrió un error al guardar la cita.");
        }
            
        return "redirect:/citas";
    }

    // ELIMINAR CITA (MEJORADO CON PROTECCIÓN DE FACTURAS)
    @GetMapping("/citas/eliminar/{id}")
    public String eliminarCita(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            citaRepository.deleteById(id);
            // Mensaje de éxito (verde)
            redirectAttributes.addFlashAttribute("mensaje", "La cita ha sido cancelada y eliminada correctamente.");
        } catch (DataIntegrityViolationException e) {
            // Mensaje de error específico si ya está facturada (rojo)
            redirectAttributes.addFlashAttribute("error", "No se puede cancelar esta cita porque ya ha sido FACTURADA. Por seguridad contable, debe anular la factura primero.");
        } catch (Exception e) {
            // Error genérico
            redirectAttributes.addFlashAttribute("error", "Ocurrió un error inesperado al intentar cancelar la cita.");
        }
        return "redirect:/citas";
    }
}