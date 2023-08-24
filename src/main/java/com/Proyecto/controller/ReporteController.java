package com.Proyecto.controller;

import com.Proyecto.service.ReporteService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reportes")
public class ReporteController {

    @Autowired
    ReporteService reporteService;

    @GetMapping("/principal")
    public String principal(Model model) {
        return "/reportes/principal";
    }

    @GetMapping("/usuario")
    public ResponseEntity<Resource>
            usuario(@RequestParam String tipo) throws IOException {
        return reporteService.generarReporte("usuario",
                null,
                tipo);
    }

    @GetMapping("/venta")
    public ResponseEntity<Resource>
            venta(@RequestParam String tipo) throws IOException {
        return reporteService.generarReporte("venta",
                null,
                tipo);
    }

    @GetMapping("/categoriak")
    public ResponseEntity<Resource>
            categoriak(@RequestParam String tipo) throws IOException {
        return reporteService.generarReporte("categoriak",
                null,
                tipo);
    }

    @GetMapping("/producto")
    public ResponseEntity<Resource>
            producto(@RequestParam String tipo) throws IOException {
        return reporteService.generarReporte("producto",
                null,
                tipo);
    }

}
