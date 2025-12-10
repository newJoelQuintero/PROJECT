package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime; 

@Data
@Entity
@Table(name = "CITA")
public class Cita {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cita")
    private Long idCita; 

    @Column(name = "hora_cita", nullable = false)
    private LocalDateTime horaCita;

    @Column(name = "lugar_cita", nullable = false, length = 100)
    private String lugarCita;

  
    @ManyToOne
    @JoinColumn(name = "id_servicio", nullable = false)
    private Servicio servicio;

   
    @ManyToOne
    @JoinColumn(name = "id_paciente", nullable = false)
    private Paciente paciente;
}