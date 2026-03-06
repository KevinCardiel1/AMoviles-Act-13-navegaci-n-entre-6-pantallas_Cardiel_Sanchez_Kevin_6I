import 'package:flutter/material.dart';

class Producto {
  final String id, nombre, imagen;
  final double precio;
  int cantidad;

  Producto({required this.id, required this.nombre, required this.imagen, required this.precio, this.cantidad = 1});
}

class EstadoApp extends ChangeNotifier {
  // Datos del Usuario (Editables)
  String nombreUsuario = "Usuario_Ajolote";
  String correoUsuario = "ajolote.bonito@gmail.com";
  String telefono = "6561234567";

  void actualizarUsuario(String n, String c, String t) {
    nombreUsuario = n; correoUsuario = c; telefono = t;
    notifyListeners();
  }

  // Lógica del Carrito
  List<Producto> carrito = [];

  void agregar(Producto p) {
    int index = carrito.indexWhere((i) => i.id == p.id);
    if (index != -1) { carrito[index].cantidad++; } 
    else { carrito.add(p); }
    notifyListeners();
  }

  void eliminar(Producto p) { carrito.remove(p); notifyListeners(); }

  void ajustarCantidad(Producto p, bool sumar) {
    if (sumar) { p.cantidad++; } 
    else if (p.cantidad > 1) { p.cantidad--; }
    notifyListeners();
  }

  double get total => carrito.fold(0, (sum, item) => sum + (item.precio * item.cantidad));
}