package com.luischac.demo.Service;

import com.luischac.demo.Entity.Venta;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface VentaService {
    List<Venta> getAllVentas();
    Venta getVentasById (Integer id);
    Venta saveVentas (Venta venta) throws RuntimeException;
    Venta updateVentas (Integer id, Venta venta);
    void deleteVentas (Integer id);
}
