
import 'package:flutter/material.dart';
import 'package:myapp/screens/pantalla_carrito.dart';

// URL del logo corregida
const String logoUrl = "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/ajolotelogo.png";

class AppBarPersonalizada extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPersonalizada({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Quitamos el botón de menú por defecto
      backgroundColor: const Color(0xFFFFC0CB), // Mantenemos el color rosa
      title: Row(
        children: [
          Image.network(
            logoUrl, // Usando la URL correcta del logo
            height: 30,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
          const SizedBox(width: 8),
          const Text(
            "FLORERIA AJOLOTE",
            style: TextStyle(
              fontSize: 16, // Ajustamos el tamaño
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón para abrir el menú lateral (hamburguesa)
              InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(Icons.menu, color: Colors.black, size: 28),
              ),
              const SizedBox(height: 4),
              // Botón del carrito de compras
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PantallaCarrito()),
                  );
                },
                child: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10); // Un poco más de altura
}
