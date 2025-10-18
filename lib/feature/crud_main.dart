// lib/feature/crud_main.dart

import 'package:flutter/material.dart';
import 'admin_users.dart'; 
// ¡Importaciones de los nuevos archivos!
import 'admin_employe.dart';
import 'admin_resident.dart';
import 'admin_visitor.dart';
import 'admin_floorapart.dart';
import 'admin_commonarea.dart';

class CrudMainScreen extends StatefulWidget {
  const CrudMainScreen({super.key});

  @override
  State<CrudMainScreen> createState() => _CrudMainScreenState();
}

class _CrudMainScreenState extends State<CrudMainScreen> {
  // 1. Variable para rastrear la opción seleccionada
  String _seccionActual = 'administracion';

  // 2. Método para construir el contenido de la derecha
  Widget _buildContent() {
    switch (_seccionActual) {
      case 'administracion':
        return const AdminUsersScreen(); 
      case 'empleado':
        return const AdminEmployeScreen();
      case 'residente':
        return const AdminResidentScreen();
      case 'visitante':
        return const AdminVisitorScreen();
      case 'piso_depa':
        return const AdminFloorApartScreen();
      case 'area_comun':
        return const AdminCommonAreaScreen();
      default:
        return const Center(child: Text('Selecciona una opción'));
    }
  }

  // 3. Método para construir un elemento de menú reutilizable
  Widget _buildMenuItem(String key, String title, IconData icon) {
    final bool isSelected = key == _seccionActual;
    
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.cyanAccent : Colors.white70),
      title: Text(title, style: TextStyle(color: isSelected ? Colors.cyanAccent : Colors.white)),
      selected: isSelected,
      selectedTileColor: Colors.blueGrey[700],
      onTap: () {
        setState(() {
          _seccionActual = key;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Building Dashboard - Gestión CRUD'),
        backgroundColor: Colors.blueGrey, // Color AppBar Consistente
        // Botón de Volver al Dashboard principal
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), 
        ),
      ),
      body: Row(
        children: [
          // LADO IZQUIERDO: Menú Lateral (Sidebar)
          Container(
            width: 250, 
            color: const Color(0xFF263238), // Color Menú Consistente
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Gestión de Entidades',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: Colors.white24, height: 1),
                
                // Opciones del Menú (CRUD)
                Expanded( 
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      _buildMenuItem('administracion', 'Usuarios (Admin)', Icons.people_alt),
                      _buildMenuItem('empleado', 'Empleados', Icons.badge),
                      _buildMenuItem('residente', 'Residentes', Icons.home_work),
                      _buildMenuItem('visitante', 'Visitantes', Icons.directions_walk),
                      _buildMenuItem('piso_depa', 'Pisos / Departamentos', Icons.apartment),
                      _buildMenuItem('area_comun', 'Áreas Comunes', Icons.pool),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // LADO DERECHO: Contenido Dinámico
          Expanded(
            child: _buildContent(), 
          ),
        ],
      ),
    );
  }
}