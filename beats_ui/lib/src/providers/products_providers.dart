import 'package:beats_ui/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductosProvider extends ChangeNotifier {
  List<ProductoModel> _productos = new List();

  ProductosProvider() {
    _cargarProductos();
  }

  List<ProductoModel> get productos => _productos;

  _cargarProductos() {
    final prod1 = new ProductoModel(
        nombre: 'Beats Studio3 Wireless',
        titulo: 'Warriors',
        subtitulo: 'Royal Blue',
        precio: 349.95,
        bateria: 45,
        color: 0xff08399B,
        favorito: false,
        url: 'blue.png');

    final prod2 = new ProductoModel(
        nombre: 'Studio3 Wireless',
        titulo: 'Warriors',
        subtitulo: 'Royal Red',
        precio: 300.95,
        bateria: 30,
        color: 0xff922325,
        favorito: false,
        url: 'black-red.png');

    final prod3 = new ProductoModel(
        nombre: 'Beats Wireless',
        titulo: 'Fighter',
        subtitulo: 'Space Grey',
        precio: 449.95,
        bateria: 50,
        color: 0xff252525,
        favorito: false,
        url: 'black.png');

    final prod4 = new ProductoModel(
        nombre: 'Beats Studio3 Wireless',
        titulo: 'Finest',
        subtitulo: 'Royal Gold',
        precio: 239.95,
        bateria: 25,
        color: 0xffC7B29B,
        favorito: false,
        url: 'gold.png');

    final prod5 = new ProductoModel(
        nombre: 'Beats Studio3',
        titulo: 'Warriors',
        subtitulo: 'Royal Red',
        precio: 349.95,
        bateria: 45,
        color: 0xffD84C3B,
        favorito: false,
        url: 'red.png');

    final prod6 = new ProductoModel(
        nombre: 'Beats Studio3',
        titulo: 'Warriors',
        subtitulo: 'Royal Teal',
        precio: 349.95,
        bateria: 45,
        color: 0xff23526D,
        favorito: false,
        url: 'teal.png');

    this._productos.addAll([
      prod1,
      prod2,
      prod3,
      prod4,
      prod5,
      prod6,
    ]);
  }
}
