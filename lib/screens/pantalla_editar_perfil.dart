import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../estado_app.dart';

class PantallaEditarPerfil extends StatelessWidget {
  const PantallaEditarPerfil({super.key});
  @override
  Widget build(BuildContext context) {
    final n = TextEditingController(text: context.read<EstadoApp>().nombreUsuario);
    final c = TextEditingController(text: context.read<EstadoApp>().correoUsuario);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("Editar", style: TextStyle(fontSize: 22)),
            const CircleAvatar(radius: 40, child: Icon(Icons.person)),
            const Text("Cambiar foto", style: TextStyle(color: Colors.blue)),
            TextField(controller: n, decoration: const InputDecoration(labelText: "Usuario *")),
            const TextField(decoration: InputDecoration(labelText: "Contraseña *"), obscureText: true),
            TextField(controller: c, decoration: const InputDecoration(labelText: "Correo electrónico *")),
            const Spacer(),
            Row(
              children: [
                Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () => Navigator.pop(context), child: const Text("Cancelar"))),
                const SizedBox(width: 10),
                Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () {
                  context.read<EstadoApp>().actualizarUsuario(n.text, c.text, "");
                  Navigator.pop(context);
                }, child: const Text("Confirmar"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
