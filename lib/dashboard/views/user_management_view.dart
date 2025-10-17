// lib/views/user_management_view.dart

import 'package:flutter/material.dart';
import '../models/user_model.dart'; 

class UserManagementView extends StatelessWidget {
  const UserManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Gestión de Usuarios y Roles',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Abriendo formulario para nuevo usuario...')),
                );
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Agregar Nuevo Usuario'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.teal, 
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        
        // Usamos Flexible para que el contenedor se adapte dentro del SingleChildScrollView principal
        Flexible( 
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2C3E50),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView( 
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DataTable(
                  columnSpacing: 30,
                  dataRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                    return states.contains(MaterialState.selected) ? Colors.blue.withOpacity(0.1) : Colors.transparent;
                  }),
                  headingRowColor: MaterialStateProperty.all(Colors.white10),
                  columns: const [
                    DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Rol', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Departamento', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Estado', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Acciones', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                  ],
                  rows: mockUserList.map((user) {
                    return DataRow(cells: [
                      DataCell(Text(user.idUsuario.toString(), style: const TextStyle(color: Colors.white70))),
                      DataCell(Text(user.nombre, style: const TextStyle(color: Colors.white))),
                      DataCell(Text(user.rol, style: const TextStyle(color: Colors.white))),
                      DataCell(Text(user.departamento, style: const TextStyle(color: Colors.white))),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: user.estado == 'Activo' ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            user.estado,
                            style: TextStyle(color: user.estado == 'Activo' ? Colors.greenAccent : Colors.redAccent, fontSize: 12),
                          ),
                        ),
                      ),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, size: 20, color: Colors.amber),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, size: 20, color: Colors.redAccent),
                            onPressed: () {},
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}