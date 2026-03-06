
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../estado_app.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({super.key});

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {

  // Agregamos los productos de ejemplo al inicializar
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final estado = Provider.of<EstadoApp>(context, listen: false);
      if (estado.carrito.isEmpty) {
        estado.agregar(Producto(
          id: "girasol_01",
          nombre: "Girasol",
          precio: 50.0,
          imagen: "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/girasol.png",
        ));
        estado.agregar(Producto(
          id: "jazmin_01",
          nombre: "Jazmín",
          precio: 45.0,
          imagen: "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/jasmineflower.png",
          cantidad: 4,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final estado = Provider.of<EstadoApp>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFC0CB),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.shopping_cart, size: 28),
          ),
        ],
      ),
      body: Column(
        children: [
          // Grid de productos en el carrito
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columnas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, // Ajusta la proporción para que se vea bien
              ),
              itemCount: estado.carrito.length,
              itemBuilder: (context, index) {
                final producto = estado.carrito[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Imagen del producto
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.network(
                                producto.imagen,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
                              ),
                            ),
                          ),
                          // Nombre y precio
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(producto.nombre, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("\$${producto.precio.toStringAsFixed(2)}", style: const TextStyle(color: Colors.green), textAlign: TextAlign.center),
                          ),
                          // Controles de cantidad
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(icon: const Icon(Icons.remove, size: 18), onPressed: () => estado.ajustarCantidad(producto, false)),
                              Text("${producto.cantidad}", style: const TextStyle(fontSize: 16)),
                              IconButton(icon: const Icon(Icons.add, size: 18), onPressed: () => estado.ajustarCantidad(producto, true)),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      // Botón para eliminar (en la esquina superior derecha)
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () => estado.eliminar(producto),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.close, color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Sección del total y botón de compra
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text("\$${estado.total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () { /* Lógica para comprar */ },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Comprar", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
