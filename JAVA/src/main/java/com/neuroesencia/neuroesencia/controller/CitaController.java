package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.neuroesencia.neuroesencia.repository.CitaRepository;
import com.neuroesencia.neuroesencia.entity.Cita;
import java.util.List;

@RestController
@RequestMapping("/api/citas")
public class CitaController {

    @Autowired
    private CitaRepository citaRepository;

    @GetMapping
    public List<Cita> listarCitas() {
        return citaRepository.findAll();
    }

    @PostMapping
    public Cita agendarCita(@RequestBody Cita cita) {
        return citaRepository.save(cita);
    }
}