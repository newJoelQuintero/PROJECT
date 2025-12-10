package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "HISTORIAL_CLINICO")
public class HistorialClinico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_historial_clinico")
    private Long idHistorialClinico;

    @Column(nullable = false, length = 50)
    private String sintomas;

    @Column(nullable = false, length = 200)
    private String diagnostico;

    @Column(nullable = false, length = 100)
    private String tratamiento;

   
    @ManyToOne
    @JoinColumn(name = "id_empleado", nullable = false)
    private Empleado empleado;

  
    @ManyToOne
    @JoinColumn(name = "id_paciente", nullable = false)
    private Paciente paciente;
}