// lib/main.dart

import 'package:flutter/material.dart';
import 'views/resumen_dashboard_view.dart';
import 'views/user_management_view.dart'; 
// importacion nueva, menu crud, opcion en alpha
import 'package:core_v001/feature/crud_main.dart'; 


void main() {
  runApp(const BuildingAdminApp());
}

class BuildingAdminApp extends StatelessWidget {
  const BuildingAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard de Administración',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, 
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white70),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

// ----------------------------------------------------
// Nombres de los menús
// ----------------------------------------------------
enum MenuOption { 
  resumen, 
  finanzas, 
  consumo, 
  mantenimiento, 
  usuarios,
  // NUEVA OPCIÓN AÑADIDA
  gestion // <- opcion para los crud
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  MenuOption _selectedMenu = MenuOption.resumen;

  void _changeMenu(MenuOption newOption) {
    setState(() {
      _selectedMenu = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: <Widget>[
          // BARRA LATERAL (Sidebar)
          FixedSidebar(
            selectedMenu: _selectedMenu, 
            onMenuSelected: _changeMenu, 
          ),

          // ÁREA DE CONTENIDO PRINCIPAL
          Expanded(
            child: SingleChildScrollView( 
              padding: const EdgeInsets.all(30.0),
              child: _buildContent(), 
            ),
          ),
        ],
      ),
    );
  }

  // Carga la vista según la opción seleccionada
  Widget _buildContent() {
    switch (_selectedMenu) {
      case MenuOption.resumen:
        return ResumenDashboardView(); 
      case MenuOption.finanzas:
        return const Center(child: Text('Vista de Reportes Financieros', style: TextStyle(fontSize: 30, color: Colors.white)));
      case MenuOption.consumo:
        return const Center(child: Text('Vista de Gráficos de Consumo (Agua/Luz)', style: TextStyle(fontSize: 30, color: Colors.white)));
      case MenuOption.mantenimiento:
        return const Center(child: Text('Vista de Seguimiento de Tickets', style: TextStyle(fontSize: 30, color: Colors.white)));
      case MenuOption.usuarios:
        return UserManagementView(); 
      // opcion para la redireccion, nuevo codigo
      case MenuOption.gestion: 
        return const Center(child: CircularProgressIndicator()); 
    }
  }
}

// ----------------------------------------------------
// WIDGET DE LA BARRA LATERAL FIJA (Sidebar)
// ----------------------------------------------------
class FixedSidebar extends StatelessWidget {
  final MenuOption selectedMenu;
  final ValueChanged<MenuOption> onMenuSelected; 

  const FixedSidebar({
    super.key, 
    required this.selectedMenu,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280, 
      color: const Color(0xFF2C3E50),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Text(
              'Admin Building Dashboard',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(color: Colors.white24, height: 1),
          // Botones del Menú
          _buildMenuItem(context, MenuOption.resumen, 'Resumen Ejecutivo', Icons.dashboard),
          _buildMenuItem(context, MenuOption.finanzas, 'Gestión Financiera', Icons.account_balance_wallet),
          _buildMenuItem(context, MenuOption.consumo, 'Monitoreo de Consumos', Icons.offline_bolt),
          _buildMenuItem(context, MenuOption.mantenimiento, 'Reportes financieros', Icons.build),
          _buildMenuItem(context, MenuOption.usuarios, 'Usuarios y Roles', Icons.people),
          // nueva opcion para el crud
          const Divider(color: Colors.white24, height: 1),
          _buildMenuItem(context, MenuOption.gestion, 'Gestión (CRUD)', Icons.list_alt),
        ],
      ),
    );
  }

  // Se modificó para recibir el 'context'
  Widget _buildMenuItem(BuildContext context, MenuOption option, String title, IconData icon) {
    final bool isSelected = option == selectedMenu;

    // Lógica de Redirección
    final VoidCallback onTapAction;
    if (option == MenuOption.gestion) {
      // Usamos Navigator.push para ir a la nueva pantalla
      onTapAction = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CrudMainScreen(), // Redirige al CrudMainScreen
          ),
        );
      };
    } else {
      // Para todas las demás opciones, cambia el contenido del Dashboard
      onTapAction = () => onMenuSelected(option);
    }

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.cyanAccent : Colors.white70),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.cyanAccent : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTapAction, // Usa la acción condicional
      selected: isSelected && option != MenuOption.gestion, // Evita marcar 'Gestión' como seleccionado
      selectedTileColor: Colors.white10,
    );
  }
}