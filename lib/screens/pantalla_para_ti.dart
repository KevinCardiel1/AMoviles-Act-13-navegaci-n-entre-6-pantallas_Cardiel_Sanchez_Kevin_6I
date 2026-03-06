
import 'package:flutter/material.dart';
import 'package:myapp/widgets/app_bar_personalizada.dart';
import 'package:myapp/widgets/menu_lateral.dart';

class PantallaParaTi extends StatelessWidget {
  const PantallaParaTi({super.key});

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
      appBar: const AppBarPersonalizada(),
      drawer: const MenuLateral(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Para ti",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // <--- Corregido a 3 columnas
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7, // Ajuste para 3 columnas
              ),
              itemCount: 9, // Manteniendo 9 productos
              itemBuilder: (context, i) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      child: Icon(
                        Icons.local_florist,
                        color: Colors.pink,
                        size: 40, // Ligeramente más pequeño para el layout
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Producto",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12, // Fuente más pequeña
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
