package com.luischac.demo.Service;


import com.luischac.demo.Entity.Proveedor;
import com.luischac.demo.Repository.ProveedorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProveedorServiceImplements implements ProveedorService {
    private final ProveedorRepository proveedorRepository;

    public ProveedorServiceImplements (ProveedorRepository proveedorRepository){
        this.proveedorRepository = proveedorRepository;
    }

    @Override
    public List<Proveedor> getAllProveedores() {
        return proveedorRepository.findAll();
    }

    @Override
    public Proveedor getProveedorById(Integer id) {
        return proveedorRepository.findById(id).orElse(null);
    }

    @Override
    public Proveedor saveProveedor(Proveedor proveedor) throws RuntimeException {
        return proveedorRepository.save(proveedor);
    }

    @Override
    public Proveedor updateProveedor(Integer id, Proveedor proveedor){
        Proveedor existingProveedor = proveedorRepository.findById(id).orElseThrow(() -> new RuntimeException("El proveedor no existe"));

        existingProveedor.setNombreProveedor(proveedor.getNombreProveedor());
        existingProveedor.setTelefonoProveedor(proveedor.getTelefonoProveedor());
        existingProveedor.setDireccion(proveedor.getDireccion());
        existingProveedor.setEmailProveedor(proveedor.getEmailProveedor());

        return proveedorRepository.save(existingProveedor);

    }

    @Override
    public void deleteProveedor(Integer id) {
        if (!proveedorRepository.existsById(id)) {
            throw new RuntimeException("Proveedor no existe");
        }
        proveedorRepository.deleteById(id);
    }
}
