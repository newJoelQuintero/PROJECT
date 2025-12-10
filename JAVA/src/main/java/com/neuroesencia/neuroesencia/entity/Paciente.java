package com.neuroesencia.neuroesencia.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "paciente") // Asegúrate que el nombre de la tabla sea exacto
public class Paciente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_paciente") // Nombre exacto en MySQL
    private Long idPaciente;

    @Column(name = "tipo_documento") // Nombre exacto en MySQL
    private String tipoDocumento;

    @Column(name = "dni_cliente") // ¡IMPORTANTE! MySQL usa dni_cliente
    private String dniCliente;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "usuario") // Tu correo
    private String usuario;

    @Column(name = "contrasena")
    private String contrasena;

    // --- GETTERS Y SETTERS OBLIGATORIOS ---
    // (Puedes generarlos automáticamente en VS Code: clic derecho -> Source Action -> Generate Getters and Setters)
    
    public Long getIdPaciente() { return idPaciente; }
    public void setIdPaciente(Long idPaciente) { this.idPaciente = idPaciente; }

    public String getTipoDocumento() { return tipoDocumento; }
    public void setTipoDocumento(String tipoDocumento) { this.tipoDocumento = tipoDocumento; }

    public String getDniCliente() { return dniCliente; }
    public void setDniCliente(String dniCliente) { this.dniCliente = dniCliente; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }

    public String getContrasena() { return contrasena; }
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }
}