package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "DETALLE_FACTURA")
public class DetalleFactura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_detalle")
    private Integer idDetalle;

    @Column(name = "valor_servicio", nullable = false)
    private Float valorServicio;

    
    @ManyToOne
    @JoinColumn(name = "id_factura", nullable = false)
    private FacturaVenta factura;

    
    @ManyToOne
    @JoinColumn(name = "id_cita", nullable = false)
    private Cita cita;

      
    @ManyToOne
    @JoinColumn(name = "id_servicio", nullable = false)
    private Servicio servicio;
}