package com.luischac.demo.Controller;

import com.luischac.demo.Entity.Repuesto;
import com.luischac.demo.Service.RepuestoService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping ("/api/repuestos")
public class RepuestoController {
    private final RepuestoService repuestoService;

    public RepuestoController(RepuestoService repuestoService) {
        this.repuestoService = repuestoService;
    }

    @GetMapping
    public List<Repuesto> getAllRepuestos(){return repuestoService.getAllRepuestos();}

    @PostMapping
    public ResponseEntity<Object> createRepuestos(@Valid @RequestBody Repuesto repuesto){
        try{
            Repuesto createdRepuesto = repuestoService.saveRepuestos(repuesto);
            return new ResponseEntity<>(createdRepuesto, HttpStatus.CREATED);
        }catch (IllegalArgumentException e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteRepuestos(@PathVariable Integer id){
        try {
            repuestoService.deleteRepuestos(id);
            return ResponseEntity.ok("Repuesto Eliminado Correctamente");
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateRepuestos(@PathVariable Integer id, @RequestBody Repuesto repuesto) {

        try {
            Repuesto actualizado = repuestoService.updateRepuestos(id, repuesto);
            return ResponseEntity.ok(actualizado);

        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }

    }
}
