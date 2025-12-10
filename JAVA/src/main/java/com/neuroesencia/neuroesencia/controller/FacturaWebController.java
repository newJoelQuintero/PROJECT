package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; // Importante para alertas
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

import com.neuroesencia.neuroesencia.entity.FacturaVenta;
import com.neuroesencia.neuroesencia.entity.DetalleFactura;
import com.neuroesencia.neuroesencia.entity.Cita;
import com.neuroesencia.neuroesencia.repository.*;

@Controller
public class FacturaWebController {

    @Autowired private FacturaVentaRepository facturaRepository;
    @Autowired private DetalleFacturaRepository detalleRepository;
    @Autowired private PacienteRepository pacienteRepository;
    @Autowired private EmpleadoRepository empleadoRepository;
    @Autowired private CitaRepository citaRepository;
    @Autowired private ServicioRepository servicioRepository;

    // 1. LISTAR FACTURAS
    @GetMapping("/facturas")
    public String listarFacturas(Model model) {
        model.addAttribute("listaFacturas", facturaRepository.findAll());
        return "facturas"; 
    }

    // 2. FORMULARIO NUEVA FACTURA
    @GetMapping("/facturas/nueva")
    public String mostrarFormulario(Model model) {
        model.addAttribute("factura", new FacturaVenta());
        model.addAttribute("listaPacientes", pacienteRepository.findAll());
        model.addAttribute("listaEmpleados", empleadoRepository.findAll());
        return "formulario_factura"; 
    }

    // 3. GUARDAR ENCABEZADO FACTURA
    @PostMapping("/facturas/guardar")
    public String guardarFactura(@ModelAttribute("factura") FacturaVenta factura) {
        if (factura.getTotalFactura() == null) {
            factura.setTotalFactura(0);
        }
        FacturaVenta guardada = facturaRepository.save(factura);
        return "redirect:/facturas/ver/" + guardada.getIdFactura();
    }

    // 4. VER DETALLE Y AGREGAR ITEMS
    @GetMapping("/facturas/ver/{id}")
    public String verDetalleFactura(@PathVariable Long id, Model model) {
        
        FacturaVenta factura = facturaRepository.findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Factura no encontrada"));

        model.addAttribute("factura", factura);
        
        // Objeto para el formulario de agregar ítem
        DetalleFactura nuevoDetalle = new DetalleFactura();
        nuevoDetalle.setFactura(factura);
        model.addAttribute("nuevoDetalle", nuevoDetalle);
        
        // Listas para los selects
        model.addAttribute("listaCitas", citaRepository.findAll()); 
        model.addAttribute("listaServicios", servicioRepository.findAll());
        
        return "detalle_factura"; 
    }

    // 5. AGREGAR ITEM (CORREGIDO)
    @PostMapping("/facturas/agregar-item")
    public String agregarItem(@ModelAttribute("nuevoDetalle") DetalleFactura detalle,
                              @RequestParam(name = "cita", required = false) Long idCita, // Capturamos la cita del HTML
                              RedirectAttributes redirectAttributes) {
        try {
            // A. Vincular la Cita si existe
            if (idCita != null) {
                Cita cita = citaRepository.findById(idCita).orElse(null);
                detalle.setCita(cita);
            }

            // B. Guardar el Detalle
            detalleRepository.save(detalle);

            // C. Actualizar el Total de la Factura
            Long idFactura = Long.valueOf(detalle.getFactura().getIdFactura());
            FacturaVenta factura = facturaRepository.findById(idFactura).orElse(null);

            if (factura != null) {
                // Manejo seguro de nulos para la suma
                int valorItem = detalle.getValorServicio() != null ? detalle.getValorServicio().intValue() : 0;
                int totalActual = factura.getTotalFactura() != null ? factura.getTotalFactura() : 0;
                
                factura.setTotalFactura(totalActual + valorItem);
                facturaRepository.save(factura);
            }

            redirectAttributes.addFlashAttribute("mensaje", "Ítem agregado y total actualizado.");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al agregar el ítem.");
        }
        
        return "redirect:/facturas/ver/" + detalle.getFactura().getIdFactura();
    }
}