package com.luischac.demo.Controller;

import com.luischac.demo.Entity.Venta;
import com.luischac.demo.Service.VentaService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping ("/api/ventas")
public class VentaController {
    private final VentaService ventaService;

    public VentaController(VentaService repuestoService) {
        this.ventaService = repuestoService;
    }

    @GetMapping
    public List<Venta> getAllVentas(){return ventaService.getAllVentas();}

    @PostMapping
    public ResponseEntity<Object> createVentas(@Valid @RequestBody Venta venta){
        try{
            Venta createdVenta = ventaService.saveVentas(venta);
            return new ResponseEntity<>(createdVenta, HttpStatus.CREATED);
        }catch (IllegalArgumentException e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteVentas(@PathVariable Integer id){
        try {
            ventaService.deleteVentas(id);
            return ResponseEntity.ok("Venta Eliminada Correctamente");
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateVentas(@PathVariable Integer id, @RequestBody Venta venta) {

        try {
            Venta actualizado = ventaService.updateVentas(id, venta);
            return ResponseEntity.ok(actualizado);

        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }

    }
}
