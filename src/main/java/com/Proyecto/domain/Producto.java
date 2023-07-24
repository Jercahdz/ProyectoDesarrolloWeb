package com.Proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "producto")
public class Producto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_producto")
    private long idProducto;
    private String descripcion;
    private String detalle;
    private double precio;
    private int existencias;

    private String rutaImagen;
    private boolean activo;

    public Producto() {
    }

    public Producto(long idProducto, String descripcion, String detalle, double precio, int existencias, String rutaImagen, boolean activo) {
        this.idProducto = idProducto;
        this.descripcion = descripcion;
        this.detalle = detalle;
        this.precio = precio;
        this.existencias = existencias;
        this.rutaImagen = rutaImagen;
        this.activo = activo;
    }

}
