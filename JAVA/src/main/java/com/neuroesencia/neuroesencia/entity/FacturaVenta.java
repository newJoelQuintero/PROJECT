package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "FACTURA_VENTA")
public class FacturaVenta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_factura")
    private Integer idFactura;

    @Column(name = "tipo_metodo_pago", nullable = false, length = 30)
    private String tipoMetodoPago;

    @Column(name = "total_factura", nullable = false)
    private Integer totalFactura;

   
    @ManyToOne
    @JoinColumn(name = "id_empleado", nullable = false)
    private Empleado empleado;

    
    @ManyToOne
    @JoinColumn(name = "id_paciente", nullable = false)
    private Paciente paciente;
}