package com.neuroesencia.neuroesencia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.neuroesencia.neuroesencia.repository.HistorialClinicoRepository;
import com.neuroesencia.neuroesencia.entity.HistorialClinico;
import java.util.List;

@RestController
@RequestMapping("/api/historiales")
public class HistorialClinicoController {

    @Autowired
    private HistorialClinicoRepository historialRepository;

    @GetMapping
    public List<HistorialClinico> listarHistoriales() {
        return historialRepository.findAll();
    }

    @PostMapping
    public HistorialClinico crearHistorial(@RequestBody HistorialClinico historial) {
        return historialRepository.save(historial);
    }
}