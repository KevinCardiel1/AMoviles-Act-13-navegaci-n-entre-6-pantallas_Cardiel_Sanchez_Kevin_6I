import 'package:flutter/material.dart';

const String urlRepo = "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2025/main/";

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFF8BBD0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/ajolotelogo.png", height: 60),
                const Text("FLORERÍA AJOLOTE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )
          ),
          ListTile(title: const Text("Servicio al cliente"), onTap: () {}),
          ListTile(title: const Text("Políticas"), onTap: () {}),
          ListTile(title: const Text("Configuración"), onTap: () {}),
          const Divider(),
          ListTile(title: const Text("Cerrar sesión"), leading: const Icon(Icons.logout), onTap: () {}),
        ],
      ),
    );
  }
}
