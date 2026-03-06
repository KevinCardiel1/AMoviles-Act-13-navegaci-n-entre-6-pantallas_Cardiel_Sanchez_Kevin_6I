import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../estado_app.dart';

class PantallaDetalle extends StatelessWidget {
  final Producto p;
  const PantallaDetalle({super.key, required this.p});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFC0CB), title: const Text("FLORERIA AJOLOTE")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Image.network(p.imagen, height: 150),
                  Text(p.nombre, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text("Descripción decorativa de la flor..."),
                  Text("\$${p.precio}0", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () {}, child: const Text("Comprar")),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade100), 
              onPressed: () {
                context.read<EstadoApp>().agregar(p);
                Navigator.pop(context);
              }, child: const Text("Agregar al Carrito")),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar", style: TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}
