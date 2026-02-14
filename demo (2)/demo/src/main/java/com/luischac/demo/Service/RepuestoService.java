package com.luischac.demo.Service;

import com.luischac.demo.Entity.Repuesto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RepuestoService {
    List<Repuesto> getAllRepuestos();
    Repuesto getRepuestosById (Integer id);
    Repuesto saveRepuestos (Repuesto repuesto) throws RuntimeException;
    Repuesto updateRepuestos (Integer id, Repuesto repuesto);
    void deleteRepuestos (Integer id);
}
