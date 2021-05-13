// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    String nombre;
    String url;
    double precio;
    bool favorito;
    String titulo;
    String subtitulo;
    int bateria;
    int color;

    ProductoModel({
        this.nombre,
        this.url,
        this.precio,
        this.favorito,
        this.titulo,
        this.subtitulo,
        this.bateria,
        this.color,
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => new ProductoModel(
        nombre: json["nombre"],
        url: json["url"],
        precio: json["precio"],
        favorito: json["favorito"],
        titulo: json["titulo"],
        subtitulo: json["subtitulo"],
        bateria: json["bateria"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "url": url,
        "precio": precio,
        "favorito": favorito,
        "titulo": titulo,
        "subtitulo": subtitulo,
        "bateria": bateria,
        "color": color,
    };
}