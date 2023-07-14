package com.Proyecto.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FirebaseStorageService {

    public String cargaImagen(MultipartFile archivoLocalCliente, String carpeta, Long id);

    //El BuketName es el <id_del_proyecto> + ".appspot.com#
    final String BucketName = "proyectodesarrolloweb-f0ecd.appspot.com";

    //Esta es la ruta básica de este proyecto Techshop 
    final String rutaSuperiorStorage = "Proyecto";

    //Ubicación donde se encuentra el archivo de configuración Json
    final String rutaJsonFile = "firebase";

    //El nombre del archivo Json
    final String archivoJsonFile = "proyectodesarrolloweb-f0ecd-firebase-adminsdk-altnm-a950521c3a.json";
}
