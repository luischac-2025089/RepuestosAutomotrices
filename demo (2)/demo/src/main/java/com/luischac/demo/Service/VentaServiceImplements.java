package com.luischac.demo.Service;

import com.luischac.demo.Entity.Venta;
import com.luischac.demo.Repository.VentaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VentaServiceImplements implements VentaService{
    private final VentaRepository ventaRepository;

    public VentaServiceImplements (VentaRepository repuestoRepository){
        this.ventaRepository = repuestoRepository;
    }

    @Override
    public List<Venta> getAllVentas() {
        return ventaRepository.findAll();
    }

    @Override
    public Venta getVentasById(Integer id) {
        return ventaRepository.findById(id).orElse(null);
    }

    @Override
    public Venta saveVentas(Venta venta) throws RuntimeException {
        return ventaRepository.save(venta);
    }

    @Override
    public Venta updateVentas(Integer id, Venta venta){
        Venta existingVenta = ventaRepository.findById(id).orElseThrow(() -> new RuntimeException("La venta no existe"));

        existingVenta.setFechaVenta(venta.getFechaVenta());
        existingVenta.setCantidad(venta.getCantidad());
        existingVenta.setTotal(venta.getTotal());
        existingVenta.setIdEmpleado(venta.getIdEmpleado());
        existingVenta.setIdRepuesto(venta.getIdRepuesto());

        return ventaRepository.save(existingVenta);

    }

    @Override
    public void deleteVentas(Integer id) {
        if (!ventaRepository.existsById(id)) {
            throw new RuntimeException("Venta no existe");
        }
        ventaRepository.deleteById(id);
    }
}
