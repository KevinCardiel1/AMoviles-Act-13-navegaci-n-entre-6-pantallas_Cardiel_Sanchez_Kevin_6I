
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:myapp/widgets/app_bar_personalizada.dart';
import 'package:myapp/widgets/menu_lateral.dart';
import '../estado_app.dart';
import 'pantalla_detalle.dart';

const String repo = "https://cdn.jsdelivr.net/gh/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/";

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categorias = [
      "Todo",
      "Flores",
      "Macetas",
      "Ramos",
      "Regalos",
      "Cuidado"
    ];

    return Scaffold(
      appBar: const AppBarPersonalizada(), // Usando la AppBar corregida
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de Ofertas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/main/ramo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Ramo San Valentín",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black45,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Botones de categorías
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      label: Text(categorias[index]),
                      backgroundColor: Colors.pink[100],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                "Productos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Grid de productos
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // <--- Corregido a 3 columnas
                childAspectRatio: 0.75, // Ajuste para 3 columnas
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (context, i) {
                final p = Producto(
                  id: "$i",
                  nombre: "Flor ${i + 1}",
                  precio: 150.0,
                  imagen: "${repo}flor${i + 1}.jpg",
                );
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => PantallaDetalle(p: p)),
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              p.imagen,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                developer.log(
                                  'Failed to load product image',
                                  name: 'my_app.network',
                                  error: 'URL: ${p.imagen}, Error: $error',
                                  stackTrace: stackTrace,
                                );
                                return const Icon(Icons.broken_image, color: Colors.red);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_circle, color: Colors.green, size: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
