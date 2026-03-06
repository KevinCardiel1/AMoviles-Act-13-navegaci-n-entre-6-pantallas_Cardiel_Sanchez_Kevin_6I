import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'estado_app.dart';
import 'screens/pantalla_inicio.dart';
import 'screens/pantalla_para_ti.dart';
import 'screens/pantalla_perfil.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EstadoApp(),
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: MenuPrincipal()),
    ),
  );
}

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});
  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  int _index = 0;
  final List<Widget> _paginas = [const PantallaInicio(), const PantallaParaTi(), const PantallaPerfil()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        backgroundColor: const Color(0xFFD1C4E9), // Morado claro de la barra
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: ''), // El botón de 4 cuadritos
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
