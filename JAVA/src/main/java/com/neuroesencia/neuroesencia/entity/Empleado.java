package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "EMPLEADO")
public class Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_empleado")
    private Integer idEmpleado;

    @Enumerated(EnumType.STRING) 
    @Column(name = "tipo_documento", nullable = false)
    private TipoDocumento tipoDocumento;

    @Column(name = "dni_empleado", nullable = false, length = 10, unique = true)
    private String dniEmpleado;

    @Column(nullable = false, length = 30)
    private String nombre;

    @Column(nullable = false, length = 50)
    private String direccion;

    @Column(nullable = false, length = 15)
    private String telefono;

    @Column(nullable = false, length = 40, unique = true)
    private String usuario;

    @Column(nullable = false)
    private String contrasena;

 
    @ManyToOne 
    @JoinColumn(name = "id_rol", nullable = false) 
    private Rol rol;
}