package com.luischac.demo.Service;

import com.luischac.demo.Entity.Repuesto;
import com.luischac.demo.Repository.RepuestoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepuestoServiceImplements implements RepuestoService {
    private final RepuestoRepository repuestoRepository;

    public RepuestoServiceImplements (RepuestoRepository repuestoRepository){
        this.repuestoRepository = repuestoRepository;
    }

    @Override
    public List<Repuesto> getAllRepuestos() {
        return repuestoRepository.findAll();
    }

    @Override
    public Repuesto getRepuestosById(Integer id) {
        return repuestoRepository.findById(id).orElse(null);
    }

    @Override
    public Repuesto saveRepuestos(Repuesto repuesto) throws RuntimeException {
        return repuestoRepository.save(repuesto);
    }

    @Override
    public Repuesto updateRepuestos(Integer id, Repuesto repuesto){
        Repuesto existingRepuesto = repuestoRepository.findById(id).orElseThrow(() -> new RuntimeException("El repuesto no existe"));

        existingRepuesto.setNombreRepuesto(repuesto.getNombreRepuesto());
        existingRepuesto.setCategoriaRepuesto(repuesto.getCategoriaRepuesto());
        existingRepuesto.setPrecioCompra(repuesto.getPrecioCompra());
        existingRepuesto.setPrecioVenta(repuesto.getPrecioVenta());
        existingRepuesto.setIdProveedor(repuesto.getIdProveedor());

        return repuestoRepository.save(existingRepuesto);

    }

    @Override
    public void deleteRepuestos(Integer id) {
        if (!repuestoRepository.existsById(id)) {
            throw new RuntimeException("Repuesto no existe");
        }
        repuestoRepository.deleteById(id);
    }
}
