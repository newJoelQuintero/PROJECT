package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "SERVICIOS")
public class Servicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_servicio")
    private Integer idServicio;

    @Column(name = "nom_servicio", nullable = false, length = 100)
    private String nomServicio;

    @Column(name = "valor_servicio", nullable = false)
    private Long valorServicio; 

   
    @ManyToOne
    @JoinColumn(name = "id_empleado", nullable = false)
    private Empleado empleado;
}