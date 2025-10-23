import 'package:flutter/material.dart';
import 'dart:math';

// Helper para generar un número CI de 7 dígitos
String _generateRandomCi() {
  final random = Random();
  // Genera un número entre 1,000,000 y 9,999,999
  return (random.nextInt(9000000) + 1000000).toString(); 
}

// Modelo de Datos (Clase para representar un Usuario)
class User {
  final int id; 
  String nombre;
  String apellido;
  String username; // NUEVO CAMPO: Username
  String ci;       // NUEVO CAMPO: Carnet de Identidad (CI)
  String celular;
  String correo;
  bool isActive;

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.username,
    required this.ci,
    required this.celular,
    required this.correo,
    this.isActive = true,
  });
}

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  // 1. INICIALIZAMOS CON 10 USUARIOS ESTÁTICOS Y DATOS NUEVOS
  List<User> _users = [
    User(id: 101, nombre: 'Ana', apellido: 'Gómez', username: 'ana.gomez', ci: _generateRandomCi(), celular: '555-1001', correo: 'ana.gomez@ejemplo.com', isActive: true),
    User(id: 102, nombre: 'Luis', apellido: 'Pérez', username: 'luisperez', ci: _generateRandomCi(), celular: '555-1002', correo: 'luis.perez@ejemplo.com', isActive: true),
    User(id: 103, nombre: 'Sofía', apellido: 'Martínez', username: 'sofimarti', ci: _generateRandomCi(), celular: '555-1003', correo: 'sofia.m@ejemplo.com', isActive: false),
    User(id: 104, nombre: 'Javier', apellido: 'Soto', username: 'jsoto', ci: _generateRandomCi(), celular: '555-1004', correo: 'javier.s@ejemplo.com', isActive: true),
    User(id: 105, nombre: 'Elena', apellido: 'Rojas', username: 'elenita', ci: _generateRandomCi(), celular: '555-1005', correo: 'elena.r@ejemplo.com', isActive: false),
    User(id: 106, nombre: 'Miguel', apellido: 'Vera', username: 'migue_v', ci: _generateRandomCi(), celular: '555-1006', correo: 'miguel.v@ejemplo.com', isActive: true),
    User(id: 107, nombre: 'Carmen', apellido: 'Díaz', username: 'carmend', ci: _generateRandomCi(), celular: '555-1007', correo: 'carmen.d@ejemplo.com', isActive: true),
    User(id: 108, nombre: 'Ricardo', apellido: 'Castro', username: 'rcastro', ci: _generateRandomCi(), celular: '555-1008', correo: 'ricardo.c@ejemplo.com', isActive: true),
    User(id: 109, nombre: 'Paula', apellido: 'Nieto', username: 'paunieto', ci: _generateRandomCi(), celular: '555-1009', correo: 'paula.n@ejemplo.com', isActive: false),
    User(id: 110, nombre: 'Andrés', apellido: 'Blanco', username: 'a_blanco', ci: _generateRandomCi(), celular: '555-1010', correo: 'andres.b@ejemplo.com', isActive: true),
  ];
  
  // Controladores para los campos del formulario de Editar
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _usernameController = TextEditingController(); // NUEVO CONTROLADOR
  final _celularController = TextEditingController();
  final _correoController = TextEditingController();

  // =======================================================
  // LÓGICA R-U-D (Read, Update, Disable)
  // =======================================================

  // FUNCIÓN: Cambia el estado Activo/Inactivo
  void _toggleUserStatus(User user, bool value) {
    setState(() {
      user.isActive = value;
      print('Usuario ID ${user.id} ahora está ${value ? 'ACTIVO' : 'INACTIVO'}');
    });
  }

  // Muestra el diálogo para editar un usuario
  Future<void> _showEditForm(User userToEdit) async {
    // Precargar datos del usuario, incluyendo el nuevo campo
    _nombreController.text = userToEdit.nombre;
    _apellidoController.text = userToEdit.apellido;
    _usernameController.text = userToEdit.username; // PRECAGA USERNAME
    _celularController.text = userToEdit.celular;
    _correoController.text = userToEdit.correo;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Usuario'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre')),
                TextField(controller: _apellidoController, decoration: const InputDecoration(labelText: 'Apellido')),
                TextField(controller: _usernameController, decoration: const InputDecoration(labelText: 'Username')), // CAMPO USERNAME
                TextField(controller: _celularController, decoration: const InputDecoration(labelText: 'Celular')),
                TextField(controller: _correoController, decoration: const InputDecoration(labelText: 'Correo')),
                
                // CI no se puede editar, solo se muestra su valor
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('CI (Carnet de Identidad): ${userToEdit.ci}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Guardar Cambios'),
              onPressed: () {
                _updateUser(userToEdit);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // EDITAR (Update) - Actualiza los datos del usuario
  void _updateUser(User user) {
    setState(() {
      user.nombre = _nombreController.text;
      user.apellido = _apellidoController.text;
      user.username = _usernameController.text; // ACTUALIZA USERNAME
      user.celular = _celularController.text;
      user.correo = _correoController.text;
      print('Datos de usuario ID ${user.id} actualizados.');
    });
  }


  // =======================================================
  // ESTRUCTURA DE LA INTERFAZ (UI)
  // =======================================================

  @override
  Widget build(BuildContext context) {
    // Definición del color #25a7d9 en formato Flutter (0xFF + Hex)
    const activeSwitchColor = Color(0xFF25A7D9);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Administración de Usuarios'),
        backgroundColor: Colors.black,
      ),
      
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // TÍTULO
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Lista de Usuarios',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // TABLA DE USUARIOS (DataTable)
              DataTable(
                headingRowColor: WidgetStateProperty.all(Colors.grey.shade900),
                dataRowMinHeight: 50,
                dataRowMaxHeight: 60,
                columnSpacing: 12.0, 
                
                // CABECERAS MODIFICADAS
                columns: const [
                  DataColumn(label: Text('CI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))), // CI
                  DataColumn(label: Text('Nombre', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Apellido', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Username', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))), // USERNAME
                  DataColumn(label: Text('Celular', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Correo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Editar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Estado', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))), // RENOMBRADO A ESTADO
                ],

                rows: _users.map((user) {
                  return DataRow(
                    color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                      return user.isActive ? Colors.black54 : Colors.black45;
                    }),
                    cells: [
                      // Celdas de datos
                      DataCell(Text(user.ci, style: const TextStyle(color: Colors.white))), // CI
                      DataCell(Text(user.nombre, style: const TextStyle(color: Colors.white))),
                      DataCell(Text(user.apellido, style: const TextStyle(color: Colors.white))),
                      DataCell(Text(user.username, style: const TextStyle(color: Colors.white))), // USERNAME
                      DataCell(Text(user.celular, style: const TextStyle(color: Colors.white))),
                      DataCell(Text(user.correo, style: const TextStyle(color: Colors.white))),
                      
                      // Columna de Editar
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent, size: 20),
                          onPressed: () => _showEditForm(user),
                        ),
                      ),

                      // Columna de Estado (Switch)
                      DataCell(
                        Switch(
                          value: user.isActive,
                          activeColor: const Color.fromARGB(255, 109, 217, 37), // COLOR PERSONALIZADO #25a7d9
                          inactiveThumbColor: Colors.redAccent,
                          onChanged: (bool value) {
                            _toggleUserStatus(user, value);
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}