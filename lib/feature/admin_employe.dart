import 'package:flutter/material.dart';
import 'dart:math';

// Helper para generar un número CI de 7 dígitos aleatorio
String _generateRandomCi() {
  final random = Random();
  return (random.nextInt(9000000) + 1000000).toString(); 
}

// Modelo de Datos (Clase para representar un Empleado)
class Employee {
  final int id; 
  String ci;       
  String nombre;
  String apellido;
  double salario;  
  String fechaContratacion; 
  bool isActive;

  Employee({
    required this.id,
    required this.ci,
    required this.nombre,
    required this.apellido,
    required this.salario,
    required this.fechaContratacion,
    this.isActive = true,
  });
}

class AdminEmployeScreen extends StatefulWidget {
  const AdminEmployeScreen({super.key});

  @override
  State<AdminEmployeScreen> createState() => _AdminEmployeScreenState();
}

class _AdminEmployeScreenState extends State<AdminEmployeScreen> {
  // Inicialización de datos (10 empleados estáticos)
  List<Employee> _employees = [
    Employee(id: 1, ci: _generateRandomCi(), nombre: 'Juan', apellido: 'Tapia', salario: 5500.0, fechaContratacion: '2022-05-15', isActive: true),
    Employee(id: 2, ci: _generateRandomCi(), nombre: 'Maria', apellido: 'Vargas', salario: 7200.50, fechaContratacion: '2023-01-20', isActive: true),
    Employee(id: 3, ci: _generateRandomCi(), nombre: 'Roberto', apellido: 'Flores', salario: 4800.0, fechaContratacion: '2021-11-01', isActive: false),
    Employee(id: 4, ci: _generateRandomCi(), nombre: 'Daniela', apellido: 'López', salario: 6100.25, fechaContratacion: '2024-03-10', isActive: true),
    Employee(id: 5, ci: _generateRandomCi(), nombre: 'Carlos', apellido: 'Reyes', salario: 5000.0, fechaContratacion: '2023-08-01', isActive: true),
    Employee(id: 6, ci: _generateRandomCi(), nombre: 'Andrea', apellido: 'Guzmán', salario: 6500.0, fechaContratacion: '2022-07-20', isActive: false),
    Employee(id: 7, ci: _generateRandomCi(), nombre: 'Felipe', apellido: 'Sánchez', salario: 8000.0, fechaContratacion: '2021-01-01', isActive: true),
    Employee(id: 8, ci: _generateRandomCi(), nombre: 'Laura', apellido: 'Mora', salario: 5950.0, fechaContratacion: '2023-10-10', isActive: true),
    Employee(id: 9, ci: _generateRandomCi(), nombre: 'Jorge', apellido: 'Díaz', salario: 4500.0, fechaContratacion: '2024-01-01', isActive: true),
    Employee(id: 10, ci: _generateRandomCi(), nombre: 'Natalia', apellido: 'Cruz', salario: 7000.0, fechaContratacion: '2022-04-25', isActive: false),
  ];
  
  // Controladores de edición
  final _ciController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _salarioController = TextEditingController();
  final _fechaContratacionController = TextEditingController();

  // Color personalizado: #25a7d9
  static const activeSwitchColor = Color(0xFF25A7D9);

  // =======================================================
  // LÓGICA R-U-D (Read, Update, Disable)
  // =======================================================

  void _toggleEmployeeStatus(Employee employee, bool value) {
    setState(() {
      employee.isActive = value;
    });
  }

  Future<void> _showEditForm(Employee employeeToEdit) async {
    _ciController.text = employeeToEdit.ci;
    _nombreController.text = employeeToEdit.nombre;
    _apellidoController.text = employeeToEdit.apellido;
    _salarioController.text = employeeToEdit.salario.toStringAsFixed(2);
    _fechaContratacionController.text = employeeToEdit.fechaContratacion;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Empleado'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('CI: ${employeeToEdit.ci}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                TextField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre')),
                TextField(controller: _apellidoController, decoration: const InputDecoration(labelText: 'Apellido')),
                TextField(
                  controller: _salarioController, 
                  decoration: const InputDecoration(labelText: 'Salario'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _fechaContratacionController, 
                  decoration: const InputDecoration(labelText: 'Fecha de Contratación (YYYY-MM-DD)'),
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
                _updateEmployee(employeeToEdit);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateEmployee(Employee employee) {
    setState(() {
      employee.nombre = _nombreController.text;
      employee.apellido = _apellidoController.text;
      employee.salario = double.tryParse(_salarioController.text) ?? employee.salario; 
      employee.fechaContratacion = _fechaContratacionController.text;
    });
  }

  // =======================================================
  // ESTRUCTURA DE LA INTERFAZ (UI)
  // =======================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administración de Empleados'),
        backgroundColor: Colors.black,
      ),
      
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // 🔑 CLAVE: Fuerza a los hijos a ocupar el ancho máximo disponible por el padre
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: <Widget>[
              // TÍTULO
              const Text(
                'Lista de Empleados',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),

              // 🔑 CLAVE: SingleChildScrollView Horizontal para que la tabla se estire y se desplace
              SingleChildScrollView( 
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(Colors.grey.shade900),
                  dataRowMinHeight: 50,
                  dataRowMaxHeight: 60,
                  columnSpacing: 18.0, 
                  
                  columns: const [
                    DataColumn(label: Text('CI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Nombre', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Apellido', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Salario', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Contratación', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Editar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Estado', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],

                  rows: _employees.map((employee) {
                    return DataRow(
                      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                        return employee.isActive ? Colors.black54 : Colors.black45;
                      }),
                      cells: [
                        DataCell(Text(employee.ci, style: const TextStyle(color: Colors.white))),
                        DataCell(Text(employee.nombre, style: const TextStyle(color: Colors.white))),
                        DataCell(Text(employee.apellido, style: const TextStyle(color: Colors.white))),
                        DataCell(Text('\$${employee.salario.toStringAsFixed(2)}', style: const TextStyle(color: Colors.amber))), 
                        DataCell(Text(employee.fechaContratacion, style: const TextStyle(color: Colors.white))),
                        
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blueAccent, size: 20),
                            onPressed: () => _showEditForm(employee),
                          ),
                        ),

                        DataCell(
                          Switch(
                            value: employee.isActive,
                            activeColor: activeSwitchColor, 
                            inactiveThumbColor: Colors.redAccent,
                            onChanged: (bool value) {
                              _toggleEmployeeStatus(employee, value);
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}