import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../estado_app.dart';
import 'pantalla_editar_perfil.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});
  @override
  Widget build(BuildContext context) {
    final estado = context.watch<EstadoApp>();
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFC0CB), title: const Text("Perfil")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          Text(estado.nombreUsuario, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(estado.correoUsuario),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const PantallaEditarPerfil())), child: const Text("editar")),
          const Divider(),
          const Text("Historial Compras"),
          Expanded(child: GridView.count(crossAxisCount: 3, children: List.generate(6, (i) => const Card(child: Icon(Icons.shopping_bag_outlined))))),
        ],
      ),
    );
  }
}
