package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.neuroesencia.neuroesencia.repository.FacturaVentaRepository;
import com.neuroesencia.neuroesencia.repository.DetalleFacturaRepository;
import com.neuroesencia.neuroesencia.entity.FacturaVenta;
import com.neuroesencia.neuroesencia.entity.DetalleFactura;
import java.util.List;

@RestController
@RequestMapping("/api/facturas")
public class FacturaController {

    @Autowired
    private FacturaVentaRepository facturaRepository;

    @Autowired
    private DetalleFacturaRepository detalleRepository;

    
    @GetMapping
    public List<FacturaVenta> listarFacturas() {
        return facturaRepository.findAll();
    }

    @PostMapping
    public FacturaVenta crearFactura(@RequestBody FacturaVenta factura) {
        return facturaRepository.save(factura);
    }

  
    @GetMapping("/detalles")
    public List<DetalleFactura> listarDetalles() {
        return detalleRepository.findAll();
    }

    @PostMapping("/detalles")
    public DetalleFactura agregarDetalle(@RequestBody DetalleFactura detalle) {
        return detalleRepository.save(detalle);
    }
}